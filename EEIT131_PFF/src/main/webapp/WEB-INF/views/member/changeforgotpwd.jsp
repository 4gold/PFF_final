<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="<c:url value='/assets/images/favicon.ico' />" />
<link href="<c:url value='/assets/styles/font-awesome.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/pe-icon-7-stroke/css/helper.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/minimal-menu.css' />"
	rel="stylesheet" type="text/css" />
<!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="<c:url value='assets/styles/minimal-menu-ie.css' />" />
        <![endif]-->
<link href="<c:url value='/assets/styles/flat-form.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/fancySelect.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/jquery.fancybox.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/allinone_bannerRotator.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/owl.carousel.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/owl.theme.default.min.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/styles.css' />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value='/assets/scripts/libs/prefixfree.min.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/modernizr.js' />"></script>
<script src="<c:url value='/js/JSOG.js' />" ></script>
<meta charset="UTF-8">
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>

<script>
window.onload=function(){
	
	let checkPwd = document.getElementById("checkPwd");
	

	let checkmsg = document.getElementById("checkmsg");
	
	let flag1 = false;

	let sendData = document.getElementById("sendData");

	sendData.onclick = function() {
		let newPwdValue = newPwd.value;
		let checkPwdValue = checkPwd.value;
		
		console.log(flag1);
        let code = '${param.code}';
		
        console.log(code);
        
		if(flag1){
			
		if (window.confirm("確定修改？")){
			
		//"<c:url value='/updatepayment/"+pId+"' />"
	    let xhr2 = new XMLHttpRequest();
	    xhr2.open("PUT", "<c:url value='/changepwd' />", true);
		xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	    xhr2.send("pwd="+newPwdValue+"&code="+code);
	    xhr2.onreadystatechange = function(){
	    	if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
	    		let res = xhr2.responseText
	    		console.log(res);
	    		
	           if( xhr2.responseText == 'true'){
	        	   window.location.href="<c:url value='/updatepwdsuccesspage_forgetpwd' />";
	           }else{
	        	   let resmsg = document.getElementById("resmsg");
	        	   console.log(resmsg);
	        	   resmsg.innerHTML=res;
	           }

	    	}
	    }
		}
		}
	}
	
	
	$(document).on("change keyup paste", "#checkPwd", function(){
		let newPwdValue = newPwd.value;
		let checkPwdValue = checkPwd.value;		
		flag1 = checkNewPwd(newPwdValue, checkPwdValue);
	});
	
	function checkNewPwd(newPwd, checkPwd){
        if(checkPwd === newPwd){
        	checkmsg.style.color = "green";
			checkmsg.innerHTML="正確";
			return true;
		}else if(checkPwd.length != newPwd.length){
			checkmsg.style.color = "red";
			checkmsg.innerHTML="長度不相符";
		}else{
			checkmsg.style.color = "red";
			checkmsg.innerHTML="密碼不相符";
		}
        return false;
	}
}

</script>
<style>
.div1{
    margin-left:40vw;
    
}

</style>
<title>忘記密碼</title>
</head>
<body>
<%@include file="../Top.jsp"%>
    <div class="main div1">
        <span id='resmsg' style='color:red;'></span>
        <table>
        <tr><td>新密碼：</td><td><input type="password" id="newPwd" autofocus /><span id='newmsg'></span></td></tr>
        <tr><td>確認密碼：</td><td><input type="password" id="checkPwd" autofocus /><span id='checkmsg'></span></td></tr>
        </table>
        <button id="sendData">確認修改</button>
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