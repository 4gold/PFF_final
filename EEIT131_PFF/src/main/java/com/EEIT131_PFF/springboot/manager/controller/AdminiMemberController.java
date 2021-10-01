package com.EEIT131_PFF.springboot.manager.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
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

import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.manager.service.AdminiMemberService;
import com.google.gson.Gson;

@Controller
public class AdminiMemberController {

	@Autowired
	AdminiMemberService AdminiMemberService;

	//從bean找資料到/user/alluser
	@GetMapping("/user/alluser")    
	public @ResponseBody List<Member> findAll() {
		return AdminiMemberService.findAll();
	}
	//將/user/alluser找到的資料 塞到AllMembers.jsp給的表格裡面
	@GetMapping("/user/allmemberpage")
	public String findAllmember() {
		return "/manager/ShowMembers";
	}
	//----------------------------------------------------------
	
	//檢查帳號格式
	@PostMapping("/CheckMemberId")
	public @ResponseBody Map<String, String> existsByMemberId(
			 @RequestParam("accountId") String accountId) {
		Map<String, String> map = new HashMap<>();
		Member member = AdminiMemberService.findByUserId(accountId);
		if (member == null) {
			map.put("accountId", "");
		} else {
			map.put("accountId", member.getAccountId());
		}
		return map;
	}
	//------------------------------------------------------------
	
	//新增會員資料
	@GetMapping("/user/addmember")
	public String addMemberForm(Model model) {
		return "manager/AddMember";
	}

	@PostMapping(path="/user/addmemberpage", consumes = "application/json")
	public @ResponseBody Map<String, String> save(
		   @RequestBody String account
			) {
		Gson gson = new Gson();
		Member member = gson.fromJson(account, Member.class);
		
		String pwd = member.getPassword();
		String hashed = BCrypt.hashpw(pwd, BCrypt.gensalt(11));
		member.setPassword(hashed);
		
		System.out.println("Member=" + member);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		member.setCreateTime(ts);
		Map<String, String> map = new HashMap<>();
		String result = "";
		
		if(member.getAccountId() == null || member.getPassword( ) == null) {
        	map.put("fail", "請輸入帳號欄位及密碼");
        	return map;
        } 
		try {
			AdminiMemberService.save(member);
			result = "新增成功,3秒後跳轉";
			map.put("success", result);
		} catch (Exception e) {
			result = e.getMessage();
			map.put("fail", result);
		}
		return map;
	}
	//---------------------------------------------------------------
	
	//修改會員資料
	@GetMapping("/user/updatemembers")
	public String sendEditMemberForm(
			@RequestParam("memberId") Integer memberId,
			Model model
			) {
		model.addAttribute("idid", memberId);
		return "manager/UpdateMember";
	}
	
	@GetMapping("/user/updatememberpage")
	public String sendAjaxMemberForm() {
		return "manager/ShowMembers";
	}
	
	@GetMapping("/user/member")
	public @ResponseBody Member findByMemberId(
			@RequestParam Integer memberId
			) {
		System.out.println("memberId="+memberId);
		return AdminiMemberService.findByMemberId(memberId);
	}
	
	@GetMapping("/user/member/{memberId}")
	public @ResponseBody Member findById(
			@PathVariable Integer memberId
			) {
		return AdminiMemberService.findById(memberId);
	}
	
	
	@PutMapping("/user/updatemember/{memberId}")
	public @ResponseBody Map<String, String> update(
		   @RequestBody Member member,
		   @PathVariable Integer memberId
			) {
		System.out.println("update()之 member=" + member);
		Map<String, String> map = new HashMap<>();
		String result = "";
		try {

		   
		   Member original = AdminiMemberService.findByMemberId(memberId);
		   
		   member.setMemberId(memberId);
		   member.setAccountId(original.getAccountId());
		   member.setPassword(original.getPassword());
		   member.setActiveCode("xx");
		   member.setActiveStatus(original.getActiveStatus());
		   member.setCreateTime(original.getCreateTime());
		   
			System.out.println("============");
			System.out.println(member);
			System.out.println("============");
			   
		   AdminiMemberService.update(member);
		   result = "修改成功,3秒後跳轉";
		   map.put("success", result);
		} catch(Exception e) {
		   result = e.getMessage();	
		   map.put("fail", result);
		}
		return map;
	}
	//-------------------------------------------------------------------------------
	
	//刪除
	@DeleteMapping(path="/user/deletemember/{memberId}")
	public String DeleteMember(
			@PathVariable Integer memberId
			) {
		AdminiMemberService.DeleteMember(memberId);
		
		return "true";
	}

}