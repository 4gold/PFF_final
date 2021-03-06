package com.EEIT131_PFF.springboot.users.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.hibernate.internal.build.AllowSysOut;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.EEIT131_PFF.springboot.users.service.MemberService;
import com.EEIT131_PFF.springboot.users.service.ProductServiceTemp;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.EEIT131_PFF.springboot.model.Bookmark;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberHealth;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.EEIT131_PFF.springboot.model.SavedPayment;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;

import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.DataStoreFactory;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.sun.source.tree.MemberReferenceTree;

import net.bytebuddy.utility.RandomString;

@Controller
@SessionAttributes("loginAccount")
public class MemberController {
	
	
	@GetMapping({"/member/index","/member"})
	public String Home(Model model) {
		return "member/index";
	}
	
    //????????????
	@GetMapping("/memberloginpage")
	public String LoginMain() {
		return "member/login";
	}
	//????????????
	@GetMapping("/memberregisterpage")
	public String RegisterMain() {
		// Hash a password for the first time
		String password = "111111";
		// gensalt's log_rounds parameter determines the complexity
		// the work factor is 2**log_rounds, and the default is 10
		String hashed = BCrypt.hashpw(password, BCrypt.gensalt(11));//??????
		System.out.println(hashed);
		Boolean b  = BCrypt.checkpw(password, hashed );
		System.out.println(b);
		
		return "member/register";
	}
	//???????????????????????????
	@GetMapping("/registerEmailpage")
	public String RegisterEmailMain() {
		return "member/registerEmailVerification";
	}
	
	//??????????????????
	@GetMapping(path="/member/memberupdatepage")
	public String MemberUpdateMain() {
		
		return "member/memberupadte";
	}
    
	//????????????????????????
	@GetMapping(path="/member/savedpaymentpage")
	public String SavedPaymentMain() {
		return "member/savedpayment";
	}
	
	//????????????????????????
	@GetMapping(path="/member/updatepaymentpage/{sv}")
	public String UpdatePaymentMain() {
		return "member/updatepayment";
	}
	//????????????????????????
	@GetMapping(path="/member/addpaymentpage")
	public String AddPaymentMain() {
		return "member/insertpayment";
	}
	
	//??????????????????
	@GetMapping(path="/member/memberbookmarkpage")
	public String BookmarkMain() {
		return "member/memberbookmark";
	}
	
//	//????????????????????????
//	@GetMapping(path="/cartpage")
//	public String ShoppingCartRef() {
//		return "shopping-cart";
//	}
	
	//??????????????????
	@GetMapping(path="/member/purchaserecordpage")
	public String PurchaseRecordPage() {
		return "member/purchaserecord";
	}
	
	//??????????????????????????????
    @GetMapping(path="/member/orderdetailspage/{orderId}")
    public String ShowOrderDetails() {    	
    	return "member/orderdetails";
    }
    //(??????)????????????
    @GetMapping(path="/member/memberpasswordpage")
    public String MemberPasswordUpdatePage() {
    	return "member/updatepassword";
    }
    //(??????)??????????????????
    @GetMapping(path="/updatepwdsuccesspage")
    public String PasswordUpdateSuccessPage() {
    	return "member/updatepwdsuccess";
    }
    //(??????)??????????????????
    @GetMapping(path="/forgetpasswordapplication")
    public String ForgetPasswordApplicationPage() {
    	return "member/forgetpasswordapplication";
    } 
    //(??????)????????????????????????
    @GetMapping(path="/forgetpasswordemailsend")
    public String ForgetPasswordEmailSendPage() {
    	return "member/forgetpasswordemailsend";
    }
    
    //(??????)????????????????????????
    @GetMapping(path="/updatepwdsuccesspage_forgetpwd")
    public String ForgotChangeSuccessPage() {
    	return "member/updatepwdsuccess_forgetpwd";
    }

	
	@Autowired
	MemberService service;

