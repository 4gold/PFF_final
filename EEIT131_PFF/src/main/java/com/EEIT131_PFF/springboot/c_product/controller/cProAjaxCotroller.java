package com.EEIT131_PFF.springboot.c_product.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import com.EEIT131_PFF.springboot.c_product.service.cProductService;
import com.EEIT131_PFF.springboot.model.Product;
import com.google.gson.Gson;



@Controller
//@SessionAttributes({"Cart","discountList", "loginAccount"})
public class cProAjaxCotroller {

	@Autowired
	EntityManager entityManager;
		
	@Autowired
	cProductService productService;
	
	//跑/Cart/Map的JSP
	@GetMapping("/Map")
	 public String MAP() {
	  return "/Cart/Map";
	 }
	
	//跑/Cart/AP5的JSP
	@GetMapping({"/","/Cart/AP5","/index"})
	 public String findAllAP5() {
	  return "/Cart/AP5";
	 }
	
	@GetMapping("/Cart/EAP6")
	 public String findAllAP6() {
	  return "/Cart/EAP6";
	 }
	
	@GetMapping("/calories")
	 public String calories() {
	  return "/Cart/calories";
	 }
	
	@GetMapping("/calories2")
	 public String calories2() {
	  return "/Cart/calories2";
	 }
	
	@GetMapping("/calories3")
	 public String calories3() {
	  return "/Cart/calories3";
	 }
	
	@GetMapping("/cckeywordsearch")
	public @ResponseBody List<Product> viewHomePage(Model model,
			@RequestParam("keyword") String keyword) {	
		System.out.println("keyword in controller: " + keyword);
		List<Product> listProducts = productService.listAll(keyword) ;
		model.addAttribute("listProducts",listProducts);
		model.addAttribute("keyword",keyword);
		System.out.print(listProducts) ;
		return listProducts;
	}
	
	
	@GetMapping("/ccpriceProductUp")
	public @ResponseBody List<Product> findAllOrderByUp() {
		
     System.out.println(productService.findAllOrderByUp().get(0));
		return productService.findAllOrderByUp();
	}
	
	@GetMapping("/ccpriceProductDown")
	public @ResponseBody List<Product> findAllOrderBy() {
		
     System.out.println(productService.findAllOrderByDown().get(0));
		return productService.findAllOrderByDown();
	}
	
	@GetMapping("/typeProduct")
	 public @ResponseBody List<Product> getAllTP(@RequestParam("type") String productType) {
	  
	  List<Product> product = productService.getAllTP(productType);
	  
	  return product;
	 }
	
	@GetMapping("/consultion/all")
	public @ResponseBody List<Product> findAllI() {
		
     System.out.println(productService.findAllI().get(0));
		return productService.findAllI();
	}
	
	@GetMapping("/consultion/getCoverImage")
	public ResponseEntity<byte[]> getCoverImage(
			@RequestParam("productId") Integer productId
			){
		System.out.println(productId);
		ResponseEntity<byte[]> re = null;
		Product product = productService.findById(productId);
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
	
	@GetMapping("/consultion/findByInstructorid")
	public @ResponseBody Product findByInstructorid(
			@RequestParam Integer productId
			) {
		return productService.findById(productId);
	}
	
	@GetMapping("/consultion/AP2")
	 public String findAllAP2() {
	  return "AP2";
	 }
	
	@GetMapping("/consultion/AP3")
	 public String findAllAP3() {
	  return "AP3";
	 }
	
	@GetMapping("/consultion/AP4")
	 public String findAllAP4() {
	  return "AP4";
	 }
	

	
	@GetMapping("/Cart/addAP1Form")
	public String addAP1Form(Model m) {
		return"/Cart/AP1";
	}
	
	@PostMapping(value="/consultion/save",produces = {"application/json; charset=UTF-8"})
	public @ResponseBody List<Product> saveData(
			@RequestBody Product product
			){
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
		}else {
			product.setCoverImage(null);
			product.setMimeType(null);
		}
		productService.saveI(product);
		return productService.findAllI();
	}
	
