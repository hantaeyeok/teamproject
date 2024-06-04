package com.project.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.project.biz.ProductService;
import com.project.domain.Product;

@Controller
@RequestMapping("/product/")
public class ProductController {
	
	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping("productList.do")
	public String getProductList(Model model) {
		List<Product> productList = productService.getProductList();
		model.addAttribute("productList", productList);
		return "product/productList";
	}

	@GetMapping("getProductCateList.do")
	public String getProductCateList(@RequestParam("pcate") String pcate, Model model) {
		List<Product> productList = productService.getProductCateList(pcate);
		model.addAttribute("productList", productList);
		return "product/productList";
	}

	@PostMapping("getProductCateList.do")
	public String postProductCateList(@RequestParam("pcate") String pcate, Model model) {
		List<Product> productList = productService.getProductCateList(pcate);
		model.addAttribute("productList", productList);
		return "product/productList";
	}

	@GetMapping("getProduct.do")
	public String getProduct(@RequestParam("pno") int pno, Model model) {
		Product product = productService.getProduct(pno);
		model.addAttribute("product", product);
		return "product/getProduct";
	}

	@GetMapping("insProduct.do")
	public String insProduct(Model model) {
		model.addAttribute("product", new Product());
		return "product/insProduct";
	}

	@PostMapping("insProduct.do")
	public String insProductPro(@RequestParam("pcate") String pcate,
	                            @RequestParam("pname") String pname,
	                            @RequestParam("pcontext1") String pcontext1,
	                            @RequestParam("pcontext2") String pcontext2,
	                            @RequestParam("price") int price,
	                            @RequestParam("asdate") int asdate,
	                            
	                            @RequestParam("img1") MultipartFile img1,
	                            @RequestParam("img2") MultipartFile img2,
	                            @RequestParam("img3") MultipartFile img3,
	                            @RequestParam("img4") MultipartFile img4,
	                            HttpServletRequest request,
	                            HttpServletResponse response,
	                            Model model) {

	    String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
	    File dir = new File(uploadDir);

	    String img1Name = "", img2Name = "", img3Name = "", img4Name = "";

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
	        if (!img3.isEmpty()) {
	            img3Name = saveFile(img3, uploadDir);
	            log.info("업로드 파일3 이름 : {}", img3Name);
	        }
	        if (!img4.isEmpty()) {
	            img4Name = saveFile(img4, uploadDir);
	            log.info("업로드 파일4 이름 : {}", img4Name);
	        }
	    } catch (IOException e) {
	        log.error("예외 : {}", e);
	    }

	    Product product = new Product();
	    product.setPcate(pcate);
	    product.setPname(pname);
	    product.setPcontext1(pcontext1);
	    product.setPcontext2(pcontext2);
	    product.setPrice(price);
	    product.setAsdate(asdate);
	    
	    product.setResdate(new Date());
	    product.setImg1(img1Name);
	    product.setImg2(img2Name);
	    product.setImg3(img3Name);
	    product.setImg4(img4Name);

	    productService.insProduct(product);
	    return "redirect:productList.do";
	}

	
	
	
	
	@GetMapping("upProduct.do")
	public String upProduct(@RequestParam("pno") int pno, Model model) {
		Product product = productService.getProduct(pno);
		model.addAttribute("product", product);
		return "product/upProduct";
	}

	@PostMapping("upProduct.do")
	public String upProProduct(@RequestParam("pno") int pno,
	                           @RequestParam("pcate") String pcate,
	                           @RequestParam("pname") String pname,
	                           @RequestParam("price") int price,
	                           @RequestParam("asdate") int asdate,
	                           @RequestParam("pcontext1") String pcontext1,
	                           @RequestParam("pcontext2") String pcontext2,
	                           @RequestParam("img1") MultipartFile img1,
	                           @RequestParam("img2") MultipartFile img2,
	                           @RequestParam("img3") MultipartFile img3,
	                           @RequestParam("img4") MultipartFile img4,
	                           HttpServletRequest request,
	                           HttpServletResponse response,
	                           Model model) {

	    Product before = productService.getProduct(pno);
	    model.addAttribute("product", before);
	    String uploadDir = request.getServletContext().getRealPath("/resources/upload/");
	    File dir = new File(uploadDir);

	    String img1Name = "", img2Name = "", img3Name = "", img4Name = "";

	    if (!dir.exists()) {
	        dir.mkdirs();
	    }

	    try {
	        if (!img1.isEmpty()) {
	            img1Name = saveFile(img1, uploadDir);
	            log.info("변경 파일1 이름 : {}", img1Name);
	        } else {
	            img1Name = before.getImg1();
	        }
	        if (!img2.isEmpty()) {
	            img2Name = saveFile(img2, uploadDir);
	            log.info("변경 파일2 이름 : {}", img2Name);
	        } else {
	            img2Name = before.getImg2();
	        }
	        if (!img3.isEmpty()) {
	            img3Name = saveFile(img3, uploadDir);
	            log.info("변경 파일3 이름 : {}", img3Name);
	        } else {
	            img3Name = before.getImg3();
	        }
	        if (!img4.isEmpty()) {
	            img4Name = saveFile(img4, uploadDir);
	            log.info("변경 파일4 이름 : {}", img4Name);
	        } else {
	            img4Name = before.getImg4();
	        }
	    } catch (IOException e) {
	        log.error("예외 : {}", e);
	    }

	    before.setPno(pno);  // 수정 시 제품 번호가 필요합니다
	    before.setPcate(pcate);
	    before.setPname(pname);
	    before.setPcontext1(pcontext1);
	    before.setPcontext2(pcontext2);
	    before.setPrice(price);
	    before.setAsdate(asdate);
	    before.setImg1(img1Name);
	    before.setImg2(img2Name);
	    before.setImg3(img3Name);
	    before.setImg4(img4Name);

	    productService.upProduct(before);

	    return "redirect:productList.do";
	}

	@RequestMapping("delProduct.do")
	public String delProduct(@RequestParam("pno") int pno, Model model) {
		productService.delProduct(pno);
		return "redirect:productList.do";
	}

	// saveFile 메소드 추가
	private String saveFile(MultipartFile file, String uploadDir) throws IOException {
	    String originalFilename = file.getOriginalFilename();
	    String newFilename = UUID.randomUUID().toString() + "_" + originalFilename;
	    File serverFile = new File(uploadDir + newFilename);
	    file.transferTo(serverFile);
	    return newFilename;
	}
}
