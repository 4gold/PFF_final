<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        

<meta charset="UTF-8">
<title>註冊</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
    window.onload=function(){
        let sendData = document.getElementById("sendData");
        let accountId = document.getElementById("accountId");
        let password = document.getElementById("password");
        let userName = document.getElementById("userName");
        let birthday = document.getElementById("birthday");
        let email = document.getElementById("email");
        let address = document.getElementById("address");
        let phone1 = document.getElementById("phone1");
        let phone2 = document.getElementById("phone2");
        let phone3 = document.getElementById("phone3");
        
        sendData.onclick=function(){
            var jsonMember = {
                    "accountId": accountId.value,
                    "password": password.value,
                    "userName": userName.value,
                    "birthday": birthday.value,
                    "email": email.value,
                    "address": address.value,
                    "phone1": phone1.value,
                    "phone2": phone2.value,
                    "phone3": phone3.value
                }
        	
            let xhr1 = new XMLHttpRequest();
            xhr1.open("POST", "<c:url value='/memberregister' />", true);
       		xhr1.setRequestHeader("Content-Type", "application/json");
            xhr1.send(JSON.stringify(jsonMember));
            xhr1.onreadystatechange = function(){
            	if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
                    console.log(xhr1.responseText); 
                    let response = JSON.parse(xhr1.responseText);
                    console.log(response.success);
                    /* /registerEmailpage */
                    if(response.success=='success'){
                    	window.location.href="<c:url value='/registerEmailpage' />";
                    }
            	}
            }
            
            
        }
        
        //一鍵輸入
        window.addEventListener('keydown', function(e){
        	//取到按下的按鈕
            console.log(e.key);
            //指定按哪個鈕要把東西輸入
            if(e.key=="k"){
                accountId.value = "pfflover";
                password.value = "lovepff";
                userName.value = "潘金蓮";
                birthday.value = "1998-04-10";
                email.value = "eyza123@gmail.com";
                address.value = "106台北市大安區和平東路二段106號11樓";
                phone1.value  = "0978272702";
                phone2.value ="0922889007";
            	
            }
         });

    }
        
    
    </script>
    <style type="text/css">
        .center1{
        position: absolute;
         left: 50%;
        }
        td{
            align:right;
            border:0;
        }
        input{
            align:left;
        }
        .td1{
            text-align: right;
        }
        .td2{
            text-align: left;
        }
        .div1{
            border: 3px lightgray solid;
            border-radius: 20px;
            width:500px
        }

        
    </style>
</head>
<body>

<%@include file="../Top.jsp"%>


 <div class="main" >
            <div class="container div1" >
              <div class="main-content">
        <div class="table-responsive"> 
                   
                        
                            <h3 style="text-align:center">註冊</h3>
                            
                                <div style="padding: 30px">
    <table style="width: 100%; text-align: center;" class="shop-table table">
        <tbody>
        <tr><td class='td1'>帳號：</td><td class='td2'><input type="text" name="accountId" id="accountId" autofocus /></td></tr>
        <tr><td class='td1'>密碼：</td><td class='td2'><input type="password" name="password" id="password" autofocus /></td></tr>
        <tr><td class='td1'>名稱：</td><td class='td2'><input type="text" name="userName" id="userName" autofocus /></td></tr>
        <tr><td class='td1'>生日：</td><td class='td2'><input type="text" name="birthday" class="datepicker" id="birthday" autofocus size="10" /></td></tr>
        <tr><td class='td1'>Email：</td><td class='td2'><input type="email" name="email" id="email" /></td></tr>
        <tr><td class='td1'>地址：</td><td class='td2'><input type="text" name="address" id="address" autofocus /></td></tr>
        <tr><td class='td1'>聯絡電話（必填）：</td><td class='td2'><input type="text" name="phone1" id="phone1" autofocus /></td></tr>
        <tr><td class='td1'>聯絡電話（選填）：</td><td class='td2'><input type="text" name="phone2" id="phone2" autofocus /></td></tr>
        <tr><td class='td1'>聯絡電話（選填）：</td><td class='td2'><input type="text" name="phone3" id="phone3" autofocus /></td></tr>
        </tbody>
        <tfoot>
        <tr><td colspan='2'><button class="checkout-btn" id="sendData">註冊</button></td></tr>
        </tfoot>
        </table>    
        
    
        </div>
        </div>
        </div>
        </div>
        </div>
        <!-- /.log-reg-content -->
        
<%--         <a href="<c:url value='/index'/>"><button>回首頁</button></a>
<a href="<c:url value='/memberloginpage'/>"><button>回到登入</button></a>
    <div style="padding: 30px">
    <table style="width: 100%; text-align: center;" class="log-reg-content">
        
        <tr><td>帳號：</td><td><input type="text" name="accountId" id="accountId" autofocus /></td></tr>
        <tr><td>密碼：</td><td><input type="password" name="password" id="password" autofocus /></td></tr>
        <tr><td>名稱：</td><td><input type="text" name="userName" id="userName" autofocus /></td></tr>
        <tr><td>生日：</td><td><input type="text" name="birthday" class="datepicker" id="birthday" autofocus size="10" /></td></tr>
        <tr><td>E-mail：</td><td><input type="email" name="email" id="email" autofocus /></td></tr>
        <tr><td>地址：</td><td><input type="text" name="address" id="address" autofocus /></td></tr>
        <tr><td>聯絡電話（必填）：</td><td><input type="text" name="phone1" id="phone1" autofocus /></td></tr>
        <tr><td>聯絡電話（選填）：</td><td><input type="text" name="phone2" id="phone2" autofocus /></td></tr>
        <tr><td>聯絡電話（選填）：</td><td><input type="text" name="phone3" id="phone3" autofocus /></td></tr>
        
        <tr><td><button id="sendData">註冊</button></td></tr>
    </table>    
        
    
    </div> --%>

<%@include file="../Footer.jsp"%>

<script src="<c:url value = '/assets/scripts/libs/jquery-1.11.2.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery-ui-1.11.4/jquery-ui.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.easing.1.3.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/bootstrap.min.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/fancySelect.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.fancybox.pack.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.ui.touch-punch.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.mousewheel.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/allinone_bannerRotator.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/owl.carousel.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.countdown.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.mixitup.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/functions.js'/>"></script>





    <script>
       $( function() {
          $( ".datepicker" ).datepicker();
       } );
       
       $(tr).addClass("cart_item");
    </script>
</body>
</html>