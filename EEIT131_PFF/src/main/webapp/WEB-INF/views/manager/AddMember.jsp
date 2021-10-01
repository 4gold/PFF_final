<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='../DataTables/datatables.min.css' />" />
<script src="<c:url value='../js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='../DataTables/datatables.min.js' />"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="<c:url value='/css/sb-admin-2.min.css' />" rel="stylesheet">
<!-- Custom styles for this template-->
<!-- <link href="css/sb-admin-2.min.css" rel="stylesheet"> -->
<script>
var hasError = false;
window.onload = function() {
	var alink = document.getElementById("accountCheck");
	var div = document.getElementById('result0c');
	alink.onclick = function() {
	  var accountIdValue = document.getElementById("accountId").value;
	  if (!accountIdValue) {
		div.innerHTML = "<font color='blue' size='-1'>請輸入帳號...</font>";
		return;
	  }
	  var xhr = new XMLHttpRequest();
	  xhr.open("POST", "<c:url value='/CheckMemberId' />", true);
	  xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	  xhr.send("accountId=" + accountIdValue);
	  var message = "";
	  xhr.onreadystatechange = function() {
	    // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
		   var result = JSON.parse(xhr.responseText);
		   if (result.accountId.length == 0) {
			  message = "<font color='green' size='-2'>帳號可用</font>";
		   } else if (	result.accountId.startsWith("Error") ) {
			  message = "<font color='red' size='-2'>發生錯誤: 代號" + result.accountId + "</font>";
		   } else {
			  message = "<font color='red' size='-2'>帳號重複或格式出錯，請重新輸入另一個帳號</font>"; 
		   }
		   div.innerHTML = message;
	    }
      }
   }
   var sendData = document.getElementById("sendData");
   sendData.onclick = function() {
		hasError = false;
   		// 讀取欄位資料	  
		var accountIdValue = document.getElementById("accountId").value;
		var passwordValue  = document.getElementById("password").value;
		var userNameValue  = document.getElementById("userName").value;
		var birthdayValue  = document.getElementById("birthday").value;
		var emailValue     = document.getElementById("email").value;
		var addressValue   = document.getElementById("address").value;
		var phone1Value    = document.getElementById("phone1").value;
		var phone2Value    = document.getElementById("phone2").value;
		var phone3Value    = document.getElementById("phone3").value;
		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');
		var div2 = document.getElementById('result2c');
		var div3 = document.getElementById('result3c');
		var div4 = document.getElementById('result4c');
		var div5 = document.getElementById('result5c');
		var div6 = document.getElementById('result6c');
		var div7 = document.getElementById('result7c');
		var div8 = document.getElementById('result8c');
		var divResult = document.getElementById('resultMsg');
		if (!accountIdValue){
			setErrorFor(div0, "請輸入帳號");
   		} 	else {
      		div0.innerHTML = "";
   		}
		if (!passwordValue){
			setErrorFor(div1, "請輸入密碼");
		} else {
			div1.innerHTML = "";
		}
		if (!userNameValue){
			setErrorFor(div2, "請輸入姓名");
		} else {
			div2.innerHTML = "";
		}
		if (!birthdayValue){
			setErrorFor(div3, "請輸入生日");
		} else {
			div3.innerHTML = "";
		}
		if (!emailValue){
			setErrorFor(div4, "請輸入E-mail");
		} else {
			div4.innerHTML = "";
		}
		if (!addressValue){
			setErrorFor(div5, "請輸入地址");
		} else {
			div5.innerHTML = "";
		}
		if (!phone1Value){
			setErrorFor(div6, "請至少輸入一個電話");
		} else {
			div6.innerHTML = "";
		}
   		var xhr1 = new XMLHttpRequest();
   		xhr1.open("POST", "<c:url value='/user/addmemberpage' />", true);
   		// 下方為一個Javascript物件
		var jsonMember = {
			"accountId": accountIdValue, 	
			"password" : passwordValue,
			"userName" : userNameValue,
			"birthday" : birthdayValue,
			"email"    : emailValue,
			"address"  : addressValue,
			"phone1"   : phone1Value,
			"phone2"   : phone2Value,
			"phone3"   : phone3Value
   		}
  		xhr1.setRequestHeader("Content-Type", "application/json");
  		xhr1.send(JSON.stringify(jsonMember));
  		
  		
    		xhr1.onreadystatechange = function() {
 				// 伺服器請求完成
    		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
       		result = JSON.parse(xhr1.responseText);
       		if (result.fail) {
 		 		  divResult.innerHTML = "<font color='red' >"
 					+ result.fail + "</font>";
 	  		} else if (result.success) {
 				divResult.innerHTML = "<font color='GREEN'>"
 					+ result.success + "</font>";
 				div0.innerHTML = "";	
 				div1.innerHTML = "";
 				div2.innerHTML = "";
 				div3.innerHTML = "";
 				div4.innerHTML = "";
 				div5.innerHTML = "";
 				div6.innerHTML = "";
 				window.setTimeout("window.location='/PFF/user/allmemberpage'",3000);
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
function dateValidation(str) {
	  var re = new RegExp("^([0-9]{4})[.-]{1}([0-9]{1,2})[.-]{1}([0-9]{1,2})$");
	  var days = [0, 31, 28, 31, 30,  31, 30, 31, 31, 30, 31, 30, 31];
	  var strDataValue;
	  var valid = true;
	  if ((strDataValue = re.exec(str)) != null) {
	    var y, m, d;
	    y = parseFloat(strDataValue[1]);
	    if (y <= 0 || y > 9999) { /*年*/
	      return false;
	    } 
	    m = parseFloat(strDataValue[2]);
	    
	    if (m < 1 || m > 12) { /*月*/
	        return false;
	    }
	    d = parseFloat(strDataValue[3]);
	    if ( y % 4 == 0 && y % 100 != 0 || y % 400 == 0 ){
	       days[2] = 29;
	    }  else {
	       days[2] = 28;
	    }
	    if (d <= 0 || d > days[m]) { /*日*/
	      valid = false;
	    }
	  } else {
	    valid = false;
	  }  
	  return valid;
	}
   function setErrorFor(input, message){
		input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
	    hasError = true;
	}
   function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
	}

		

</script>
<title>Registration</title>
</head>
<body id="page-top">
	<div id="wrapper">

		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/PFF">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">金蓮孕動中心</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">
				<h6>控制台</h6>
			</div>
			<!-- 左邊拉條活動管理選單 -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>活動管理</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">活動資料管理:</h6>
						<a class="collapse-item"
							href="<c:url value='/manager/allactivitypage'  />">活動資料列表</a> <a
							class="collapse-item"
							href="<c:url value='/manager/addactivity'  />">新增活動</a>
					</div>
				</div></li>
			<!-- 左邊拉條會員管理選單 -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>會員管理</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">會員資料管理:</h6>
						<a class="collapse-item"
							href="<c:url value='/user/allmemberpage'  />">會員資料列表</a> <a
							class="collapse-item" href="<c:url value='/user/addmember'  />">新增會員</a>

					</div>
				</div></li>

			<!-- 左邊拉條廠商管理選單 -->
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>廠商管理</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">廠商資料管理:</h6>
						<a class="collapse-item"
							href="<c:url value='/manager/allpartnerpage'  />">廠商資料列表</a> <a
							class="collapse-item"
							href="<c:url value='/manager/addpartner'  />">新增廠商</a>
					</div>
				</div></li>
		</ul>
		<div id="content-wrapper" class="d-flex flex-column">

			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<a href="<c:url value='/manager/page' />"
					class="btn btn-secondary btn-icon-split"> <span
					class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">回到管理者頁面</span>
				</a>


				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<ul class="navbar-nav ml-auto">


					<li class="nav-item dropdown no-arrow">
						<!-- Nav Item - User Information --> <a
						class="nav-link dropdown-toggle" id="userDropdown" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">後台管理者</span>
								<img class="img-profile rounded-circle"
								src="<c:url value='/images/ET.png' />">
					</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="<c:url value='/managerlogout'/>">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 登出
							</a>
						</div>
					</li>
				</ul>
			</nav>
			<div align='center'>
				<h3>新增會員資料</h3>
				<hr>
				<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
				<br>
				<fieldset style='display: inline-block; width: 820px;'>

					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;帳號: <input type="text"
								name="accountId" id='accountId'><br>
								<div style='font-size: 10pt; text-align: center;'>
									<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查帳號</a>
								</div>
							</td>
							<td width='200'>
								<div id='result0c' style="height: 10px;"></div> <br>
								<div id='result0s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;密碼: <input type="text" name="password"
								id='password'><br>
							</td>
							<td width='200' style="vertical-align: top">
								<div id='result1c' style="height: 10px;"></div> <br>
								<div id='result1s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;姓名: <input type="text" name="userName"
								id='userName'><br>
							</td>
							<td width='200' style="vertical-align: top">
								<div id='result2c' style="height: 10px;"></div> <br>
								<div id='result2s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;生日: <input type="text" name="birthday"
								id='birthday'><br>
							</td>
							<td width='200'>
								<div id='result3c' style="height: 10px;"></div> <br>
								<div id='result3s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;E-mail: <input type="text"
								name="email" id='email'>
							</td>
							<td width='200'>
								<div id='result4c' style="height: 10px;"></div> <br>
								<div id='result4s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;地址: <input type="text" name="address"
								id='address'>
							</td>
							<td width='200'>
								<div id='result5c' style="height: 10px;"></div> <br>
								<div id='result5s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;電話一: <input type="text" name="phone1"
								id='phone1'>
							</td>
							<td width='200'>
								<div id='result6c' style="height: 10px;"></div> <br>
								<div id='result6s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;電話二: <input type="text" name="phone2"
								id='phone2'>
							</td>
							<td width='200'>
								<div id='result7c' style="height: 10px;"></div> <br>
								<div id='result7s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;電話三: <input type="text" name="phone3"
								id='phone3'>
							</td>
							<td width='200'>
								<div id='result8c' style="height: 10px;"></div> <br>
								<div id='result8s' style="height: 10px;"></div>
							</td>
						</tr>
							<tr height='50'>
							<td colspan='3' align='center'><button id='sendData' class="btn btn-success btn-icon-split">
							<span class="icon text-white-50">
                                            <i class="fas fa-check"></i>
                                        </span>
							 <span class="text">新增送出</span></button></td>
						</tr>
					</table>
				</fieldset>
				<hr>
				<p>
			</div>
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>JAVA程式設計就業養成班 &copy; EEIT131資策會 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>

		<script src="<c:url value='/vendor/jquery/jquery.min.js' />"></script>
		<script
			src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

		<!-- Core plugin JavaScript-->
		<script
			src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js' />"></script>

		<!-- Custom scripts for all pages-->
		<script src="<c:url value='/js/sb-admin-2.min.js' />"></script>

		<!-- Page level plugins -->
<%-- 		<script src="<c:url value='/vendor/chart.js/Chart.min.js' />"></script> --%>

<!-- 		<!-- Page level custom scripts --> -->
<%-- 		<script src="<c:url value='/js/demo/chart-area-demo.js' />"></script> --%>
<%-- 		<script src="<c:url value='/js/demo/chart-pie-demo.js' />"></script> --%>
</body>
</html>