package com.project.ctrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.biz.MemberService;
import com.project.domain.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private HttpSession session;
    
    @GetMapping("login.do")
    public String login(Model model) {
        return "member/login";
    }

    @PostMapping("loginPro.do")
    public void loginPro(@RequestParam("id") String id, @RequestParam("pw") String pw, HttpServletRequest request, HttpServletResponse response) {
        Member cus = memberService.getIdMember(id);  
        try {
            if (cus != null && !memberService.checkPassword(pw, cus.getPw())) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.');");
                out.println("window.location.href = '" + request.getContextPath() + "/member/login.do';");
                out.println("</script>");
                out.flush();
                return;
            }
            
            if (cus == null) {
            	response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('해당 회원이 존재하지 않습니다.');");
                out.println("window.location.href = '" + request.getContextPath() + "/member/login.do';");
                out.println("</script>");
                out.flush();
                return;
            }

            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            
            if(cus.getAble().equals("TRUE")) {
	            session = request.getSession(true);
	            session.setAttribute("cus", cus);
	            session.setAttribute("sid", id);
	            session.setAttribute("sname", cus.getName());
	            session.setAttribute("smcode", cus.getMcode());
	            session.setAttribute("smember", cus);
	            
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>");
	            out.println("window.opener.postMessage({ sid: '" + id + "' }, 'http://localhost:8091');");
	            out.println("window.close();");
	            out.println("</script>");
	            out.flush();
            } else {
            	response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
            	out.println("<script>");
                out.println("alert('정지된 회원입니다.');");
                out.println("window.location.href = '" + request.getContextPath() + "/member/login.do';");
                out.println("</script>");
                out.flush();
                return;
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("logout.do")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("message", "로그아웃 되었습니다.");
        return "redirect:/";
    }

    @RequestMapping("agree.do")
    public String agreeForm(Model model, RedirectAttributes rttr) {
        rttr.addAttribute("msg", "회원 약관에 동의하시기 바랍니다.");
        return "member/agree";
    }
    
    @GetMapping("join.do")
    public String join(Model model) {
        return "member/join";
    }

    @PostMapping("join.do")
    public String joinPro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
        try {
            String id = request.getParameter("id");
            String pw = request.getParameter("pw");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String birthString = request.getParameter("birth");
            String tel = request.getParameter("tel");
            String postcode = request.getParameter("postcode");
            String addr1 = request.getParameter("addr1");
            String addr2 = request.getParameter("addr2");

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date birth = dateFormat.parse(birthString);
            
            Date regdate = new Date();
            
            Member member = new Member();
            member.setId(id);
            member.setPw(pw);
            member.setName(name);
            member.setEmail(email);
            member.setBirth(birth);
            member.setTel(tel);
            member.setPostcode(postcode);
            member.setAddr1(addr1);
            member.setAddr2(addr2);
            member.setRegdate(regdate);
            
            memberService.insMember(member);

            rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다. 다시 로그인 해주세요.");
            return "redirect:/";
        } catch (ParseException e) {
            e.printStackTrace();
            model.addAttribute("msg", "회원가입에 실패하였습니다. 생년월일 형식을 확인해주세요.");
            return "member/join";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", "회원가입에 실패하였습니다. 다시 시도해주세요.");
            return "member/join";
        }
    }
    
    @PostMapping("idCheck.do")
    public void idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Member member = memberService.getIdMember(id);
        boolean result = (member == null);
        JSONObject json = new JSONObject();
        json.put("result", result);
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }
    
	@GetMapping("myInfo.do")
	public String myInfo(Model model, HttpSession session) {
	    Member loggedInMember = (Member) session.getAttribute("cus");
	    model.addAttribute("cus", loggedInMember);
		return "member/myInfo";
	}
	
	@GetMapping("myUpdate.do")
	public String myUpdate(Model model, HttpSession session) {
	    Member loggedInMember = (Member) session.getAttribute("cus");
	    model.addAttribute("cus", loggedInMember);
		return "member/myUpdate";
	}
	
	@PostMapping("myUpdatePro.do")
	public String myUpdatePro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		Member loggedInMember = (Member) session.getAttribute("cus");
	    
	    // 수정된 정보만을 업데이트
	    loggedInMember.setName(request.getParameter("name"));
	    loggedInMember.setEmail(request.getParameter("email"));
	    loggedInMember.setTel(request.getParameter("tel"));
	    loggedInMember.setPostcode(request.getParameter("postcode"));
	    loggedInMember.setAddr1(request.getParameter("addr1"));
	    loggedInMember.setAddr2(request.getParameter("addr2"));
	    
	    // 업데이트된 정보를 데이터베이스에도 업데이트
	    memberService.upMember(loggedInMember);
	    
	    // 업데이트된 정보만 세션에 다시 저장
	    session.setAttribute("cus", loggedInMember);
	    
	    model.addAttribute("msg", "회원정보 수정이 완료되었습니다.");
	    return "redirect:/";
	}
	
	@GetMapping("pwUpdate.do")
	public String pwUpdate(Model model) {
		return "member/pwUpdate";
	}
	
	@PostMapping("pwUpdatePro.do")
	public String pwUpdatePro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		
		Member loggedInMember = (Member) session.getAttribute("cus");
	    
	    // 수정된 정보만을 업데이트
	    loggedInMember.setPw(request.getParameter("pw"));
	    
	    // 업데이트된 정보를 데이터베이스에도 업데이트
	    memberService.upPw(loggedInMember);
	    
	    // 업데이트된 정보만 세션에 다시 저장
	    session.setAttribute("cus", loggedInMember);
		
		model.addAttribute("msg", "비밀번호 수정이 완료되었습니다.");
		
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") String id, Model model) {
		memberService.delMember(id);
		session.invalidate();
		return "redirect:/";
	}
	
}
