<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value='/css/sb-admin-2.min.css' />" rel="stylesheet">
<link href="<c:url value='/assets/styles/flat-form.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/fancySelect.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/jquery.fancybox.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/allinone_bannerRotator.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/owl.carousel.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/owl.theme.default.min.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/styles.css' />" rel="stylesheet"
	type="text/css" />
<script src="<c:url value='/assets/scripts/libs/prefixfree.min.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/modernizr.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/html5shiv.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/respond.js' />"></script>

<title>Login</title>
<script type="text/javascript">
	window.onload = function() {
        let sendData = document.getElementById("sendData");
        let sendSub = document.getElementById("sendSub");
		let uniformNumbers = document.getElementById("uniformNumbers");
		let password = document.getElementById("password");
		let msg1 = document.getElementById("msg1");
		let msg2 = document.getElementById("msg2");
		let msg3 = document.getElementById("msg3");
		let flag1, flag2 = false;
		
		sendSub.disabled=true;
		
		uniformNumbers.onfocus=function(){
			msg3.innerHTML="";
		}
		password.onfocus=function(){
			msg3.innerHTML="";
		}	
		
		uniformNumbers.onblur=function(){
			if(!uniformNumbers.value){
				sendSub.disabled=true;
				flag1=false;
				msg1.innerHTML="請輸入帳號";
			}else{
				flag1=true;
				msg1.innerHTML="";
				if(flag1&&flag2)
					sendSub.disabled=false;					
			}		
		}
		password.onblur=function(){
			if(!password.value){
				sendSub.disabled=true;
				flag2=false;
				msg2.innerHTML="請輸入密碼";
			}else{
				flag2=true;
				msg2.innerHTML="";
				if(flag1&&flag2)
					sendSub.disabled=false;						
			}
		}
		
		//這裡沒用
/* 		sendData.onclick = function(){	
			let flag1= true;
			if(!accountId.value||!password.value){
				flag1=false;
			}
			
			let xhr = new XmlHttpRequest();
			if(flag1){
				var params = "accountId="+accountId"&password="+password;
				xhr.open("POST", "<c:url value='/login' />", true);
				xhr.setRequestHeader("Context-type",
						"application/x-www-form-urlencoded");
				xhr.send(params);
				if (xhr != null) {
					xhr.onreadystatechange = function() {
						if (xhr.readtState == 4 && xhr.status == 200) {

						}
					}
				}
			}
		} */
		
	}
</script>
</head>
<body class="bg-gradient-primary" >
<%@include file="../Top.jsp"%>
<div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-50 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">

	
		<form class="user">
		<div class="form-group">
		         <p></p>
			&nbsp;帳號:<input type="text" class="form-control form-control-user" name="uniformNumbers" id="uniformNumbers" required placeholder="請輸入帳號"><br>
			     <span id=msg1>${errors.userName}</span><br>
	       
			&nbsp;密碼:<input type="password" class="form-control form-control-user" name="password" id="password" required placeholder="請輸入密碼"><br>
			     <span id=msg2>${errors.userPwd}</span>
			<br> <span id=msg3>${errors.msg}</span><br>
		</div>	
 			<!-- <button id="sendData">登入</button>  -->
			<input type="submit" id="sendSub" class="btn btn-primary btn-user btn-block" formaction="partnerlogin" formmethod="post" value="登入">
		</form>
		        <hr>
				<a href="<c:url value='/partnerregister'/>" class="btn btn-google btn-user btn-block">
				<i class=" "></i> 註冊
				</a>
				<a href="<c:url value='/ ' />" class="btn btn-google btn-user btn-block">
                <i class=" "></i> 回首頁
				</a>
                
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	
	</div>
	<!-- Bootstrap core JavaScript-->
    <script src="<c:url value='/vendor/jquery/jquery.min.js' />"></script>
    <script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js' />"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/js/sb-admin-2.min.js' />"></script>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
       <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>
    <div><br></div>

    <%@include file="../Footer.jsp"%>
</body>
</html>