	@GetMapping("/addProductForm")
	public String addProductForm(Model m) {
		return"addProduct";
	}
	
	
	
	
	@GetMapping("/product/all1")
	 public String findAllP() {
	  return "showAllProduct";
	 }
	 //--------------------------------------------------------------------------------------
	//cookie
//	@GetMapping("/cart/addProduct")
//	 public void addProduct(@CookieValue(value = "productId", defaultValue = "0") String cookie, @RequestParam("productId") String productId, HttpServletRequest req,
//	   HttpServletResponse resp) {
//	  StringBuilder shoppingCart = new StringBuilder("");//先給shoppingCart用StringBuilder方式串起來("")
//	  try {
//	   shoppingCart = new StringBuilder(URLDecoder.decode(cookie, "UTF-8"));//將 new StringBuilder做UTF-8編碼
//	  } catch (UnsupportedEncodingException e1) {
//	   e1.printStackTrace();
//	  }
//	  
//	  //Servlet方法
//	//  String nProduct = req.getParameter("newProductId");//nProduct:新商品
//	//  System.out.println("newProductId="+nProduct);
//
//	  String[] cookieList = cookie.split(",");
//	  System.out.println("cookieList="+cookieList[0]);
//	  
//	  Boolean isDuplicate = false; //是重複的? 預設布林值判斷isDuplicate(是重複的)是"否"
//	  
//	  for(int i = 0; i < cookieList.length;i++) {
//	   System.out.println("cookie="+cookieList[i]);
//	   
//	      if( productId.equals(cookieList[i])) {
//	       isDuplicate = true;
////	       shoppingCart.append("," + nProduct);//indexOf 
//	      }
//	  }
//	  
//	  
//	  if(isDuplicate == false) {
//	      shoppingCart.append("," + productId);//indexOf 
//	  }
//	  
//	//  shoppingCart.append("," + nProduct);
//
//	  if (shoppingCart.substring(0, 1).equals("0")) {
//	   shoppingCart.delete(0, 2);
//	  }
//
//	  System.out.println(shoppingCart);
//
//	  Cookie c = null;
//	  try {
//	   c = new Cookie("productId", URLEncoder.encode(shoppingCart.toString(), "UTF-8"));
//	   c.setMaxAge(7 * 24 * 60 * 60);
//	  } catch (UnsupportedEncodingException e) {
//	   e.printStackTrace();
//	  }
//	  resp.addCookie(c);
//	  return;
//	 }
//
//	 @GetMapping("/cart/deleteProduct") //將存在cookie的商品ID 刪除
//	 public void deleteProduct(@CookieValue(value = "productId") String cookie, HttpServletRequest req,
//	   HttpServletResponse resp) {
//
//	  String dProduct = req.getParameter("deleteProductId");
//	  System.out.println(dProduct);
//	  
//	  String shoppingCart = "";
//	  try {
//	   shoppingCart = URLDecoder.decode(cookie, "UTF-8");
//	  } catch (UnsupportedEncodingException e) {
//	 
//	   e.printStackTrace();
//	  }
//	        
//	  Boolean isLast = false;
//	  String newShoppingCart = "";
//	        try {
//	      if (shoppingCart.length() == shoppingCart.indexOf(dProduct) + 1) {
//	       newShoppingCart = shoppingCart.substring(0, shoppingCart.length() - 2);
//
//	      } else {
//	       newShoppingCart = shoppingCart.substring(0, shoppingCart.indexOf(dProduct))
//	     + shoppingCart.substring(shoppingCart.indexOf(dProduct) + 2);
//	      }
//	  }catch(StringIndexOutOfBoundsException e) {
//	   if(shoppingCart.indexOf(dProduct)!=-1) {
//	      isLast = true;
//	   }else {
//	    newShoppingCart = shoppingCart;  
//	   }
//	   
//	  }
//	  
//	  
//	  Cookie c = null;
//	  try {
//	   c = new Cookie("productId", URLEncoder.encode(newShoppingCart, "UTF-8"));
//	   if(isLast) {
//	    System.out.println("----------isLast----------");
//	    c.setMaxAge(0);
//	   }else
//	       c.setMaxAge(7 * 24 * 60 * 60);
//	  } catch (UnsupportedEncodingException e) {
//
//	   e.printStackTrace();
//	  }
//
//	  
//	  resp.addCookie(c);
//	  
//	 }
	 
	 //--------------------------------------------------------------------------------------
//	 @GetMapping("/cart/cartProductPage")
//	 public String goCartPage(@CookieValue(value = "productId",defaultValue="0") String cookie, HttpServletRequest req,
//	   HttpServletResponse resp ,Model model) {
//
//	  //取出cookie內的商品Id
//	  String shoppingCart = "";
//	  if(cookie !=null) {
//	   try {
//	    shoppingCart = URLDecoder.decode(cookie, "UTF-8");
//	   } catch (UnsupportedEncodingException e) {
//	  
//	    e.printStackTrace();
//	   }
//	  }
//	  String[] cookieList = shoppingCart.split(",");
//	  System.out.println("cookieList="+cookieList[0]);
//	  
//	  //查詢商品資訊
//	  List<Product> cookieProductList = new ArrayList<Product>(); //把所有select起來的id包進list
//	  
//	  for(int i = 0; i < cookieList.length;i++) {  
//	   int idlivro  = (cookieList[i]!=null) ? Integer.parseInt(cookieList[i]) : 0;
//	   cookieProductList.add(productService.findByProductIdC(1001));     
//	  }
//	  
//	  //回傳商品資訊到前端
//	  model.addAttribute("cookieProductList",cookieProductList);
//	  
//	  return "/showCart2";
//	     
//	 }
	 
}