	//=========??????=========
	@PostMapping(path="/memberregister")
	public @ResponseBody Map<String, String> register(@RequestBody String account) {
		
		Gson gson = new Gson();
		Member member = gson.fromJson(account, Member.class);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		member.setCreateTime(ts);
		//0-->?????????
		member.setActiveStatus(0);
		
		String pwd = member.getPassword();
		String hashed = BCrypt.hashpw(pwd, BCrypt.gensalt(11));
		member.setPassword(hashed);
		
		//???net.bytebuddy.utility???Spring????????????RandmoString????????????64????????????
		String randomCode = RandomString.make(64);
	    member.setActiveCode(randomCode);
		Map<String, String> map = new HashMap<String, String>();
		String result = "";
		try {
			service.save(member);
			

		} catch (Exception e) {
			result = e.getMessage();
		}
		if (result.length() == 0) {
			//????????????????????????
			try {
				sendVerificationEmail(member);
			}catch(MessagingException e) {
				result = e.getMessage();
			}catch(UnsupportedEncodingException e){
				result = e.getMessage();
			}
			map.put("success", "success");
		} else {
			map.put("fail", result);
		}
		System.out.println("member=" + member);

		return map;
	}
	
	@GetMapping(path="/verify")
	public String veryficationComplete(@Param("code")String code) {
		if(verify(code)) {
			return "member/verifySuccess";
		}
		return "member/verifyFail";
	}
	
	public boolean verify(String activeCode) {
	    Member member = service.findByActiveCode(activeCode);
	    //???????????????????????????????????????????????????1(1:?????????2:?????????3:????????????)
	    if (member == null || member.getActiveStatus()>=1 || activeCode.equals("done")) {
	        return false;
	    } else {
	        member.setActiveCode("done");
	        member.setActiveStatus(1);
	        service.merge(member);
	         
	        return true;
	    }
	     
	}
	
	@Autowired
    private JavaMailSender mailSender;
	
	private void sendVerificationEmail(Member member)
	        throws MessagingException, UnsupportedEncodingException {
	    String toAddress = member.getEmail();
	    String fromAddress = "eeit13120@outlook.com";
	    String senderName = "??????????????????";
	    String subject = "??????????????????";
	    String content = "?????? [[name]]???<br>"
	            + "???????????????????????????????????????????????????<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">????????????????????????</a></h3>"
	            + "??????,<br>"
	            + "??????????????????";
	     
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	    
		//????????????
		String baseUrl = 
				ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
	     
	    content = content.replace("[[name]]", member.getUserName());
	    //verifyURL=http://localhost:8080/PFF/verify?code=activeCode
	    String verifyURL = baseUrl + "/verify?code=" + member.getActiveCode();    
	     
	    content = content.replace("[[URL]]", verifyURL);
	     
	    helper.setText(content, true);
	     
	    mailSender.send(message);
	     
	}
	//=========??????=========
	
	@PostMapping(path="/memberlogin")
	public String Login(
			@RequestParam("accountId") String accountId, 
			@RequestParam("password") String password,
			Model model) {
		System.out.println("accountId="+accountId);
		
		Map<String, String> errors = new HashMap<String, String>();
		model.addAttribute("errors", errors);
        if(accountId.equals("")) {
        	errors.put("userName","???????????????");
        }
        if(password.equals("")) {
        	errors.put("userPwd","???????????????");
        }
		if(errors!=null && !errors.isEmpty()) {
		    return "member/login";
		}
		Member member1 = service.selectById(accountId);

		// Try turn this into DAO
		// boolean isAccess = uDAO.login(accountID, accountPwd);
		if (member1 != null) {
			String correctPwd = member1.getPassword().trim();
			String correctID = member1.getAccountId().trim();
			Integer activeStatus = member1.getActiveStatus();
			System.out.println(password + " " + correctPwd);
			System.out.println(correctID);
//			System.out.println(password.equals(correctPwd));
			Boolean b  = BCrypt.checkpw(password, correctPwd);
			if (b&&activeStatus==1) {
				
				//???????????????????????????????????????Session
				model.addAttribute("loginAccount", member1);

				return "redirect:/index";
			}
		}
		errors.put("msg", "????????????????????????");
		return "member/login";
	}
	
	//?????????????????????????????????????????????????????????
	@GetMapping(path="/checklogin")
	public @ResponseBody String checklogin(@ModelAttribute("loginAccount")Member account) {
		String accountId = "";
		accountId = account.getAccountId();
		
		System.out.println("account is "+ account.getMemberId());
		return account.getPassword();
	}
	

