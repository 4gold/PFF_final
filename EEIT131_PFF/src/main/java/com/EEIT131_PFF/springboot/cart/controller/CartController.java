package com.EEIT131_PFF.springboot.cart.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.event.ListSelectionEvent;
import javax.xml.bind.annotation.XmlType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
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

import com.EEIT131_PFF.springboot.cart.service.CartService;
import com.EEIT131_PFF.springboot.cart.service.PaypalService;
import com.EEIT131_PFF.springboot.cart.vo.CartVo;
import com.EEIT131_PFF.springboot.model.Member;
import com.EEIT131_PFF.springboot.model.MemberPayment;
import com.EEIT131_PFF.springboot.model.OrderDetails;
import com.EEIT131_PFF.springboot.model.Product;
import com.EEIT131_PFF.springboot.model.SalesOrder;
import com.EEIT131_PFF.springboot.model.SavedPayment;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
@SessionAttributes({"Cart","discountList", "loginAccount"})
public class CartController {
	@Autowired
	EntityManager entityManager;
	
	@Autowired
	PaypalService paypalservice;

	@Autowired
	CartService cartService; // 購物車service	
	
	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";
//
//	@GetMapping("/cartJsp/showCart")
//	public String showCart(Model model) {
//
//		return "cartJsp/showCart";
//	}
//
//	@GetMapping("/ajax/editForm")
//	public @ResponseBody List<ProductVo> findAll() {
//		List<ProductVo> rsList = new ArrayList<>();
//		for (Product data : cartService.findAll()) {
//			ProductVo vo = new ProductVo();
//			vo.setProductId(data.getProductId());
//			vo.setProductName(data.getProductName());
//			vo.setPrice(data.getPrice());
//			vo.setRemarks(data.getRemarks());
//			vo.setOnStock(data.getOnStock());
//			rsList.add(vo);
//		}
//		return rsList;
//	}

