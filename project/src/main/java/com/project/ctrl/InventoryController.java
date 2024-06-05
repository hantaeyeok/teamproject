package com.project.ctrl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.InventoryService;
import com.project.domain.Inventory;

@Controller
@RequestMapping("/inventory/")
public class InventoryController {
	
	//Inventory 상세보기는 사용하지 않아도 됨. update까지 구현 del은 트리거사용으로 상품하고 연관지어야함.
	
	@Autowired
    private InventoryService inventoryService;

    @GetMapping("getInventoryList.do")
    public String getInventoryList(Model model) {
        List<Inventory> inventoryList = inventoryService.getInventoryList();
        model.addAttribute("inventoryList", inventoryList);
        return "inventory/getInventoryList";
    }

    @GetMapping("getInventory.do")
    public String detail(@RequestParam("ino") int ino, Model model) {
        Inventory inventory = inventoryService.getInventory(ino);
        model.addAttribute("inventory", inventory);
        return "inventory/getInventory";
    }

    @GetMapping("insInventory.do")
    public String insInventory(Model model) {
        model.addAttribute("inventory", new Inventory());
        return "inventory/insInventory";
    }

    @PostMapping("saveInventory.do")
    public String saveInventory(@ModelAttribute Inventory inventory) {
       inventory.setResdate(new Date());
       inventoryService.upInventory(inventory);
       return "redirect:/inventory/getInventoryList.do";
    }

    @GetMapping("upInventory.do")
    public String upInventory(@RequestParam("ino") int ino, Model model) {
        Inventory inventory = inventoryService.getInventory(ino);
        model.addAttribute("inventory", inventory);
        return "inventory/upInventory";
    }

    @GetMapping("delInventory.do")
    public String delete(@RequestParam("ino") int ino) {
        inventoryService.delInventory(ino);
        return "redirect:/inventory/getInventoryList";
    }
}
