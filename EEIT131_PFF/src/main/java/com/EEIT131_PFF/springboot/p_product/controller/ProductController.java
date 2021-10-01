package com.EEIT131_PFF.springboot.p_product.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.EEIT131_PFF.springboot.model.Partner;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.ProductImage;
import com.EEIT131_PFF.springboot.p_product.service.ProductService;


@Controller
@SessionAttributes("loginPartner")
public class ProductController {
	@Autowired
	ServletContext ctx;
	
	@Autowired
	ProductService productService;

	//從bean找資料到/partner/allProduct
	@GetMapping("/partner/allProduct")    
	public @ResponseBody List<Product> findAll() {
		return productService.findAllProduct();
		
	    }
	
	//
		@GetMapping("/partner/index")
		public String prodcutIndex() {
			return "partner/indexproduct";
		}
	//將/partner/allProduct找到的資料 塞到AllProducts.jsp給的表格裡面
	@GetMapping("/partner/allProductpage")
	public String findAllproduct() {
		return "partner/ShowProduct";
	}
	@GetMapping("/partner/saleProduct")
	public @ResponseBody List<Product> getAllProducts(@RequestParam("onSale") String onSale) {
		
		List<Product> products = productService.getAllProduct(onSale);
		
		return products;
//----------------------------------------------------------
	}
	//關鍵字搜尋
	@GetMapping("/keywordsearch")
	public @ResponseBody List<Product> viewHomePage(Model model,
			@RequestParam("keyword") String keyword) {	
		System.out.println("keyword in controller: " + keyword);
		List<Product> listProducts = productService.listAll(keyword) ;
		model.addAttribute("listProducts",listProducts);
		model.addAttribute("keyword",keyword);
		System.out.print(listProducts) ;
		return listProducts;
		
		
		
	}
	

	//----------------------------------------------------------		
	//價格搜尋
	@GetMapping("/priceProductUp")
	public @ResponseBody List<Product> findAllOrderByUp() {
		
		return productService.findAllOrderByUp();
	}
	
	@GetMapping("/priceProductDown")
	public @ResponseBody List<Product> findAllOrderBy() {

		return productService.findAllOrderByDown();
	}


		

		//----------------------------------------------------------		
		
	//跟圖片有關的控制器
	//取照片
		@GetMapping("/partner/getImage")
	public ResponseEntity<byte[]> getImage(
			@RequestParam("productImageId") Integer productImageId
			){
		System.out.println(productImageId);
		ResponseEntity<byte[]> re = null;
		ProductImage productImage = productService.findProductImageById
				(productImageId);
		HttpHeaders headers = new HttpHeaders();
		
		if(productImage.getImage()!=null) {
			Blob blob = productImage.getImage();
			MediaType mediaType = MediaType.valueOf(productImage.getMimeType());
			
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
			System.out.println(productImage.getProductImageId()+"doesn't have images");
		}
		return re;
	}
	
	
	@GetMapping("/partner/getCoverImage")
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
	
	
	

	//----------------------------------------------------------
	
	//檢查格式
	@PostMapping("/CheckProductName")
	public @ResponseBody Map<String, String> existsByProductId(
			@RequestParam("ProductName") String productName) {
		Map<String, String> map = new HashMap<>();
		Product product = productService.findByProductName(productName);
		if (product == null) {
			map.put("ProductName", "");
		} else {
			map.put("ProductName", product.getProductName());
		}
		return map;
	}
	//------------------------------------------------------------
	
	//新增會員資料
	@GetMapping("/partner/addproduct")
	public String addProductForm(Model model) {
		return "partner/AddProduct";
	}
   //舊的接新增會員
//	@PostMapping("/partner/addproductpage")
//	public @ResponseBody Map<String, String> save(
//		   @RequestBody Product productName
//			) {
//		System.out.println("ProductName=" + productName);
////		Timestamp ts = new Timestamp(System.currentTimeMillis());
////		memberId.setCreateTime(ts);
//		
//		Partner partner = ProductService.findPartnerById(1000);
//		
//		productName.setPartner(partner);
//		Map<String, String> map = new HashMap<>();
//		String result = "";
//		try {
//			ProductService.save(productName);
//			result = "新增成功";
//			map.put("success", result);
//		} catch (Exception e) {
//			result = e.getMessage();
//			map.put("fail", result);
//		}
//		return map;
//	}
	//新的接新增會員
	 @PostMapping(value="/partner/addproductpage",produces = {"application/json; charset=UTF-8"})
	 public @ResponseBody Map<String, String> saveData(
	   @RequestBody Product product,
	   @ModelAttribute("loginPartner") Partner sessionPartner
	   ){
	  Partner partner = productService.findPartnerById(sessionPartner.getPartnerId());
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
	
	   
	  }else {
	   
	   product.setCoverImage(null);
	   product.setMimeType(null);
	   product.setPartner(partner);
	  }
	  System.out.println(product);
	  Map<String, String> result = new HashMap<>();
	  try {
		  productService.save(product); 
		  result.put("success", "新增成功");
	  }catch(Exception e) {
		  e.printStackTrace();
		  result.put("fail", e.getMessage());
	  }

	  
	  return result;
	 }
	

	//---------------------------------------------------------------
	
//修改商品資料
	@GetMapping("/partner/updateproduct")
	public String sendEditProductForm(
			@RequestParam("productId") Integer productId,
			Model model
			) {
		model.addAttribute("idid", productId);
		return "partner/UpdateProduct";
	}
	
	@GetMapping("/partner/updateproductpage")
	public String sendAjaxProductForm() {
		return "partner/ShowProduct";
	}
	
	@GetMapping("/partner/product")
	public @ResponseBody Product findByProductId(
			@RequestParam Integer productId
			) {
		System.out.println("productId="+productId);
		return productService.findByProductId(productId);
	}
	
	@GetMapping("/partner/product/{productId}")
	public String updatePage(
			@PathVariable Integer productId,
			Model model
			) {
		model.addAttribute("idid", productId);
		return "partner/UpdateProduct";
	}
	
	
	@PutMapping("/partner/updateproduct/{productId}")
	public @ResponseBody Map<String, String> update(
		   @RequestBody Product product,
		   @PathVariable Integer productId,
		   @ModelAttribute("loginPartner") Partner sessionPartner
			) {
		System.out.println("update()之 product=" + product);
		Map<String, String> map = new HashMap<>();
		String result = "";
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
		   try {
		       product.setCoverImage(new SerialBlob(a));
		   }catch(SerialException e){
			   result=e.getMessage();
		       e.printStackTrace();
		   }catch(SQLException e){
		       e.printStackTrace();
		   }
		   product.setMimeType(mimeType);
		   product.setFileDataURL(i);
		 }   

		   
		try {

		   
		Product original = productService.findByProductId(productId);

		System.out.println("============");
		System.out.println(product);
		System.out.println("============");
         Partner partner = productService.findPartnerById(sessionPartner.getPartnerId());
		
         product.setPartner(partner);
		productService.update(product);
		   result = "修改成功";
		   map.put("success", result);
		} catch(Exception e) {
		   result = e.getMessage();	
		   map.put("fail", result);
		}
		return map;
		
	}
	//庫存量搜尋

		@GetMapping("/onStockProductUp")
		public @ResponseBody List<Product> findAllOrderonStockByUp() {
			
			return productService.findAllOrderonStockByUp();
		}
		
		@GetMapping("/onStockProductDown")
		public @ResponseBody List<Product> findAllOrderonStockByDown() {

			return productService.findAllOrderonStockByDown();
		}

}
