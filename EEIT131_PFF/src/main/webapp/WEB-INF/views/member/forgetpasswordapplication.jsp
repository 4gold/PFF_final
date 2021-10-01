<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
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
<script type="text/javascript">
window.onload = function(){
	let email = document.getElementById("email");
	let msg = document.getElementById("msg");
	let sendData = document.getElementById("sendData");
	
	
	let flag1 = false;
	
	sendData.onclick = function(){
		let emailValue = email.value;
		
		let xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/sendforgetemail' />?email="+emailValue);
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				if(xhr1.responseText === "true"){
					window.location.href = "<c:url value='/forgetpasswordemailsend' />";
				}else{
					msg.style.display="inline";
					msg.style.color = "red";
					msg.innerHTML = xhr1.responseText;
					flag1 = false;
				}
				
			}
		} 
	}
	
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
            width:500px;
            /* height:100px; */
            padding: 30px;
        }

        
    </style>
<title>忘記密碼</title>
</head>
<body>
<%@include file="../Top.jsp"%>

    <div class="main">
    <div class="container div1" >
    <table>
    <tr><td>請輸入Email: </td><td><input type="email" id="email" /><span id="msg"></span></td></tr>
    <tr><td><p>&nbsp;</p></td></tr>
    <tr><td><button id="sendData">確認</button></td></tr>
    </table>
      
       
    </div>
    </div>
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
</body>
</html>