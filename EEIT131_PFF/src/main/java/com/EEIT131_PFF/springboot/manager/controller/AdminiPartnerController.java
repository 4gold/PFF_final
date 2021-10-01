package com.EEIT131_PFF.springboot.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.manager.service.AdminiPartnerService;

@Controller
public class AdminiPartnerController {

	@Autowired
	AdminiPartnerService AdminiPartnerService;

	@GetMapping("/manager/allpartner")
	public @ResponseBody List<Partner> findAllPartner() {
		return AdminiPartnerService.findAllPartner();
	}
	@GetMapping("/manager/allpartnerpage")
	public String findAllpartner() {
		return "manager/ShowPartners";
	}
	//------------------------------------------------------------------------------
    
	//新增廠商資料
	@GetMapping("/manager/addpartner")
	public String addPartnerForm(Model model) {
		return "manager/AddPartner";
	}
                                               //, consumes = "application/json"
	@PostMapping(path="/manager/addpartnerpage" , consumes = "application/json")
	public @ResponseBody Map<String, String> save(
		   @RequestBody Partner partnerId
			) {
		System.out.println("PartnerId=" + partnerId);
		Map<String, String> map = new HashMap<>();
		String result = "";
		try {
			AdminiPartnerService.save(partnerId);
			result = "新增成功,3秒後跳轉";
			map.put("success", result);
		} catch (Exception e) {
			result = e.getMessage();
			map.put("fail", result);
		}
		return map;
	}
	//-----------------------------------------------------------------------------
	
	//修改廠商資料
	@GetMapping("/manager/updatepartners")
	public String sendEditPartnerForm(
			@RequestParam("partnerId") Integer partnerId, 
			Model model
			) {
		model.addAttribute("paid", partnerId);
		return "manager/UpdatePartner";
	}
	
	@GetMapping("/manager/updatepartnerpage")
	public String sendAjaxPartnerForm() {
		return "manager/ShowPartners";
	}
	
	@GetMapping("/manager/partners")
	public @ResponseBody Partner findByPartnerId(
			@RequestParam Integer partnerId
			) {
		System.out.println("partnerId="+partnerId);
		return AdminiPartnerService.findByPartnerId(partnerId);
	}
	
	@GetMapping("/manager/partners/{partnerId}")
	public @ResponseBody Partner findById(
			@PathVariable Integer partnerId
			) {
		return AdminiPartnerService.findById(partnerId);
	}
	
	@PutMapping("/manager/updatepartner/{partnerId}")
	public @ResponseBody Map<String, String> update(
		   @RequestBody Partner Partner,
		   @PathVariable Integer partnerId
			) {
		System.out.println("update()之 partnerId=" + Partner);
		Map<String, String> map = new HashMap<>();
		String result = "";
		
		Partner original = AdminiPartnerService.findByPartnerId(partnerId);
		
		System.out.println("=============================");
		System.out.println(Partner);
		System.out.println("=============================");
		Partner.setUniformNumbers(original.getUniformNumbers());
		Partner.setPassword(original.getPassword());
		try {
			AdminiPartnerService.update(Partner);
			   result = "修改成功,3秒後跳轉";
			   map.put("success", result);
			} catch(Exception e) {
			   result = e.getMessage();	
			   map.put("fail", result);
			}
			return map;
		}
	//--------------------------------------------------------------------
	
	//刪除
	@DeleteMapping(path="/manager/deletepartner/{partnerId}")
	public String DeletePartner(
			@PathVariable Integer partnerId
			) {
		AdminiPartnerService.DeletePartner(partnerId);
		
		return "true";
	}

}