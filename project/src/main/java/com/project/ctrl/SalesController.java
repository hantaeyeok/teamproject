package com.project.ctrl;

import java.util.ArrayList;
import java.util.List;

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

import com.project.biz.InventoryService;
import com.project.biz.MemberService;
import com.project.biz.ProductService;
import com.project.biz.SalesService;
import com.project.domain.BasketItem;
import com.project.domain.IamPortClient;
import com.project.domain.Inventory;
import com.project.domain.Member;
import com.project.domain.Product;
import com.project.domain.Sales;

@Controller
@RequestMapping("/sales/")
public class SalesController {

    private static final Logger log = LoggerFactory.getLogger(SalesController.class);

    @Autowired
    private SalesService salesService;

    @Autowired
    private ProductService productService;
    
    @Autowired
    private InventoryService inventoryService;
    
    @Autowired
    private MemberService memberService;

    // 상품 구매하기 전 jsp: 상품 구매 리스트
    
    @GetMapping("buySalesList.do")
    public String getSalesList(Model model, HttpSession session) {
        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        model.addAttribute("basket", basket);
        return "sales/buySalesList";
    }

    
    @PostMapping("buySalesList.do")
    public String getSalesList(@RequestParam("productPno") int productPno, 
                               @RequestParam("quantity") int quantity, 
                               HttpSession session, 
                               Model model) {

        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        if (basket == null) {
            basket = new ArrayList<>();
            session.setAttribute("basket", basket);
        }

        Product product = productService.getProduct(productPno);
        Inventory inventory = inventoryService.getInventoryPno(productPno);
        if (product != null && inventory != null) {
            basket.add(new BasketItem(product, inventory, quantity));
        }

        model.addAttribute("basket", basket);
        return "sales/buySalesList";
    }
    
    
    
    
    @PostMapping("updateBuy.do")
    public String updateBuy(@RequestParam("productPno") int productPno, 
                            @RequestParam("quantity") int quantity, 
                            HttpSession session) {
        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        if (basket != null) {
            for (BasketItem item : basket) {
                if (item.getProduct().getPno() == productPno) {
                    item.setQuantity(quantity);
                    break;
                }
            }
            session.setAttribute("basket", basket);
        }
        return "redirect:/sales/buySalesList.do";
    }

    // 구매하기 
    @GetMapping("insSales.do")
    public String insSales(Model model, HttpSession session) {
        List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
        model.addAttribute("basket", basket);

        // 사용자 정보 가져오기
        String memberId = (String) session.getAttribute("sid");
        Member member = memberService.getIdMember(memberId);
        model.addAttribute("member", member);

        // 아임포트 결제 정보를 모델에 추가
        IamPortClient iamPortClient = new IamPortClient();
        model.addAttribute("code", IamPortClient.CODE);
        model.addAttribute("key", IamPortClient.KEY);
        model.addAttribute("secret", IamPortClient.SECRET);
        model.addAttribute("gtid", iamPortClient.getRandChar());

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
                newSale.setId((String) session.getAttribute("sid")); // 사용자 ID 세션에서 가져오기
                newSale.setPaymethod(paymethod);
                newSale.setPaynum(paynum);
                newSale.setAddr(addr);
                newSale.setTel(tel);

                salesService.insSales(newSale);

                // 재고 감소
                Inventory inventory = item.getInventory();
                inventory.setAmount(inventory.getAmount() - item.getQuantity());
                inventoryService.upInventory(inventory);
            }
            session.removeAttribute("basket");
        }
        return "redirect:/sales/getSalesList.do";
    }

    // 구매 내역 리스트 보기
    @GetMapping("getSalesList")
    public String getSalesList() {
        return "sales/getSalesList";
    }

    // 구매 내역 상세 보기
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