	String CLIENT_ID = "508378394577-lf8cttkpvvcftanejqt96jii1b33hvna.apps.googleusercontent.com";


	@PostMapping(path="/googlelogin")
	public @ResponseBody String GoogleLogin(
			@RequestParam("idtoken") String idTokenString,
			Model model) {
		HttpTransport transport = new NetHttpTransport();
		JsonFactory jsonFactory = new JacksonFactory();
		
		   GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
			    // Specify the CLIENT_ID of the app that accesses the backend:
			    .setAudience(Collections.singletonList(CLIENT_ID))
			    // Or, if multiple clients access the backend:
			    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
			    .build();
			// (Receive idTokenString by HTTPS POST)

			GoogleIdToken idToken;
			try {
				idToken = verifier.verify(idTokenString);
				if (idToken != null) {
					  Payload payload = idToken.getPayload();

					  // Print user identifier
					  String userId = payload.getSubject();
					  System.out.println("User ID: " + userId);

					  // Get profile information from payload
					  String email = payload.getEmail();
					  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
					  String name = (String) payload.get("name");
					  String pictureUrl = (String) payload.get("picture");
					  String locale = (String) payload.get("locale");
					  String familyName = (String) payload.get("family_name");
					  String givenName = (String) payload.get("given_name");
                      System.out.println("name is: "+name);
                      System.out.println("given_name is: "+givenName);
					  // Use or store profile information
					  // ...
                      Member account = service.selectById(userId);
                      //??????????????????????????????????????????????????????????????????????????????????????????????????????????????????
                      if(account==null) {
                    	  Member member = new Member();
                    	  member.setAccountId(userId);
                    	  String randomCode = RandomString.make(64);
                    	  member.setPassword(randomCode);
                    	  //???2??????google??????
                    	  member.setActiveStatus(2);
                    	  member.setAddress("");
                  		  Timestamp ts = new Timestamp(System.currentTimeMillis());
                    	  member.setCreateTime(ts);
                    	  member.setBirthday("");                 	  
                    	  member.setEmail(email);
                    	  member.setPhone1("");
                    	  member.setUserName(name);
                    	  
                    	  service.save(member);
                    	  account = service.selectById(userId);
                       }
                      
                      model.addAttribute("loginAccount", account);
					  return "1";
					} else {
					  System.out.println("Invalid ID token.");
					  return "????????????";
					}
			} catch (GeneralSecurityException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();				
			}

		return "????????????";
	}
	
	//========??????????????????=========
	
	@PostMapping(path="/member/getmemberdata")
	public @ResponseBody Member getMemberData(@ModelAttribute("loginAccount")Member account) {
		System.out.println(account.getMemberHealth());
		System.out.println(account);
		return account;
	}
	
