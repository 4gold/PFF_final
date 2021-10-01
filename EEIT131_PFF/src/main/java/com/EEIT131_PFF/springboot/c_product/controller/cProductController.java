package com.EEIT131_PFF.springboot.c_product.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;



import com.EEIT131_PFF.springboot.c_product.service.cProductService;

@Controller
public class cProductController {
	
	@Autowired
	cProductService productService;
	
	@GetMapping({"/product/index"})
	public  String home(Model model) {
		return "addProduct";         
	}
	
	@GetMapping("/calories123")
	public String getMemberSpringMvc(Model model) {
//		List<Member> members = memberService.findAll();
//		model.addAttribute("members123", members);
		return "calories";
	}
	
//	@GetMapping("/product/all")
//	public String getProduct(Model m) {
//		List<Product> products = productService.findAll();
//		m.addAttribute("p123",products);
//		return "showAllProduct";
//	}
	
	

}
