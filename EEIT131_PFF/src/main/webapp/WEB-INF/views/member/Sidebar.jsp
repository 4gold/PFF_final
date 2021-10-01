<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
    <div class="main one" style="float:left;">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="sidebar">
                        
                            <aside class="widget">
                                <h3 class="widget-title" style="border:0">會員中心</h3>
                                <ul class="ul-sidebar">
                                    <li>
                                        <h5>
                                            會員基本資料 
                                        </h5>
                                        <ul class="children">
                                            <li>
                                                <a href="<c:url value='/member/memberupdatepage'/>">
                                                    檢視基本資料                                                  
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/member/memberpasswordpage'/>">
                                                    修改密碼
                                                </a>
                                            </li>
                                           
                                        </ul>
                                    </li>
                                    <li>
                                        <h5>
                                            會員紀錄
                                        </h5>
                                        <ul class="children">
                                            <li>
                                                <a href="<c:url value='/member/memberbookmarkpage'/>">
                                                會員收藏
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/member/purchaserecordpage'/>">
                                                    購物紀錄
                                                </a>
                                            </li>
                                            <li>
                                                <a href="<c:url value='/member/savedpaymentpage'/>">
                                                    付款資訊管理
                                                </a>
                                            </li>
                                            </ul>
                                            <ul>
                                            <li>
                                                <a id= "logon" href="<c:url value='/memberloginpage'/>">
                                                    登出
                                                </a>
                                            </li>
                                            
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </aside>
                       </div>
                       </div>
                       </div>
                       </div>
                       </div>