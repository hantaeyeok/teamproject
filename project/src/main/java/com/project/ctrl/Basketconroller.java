package com.project.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.ProductService;
import com.project.domain.BasketItem;
import com.project.domain.Product;

@Controller
@RequestMapping("/basket/")
public class Basketconroller {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("basketList.do")
	public String basketList(HttpSession session, Model model) {
	    List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
	    model.addAttribute("basket", basket);
	    return "basket/basketList";
	}
	
	@PostMapping("addBasket.do")
	public String addBasket(
			@RequestParam("productPno") int productPno, 
			@RequestParam("quantity") int quantity, 
			HttpSession session) {
	    List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
	    if (basket == null) {
	        basket = new ArrayList<>();
	        session.setAttribute("basket", basket);
	    }
	    
	    Product product = productService.getProduct(productPno);
	    if (product != null) {
	        basket.add(new BasketItem(product, quantity));
	        session.setAttribute("basket", basket);
	    }
	    
	    return "redirect:/basket/basketList.do";
	}
	@PostMapping("removeBasket.do")
	public String removeFromBasket(
			@RequestParam("productPno") int productPno, 
			HttpSession session) {
	    List<BasketItem> basket = (List<BasketItem>) session.getAttribute("basket");
	    if (basket != null) {
	        basket.removeIf(item -> item.getProduct().getPno() == productPno);
	        session.setAttribute("basket", basket);
	        //여기 다시,,..,
	    }
	    return "redirect:/basket/basketList.do";
	}
}
/*
basket.removeIf(item -> item.getProduct().getPno() == productPno)는 람다 표현식을 사용한 Java 코드입니다. 이 구문은 장바구니 목록에서 특정 조건을 만족하는 항목을 제거하는 데 사용됩니다. 

removeIf 메서드
removeIf는 Java 8의 Collection 인터페이스에 추가된 메서드입니다. 
이 메서드는 주어진 조건(predicate)을 만족하는 요소를 제거합니다. predicate는 boolean 값을 반환하는 함수형 인터페이스입니다.

item -> item.getProduct().getPno() == productPno 부분 설명
 item이 BasketItem 타입의 객체를 나타냅니다.

item ->:
item은 람다 표현식의 매개변수입니다. 여기서 item은 BasketItem 객체를 의미합니다.
->는 람다 표현식의 구문을 구분하는 화살표입니다.
item.getProduct().getPno() == productPno:

item.getProduct(): BasketItem 객체의 getProduct 메서드를 호출하여 Product 객체를 반환합니다.
getPno(): Product 객체의 getPno 메서드를 호출하여 제품 번호를 반환합니다.
== productPno: 해당 제품 번호가 매개변수로 전달된 productPno와 일치하는지 비교합니다.
이 비교가 true이면 Predicate의 조건을 만족하여 해당 항목이 삭제됩니다.
*/