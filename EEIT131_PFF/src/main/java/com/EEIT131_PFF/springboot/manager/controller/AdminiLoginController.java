package com.EEIT131_PFF.springboot.manager.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

//import javax.sql.rowset.serial.SerialBlob;
//import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.EEIT131_PFF.springboot.model.Administrator;
import com.EEIT131_PFF.springboot.manager.service.AdministratorService;



@Controller
@SessionAttributes("loginManager")
public class AdminiLoginController {

	@Autowired
	AdministratorService AdministratorService;
	
	//登入頁面
		@GetMapping("/managerloginpage")
		public String LoginMain() {
			return "manager/Managerlogin";
		}
		@GetMapping("/manager/page")
		public String ManagerMain() {
			return "manager/Managermenu";
		}
		
		@PostMapping(path="/managerlogin")
		public String Login(@RequestParam("accountId") String accountId, @RequestParam("password") String password,
				Model model) {
			System.out.println("accountId="+accountId);
			
			Map<String, String> errors = new HashMap<String, String>();
			model.addAttribute("errors", errors);
	        if(accountId.equals("")) {
	        	errors.put("userName","請輸入帳號");
	        }
	        if(password.equals("")) {
	        	errors.put("userPwd","請輸入密碼");
	        }
			if(errors!=null && !errors.isEmpty()) {
			    return "login";
			}
			Administrator administrator1 = AdministratorService.selectById(accountId);

			// Try turn this into DAO
			// boolean isAccess = uDAO.login(accountID, accountPwd);
			if (administrator1 != null) {
				String correctPwd = administrator1.getPassword().trim();
				String correctID = administrator1.getAccountId().trim();
				System.out.println(password + " " + correctPwd);
				System.out.println(correctID);
				System.out.println(password.equals(correctPwd));
				if (password.equals(correctPwd)) {
					
					//如果登入成功將登入帳號送進Session
					model.addAttribute("loginManager",administrator1);

					return "redirect:/manager/page";
				}
			}
			errors.put("msg", "帳號或密碼不正確");
			return "manager/Managerlogin";
		}
		
		@GetMapping(path="/managerlogin")
		public @ResponseBody String checklogin(@ModelAttribute("loginManager")Administrator account) {
			String accountId = "";
			accountId = account.getAccountId();
			System.out.println("resText is "+ accountId);
			return accountId;
		}
		
		//=========登出==========
		
		@GetMapping(path="/managerlogout")
		public String Logout(HttpSession session, SessionStatus status) {
			session.removeAttribute("loginManager");
			//使用SessionAttribute需要用SessionStatus.setComplete()來清除
			status.setComplete();
			//不用redirect的話網址會保留在logout
			return "redirect:/index";
		}
	

}