	@PostMapping(path="/member/memberupdate")
	public @ResponseBody String memberupdate(
			@RequestBody String memberData,
			@ModelAttribute("loginAccount")Member account,
			Model model) {
		System.out.println(memberData);
		
		
		Integer memberId = account.getMemberId();
		String password = account.getPassword();
		Timestamp createTime = account.getCreateTime();
		String activeCode = account.getActiveCode();
		Integer activeStatus = account.getActiveStatus();
		Gson gson = new Gson();
		
		Member member = new Member();
        //merge????????????????????????????????????????????????????????????
        member = gson.fromJson(memberData, Member.class);
        member.setAccountId(account.getAccountId());
        member.setMemberId(memberId);
        member.setPassword(password);
        member.setCreateTime(createTime);
        member.setActiveCode(activeCode);
        member.setActiveStatus(activeStatus);
        member.setBookmark(member.getBookmark());

        
        System.out.println(member);
        MemberHealth memberHealth = null;
        try {
        	
//        	memberHealth = gson.fromJson(memberData, MemberHealth.class); 
        	
        	memberHealth = new MemberHealth();
        	JsonObject jobj = new Gson().fromJson(memberData, JsonObject.class);
            memberHealth.setGender(jobj.get("gender").getAsString());
            memberHealth.setHeight(jobj.get("height").getAsDouble());
            memberHealth.setWeight(jobj.get("weight").getAsDouble());
        }catch(Exception e){
        	System.out.println("??????????????????");
        }
        
        if(memberHealth!=null) {
            
            System.out.println(memberHealth);
            
            
            
            if(memberHealth.getHeight()!=null && memberHealth.getWeight()!=null) {
                Double bmi = memberHealth.getWeight()/Math.pow(memberHealth.getHeight()/100, 2);
                memberHealth.setBmi(bmi);
            }
            
            
            //memberhealth-->Member ??? fk?          
            
            if(account.getMemberHealth()==null) {
            	memberHealth.setMember(member);
            	System.out.println("memberHealth saves");
            	service.saveHealth(memberHealth);
            }else {
            	memberHealth.setFk_memberId(memberId);
            }
            
            
            System.out.println(memberHealth);
            
           
            
            //Member-->MemberHealth ??? ????????????
            member.setMemberHealth(memberHealth);
//            memberHealth.setMember(member);
            
            
            
        }else if(account.getMemberHealth()!=null){
        	System.out.println("already has MemberHealth");
        	member.setMemberHealth(account.getMemberHealth());
        }

        
        try {
        	 service.merge(member);
        	 System.out.println(memberHealth);
        
        }catch(Exception e) {
        	return "fail";
        }
   	    //??????SessionAttribute?????????
   	    model.addAttribute("loginAccount", member);
        
		return "success";
	}
	
	//========????????????========
	
	@PutMapping(path="/member/updatepassword")
	public @ResponseBody String MemberPasswordUpdate(
			HttpSession session, 
			SessionStatus status,
			@ModelAttribute("loginAccount") Member account,
			@RequestParam("pwd") String frontPwd,
			@RequestParam("oldpwd") String frontOldPwd
			) {
		
		String hashed = BCrypt.hashpw(frontPwd, BCrypt.gensalt(11));
		String oldPwd = account.getPassword().trim();
		
		if(!BCrypt.checkpw(frontOldPwd, oldPwd)) {
			return "????????????";
		}
		try {
			service.updateMemberPwd(hashed, account.getMemberId());
			//System.out.println("???????????????");
		}catch(Exception e) {
			
			return "????????????????????????????????????";
		}
		session.removeAttribute("loginAccount");
		status.setComplete();
		
		return "true";
	}
	
	@PostMapping(path="/member/checkpwd")
	public @ResponseBody String CheckPwd(
			@ModelAttribute("loginAccount") Member account,
			@RequestParam("pwd") String frontPwd){		
		String backPwd = service.selectById(account.getAccountId()).getPassword();
		
		Boolean b  = BCrypt.checkpw(frontPwd,backPwd);
		if(b) {
			return "true";
		}
		return "????????????";
		
		
	}
	
	//========????????????========
	
	//??????email??????
	@GetMapping(path="/checkemail")
	public @ResponseBody String checkEmail(
			@RequestParam("email") String frontEmail) {
		
		Boolean hasEamil = service.hasEmail(frontEmail);
		if(hasEamil) {
			return "true";
		}
		
		return "Email?????????";
	}
	
	@GetMapping(path="/sendforgetemail")
	private @ResponseBody String SendForgetEmail(
			@RequestParam("email") String email)
	        throws MessagingException, UnsupportedEncodingException {
		Boolean hasEmail = service.hasEmail(email);
		if(!hasEmail) {
			return "???????????????";
		}
		Member member = service.selectByEmail(email);
		
		String randomCode = RandomString.make(64);
	    String toAddress = email;
	    String fromAddress = "eeit13120@outlook.com";
	    String senderName = "??????????????????";
	    String subject = "??????????????????";
	    String content = "?????? [[name]]???<br>"
	            + "??????????????????????????????????????????<br>"
	            + "<h3><a href=\"[[URL]]\" target=\"_self\">????????????????????????</a></h3>"
	            + "??????<br>"
	            + "??????????????????";
	     
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);
	     
	    helper.setFrom(fromAddress, senderName);
	    helper.setTo(toAddress);
	    helper.setSubject(subject);
	    
