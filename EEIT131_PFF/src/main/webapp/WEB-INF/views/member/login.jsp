<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- google SignIn -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="508378394577-lf8cttkpvvcftanejqt96jii1b33hvna.apps.googleusercontent.com">
<meta name="google-signin-scope" content="profile email">
<!-- google SignIn -->

<link rel="stylesheet" type="text/css" href="<c:url value='/DataTables/datatables.min.css' />" />
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script> 
<script type="text/javascript" src="<c:url value='/DataTables/datatables.min.js' />"></script>

<link rel="shortcut icon" href="<c:url value = '/assets/images/favicon.ico' />">
<link href="<c:url value = '/assets/styles/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css'/>"  rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/pe-icon-7-stroke/css/helper.css'/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/minimal-menu.css'/> " rel="stylesheet" type="text/css" />
        <!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="assets/styles/minimal-menu-ie.css" />
        <![endif]-->
<link href="<c:url value = '/assets/styles/flat-form.css '/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/fancySelect.css'/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/jquery.fancybox.css '/>" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/allinone_bannerRotator.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/owl.carousel.css'/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/owl.theme.default.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/styles.css" rel="stylesheet' />"  type="text/css" />
<script src="<c:url value = '/assets/scripts/libs/prefixfree.min.js' /> "></script>
<script src="<c:url value = '/assets/scripts/libs/modernizr.js'  />"></script>
        <!--[if lt IE 9]>
        <script src="assets/scripts/libs/html5shiv.js"></script>
        <script src="assets/scripts/libs/respond.js"></script>
        <![endif]-->
        
        

<meta charset="UTF-8">
<title>Login</title>
<script type="text/javascript">
	window.onload = function() {
		
		
        let sendData = document.getElementById("sendData");
        let sendSub = document.getElementById("sendSub");
		let accountId = document.getElementById("accountId");
		let password = document.getElementById("password");
		let msg1 = document.getElementById("msg1");
		let msg2 = document.getElementById("msg2");
		let msg3 = document.getElementById("msg3");
		
		
		
		accountId.onfocus=function(){
			msg3.innerHTML="";
		}
		password.onfocus=function(){
			msg3.innerHTML="";
		}	
		
		accountId.onblur=function(){
			if(!accountId.value){
				msg1.innerHTML="請輸入帳號";
			}else{
				msg1.innerHTML="";
							
			}		
		}
		password.onblur=function(){
			if(!password.value){				
				msg2.innerHTML="請輸入密碼";
			}else{
				flag2=true;
				msg2.innerHTML="";
									
			}
		}
		
		window.addEventListener('keydown', function(e){
        	//取到按下的按鈕
            console.log(e.key);
            //指定按哪個鈕要把東西輸入
            if(e.key=="k"){
                accountId.value = "pfflover";
                password.value = "lovepff";   	
            }
            if(e.key=="p"){
                accountId.value = "pfflover";
                password.value = "pfflove";   	
            }
            if(e.key=="l"){
                accountId.value = "member1";
                password.value = "eeit131";   	
            }
            //無用
/*             if(e.key=="o"){
            	let xhr1 = new XMLHttpRequest();
                xhr1.open("GET", "<c:url value='/memberaddbookmark' />", true);
                xhr1.send();
                xhr1.onreadystatechange = function(){
                	if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
                        console.log(xhr1.responseText); 
                        
                	}
                }
            } */
         });	
 		
 		gapi.load('auth2', function(){
			gapi.auth2.init();
		});  
		
	}
var clicked=false;//Global Variable
function onSignIn(googleUser) {
  if (clicked) {
    var profile = googleUser.getBasicProfile();
    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    console.log('Name: ' + profile.getName());
    console.log('Image URL: ' + profile.getImageUrl());
    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  
    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
  
	let xhr1 = new XMLHttpRequest();
    xhr1.open("POST", "<c:url value='/googlelogin' />", true);
    xhr1.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr1.onload = function() {
    	  console.log('Signed in as: ' + xhr1.responseText);
    	};
    xhr1.send('idtoken=' + id_token);
    xhr1.onreadystatechange = function(){
    	if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
            console.log(xhr1.responseText); 
            let res = xhr1.responseText;
            if(res=='1'){
            	window.location.href = "<c:url value='/index' />";
            }else{
            	document.getElementById("msg3").innerHTML = res;
            }
            
    	}
     }
   }
}
//防止google自動觸發SignIn（因為disconnect不知為何無用)
function ClickLogin()
{
    clicked=true;
}
</script>
</head>
<body>
<%-- <a href="<c:url value='/memberindex'/>"><button>回首頁</button></a> --%>

<%@include file="../Top.jsp"%>

 <div class="log-reg-content">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <form action="#" class="login-form">
                            <h3>登入</h3>
                            <div class="g-signin2" onclick="ClickLogin()" data-onsuccess="onSignIn"></div> 
                            <br> <span id=msg3>${errors.msg}</span><br>
                            <label for="accountId">帳號</label><span id=msg1>${errors.userName}</span><br>
                            <input type="text" name="accountId" id="accountId" class="input-form" />
                            <label for="password">密碼</label><span id=msg2>${errors.userPwd}</span><br>
                            <input type="password" name="password" id="password" class="input-form">
                            <br>
                            
                            <button class="submit-btn" type="submit" id="sendSub" formaction="memberlogin" formmethod="post" value="登入">登入</button>
                            
                            <a href="<c:url value='/forgetpasswordapplication'/>">忘記密碼?</a>
                        </form>
                        
                    </div>
                    <div class="col-md-6">
                        <form action="#" class="register-form">
                            <h3>註冊</h3>
                            <h5>沒有會員？現在就來註冊！</h5>
                            
                            <button class="submit-btn" type="submit" formaction="<c:url value='/memberregisterpage'/>" formmethod="get">註冊會員</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.log-reg-content -->

<%@include file="../Footer.jsp"%>

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

<!-- my old pattern -->
<%-- 	<div style="padding: 30px">
	
	
	
	
		<form>
			帳號：<input type="text" name="accountId" id="accountId">
			     <span id=msg1>${errors.userName}</span><br>
			密碼：<input type="password" name="password" id="password">
			     <span id=msg2>${errors.userPwd}</span>
			<br> <span id=msg3>${errors.msg}</span><br>
 			<!-- <button id="sendData">登入</button>  -->
			<input type="submit" id="sendSub" formaction="memberlogin" formmethod="post" value="登入">
			
			<a href="<c:url value='/forgetpasswordapplication'/>">忘記密碼</a>
		</form>
				<a href="<c:url value='/memberregisterpage'/>"><button>註冊會員</button></a>
	</div> --%>
</body>
</html>