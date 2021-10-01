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

<script>
window.onload=function(){
	let accountId = document.getElementById("accountId");
	let userName = document.getElementById("userName");
	let birthday = document.getElementById("birthday");
	let email = document.getElementById("email");
	let address = document.getElementById("address");
	let phone1 = document.getElementById("phone1");
	let phone2 = document.getElementById("phone2");
	let phone3 = document.getElementById("phone3");
	let gender = document.getElementById("gender");
	let height = document.getElementById("height");
	let weight = document.getElementById("weight");
	//===========span隔線=============
	let spName = document.getElementById("spName");
	let spBirth = document.getElementById("spBirth");
	let spEmail = document.getElementById("spEmail");
	let spAddress = document.getElementById("spAddress");
	let spPhone1 = document.getElementById("spPhone1");
	let spPhone2 = document.getElementById("spPhone2");
	let spPhone3 = document.getElementById("spPhone3");
	let spGender = document.getElementById("spGender");
	let spHeight = document.getElementById("spHeight");
	let spWeight = document.getElementById("spWeight");
	
    //==========button================
	
	var update = document.getElementById("update");
	var msg = document.getElementById("msg");
	var edit = document.getElementById("edit");
	//==========allinput、allspan=================
	let allinput = document.querySelectorAll("input");
	let allspan = document.querySelectorAll("span");
	
	hideInput();
	
	var xhr1 = new XMLHttpRequest();
    xhr1.open("POST", "<c:url value='/member/getmemberdata' />", true);
	xhr1.setRequestHeader("Content-Type", "application/json");
	xhr1.send();
    xhr1.onreadystatechange = function(){
    	if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
    		console.log(xhr1.responseText);
    		let member = JSON.parse(xhr1.responseText);
    		console.log(member);
    		accountId.innerHTML=member.accountId;
    		userName.value=member.userName;
    		birthday.value=member.birthday;
    		email.value=member.email;
    		address.value=member.address;
    		phone1.value=member.phone1;
    		phone2.value=member.phone2;
    		phone3.value=member.phone3;
    		
    		try{
    			gender.value=member.memberHealth.gender.trim();
    		}catch{
    			gender.value="";
    		}
    		try{
    			height.value=member.memberHealth.height;
    		}catch{
    			height.value="";
    		}
    		try{
    			weight.value=member.memberHealth.weight;
    		}catch{
    			weight.value="";
    		}
    		
    		
    		//=============span隔線==========
    		spName.innerHTML = userName.value;
    		spBirth.innerHTML = birthday.value;
    		spEmail.innerHTML = email.value;
    		spAddress.innerHTML = address.value;
    		spPhone1.innerHTML = phone1.value;
    		spPhone2.innerHTML = phone2.value;
    		spPhone3.innerHTML = phone3.value;
    		if(gender.value=='female'){
    			spGender.innerHTML = '女';
    		}else if(gender.value=='male'){
    			spGender.innerHTML = '男';
    		}else{
    			spGender.innerHTML ='';
    		}
    		   		
    		spHeight.innerHTML = height.value;
    		spWeight.innerHTML = weight.value;
    			
    	}
    }
    edit.onclick=function(){
    	showInput();
    	console.log("edit clicked");
    }
    
    update.onclick=function(){
    	let memberData={
    			"userName":userName.value,
    			"birthday":birthday.value,
    			"email":email.value,
    			"address":address.value,
    			"phone1":phone1.value,
    			"phone2":phone2.value,
    			"phone3":phone3.value,
    			"gender":gender.value,
    			"height":height.value,
    			"weight":weight.value
    	}
    	console.log(memberData);
    	var xhr2 = new XMLHttpRequest();
        xhr2.open("POST", "<c:url value='/member/memberupdate' />", true);
    	xhr2.setRequestHeader("Content-Type", "application/json");
    	xhr2.send(JSON.stringify(memberData));
        xhr2.onreadystatechange = function(){
        	if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
        		
        		let response = xhr2.responseText;
        		console.log(response);
        		if(response == 'success'){
            		spName.innerHTML = userName.value;
            		spBirth.innerHTML = birthday.value;
            		spEmail.innerHTML = email.value;
            		spAddress.innerHTML = address.value;
            		spPhone1.innerHTML = phone1.value;
            		spPhone2.innerHTML = phone2.value;
            		spPhone3.innerHTML = phone3.value;
            		if(gender.value=='female'){
            			spGender.innerHTML = '女';
            		}else if(gender.value=='male'){
            			spGender.innerHTML = '男';
            		}else{
            			spGender.innerHTML ='';
            		}
            		
            		spHeight.innerHTML = height.value;
            		spWeight.innerHTML = weight.value;
        			msg.innerHTML = "<span style='color:green'>更新成功！</span>";
        			
        			hideInput();
        		}else{
        			msg.innerHTML = "<span style='color:red'>更新失敗！</span>";
        		}
        	}
        }
    }
    function hideInput(){
		for(let i=0; i<allinput.length; i++){
		    allinput[i].style.display='none';
		}
		document.querySelector("select").style.display="none";
		update.style.display="none";
		
		for(let i=1; i<allspan.length; i++){
		    allspan[i].style.display='inline';
		}
    }
    function showInput(){
		for(let i=0; i<allinput.length; i++){
		    allinput[i].style.display='inline';
		}
		document.querySelector("select").style.display="inline";
		update.style.display="inline";
		for(let i=1; i<allspan.length; i++){
		    allspan[i].style.display='none';
		}
		
    }
}


</script>
<style type="text/css">
.one {
  width: 15%;
  height: 650px;
  float: left;
}

.two {
  /* background: red; */
  width: 75%;
  margin-left: 15%;
  height: 74vh;
  padding-left: 100px;
}
/* input{
  padding-bottom: 1px;
} */

p{
   margin:0;
   padding:0;
}
</style>

<meta charset="UTF-8">
<title>修改會員資料</title>
</head>
<body>
<%@include file="../Top.jsp"%>
<%@include file="Sidebar.jsp"%>
<hr>
<div class=" main two" >
<button id="edit">編輯</button>
   <div id='msg'></div>
   <div>
   <h3>基本資料</h3>
   
   帳號：<p id="accountId"></p><br>
   姓名：<input id="userName" type="text" /><span id='spName' ></span><br>
   生日：<input id="birthday" type="text" /><span id='spBirth' ></span><br>
   Email：<input id="email" type="email" /><span id='spEmail' ></span><br>
   地址：<input id="address" type="text" /><span id='spAddress' ></span><br>
   電話一：<input id="phone1" type="text" /><span id='spPhone1' ></span><br>
   電話二：<input id="phone2" type="text" /><span id='spPhone2' ></span><br>
   電話三：<input id="phone3" type="text" /><span id='spPhone3' ></span><br>
   </div>
   <hr>
   <div>
   <h3>身體資料</h3>
   性別：<select id='gender'>
        <option value='' selected>請選擇性別</option>
        <option value='male'>男</option>
        <option value='female'>女</option>
        </select><span id='spGender' ></span><br>
   身高：<input id="height" type="number" /><span id='spHeight' ></span><br>
   體重：<input id="weight" type="number" /><span id='spWeight' ></span><br>
   </div>
   
   <button id='update'>送出</button>
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