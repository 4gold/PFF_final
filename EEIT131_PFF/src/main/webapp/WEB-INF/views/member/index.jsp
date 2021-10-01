<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script> 

<link rel="shortcut icon" href="<c:url value='/assets/images/favicon.ico' />" />
<link href="<c:url value='/assets/styles/font-awesome.min.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/pe-icon-7-stroke/css/helper.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/minimal-menu.css' />" rel="stylesheet"
	type="text/css" />
<!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="<c:url value='assets/styles/minimal-menu-ie.css' />" />
        <![endif]-->
<link href="<c:url value='/assets/styles/flat-form.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/fancySelect.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/jquery.fancybox.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/allinone_bannerRotator.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/owl.carousel.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/owl.theme.default.min.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/styles.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/assets/scripts/libs/prefixfree.min.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/modernizr.js' />"></script>

<script type="text/javascript">
    window.onload=function(){

    	let logon = document.getElementById("logon");
    	let register = document.getElementById("register");
    	var xhr = new XMLHttpRequest();
	    xhr.open("GET", "<c:url value='/checklogin'/>");
    	xhr.send();
		if (xhr != null) {

			console.log("xhr != null");
			xhr.onreadystatechange = function() {
				console.log("readyState="+xhr.readyState +", status="+xhr.status);
				if (xhr.readyState == 4 && xhr.status == 200) {
					let account = xhr.responseText;
					console.log(account);
					if(account == ""){
						console.log("response is null");
						logon.href="<c:url value='/member/loginpage'/>";
						logon.innerHTML="登入";
						register.style.display="display";
					}else{					
						console.log("response is "+account);
						logon.href="<c:url value='/member/logout'/>";
						logon.innerHTML="登出";
						register.style.display="none";
					}
					
				}
			}
		}
    }
    
    
</script>

<meta charset="UTF-8">
<title>會員主頁</title>
</head>
<body>
<%@include file="../Top.jsp"%>

<div class="main" style="float:left">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="sidebar">
                        
                            <aside class="widget">
                                <h3 class="widget-title">會員中心</h3>
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
                       
 
                        <!-- /.sidebar -->
                        
                 <%@include file="../Footer.jsp"%>
<%--     <a id= "logon" href="<c:url value='/memberloginpage'/>">登入</a><br>
    <a id= "register" href="<c:url value='/memberregisterpage'/>">註冊</a><br>
    <a href="<c:url value='/member/memberupdatepage'/>">修改資料</a><br>
    <a href="<c:url value='/member/memberpasswordpage'/>">修改密碼</a><br>
    <a href="<c:url value='/member/memberbookmarkpage'/>">會員收藏</a><br>
    <a href="<c:url value='/member/purchaserecordpage'/>">會員購物紀錄</a><br>
    <a href="<c:url value='/member/savedpaymentpage'/>">會員付款資訊管理</a><br> --%>
    
</body>
</html>