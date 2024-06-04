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
        Member member = memberService.getMember(id);  
        try {
            if (member == null || !memberService.checkPassword(pw, member.getPw())) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('로그인 실패: 아이디 또는 비밀번호가 일치하지 않습니다.');");
                out.println("window.location.href = '" + request.getContextPath() + "/member/login.do';");
                out.println("</script>");
                out.flush();
                return;
            }

            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            session = request.getSession(true);
            session.setAttribute("member", member);
            session.setAttribute("sid", id);
            session.setAttribute("sname", member.getName());
            session.setAttribute("smember", member);
            
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("window.opener.postMessage({ sid: '" + id + "' }, 'http://localhost:8091');");
            out.println("window.close();");
            out.println("</script>");
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
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
            String addr = request.getParameter("addr1") + " " + request.getParameter("addr2");

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
            member.setAddr(addr);
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
    
    @RequestMapping("logout.do")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("message", "로그아웃 되었습니다.");
        return "redirect:/";
    }
    
    
//    @PostMapping("idCheck.do")
//    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
//        String id = request.getParameter("id");
//        Member member = memberService.getMember(id);
//        boolean result = (member == null);
//        JSONObject json = new JSONObject();
//        json.put("result", result);
//        PrintWriter out = response.getWriter();
//        out.println(json.toString());
//    }
    
    @PostMapping("idCheck.do")
    public void idCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Member member = memberService.getMember(id);
        boolean result = (member == null);
        JSONObject json = new JSONObject();
        json.put("result", result);
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }
    
    @RequestMapping("agree.do")
    public String agreeForm(Model model, RedirectAttributes rttr) {
        rttr.addAttribute("msg", "회원 약관에 동의하시기 바랍니다.");
        return "member/agree";
    }
	@RequestMapping("agree2.do")
    public String showagree2() {
        return "member/agree2";
    }
    
	
	
}
