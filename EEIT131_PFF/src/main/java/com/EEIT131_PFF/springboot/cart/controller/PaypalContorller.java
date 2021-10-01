package com.EEIT131_PFF.springboot.cart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.EEIT131_PFF.springboot.cart.service.PaypalService;
import com.EEIT131_PFF.springboot.cart.vo.Order;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;




@Controller
public class PaypalContorller {
	@Autowired
	PaypalService paypalservice;
	
	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";
	
	@GetMapping("/cart/paypal")
	public String home() {
		return "/cartJsp/home";
	}
	
//	@PostMapping("/pay")
//	public String payment(@ModelAttribute("order") Order order) {
//		
//		try {
//			Payment payment = paypalservice.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
//					order.getIntent(), order.getDescription(), "http://localhost:8080/PFF/"+CANCEL_URL, "http://localhost:8080/PFF/"+SUCCESS_URL);
//			for(Links link:payment.getLinks()) {
//				if(link.getRel().equals("approval_url")) {
//					return "redirect:"+link.getHref();
//				}
//			}
//		} catch (PayPalRESTException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return "redirect:/cart/paypal";
//	}
//	
//	@GetMapping(value = CANCEL_URL)
//    public String cancelPay() {
//        return "/cartJsp/cancel";
//    }
//
//    @GetMapping(value = SUCCESS_URL)
//    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
//        try {
//            Payment payment = paypalservice.executePayment(paymentId, payerId);
//            System.out.println(payment.toJSON());
//            if (payment.getState().equals("approved")) {
//                return "/cartJsp/success";
//            }
//        } catch (PayPalRESTException e) {
//         System.out.println(e.getMessage());
//        }
//        return "/cartJsp/cancel";
//    }

}
