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
		var sendData = document.getElementById('sendData');
		sendData.onclick = function() {
			// 讀取欄位資料	  
			var divResult = document.getElementById('resultMsg');
			var uniformNumbersValue = document.getElementById("uniformNumbers").value;
			var companyNameValue = document.getElementById("companyName").value;
			var phoneValue = document.getElementById("phone").value;
			var passwordValue = document.getElementById("password").value;
			var emailValue = document.getElementById("email").value;
			var addressValue = document.getElementById("address").value;
			var businessCategoryValue = document
					.getElementById("businessCategory").value;
			var officialWebsiteValue = document
					.getElementById("officialWebsite").value;
			var remarksValue = document.getElementById("remarks").value;
			var bankAccountValue = document.getElementById("bankAccount").value;
			var div0 = document.getElementById('result0c');
			var div1 = document.getElementById('result1c');
			var div2 = document.getElementById('result2c');
			var div3 = document.getElementById('result3c');
			var div4 = document.getElementById('result4c');
			var div5 = document.getElementById('result5c');
			var div6 = document.getElementById('result6c');
			var div7 = document.getElementById('result7c');
			var div8 = document.getElementById('result8c');
			var div9 = document.getElementById('result9c');
			if (!uniformNumbersValue) {
				setErrorFor(div0, "請輸入統一編號");
			} else {
				div0.innerHTML = "";
			}
			if (!companyNameValue) {
				setErrorFor(div1, "請輸入公司名稱");
			} else {
				div1.innerHTML = "";
			}
			if (!phoneValue) {
				setErrorFor(div2, "請輸入電話");
			} else {
				div2.innerHTML = "";
			}
			if (!passwordValue) {
				setErrorFor(div3, "請輸入密碼");
			} else {
				div3.innerHTML = "";
			}
			if (!emailValue) {
				setErrorFor(div4, "請輸入E-mail");
			} else {
				div4.innerHTML = "";
			}
			if (!addressValue) {
				setErrorFor(div5, "請輸入地址");
			} else {
				div5.innerHTML = "";
			}
			if (!businessCategoryValue) {
				setErrorFor(div6, "請輸入行業類別");
			} else {
				div6.innerHTML = "";
			}
			if (!bankAccountValue) {
				setErrorFor(div9, "請輸入銀行帳戶");
			} else {
				div9.innerHTML = "";
				// 		console.log(uniformNumbersValue);
				// 	    console.log(companyNameValue);
				// 	    console.log(phoneValue);
				// 	    console.log(passwordValue);
				// 	    console.log(emailValue);
				// 	    console.log(addressValue);
				// 	    console.log(businessCategoryValue);
				// 	    console.log(officialWebsiteValue);
				// 	    console.log(remarksValue);
				// 	    console.log(bankAccountValue);

				var xhr1 = new XMLHttpRequest();
				xhr1.open("POST", "<c:url value='/manager/addpartnerpage' />",
						true);
				// 下方為一個Javascript物件

				var jsonPartner = {

					"uniformNumbers" : uniformNumbersValue,
					"companyName" : companyNameValue,
					"phone" : phoneValue,
					"password" : passwordValue,
					"email" : emailValue,
					"address" : addressValue,
					"businessCategory" : businessCategoryValue,
					"officialWebsite" : officialWebsiteValue,
					"remarks" : remarksValue,
					"bankAccount" : bankAccountValue

				}
				xhr1.setRequestHeader("Content-Type", "application/json");
				xhr1.send(JSON.stringify(jsonPartner));

				xhr1.onreadystatechange = function() {
					console.log(xhr1.status);
					if (xhr1.readyState == 4
							&& (xhr1.status == 200 || xhr1.status == 201)) {

						result = JSON.parse(xhr1.responseText);

						console.log(result);

						if (result.fail) {
							divResult.innerHTML = "<font color='red'>"
									+ result.fail + "</font>";
						} else if (result.success) {
							divResult.innerHTML = "<font color='GREEN'>"
									+ result.success + "</font>";
							window.setTimeout("window.location='/PFF/manager/allpartnerpage'",3000);
						}
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
		    	   uniformNumbers.value = "16601535";
		    	   companyName.value = "萬豐珠寶";
		    	   phone.value = "0226316179";
		    	   password.value = "16601535";
		           email.value = "eyza123@gmail.com";
		           address.value = "114台北市內湖區動湖路139號";
		           businessCategory.value  = "服務業";
		           officialWebsite.value ="https://www.facebook.com/WanFeng.Jewellery.7733/";
		           remarks.value = "★讓時尚精品 豐富你我的生活★ Welcome to the official Wan Feng Jewellery Facebook Fan Page.";
		           bankAccount.value = "15922408166";
		        
		       }
		     });
	}
	function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
				.test(email);
	}
	function setErrorFor(input, message) {
		input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
		hasError = true;
	}
</script>
<%-- <link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />	 --%>
<meta charset="UTF-8">
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
				<h3>新增廠商資料</h3>
				<hr>
				<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
				<br>
				<fieldset style='display: inline-block; width: 820px;'>
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;統一編號: <input type="text"
								name="uniformNumbers" id='uniformNumbers'><br>
							</td>
							<td width='200'>
								<div id='result0c' style="height: 10px;"></div> <br>
								<div id='result0s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;企業名稱: <input type="text"
								name="companyName" id='companyName'><br>
							</td>
							<td width='200' style="vertical-align: top">
								<div id='result1c' style="height: 10px;"></div> <br>
								<div id='result1s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;電話: <input type="text" name="phone"
								id='phone'><br>
							</td>
							<td width='200' style="vertical-align: top">
								<div id='result2c' style="height: 10px;"></div> <br>
								<div id='result2s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;密碼: <input type="text" name="password"
								id='password'><br>
							</td>
							<td width='200' style="vertical-align: top">
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
							<td width='400'>&nbsp;企業類別: <input type="text"
								name="businessCategory" id='businessCategory'>
							</td>
							<td width='200'>
								<div id='result6c' style="height: 10px;"></div> <br>
								<div id='result6s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;企業官網: <input type="text"
								name="officialWebsite" id='officialWebsite'>
							</td>
							<td width='200'>
								<div id='result7c' style="height: 10px;"></div> <br>
								<div id='result7s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;企業簡介: <input type="text"
								name="remarks" id='remarks'>
							</td>
							<td width='200'>
								<div id='result8c' style="height: 10px;"></div> <br>
								<div id='result8s' style="height: 10px;"></div>
							</td>
						</tr>
						<tr height='60'>
							<td width='200'>&nbsp;</td>
							<td width='400'>&nbsp;企業帳戶號碼: <input type="text"
								name="bankAccount" id='bankAccount'>
							</td>
							<td width='200'>
								<div id='result9c' style="height: 10px;"></div> <br>
								<div id='result9s' style="height: 10px;"></div>
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