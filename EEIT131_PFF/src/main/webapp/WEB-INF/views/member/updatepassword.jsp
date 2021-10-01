<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script> 

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
	let oldPwd = document.getElementById("oldPwd");
	let newPwd = document.getElementById("newPwd");
	let checkPwd = document.getElementById("checkPwd");
	let msg = document.getElementById("msg");
	let oldmsg = document.getElementById("oldmsg");
	let newmsg = document.getElementById("newmsg");
	let checkmsg = document.getElementById("checkmsg");
	
	let flag1 = false;
	let flag2 = false;
	let flag3 = false;

	let sendData = document.getElementById("sendData");

	sendData.onclick = function() {
		let oldPwdValue = oldPwd.value;
		let newPwdValue = newPwd.value;
		let checkPwdValue = checkPwd.value;
		
		console.log(flag1);
		console.log(flag2);
		console.log(flag3);
		
		if(flag1 && flag2 && flag3){
			
		if (window.confirm("確定修改？")){
			
		//"<c:url value='/updatepayment/"+pId+"' />"
	    let xhr2 = new XMLHttpRequest();
	    xhr2.open("PUT", "<c:url value='/member/updatepassword' />", true);
		xhr2.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    xhr2.send("pwd="+newPwdValue+"&oldpwd="+oldPwdValue);
	    xhr2.onreadystatechange = function(){
	    	if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
	    		console.log(xhr2.responseText);
	    		
	           if( xhr2.responseText == 'true'||xhr2.responseText == null){
	        	   window.location.href="<c:url value='/updatepwdsuccesspage' />";
	           }else{
	        	   msg.innerHTML = xhr2.responseText;
	           }

	    	}
	    }
		}
		}
	}
	
	$(document).on("change keyup paste", "#oldPwd", function(){
		let oldPwdValue = oldPwd.value;
		checkOldPwd(oldPwdValue);

		
		
	});
	
	$(document).on("change keyup paste", "#newPwd", function(){
		let oldPwdValue = oldPwd.value;
		let newPwdValue = newPwd.value;
		flag2 = checkNotEqualToOld(oldPwdValue, newPwdValue);
	});
	
	$(document).on("change keyup paste", "#checkPwd", function(){
		let oldPwdValue = oldPwd.value;
		let newPwdValue = newPwd.value;
		let checkPwdValue = checkPwd.value;		
		flag3 = checkNewPwd(newPwdValue, checkPwdValue);
	});
	
	function checkNotEqualToOld(oldPwd, newPwd){
		if(oldPwd === newPwd){
			newmsg.style.display="inline";
			newmsg.style.color = "red";
			newmsg.innerHTML="密碼不能與舊密碼相同";
			return false;
		}else{
			newmsg.style.display="none";
			return true;
		}
		
	}
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
	function checkOldPwd(oldPwd){
		
		let xhr1 = new XMLHttpRequest();
		xhr1.open("POST", "<c:url value='/member/checkpwd' />");
		xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr1.send("pwd="+oldPwd);
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				if(xhr1.responseText === "true"){
					oldmsg.style.display="none";
					oldmsg.innerHTML = "";
					flag1 = true;
				}else{
					oldmsg.style.display="inline";
					oldmsg.style.color = "red";
					oldmsg.innerHTML = xhr1.responseText;
					flag1 = false;
				}
				
			}
		} 
	}
}

</script>
<style type="text/css">
.one {
  width: 15%;
  height: 500px;
  float: left;
}

.two {
  /* background: red; */
  width: 75%;
  margin-left: 15%;
  height: 74vh;
  padding-left: 100px;
}

</style>

<title>修改密碼</title>

</head>
<body>
<%@include file="../Top.jsp"%>
<%@include file="Sidebar.jsp"%>
<div class="main two">

<span id='msg' style='color:red; '></span>
<table>
<tr><td>舊密碼：</td><td><input type="password" id="oldPwd" autofocus /><span id='oldmsg'></span></td></tr>
<tr><td><p>&nbsp;</p></td></tr>
<tr><td>新密碼：</td><td><input type="password" id="newPwd" autofocus /><span id='newmsg'></span></td></tr>
<tr><td><p>&nbsp;</p></td></tr>
<tr><td>確認密碼：</td><td><input type="password" id="checkPwd" autofocus /><span id='checkmsg'></span></td></tr>
<tr><td><p>&nbsp;</p></td></tr>
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