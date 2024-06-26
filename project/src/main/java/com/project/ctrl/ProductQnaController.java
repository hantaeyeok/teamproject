package com.project.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.biz.ProductQnaService;
import com.project.domain.ProductQna;

@Controller
@RequestMapping("/productQna/")
public class ProductQnaController {

    private static final Logger log = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductQnaService productQnaService;

    @Autowired
    private HttpSession session;

    @GetMapping("getProductQnaList.do")
    public String getProductQnaList(@RequestParam("pno") int pno, Model model) {
        List<ProductQna> productQnaList = productQnaService.getProductQnaList(pno);
        model.addAttribute("productQnaList", productQnaList);
        model.addAttribute("pno", pno);
        return "productQna/getProductQnaList";
    }

    @GetMapping("getProductQna.do")
    public String detail(@RequestParam("no") int no, Model model) {
        ProductQna productQna = productQnaService.getProductQna(no);
        List<ProductQna> answerList = productQnaService.getAnswers(no);
        model.addAttribute("productQna", productQna);
        model.addAttribute("answerList", answerList);
        return "productQna/getProductQna";
    }

    @GetMapping("insProductQna.do")
    public String insProductQna(Model model, @RequestParam("pno") int pno) {
        ProductQna productQna = new ProductQna();
        productQna.setPno(pno);
        model.addAttribute("productQna", productQna);
        return "productQna/insProductQna";
    }

    @PostMapping("insProductQna.do")
    public String insProProductQna(@RequestParam("qimg1") MultipartFile qimg1,
                                   @RequestParam("qimg2") MultipartFile qimg2,
                                   @RequestParam("title") String title,
                                   @RequestParam("content") String content,
                                   @RequestParam("pno") int pno,
                                   HttpServletRequest request) {
        String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
        File dir = new File(uploadDir);

        ProductQna productQna = new ProductQna();

        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            if (!qimg1.isEmpty()) {
                String qimg1Name = saveFile(qimg1, uploadDir);
                productQna.setQimg1(qimg1Name);
            }
            if (!qimg2.isEmpty()) {
                String qimg2Name = saveFile(qimg2, uploadDir);
                productQna.setQimg2(qimg2Name);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        String sid = (String) session.getAttribute("sid");
        String sname = (String) session.getAttribute("sname");
        productQna.setId(sid);
        productQna.setName(sname);
        productQna.setContent(content);
        productQna.setTitle(title);
        productQna.setPno(pno);
        productQna.setResdate(new Date());
        productQna.setHits(0);
        productQnaService.insProductQna(productQna);
        return "redirect:/product/getProduct.do?pno=" + productQna.getPno();
    }

    @GetMapping("upProductQna.do")
    public String upProductQna(@RequestParam("no") int no, Model model) {
        ProductQna productQna = productQnaService.getProductQna(no);
        model.addAttribute("productQna", productQna);
        return "productQna/upProductQna";
    }

    @PostMapping("upProductQna.do")
    public String update(
        Model model,
        @RequestParam("no") int no,
        @RequestParam("qimg1") MultipartFile qimg1,
        @RequestParam("qimg2") MultipartFile qimg2,
        @RequestParam("title") String title,
        @RequestParam("content") String content,
        HttpServletRequest request         
    ) {
        ProductQna before = productQnaService.getProductQna(no);

        String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
        File dir = new File(uploadDir);

        String qimg1Name = "", qimg2Name = "";

        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            if (!qimg1.isEmpty()) {
                qimg1Name = saveFile(qimg1, uploadDir);
                before.setQimg1(qimg1Name);
                log.info("변경 파일1 이름 : {}", qimg1Name);
            }
            if (!qimg2.isEmpty()) {
                qimg2Name = saveFile(qimg2, uploadDir);
                before.setQimg2(qimg2Name);
                log.info("변경 파일2 이름 : {}", qimg2Name);
            }
        } catch (IOException e) {
            log.error("예외 : {}", e);
        }

        before.setTitle(title);
        before.setContent(content);
        productQnaService.upProductQna(before);

        return "redirect:/productQna/getProductQna.do?no=" + before.getNo();
    }

    @PostMapping("insAnswer.do")
    public String insProductQnaAnswer(@RequestParam("pimg1") MultipartFile pimg1,
                                      @RequestParam("pimg2") MultipartFile pimg2,
                                      @RequestParam("title") String title,
                                      @RequestParam("content") String content,
                                      @RequestParam("parno") int parno,
                                      HttpServletRequest request) {
        String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
        File dir = new File(uploadDir);
        ProductQna productQna = new ProductQna();

        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            if (!pimg1.isEmpty()) {
                String pimg1Name = saveFile(pimg1, uploadDir);
                productQna.setPimg1(pimg1Name);
            }
            if (!pimg2.isEmpty()) {
                String pimg2Name = saveFile(pimg2, uploadDir);
                productQna.setPimg2(pimg2Name);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        String sid = (String) session.getAttribute("sid");
        if ("admin".equals(sid)) {
            ProductQna parentQna = productQnaService.getProductQna(parno);
            productQna.setId(sid);
            productQna.setParno(parno);
            productQna.setTitle(title);
            productQna.setContent(content);
            productQna.setResdate(new Date());
            productQna.setPno(parentQna.getPno()); // 부모 QnA의 pno 설정
            int plevel = productQnaService.getProductPlevel(parno);
            productQna.setPlevel(plevel + 1);
            productQnaService.insProductQna(productQna);
        }

        return "redirect:/productQna/getProductQna.do?no=" + parno;
    }

    @GetMapping("upProductQnaAnswer.do")
    public String updateAnswer(@RequestParam("no") int no, Model model) {
        ProductQna productQna = productQnaService.getProductQna(no);
        model.addAttribute("productQna", productQna);
        return "productQna/upProductQnaAnswer";
    }

    @PostMapping("upProductQnaAnswer.do")
    public String updateAnswer(
        Model model,
        @RequestParam("no") int no,
        @RequestParam("pimg1") MultipartFile pimg1,
        @RequestParam("pimg2") MultipartFile pimg2,
        @RequestParam("title") String title,
        @RequestParam("content") String content,
        HttpServletRequest request         
    ) {
        ProductQna before = productQnaService.getProductQna(no);

        String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
        File dir = new File(uploadDir);

        String pimg1Name = "", pimg2Name = "";

        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            if (!pimg1.isEmpty()) {
                pimg1Name = saveFile(pimg1, uploadDir);
                before.setPimg1(pimg1Name);
                log.info("변경 파일1 이름 : {}", pimg1Name);
            }
            if (!pimg2.isEmpty()) {
                pimg2Name = saveFile(pimg2, uploadDir);
                before.setPimg2(pimg2Name);
                log.info("변경 파일2 이름 : {}", pimg2Name);
            }
        } catch (IOException e) {
            log.error("예외 : {}", e);
        }

        before.setTitle(title);
        before.setContent(content);
        productQnaService.upProductQna(before);

        return "redirect:/productQna/getProductQna.do?no=" + before.getParno();
    }

    public String saveFile(MultipartFile file, String uploadDir) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String newFilename = UUID.randomUUID().toString() + "_" + originalFilename;
        File serverFile = new File(uploadDir + newFilename);
        file.transferTo(serverFile);
        return newFilename;
    }
}
