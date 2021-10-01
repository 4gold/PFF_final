package com.EEIT131_PFF.springboot.partner.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.partner.service.PartnerService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
@SessionAttributes("loginPartner")
public class PartnerController {
	
	@Autowired
	PartnerService partnerService;
	
	//登入頁面
	@GetMapping("/partnerlogin")
	public String LoginMain() {
		return "partner/partnerlogin";
		}
    //註冊
	@GetMapping("/partnerregister")
	public String addPartnerForm(Model model) {
		return "partner/register";   
	}
	//查詢
	@GetMapping("/partner/inquire")
	public String getPartner() {

		return "partner/showPartner";
	}
	//修改
	@GetMapping("/partner/revisePartnerPage")
	public String revisePartner() {

		return "partner/revisePartner";
	}
	//修改全部
	@GetMapping("/partner/inquireAll")
	public String getPartner(Model model) {
		List<Partner> partners = partnerService.findAll();
		model.addAttribute("partner123",partners);
		return "partner/showAllPartners";   
	}
	//主頁
	@GetMapping("/partnerIndex")
	public String getPartner2(Model model) {
		List<Partner> partners = partnerService.findAll();
		model.addAttribute("partner",partners);
		return "partner/partnerIndex";   
	}
	
	@GetMapping("/partner/partner")
	public String getPartner1(Model model) {
		List<Partner> partners = partnerService.findAll();
		model.addAttribute("partner",partners);
		return "partner/partner";   
	}
	
	@PostMapping("/partner/_02/CheckMemberId")
	public @ResponseBody Map<String, String> existsByuniformNumbers(
			@RequestParam("uniformNumbers") String uniformNumbers
			) {
		Map<String, String> map = new HashMap<>();
		Partner partner = partnerService.findByuniformNumbers(uniformNumbers);
		if(partner ==  null) {
			map.put("uniformNumbers", "");
		} else {
			map.put("uniformNumbers", partner.getUniformNumbers());
		}
		
		return map;
	}
	//註冊成功
	@PostMapping("/register")
	public @ResponseBody Map<String, String> save(@RequestBody String partner){
		Gson gson = new Gson();
		Partner partnerId = gson.fromJson(partner, Partner.class);
		
		System.out.println("partnerId=" + partnerId);
		Map<String, String> map = new HashMap<>();
		String result = "";
		
		try {
		    partnerService.save(partnerId);
		    result =  "新增成功";
		    map.put("success", result);
		} catch(Exception e) {
			result = e.getMessage();
			map.put("fail", "新增失敗");
		}
		
		return map;
		
	}

	//修改
	@GetMapping("/partner/revises")
	public @ResponseBody Partner findByPartnerId(
			@RequestParam Integer partnerId
			) {
		return partnerService.findByPartnerId(partnerId);
	}
	//修改
	@GetMapping("/partner/revises/{id}")
	public @ResponseBody Partner findById(
			@PathVariable Integer partnerId
			) {
		return partnerService.findById(partnerId);
	}
	//修改
	@PutMapping("/partner/revisePartner")
	public  @ResponseBody Map<String, String> sendEditPartner(
			@RequestBody String frontPartner,
			@ModelAttribute("loginPartner") Partner partner,
			Model model
			) {
		Gson gson = new Gson();
		Partner newPartner = gson.fromJson(frontPartner, Partner.class);
		
		newPartner.setPartnerId(partner.getPartnerId());
		newPartner.setUniformNumbers(partner.getUniformNumbers());

		
		//做update
		
		System.out.println("partnerId=" + newPartner);
		Map<String, String> map = new HashMap<>();
//		partner.setPartnerId(Integer.parseInt(partnerId));
		String result = "";
		try {
		    partnerService.update(newPartner);
		    result =  "修改成功";
		    map.put("success", result);
		} catch(Exception e) {
			result = e.getMessage();
			map.put("fail", result);
		}
		model.addAttribute("loginPartner", newPartner);
		return map;
	}
	
/*	@PutMapping("/revisePartner")
	public @ResponseBody Map<String, String> update1(
			@RequestBody Partner Partner
			
			){
		System.out.println("partnerId=" + Partner);
		Map<String, String> map = new HashMap<>();
//		partner.setPartnerId(Integer.parseInt(partnerId));
		String result = "";
		try {
		    partnerService.update(Partner);
		    result =  "新增成功";
		    map.put("success", result);
		} catch(Exception e) {
			result = e.getMessage();
			map.put("fail", result);
		}
		
		return map;	
}*/
	//修改
	@GetMapping("/partner/revise")
	public @ResponseBody List<Partner> findAll() {
		return partnerService.findAll();
	}
	//修改	
	@GetMapping("/partner/reviseForm") 
	public String sendAjaxPartnerForm() {
		return "partner/showAllPartnersRevise";
	}
	//修改
	@GetMapping("/partner/editForm") 
	public String sendEditPartnerForm(
			@RequestParam("partnerId") String partnerId,
			Model model
			) {
		model.addAttribute("partnerId", partnerId);
		return "partner/revise";
	}
	//訂單查詢
	@GetMapping("/partner/orderdetails") 
	public String sendOrderDetailsForm() {
		return "partner/orderdetails";
	}
	//訂單查詢	
	@PutMapping("/partner/revises/{partnerId}")
		public @ResponseBody Map<String, String> update(
				@RequestBody Partner partner,
				@PathVariable String partnerId
				){
			System.out.println("partnerId=" + partnerId);
			Map<String, String> map = new HashMap<>();
//			partner.setPartnerId(Integer.parseInt(partnerId));
			String result = "";
			try {
			    partnerService.update(partner);
			    result =  "新增成功";
			    map.put("success", result);
			} catch(Exception e) {
				result = e.getMessage();
				map.put("fail", result);
			}
			
			return map;	
	}

//		@ModelAttribute("partner")
//		public Partner getPartner(
//			@PathVariable(value="partnerId", required = false) Integer partnerId	
//				) {
//			Partner partner = null;
//			if (partnerId == null)  {
//				partner = new Partner();
//			} else {
//				partner = partnerService.findById(partnerId);
//			}
//			System.out.println("@ModelAttribute之 partner=" + partner);
//			return partner;
//		}
		