	/**
	 * 將商品ID存入cookie
	 * @param cookie
	 * @param productId
	 * @param req
	 * @param resp
	 */
	@GetMapping("/cart/addProduct")
	public void addProduct(@CookieValue(value = "productId", defaultValue = "0") String cookie,
			@RequestParam("productId") String productId, HttpServletRequest req,
			HttpServletResponse resp) {
		
		StringBuilder shoppingCart = new StringBuilder("");//先給shoppingCart用StringBuilder方式串起來("")
		try {
			shoppingCart = new StringBuilder(URLDecoder.decode(cookie, "UTF-8"));//將 new StringBuilder做UTF-8編碼
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		//Servlet方法
//		String nProduct = req.getParameter("newProductId");//nProduct:新商品
//		System.out.println("newProductId="+nProduct);

		String[] cookieList = cookie.split(",");
		System.out.println("cookieList="+cookieList[0]);
		
		Boolean isDuplicate = false; //是重複的? 預設布林值判斷isDuplicate(是重複的)是"否"
		
		for(int i = 0; i < cookieList.length;i++) {
			System.out.println("cookie="+cookieList[i]);
			
		    if( productId.equals(cookieList[i])) {
		    	isDuplicate = true;
//			    shoppingCart.append("," + nProduct);//indexOf 
		    }
		}
		if(isDuplicate == false) {
		    shoppingCart.append("," + productId);//indexOf 
		}
//		shoppingCart.append("," + nProduct);

		if (shoppingCart.substring(0, 1).equals("0")) {
			shoppingCart.delete(0, 2);
		}

		System.out.println(shoppingCart);

		Cookie c = null;
		try {
			c = new Cookie("productId", URLEncoder.encode(shoppingCart.toString(), "UTF-8"));
			c.setMaxAge(7 * 24 * 60 * 60);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		resp.addCookie(c);
		return;
	}

	@GetMapping("/cart/deleteProduct") //將存在cookie的商品ID 刪除
	public @ResponseBody String deleteProduct(@CookieValue(value = "productId") String cookie, HttpServletRequest req,
			HttpServletResponse resp,Model model) {

		String dProduct = req.getParameter("deleteProductId");
		System.out.println("dproduct: "+dProduct);
		
		String shoppingCart = "";
		try {
			shoppingCart = URLDecoder.decode(cookie, "UTF-8");//shoppingCart assign String cookie UTF-8
		} catch (UnsupportedEncodingException e) {
	
			e.printStackTrace();
		}
        
		Boolean isLast = false; //變數名稱:是否是最後一個,預設是否
		String newShoppingCart = "";
		System.out.println("spc.lenth="+shoppingCart.length());
		System.out.println("spc.indexof="+shoppingCart.indexOf(dProduct));
        try {
		    if (shoppingCart.length() == shoppingCart.indexOf(dProduct) + 4) {
			    newShoppingCart = shoppingCart.substring(0, shoppingCart.length()-5);
			    System.out.println("111111111111111111111111111111111111"+newShoppingCart);

		    } else {
			    newShoppingCart = shoppingCart.substring(0, shoppingCart.indexOf(dProduct))
			    		+ shoppingCart.substring(shoppingCart.indexOf(dProduct) + 5);
			    System.out.println("啊啊啊啊啊啊啊啊啊啊啊啊啊"+newShoppingCart);
		    }
		}catch(StringIndexOutOfBoundsException e) {
			if(shoppingCart.indexOf(dProduct)!=-1) {
				  isLast = true;
			}else {
				newShoppingCart = shoppingCart;  
			}
			
		}
		Cookie c = null;
		try {
			c = new Cookie("productId", URLEncoder.encode(newShoppingCart, "UTF-8"));
			if(isLast) {
				System.out.println("----------isLast----------");
				c.setMaxAge(0);
			}else
			    c.setMaxAge(7 * 24 * 60 * 60);
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		resp.addCookie(c);
		
		return "done";

	}
	
	
	@GetMapping("/cart/cartProductPage") //按下去購物車頁面
	public String goCartPage(
			@CookieValue(value = "productId",defaultValue="0") String cookie, 
			HttpServletRequest req,
			HttpServletResponse resp,
			Model model) {
		//取出cookie內的商品Id
		String shoppingCart = "";
		if(cookie !=null) {
			try {
				shoppingCart = URLDecoder.decode(cookie, "UTF-8");
			} catch (UnsupportedEncodingException e) {
		
				e.printStackTrace();
			}
		}
		String[] cookieList = shoppingCart.split(",");
		System.out.println("cookieList="+cookieList[0]);
		
		//產生假的discount(亂數)
		List<Double> discounts = new ArrayList<>();
		Double[] discountVol = {0.7, 0.8, 1.0};
		//查詢商品資訊
		List<Product> cookieProductList = new ArrayList<Product>(); //把所有select起來的id包進list
		for(int i = 0; i < cookieList.length;i++) {		
			int idlivro  = (cookieList[i]!=null) ? Integer.parseInt(cookieList[i]) : 0;
			cookieProductList.add(cartService.findByProductId(Integer.parseInt(cookieList[i])));//*************************
			System.out.println(discountVol[(int)(Math.random()*3)]);
			discounts.add(discountVol[(int)(Math.random()*3)]);
		}
		//回傳商品資訊到前端
		model.addAttribute("cookieProductList",cookieProductList);	
		List<Double> modelDiscount = (List<Double>)model.getAttribute("discountList");
		
		//demo刪商品刪最下面的不然會GG
		if(modelDiscount == null) {
			model.addAttribute("discountList", discounts);
		}else {
			modelDiscount.addAll(discounts);
			model.addAttribute("discountList", modelDiscount);
		}
		
		//model.addAttribute("discountList", discountVol);
		
		return "/cartJsp/showCart2";   
	}
	
	/**
	 * 將購物車資訊存進session
	 * @param cartvos
	 * @param model
	 * @return
	 */
	@PostMapping("/cart/sendorder")
	public @ResponseBody String saveCartdata(@RequestBody List<CartVo> cartvos ,Model model) {
		System.out.println("cartvos="+cartvos);
		model.addAttribute("Cart", cartvos);
		System.out.println("Cart="+cartvos);
		return "done";
	}
	
	/**
	 * 
	 * @param session
	 * @param status
	 * @return
	 * 清除購物車session
	 */
	@GetMapping("/cart/removeCartSession")
	public String RemoveAllsession(@CookieValue(value = "productId") String cookie,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session, SessionStatus status) {
		Cookie c = new Cookie("productId" , null);
		System.out.println(c);
		c.setMaxAge(0);
		response.addCookie(c);
		session.removeAttribute("Cart");
		//status.setComplete();
		System.out.println("Cart"+"----------------------------------------");
		
		return "redirect:cartJsp/finishShop";
	}
	
	@GetMapping("/cart/paymentPage")//此路徑我希望做成按鈕按下去的路徑(送到結帳頁面)
	public String goCheckpage(
			@ModelAttribute("Cart") CartVo cartvo,
			@ModelAttribute("loginAccount") Member account,
			Model model) {
		
		SavedPayment savedPayment = cartService.selectBySaveMemberPaymentId(account.getMemberId());//
		model.addAttribute("savedPayment123", savedPayment);
		return "/cartJsp/checkOut";
	}
	
	@PostMapping("/cart/orderResult")
	public String goOrderResult(
			@ModelAttribute("loginAccount") Member account,
			@ModelAttribute("Cart") List<CartVo> cartList,
			@RequestParam("payerName") String payerName,@RequestParam("phone") String phone ,@RequestParam("email") String email,
			@RequestParam("cardId") String cardId,@RequestParam("address")  String address ,@RequestParam("paymentMethod") String paymentMethod,
			@RequestParam("shippingMethod") String shippingMethod,
			Model model) {
		
		boolean isPaypal="paypal".equals(paymentMethod);
		OrderDetails orderDetails = new OrderDetails();
		orderDetails.setOrderStatus("checked");
		orderDetails.setShippingStatus("shipping");
		orderDetails.setPaymentStatus(isPaypal?"unpaid":"paid");
		orderDetails.setPaymentMethod(paymentMethod);
		orderDetails.setShippingMethod(shippingMethod);
		Timestamp orderTime = new Timestamp(System.currentTimeMillis());
		orderDetails.setOrderTime(orderTime);
		cartService.saveOrderDetails(orderDetails);
	    
		//取出最新的一筆
        OrderDetails order = cartService.selectOrderDetail();
		System.err.println("============================");
		System.out.println(order);
		System.err.println("============================");
		
		MemberPayment memberPayment = new MemberPayment();
		memberPayment.setMember(account);
	    memberPayment.setOrderDetails(order);
		memberPayment.setPayerName(payerName);
		memberPayment.setPhone(phone);
		memberPayment.setEmail(email);
		memberPayment.setCardId(cardId);
		memberPayment.setAddress(address);
		cartService.saveMemberPayment(memberPayment);
		
		for(int i = 0; i< cartList.size(); i++) {
			CartVo cartvo = cartList.get(i);
			
            SalesOrder salesOrder = new SalesOrder();
			salesOrder.setOrderDetails(order);
			Product product = cartService.findByProductId(cartvo.getProductId());
			salesOrder.setProduct(product);
			salesOrder.setQuantity(cartvo.getQuantity());
			salesOrder.setDiscount(cartvo.getDiscount());
			System.out.println( cartList.get(i).getProductName());
			System.out.println(cartvo.getProductName());
			cartService.saveSalesOrder(salesOrder);
		}
		
		if(isPaypal) {
			try {
				//TODO 要把正確金額放進來
				Double totelAmount = Double.valueOf(cartList.get(0).getTotal());
				String paymentDesc = String.valueOf(order.getOrderId());
				Payment payment = paypalservice.createPayment(totelAmount, "TWD", "paypal",
						"sale", paymentDesc, "http://localhost:8080/PFF/"+CANCEL_URL, "http://localhost:8080/PFF/"+SUCCESS_URL);
				for(Links link:payment.getLinks()) {
					if(link.getRel().equals("approval_url")) {
						return "redirect:"+link.getHref();
					}
				}
			} catch (PayPalRESTException e) {
				e.printStackTrace();
			}
		}

		return "/cartJsp/finishShop";
	}
	
	@GetMapping(value = CANCEL_URL)
    public String cancelPay() {
        return "/cartJsp/cancel";
    }
	
    @GetMapping(value = SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
        try {
            Payment payment = paypalservice.executePayment(paymentId, payerId);
            System.out.println(payment.toJSON());
            if (payment.getState().equals("approved")) {
            	int orderId = Integer.parseInt(payment.getTransactions().get(0).getDescription());
            	OrderDetails  orderDetail = cartService.selectOrderDetailById(orderId);
            	orderDetail.setPaymentStatus("paid");
            	cartService.saveOrderDetails(orderDetail);
                return "/cartJsp/success";
            }
        } catch (PayPalRESTException e) {
         System.out.println(e.getMessage());
        }
        return "/cartJsp/cancel";
    }
	
}
	
	

