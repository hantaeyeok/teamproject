package com.project.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import com.project.biz.NoticeService;
import com.project.domain.Notice;

@Controller
@RequestMapping("/notice/")
public class NoticeController {

    private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

    @Autowired
    private NoticeService noticeService;

    @GetMapping("noticeList.do")
    public String getNoticeList(Model model) {
        List<Notice> noticeList = noticeService.getNoticeList();
        model.addAttribute("noticeList", noticeList);
        return "notice/noticeList";
    }

    @GetMapping("getNotice.do")
    public String getNotice(@RequestParam("nno") int nno, Model model) {
        Notice notice = noticeService.getNotice(nno);
        model.addAttribute("notice", notice);
        return "notice/getNotice";
    }

    @GetMapping("insNotice.do")
    public String insNotice(Model model) {
        model.addAttribute("notice", new Notice());
        return "notice/insNotice";
    }

    @PostMapping("insNotice.do")
    public String insProNotice(Model model,
                               @RequestParam("img1") MultipartFile img1,
                               @RequestParam("img2") MultipartFile img2,
                               @RequestParam("title") String title,
                               @RequestParam("content") String content,
                               @RequestParam("author") String author,
                               HttpServletRequest request) {

        String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
        File dir = new File(uploadDir);

        String img1Name = "", img2Name = "";

        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            if (!img1.isEmpty()) {
                img1Name = saveFile(img1, uploadDir);
                log.info("업로드 파일1 이름 : {}", img1Name);
            }
            if (!img2.isEmpty()) {
                img2Name = saveFile(img2, uploadDir);
                log.info("업로드 파일2 이름 : {}", img2Name);
            }
        } catch (IOException e) {
            log.error("예외 : {}", e);
        }

        Notice notice = new Notice();
        notice.setImg1(img1Name);
        notice.setImg2(img2Name);
        notice.setAuthor(author);
        notice.setContent(content);
        notice.setResdate(new Date());
        notice.setTitle(title);

        noticeService.insNotice(notice);
        return "redirect:/notice/noticeList.do";
    }

    @GetMapping("upNotice.do")
    public String upNotice(@RequestParam("nno") int nno, Model model) {
        Notice notice = noticeService.getNotice(nno);
        model.addAttribute("notice", notice);
        return "notice/upNotice";
    }

    @PostMapping("upProNotice.do")
    public String upProNotice(@RequestParam("nno") int nno,
                              @RequestParam("title") String title,
                              @RequestParam("content") String content,
                              @RequestParam("author") String author,
                              @RequestParam("img1") MultipartFile img1,
                              @RequestParam("img2") MultipartFile img2,
                              HttpServletRequest request,
                              Model model) {

        String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
        File dir = new File(uploadDir);

        String img1Name = "", img2Name = "";

        if (!dir.exists()) {
            dir.mkdirs();
        }

        try {
            if (!img1.isEmpty()) {
                img1Name = saveFile(img1, uploadDir);
                log.info("업로드 파일1 이름 : {}", img1Name);
            }
            if (!img2.isEmpty()) {
                img2Name = saveFile(img2, uploadDir);
                log.info("업로드 파일2 이름 : {}", img2Name);
            }
        } catch (IOException e) {
            log.error("예외 : {}", e);
        }

        Notice notice = noticeService.getNotice(nno);
        notice.setTitle(title);
        notice.setContent(content);
        notice.setAuthor(author);
        if (!img1.isEmpty()) {
            notice.setImg1(img1Name);
        }
        if (!img2.isEmpty()) {
            notice.setImg2(img2Name);
        }

        noticeService.upNotice(notice);
        return "redirect:/notice/getNotice.do?nno=" + nno;
    }
    
    
    

    @GetMapping("delNotice.do")
    public String delNotice(@RequestParam("nno") int nno) {
        noticeService.delNotice(nno);
        return "redirect:/notice/noticeList.do";
    }

    private String saveFile(MultipartFile file, String uploadDir) throws IOException {
        String originalFilename = file.getOriginalFilename();
        String newFilename = UUID.randomUUID().toString() + "_" + originalFilename;
        File serverFile = new File(uploadDir + newFilename);
        file.transferTo(serverFile);
        return newFilename;
    }
}
