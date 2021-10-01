package com.EEIT131_PFF.springboot.manager.others;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.EEIT131_PFF.springboot.model.Administrator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManagerLoginInterceptor implements HandlerInterceptor {

    /***
     * 在請求處理之前進行呼叫(Controller方法呼叫之前)
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("執行了攔截器的preHandle方法");
        try {
            HttpSession session = request.getSession();
            //統一攔截（查詢當前session是否存在member）(這裡member會在每次登入成功後，寫入session)
           Administrator admin = (Administrator)session.getAttribute("loginManager");
            if (admin != null) {
                return true;
            }
            //要改成Partner的登入page
            response.sendRedirect(request.getContextPath() + "/managerloginpage");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
        //如果設定為false時，被請求時，攔截器執行到此處將不會繼續操作
        //如果設定為true時，請求將會繼續執行後面的操作
    }

    /***
     * 請求處理之後進行呼叫，但是在檢視被渲染之前（Controller方法呼叫之後）
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("執行了攔截器的postHandle方法");
    }

    /***
     * 整個請求結束之後被呼叫，也就是在DispatchServlet渲染了對應的檢視之後執行（主要用於進行資源清理工作）
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("執行了攔截器的afterCompletion方法");
    }
}
