package com.project.ctrl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.biz.SalesService;
import com.project.domain.Sales;

@Controller
@RequestMapping("/sales/")
public class SalesController {
	
	@Autowired
    private SalesService salesService;

    @GetMapping("getSalesList.do")
    public String getSalesList(Model model) {
        List<Sales> salesList = salesService.getSalesList();
        model.addAttribute("salesList", salesList);
        return "sales/getSalesList";
    }

    @GetMapping("getSales.do")
    public String getSales(@RequestParam("sno") int sno, Model model) {
        Sales sales = salesService.getSales(sno);
        model.addAttribute("sales", sales);
        return "sales/getSales";
    }

    @GetMapping("insSales.do")
    public String insSales(Model model) {
        model.addAttribute("sales", new Sales());
        return "sales/insSales";
    }

    @PostMapping("saveSales.do")
    public String saveSales(@ModelAttribute Sales sales) {
        if (sales.getSno() == 0) {
            salesService.insSales(sales);
        } else {
            salesService.upSales(sales);
        }
        return "redirect:/sales/getSalesList.do";
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