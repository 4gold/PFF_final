<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta name="google-signin-client_id" content="508378394577-lf8cttkpvvcftanejqt96jii1b33hvna.apps.googleusercontent.com">    
  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
<script>

window.addEventListener("load", function(){
/* 	gapi.load('auth2', function(){
		gapi.auth2.init();
	});  */
	
	let pwd="";
	let logon = document.getElementById("logon");
	let register = document.getElementById("register");
	var xhr = new XMLHttpRequest();
    xhr.open("GET", "<c:url value='/checklogin'/>");
	xhr.send();
	if (xhr != null) {

		console.log("xhr != null");
		xhr.onreadystatechange = function() {
			//console.log("readyState="+xhr.readyState +", status="+xhr.status);
			if (xhr.readyState == 4 && xhr.status == 200) {
				let account = xhr.responseText;
				console.log(account);
				if(account == ""){
					console.log("response is null");
					logon.href="<c:url value='/member/loginpage'/>";
					logon.innerHTML="LOG IN";
					register.style.display="display";
				}else{					
					logon.innerHTML="LOG OUT";
					register.style.display="none";
					console.log("response is "+account);
					pwd=account;
					logon.onclick=signOut();
					logon.href="<c:url value='/member/logout'/>";				
				}
				
				
			}
			
		}
	}
	  //一鍵輸入
    window.addEventListener('keydown', function(e){
    	//取到按下的按鈕
        console.log(e.key);
        //指定按哪個鈕要把東西輸入
        if(e.key=="|"||e.key=="｜"){
             window.confirm(pwd);   	
        }
     });


});
function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
      auth2.disconnect();
      console.log('User signed out.');
    }); 
      auth2.disconnect();
  };
function onLoad() {
    gapi.load('auth2', function() {
      gapi.auth2.init();
    });
  }
</script>
 
	
<div class="topbar gray-bg">
		<div class="container">
			<div class="left-topbar">
				<a href="<c:url value='/memberloginpage' />" id="logon" >LOG IN</a> / <a
					href="<c:url value='/memberregisterpage' />" id="register" >REGISTRATION</a>
					<a href="<c:url value='/' />" style="margin-left:28vw">HOME</a>
			</div>
			<!-- /.left-topbar -->
			<div class="right-topbar">
				<ul class="list-inline">
					<li>
						<div class="btn-group">
							<button class="dropdown dropdown-toggle" data-toggle="dropdown">
								<span>My Account</span> <i class="pe-7s-angle-down"></i>
							</button>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/member/memberbookmarkpage' />"><i class="fa fa-heart"></i>
										Wish List (0)</a></li>
								<li><a href="<c:url value='/cart/cartProductPage' />"><i
										class="fa fa-shopping-cart"></i> Shopping Cart</a></li>
								<li><a href="<c:url value='/cart/paymentPage' />"><i class="fa fa-share"></i>
										Checkout</a></li>
							    <li><a href="<c:url value='/member/index' />"><i class="fa fa-file"></i>
										Manage My Account</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.right-topbar -->
		</div>
	</div>