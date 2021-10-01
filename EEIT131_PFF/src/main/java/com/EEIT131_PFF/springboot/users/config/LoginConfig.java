package com.EEIT131_PFF.springboot.users.config;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.EEIT131_PFF.springboot.manager.others.ManagerLoginInterceptor;
import com.EEIT131_PFF.springboot.partner.others.PartnerLoginInterceptor;
import com.EEIT131_PFF.springboot.users.others.MemberLoginInterceptor;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.OAuthTokenCredential;
import com.paypal.base.rest.PayPalRESTException;

@Configuration
public class LoginConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //註冊MemberInterceptor攔截器
        InterceptorRegistration memberRegistration = registry.addInterceptor(new MemberLoginInterceptor());
        memberRegistration.addPathPatterns("/member/*"); //要攔截的路徑
        
        
        memberRegistration.excludePathPatterns(    //新增不攔截路徑
                "/memberloginpage",                //登入路徑
//                "/registerpage",
                "/**/*.js",                  //js靜態資源
                "/**/*.css"                  //css靜態資源
        );
        
        //註冊PartnerInterceptor攔截器
        InterceptorRegistration partnerRegistration = registry.addInterceptor(new PartnerLoginInterceptor());
        partnerRegistration.addPathPatterns("/partner/*"); //要攔截的路徑
        
        
        partnerRegistration.excludePathPatterns(    //新增不攔截路徑
                "/partnerlogin",
        		"/**/*.js",                  //js靜態資源
                "/**/*.css"                  //css靜態資源
        );
        
        //註冊ManagerLoginInterceptor攔截器
        InterceptorRegistration managerRegistration = registry.addInterceptor(new ManagerLoginInterceptor());
        managerRegistration.addPathPatterns("/manager/*"); //要攔截的路徑
        
        
        managerRegistration.excludePathPatterns(    //新增不攔截路徑
                "/managerloginpage",
        		"/**/*.js",                  //js靜態資源
                "/**/*.css"                  //css靜態資源
        );
    }
    
	@Value("${paypal.client.id}")
	private String clientId;
	@Value("${paypal.client.secret}")
	private String clientSecret;
	@Value("${paypal.mode}")
	private String mode;
	
	@Bean
	public Map<String,String>paypalSdkConfig(){
		Map<String,String>configMap = new HashMap<>();
		configMap.put("mode", mode);
		return configMap;
	}
	
	@Bean
	public OAuthTokenCredential oAuthTokenCredential() {
		return new OAuthTokenCredential(clientId,clientSecret,paypalSdkConfig());
	}
	
	@Bean
	public APIContext apiContext() throws PayPalRESTException {
		APIContext context = new APIContext(oAuthTokenCredential().getAccessToken());
		context.setConfigurationMap(paypalSdkConfig());
		return context;
	}
    

}