		//????????????
		String baseUrl = 
				ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();
	     
	    content = content.replace("[[name]]", member.getUserName());
	    //verifyURL=http://localhost:8080/PFF/verify?code=activeCode
	    String changeURL = baseUrl + "/changepwdpage?code=" + randomCode;    
	     
	    content = content.replace("[[URL]]", changeURL);
	     
	    helper.setText(content, true);
	    
	    
		
			service.updateMemberActiveCode(randomCode, member.getMemberId());
			
			mailSender.send(message);
			
			return "true";
   
	    
	     
	}
	
	//????????????????????????????????????
    @GetMapping(path="/changepwdpage")
    public String CahngeForgotPwdPage(
    		@RequestParam("code") String activeCode) {   
    	Member member = service.findByActiveCode(activeCode);
    	if(member!=null && member.getActiveStatus()==1) {
    		return "member/changeforgotpwd";
    	}
    	
    	return "member/verifyFail";
    }
    
  //??????????????????????????????
    @PutMapping(path="/changepwd")
    public @ResponseBody String CahngeForgotPwd(
			HttpSession session, 
			SessionStatus status,
    		@RequestParam("pwd") String password,
    		@RequestParam("code") String activeCode) {  
    	
    	
    	
	
    	Member member = service.findByActiveCode(activeCode);
    	if(member!=null && member.getActiveStatus()==1) {
    		String hashed = BCrypt.hashpw(password, BCrypt.gensalt(11));

    		try {
    			service.updateMemberPwd(hashed, member.getMemberId());
    		}catch(Exception e) {
    			return "????????????";
    		}
    		service.updateMemberActiveCode("done", member.getMemberId());
    		session.removeAttribute("loginAccount");
    		status.setComplete();
    	
    		return "true";
    	}
    	return "????????????";
    	
    }
	
	
	//=========??????????????????=========
	
	@GetMapping(path="/member/showsavedpayment")
	public @ResponseBody List<SavedPayment> SavedPayment(@ModelAttribute("loginAccount")Member account) {

		List<SavedPayment> savedPayment = service.findSavedPaymentById(account.getAccountId());
		for(int i = 0; i<savedPayment.size();i++) {
			SavedPayment payment = savedPayment.get(i);
//			System.out.println(payment);
			String CardId = payment.getCardId();
			String ProtectedCardId = CardId.substring(0,4)+"-****-****-"+CardId.substring(12,16);
			savedPayment.get(i).setCardId(ProtectedCardId);
		}
//		System.out.println(savedPayment);
	    return savedPayment;
	}
	
	//????????????
	@GetMapping(path="/member/showsavedpayment/{svId}")
	public @ResponseBody SavedPayment SingleSavedPayment(
			@PathVariable Integer svId, 
			@ModelAttribute("loginAccount")Member account) {
		//????????????????????????????????????
		List<SavedPayment> savedPayment = service.findSavedPaymentById(account.getAccountId());
		boolean hasPayment = false;
		int payNum = 0;
		//(???????????????????????????????????????)???????????????????????????????????????
		for(int i = 0; i<savedPayment.size();i++) {
			SavedPayment payment = savedPayment.get(i);
//			System.out.println(payment);
			String CardId = payment.getCardId();
			String ProtectedCardId = CardId.substring(0,4)+"-****-****-"+CardId.substring(12,16);
			savedPayment.get(i).setCardId(ProtectedCardId);
			if(payment.getSavedPaymentId()==svId) {
				hasPayment = true;
				payNum = i;
			}
		}
		//????????????????????????????????????????????????????????????
		if(!hasPayment) {
			return null;
		}
		//?????????????????????????????????
		SavedPayment payment = savedPayment.get(payNum);
		
//		System.out.println(savedPayment);
	    return payment;
	}
	
	@PutMapping(path="/member/updatepayment/{svId}")
	public @ResponseBody String UpdatePayment(@PathVariable Integer svId, 
			@RequestBody SavedPayment savedPayment, 
			@ModelAttribute("loginAccount") Member account){
		
		//????????????????????????????????????
		List<SavedPayment> savedPayments = service.findSavedPaymentById(account.getAccountId());
		boolean hasPayment = false;
		int payNum = 0;
		//(???????????????????????????????????????)
		for(int i = 0; i<savedPayments.size();i++) {
			SavedPayment payment = savedPayments.get(i);
//			System.out.println(payment);
			if(payment.getSavedPaymentId()==svId) {
				hasPayment = true;
			}
		}
		
		savedPayment.setSavedPaymentId(svId);
		System.out.println(savedPayment.getAddress().equals(""));
		if(savedPayment.getAddress().equals("")) {
			savedPayment.setAddress("");
		}else if(savedPayment.getShopAddress().equals("")) {
			savedPayment.setShopAddress("");
		}
		if(savedPayment.getAddress().equals("")&&savedPayment.getShopAddress().equals("")){
			return "????????????????????????";
		}
		if(savedPayment.getCardId().equals("")||savedPayment.getPayerName().equals("")||savedPayment.getEmail().equals("")||savedPayment.getPhone().equals("")) {
			return "??????????????????????????????";
		}
		
		
		savedPayment.setMember(account);		
		
		System.out.println(savedPayment);
		service.merge(savedPayment);

		
		return "true";
	}
	
	@PostMapping(path="/member/addpayment")
	public @ResponseBody String AddPayment(
			@RequestBody SavedPayment savedPayment, 
			@ModelAttribute("loginAccount") Member account) {
		System.out.println(savedPayment);
		
		System.out.println(savedPayment.getAddress().equals(""));
		if(savedPayment.getAddress().equals("")) {
			savedPayment.setAddress("");
		}else if(savedPayment.getShopAddress().equals("")) {
			savedPayment.setShopAddress("");
		}
		if(savedPayment.getAddress().equals("")&&savedPayment.getShopAddress().equals("")){
			return "????????????????????????";
		}
		if(savedPayment.getCardId().equals("")||savedPayment.getPayerName().equals("")||savedPayment.getEmail().equals("")||savedPayment.getPhone().equals("")) {
			return "??????????????????????????????";
		}
		

		
		savedPayment.setMember(account);
		
		service.save(savedPayment);

		
		return "true";
		
		
	}
	
	@DeleteMapping(path="/member/deletepayment/{svId}")
	public String DeletePayment(
			@PathVariable Integer svId,
			@ModelAttribute("loginAccount")Member account) {
			
		service.deletePayment(svId);
		
		return "true";
	}
	
	//==========??????????????????==========
	
	@GetMapping(path="/member/showbookmark")
	public @ResponseBody List<Product> ShowBookmark(@ModelAttribute("loginAccount") Member account){
		List<Bookmark> bookmarks = service.selectFromBookmarkBymemberId(account.getMemberId());
		
		List<Product> products = new ArrayList<Product>();
		
		for(int i = 0; i < bookmarks.size(); i++) {
			products.add(bookmarks.get(i).getProduct());
		}
		
		
		return products;
	}
	
	@DeleteMapping(path="/member/deletebookmark/{productId}")
	public String DeleteBookmark(
			@PathVariable Integer productId,
			@ModelAttribute("loginAccount")Member account) {
		System.out.println(account);
		service.deleteBookmark(productId, account);
		
		
		
		return "true";
	}
	
	@GetMapping(path="/memberaddbookmark")
	public @ResponseBody String addBookmark() {
		productServiceTemp.saveBookmark();	
		return "done";
	}
	
	//=========??????????????????=========
	
    @GetMapping(path="/member/showpurchaserecord")
    public @ResponseBody String ShowPurchaseRecord(@ModelAttribute("loginAccount") Member account) {
    	List<OrderDetails> orders = service.selectAllPurchaseRecord(account.getMemberId());
//     	List<OrderDetails> orderDetails = service.selectAllPurchaseRecord(account.getMemberId());
//    	Map<OrderDetails, List<Product>> orders = new HashMap<OrderDetails, List<Product>>();
//    	
//    	for(int i = 0; i < orderDetails.size();i++) {
//    		List<SalesOrder> salesOrders = service.findSalesOrdersByOrderId(orderDetails.get(i).getOrderId());
//    		List<Product> products = new ArrayList<Product>();
//    		for(int j = 0; j < salesOrders.size(); j++) {
//    			products.add(salesOrders.get(i).getProduct());
//    		}   		
//    		orders.put(orderDetails.get(i), products);
//    	}
//    	
//    	return orders;
    	
    	ObjectMapper om = new ObjectMapper();
        String s = "";
        for(int i = 0; i < orders.size();i++) {
        	if(i!=0) {
        		s+=",";
        	}
        	try {
				s += om.writeValueAsString(orders.get(i));
				System.out.println(s);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
        }
    	return s;
    }
	
    @GetMapping(path="/member/showorderdetails/{orderId}")
    public @ResponseBody OrderDetails ShowOrderDetails(
    		@PathVariable("orderId") Integer orderId,
    		@ModelAttribute("loginAccount") Member account) {
    	List<OrderDetails> orders = service.selectAllPurchaseRecord(account.getMemberId());
    	//?????????????????????????????????
    	for(int i = 0; i< orders.size(); i++) {
//    		System.out.print("orderId.get("+i+"): "+orders.get(i).getOrderId()+" ");
//    		System.out.println(orders.get(i).getOrderId().equals(orders));
    		if(orders.get(i).getOrderId().equals(orderId)) {
    			return orders.get(i);
    		}
    	}
    	//????????????????????????????????????????????????????????????
    	return null;
    }

	
	//=========??????==========
	
	@GetMapping(path="/member/logout")
	public String Logout(HttpSession session, SessionStatus status) {
		session.removeAttribute("loginAccount");
		//??????SessionAttribute?????????SessionStatus.setComplete()?????????
		status.setComplete();
		//??????redirect????????????????????????logout
		return "redirect:/memberloginpage";
	}
	
	//========????????????????????????========
	
	@Autowired
	ProductServiceTemp productServiceTemp;
	
	@GetMapping(value="/productupload")
	public String ProductUploadPage() {
		return "AP1";
	}
	
	@PostMapping(value="/product/save",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Product> saveData(
			@RequestBody Product product
			){
		Partner partner = productServiceTemp.find(1000);
		String i= product.getFileDataURL();
		if(product.getFileDataURL()!=null) {
			int startIndex="data:".length();
			System.out.println(product.getFileDataURL());
			int endIndex=product.getFileDataURL().indexOf(",");
			String mimeType=product.getFileDataURL().substring(startIndex,endIndex);
			String base64 = product.getFileDataURL().substring(product.getFileDataURL().indexOf(",")+1);
			byte[] a = Base64.getDecoder().decode(base64);
			System.out.println(a);
			System.out.println(base64);
			System.out.println(mimeType);
			String result="";
			try {
				product.setCoverImage(new SerialBlob(a));
			}catch(SerialException e){
				e.printStackTrace();
				result=e.getMessage();
			}catch(SQLException e){
				e.printStackTrace();
			}
			product.setMimeType(mimeType);
			product.setFileDataURL(i);
			

			product.setPartner(partner);
//			partner.getProducts().add(product);
			
		}else {
			
			product.setCoverImage(null);
			product.setMimeType(null);
			product.setPartner(partner);
		}
		System.out.println(product);
		productServiceTemp.save(product);
		return productServiceTemp.findAll();
	}
	
	
	@GetMapping("/member/getProductImage")
	public ResponseEntity<byte[]> getCoverImage(
			@RequestParam("productId") Integer productId
			){
		System.out.println(productId);
		ResponseEntity<byte[]> re = null;
		Product product = productServiceTemp.findById(productId);
		HttpHeaders headers = new HttpHeaders();
		
		if(product.getCoverImage()!=null) {
			Blob blob= product.getCoverImage();
			MediaType mediaType = MediaType.valueOf(product.getMimeType());
			
			try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			InputStream is = blob.getBinaryStream();
			byte[] b = new byte[81920];
			int len = 0;
			while((len=is.read(b))!=-1) {
				baos.write(b,0,len);
			}
			headers.setContentType(mediaType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			re = new ResponseEntity<byte[]>(baos.toByteArray(),HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {
			headers.setContentType(null);
			re = null;
			System.out.println(product.getProductId()+"doesn't have images");
		}
		return re;
	}
	
}