		//登入		
		@PostMapping(path="/partnerlogin")
		public String Login(@RequestParam("uniformNumbers") String uniformNumbers, @RequestParam("password") String password,
				Model model) {
			System.out.println("uniformNumbers="+uniformNumbers);
			
			Map<String, String> errors = new HashMap<String, String>();
			model.addAttribute("errors", errors);
	        if(uniformNumbers.equals("")) {
	        	errors.put("userName","請輸入帳號");
	        }
	        if(password.equals("")) {
	        	errors.put("userPwd","請輸入密碼");
	        }
			if(errors!=null && !errors.isEmpty()) {
			    return "partnerlogin";
			}
			Partner partner = partnerService.selectById(uniformNumbers);
			
			if (partner != null) {
				String correctPwd = partner.getPassword().trim();
				String correctID = partner.getUniformNumbers().trim();
				
				System.out.println(password + " " + correctPwd);
				System.out.println(correctID);
				System.out.println(password.equals(correctPwd));
				if (password.equals(correctPwd) ) {
					
					model.addAttribute("loginPartner", partner);

					return "redirect:/partner/partner";
				}
			}
			errors.put("msg", "帳號或密碼不正確");
			return "redirect:/partner/partnerlogin";
		}
		//登入確認
//		@GetMapping(path="/checklogin")
//		public @ResponseBody Partner checklogin(@ModelAttribute("loginPartner")Partner partner) {
//			String uniformNumbers = "";
//			uniformNumbers = partner.getUniformNumbers();
//			System.out.println("resText is "+ uniformNumbers);
//			return partner;
//		}
		//取得ID資料
		@PostMapping(path="/partner/getpartnerdata")
		public @ResponseBody Partner getPartnerData(@ModelAttribute("loginPartner")Partner partner) {

			System.out.println(partner);
			return partner;
		}
		
		
		//所有訂單
		 @GetMapping(path="/partner/showAllOrder")
		    public @ResponseBody String ShowPurchaseRecord(@ModelAttribute("loginPartner") Partner partner) {
			 List<OrderDetails> orders = partnerService.selectAllOrder(partner.getPartnerId());
			 
			 ObjectMapper om = new ObjectMapper();
			 String s ="";
			 System.out.println(orders.get(0));
			 for(int i = 0; i < orders.size(); i++) {
				 if(i!=0) {
					 s += ",";
				 }
				 try {
					 s += om.writeValueAsString(orders.get(i));
				 }catch(JsonProcessingException e){
					 e.printStackTrace();
				 }
			 }
		    	return s;
		    }
			
		 @GetMapping(path="/partner/showOrderDetails/{orderId}")
		    public @ResponseBody OrderDetails ShowOrderDetails(
		    		@PathVariable Integer orderId,
		    		@ModelAttribute("loginPartner") Partner partner) {
		    	List<OrderDetails> orders = partnerService.selectAllOrder(partner.getPartnerId());
		    	//確認使用者擁有此筆訂單
		    	for(int i = 0; i< orders.size(); i++) {
//		    		System.out.print("orderId.get("+i+"): "+orders.get(i).getOrderId()+" ");
//		    		System.out.println(orders.get(i).getOrderId().equals(orders));
		    		if(orders.get(i).getOrderId().equals(orderId)) {
		    			return orders.get(i);
		    		}
		    	}
		    	//如果此使用者不擁有這筆訂單記錄，則不顯示
		    	return null;
		    }

		
		//=========登出==========
		
		@GetMapping(path="/partner/logout")
		public String Logout(HttpSession session, SessionStatus status) {
			session.removeAttribute("loginPartner");
			//使用SessionAttribute需要用SessionStatus.setComplete()來清除
			status.setComplete();
			//不用redirect的話網址會保留在logout
			return "redirect:/";
		}
		
}
