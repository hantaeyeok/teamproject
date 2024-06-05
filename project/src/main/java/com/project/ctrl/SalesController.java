package com.project.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.ProductService;
import com.project.biz.SalesService;
import com.project.domain.BasketItem;
import com.project.domain.Product;
import com.project.domain.Sales;

@Controller
@RequestMapping("/sales/")
public class SalesController {
	
	@Autowired
    private SalesService salesService;
	
	@Autowired
	private ProductService productService;

	//상품 구매하기 전 jsp : 상품 구매 리스트
    @GetMapping("buySalesList.do")
    public String getSalesList(Model model, HttpSession session) {
    	List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
	    model.addAttribute("basket", basket);
        return "sales/buySalesList";
    }
    
    @PostMapping("buySalesList.do")
    public String getSalesList(
            @RequestParam("productPno") int productPno, 
            @RequestParam("quantity") int quantity, 
            HttpSession session, 
            Model model) {
        
        // 장바구니에서 가져온 목록과 추가된 항목을 처리
        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        if (basket == null) {
            basket = new ArrayList<>();
            session.setAttribute("basket", basket);
        }
        
        // 상품 정보 가져오기 (예: ProductService 사용)
        Product product = productService.getProduct(productPno);
        if (product != null) {
            basket.add(new BasketItem(product, quantity));
        }
        
        model.addAttribute("basket", basket);
        return "sales/buySalesList";
    }
    
    //구매하기 
    @GetMapping("insSales.do")
    public String insSales(Model model, HttpSession session) {
        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        model.addAttribute("basket", basket);
        return "sales/insSales";
    }

    @PostMapping("insSales.do")
    public String saveSales(@RequestParam("paymethod") String paymethod,
                            @RequestParam("paynum") String paynum,
                            @RequestParam("addr") String addr,
                            @RequestParam("tel") String tel,
                            HttpSession session) {
        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        if (basket != null) {
            for (BasketItem item : basket) {
                Sales newSale = new Sales();
                newSale.setPno(item.getProduct().getPno());
                newSale.setAmount(item.getQuantity());
                newSale.setTot(item.getProduct().getPrice() * item.getQuantity());
                newSale.setId((String) session.getAttribute("id")); // 사용자 ID 세션에서 가져오기
                newSale.setPaymethod(paymethod);
                newSale.setPaynum(paynum);
                newSale.setAddr(addr);
                newSale.setTel(tel);
                salesService.insSales(newSale);
            }
            session.removeAttribute("basket");
        }
        return "redirect:/sales/getSalesList.do";
    }
    
    
    
    //구매 내역 리스트보기
    @GetMapping("getSalesList")
    public String getSalesList() {
    	
    	return "sales/getSalesList";
    }
    
    
    //구매내역 상세보기
    @GetMapping("getSales.do")
    public String getSales(@RequestParam("sno") int sno, Model model) {
        Sales sales = salesService.getSales(sno);
        model.addAttribute("sales", sales);
        return "sales/getSales";
    }


    
    
    @GetMapping("upSales.do")
    public String edit(@RequestParam("sno") int sno, Model model) {
        Sales sales = salesService.getSales(sno);
        model.addAttribute("sales", sales);
        return "sales/form";
    }

    @GetMapping("delSales.do")
    public String delete(@RequestParam("sno") int sno) {
        salesService.delSales(sno);
        return "redirect:/sales/getSalesList.do";
    }

}