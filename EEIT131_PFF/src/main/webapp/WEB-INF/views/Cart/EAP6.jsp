<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- 一次載入所有的圖示 -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.0/js/all.js"></script>
<!-- 選擇所需圖示類型的載入 -->
<!-- 這裡會載入 solid 和 regular 這兩類的圖示，最後要記得載入 fontawesome.js -->
<script src="https://use.fontawesome.com/releases/v5.0.0/js/solid.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.0/js/regular.js"></script>
<script
	src="https://use.fontawesome.com/releases/v5.0.0/js/fontawesome.js"></script>

<!-- 若使用 Font Awesome 小圖案 ，載入這個 CSS -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- 使用 照片輪播，要先載入這個 CSS 以下-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- 使用 照片輪播，要先載入這個 CSS 以上-->

<link rel="shortcut icon" href="../../assets/images/favicon.ico" />
<link href="../../assets/styles/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="../../assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet" type="text/css" />
<link href="../../assets/pe-icon-7-stroke/css/helper.css"
	rel="stylesheet" type="text/css" />
<link href="../../assets/styles/minimal-menu.css" rel="stylesheet"
	type="text/css" />
<!--[if LTE IE 8]><![endif]-->

<link rel="stylesheet" type="text/css"
	href="assets/styles/minimal-menu-ie.css" />

<link href="../assets/styles/flat-form.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/styles/fancySelect.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/styles/jquery.fancybox.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/styles/allinone_bannerRotator.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/styles/owl.carousel.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/styles/owl.theme.default.min.css" rel="stylesheet"
	type="text/css" />
<link href="../assets/styles/styles.css" rel="stylesheet"
	type="text/css" />
<script src="../assets/scripts/libs/prefixfree.min.js"></script>
<script src="../assets/scripts/libs/modernizr.js"></script>
<script src="../assets/scripts/libs/html5shiv.js"></script>
<script src="../assets/scripts/libs/respond.js"></script>

<link rel='stylesheet' href="<c:url value='/css/cart.css' />"
	type="text/css" />

<script>
	window.onload = function() {

		let search = document.getElementById("search");

		//Show出所有圖片
		let dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/consultion/all' />");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				console.log(xhr.responseText);
				dataArea.innerHTML = processInstructorData(xhr.responseText);
			}
		}
		
		//產品分類
		var selectElement = document.getElementById("typeid");
		
	    selectElement.onchange = function(){
	     let xhr2 = new XMLHttpRequest();
	  //使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
	  var typeId = selectElement.options[ selectElement.selectedIndex ].value;
	  // 定義open方法
	  xhr2.open("GET", "<c:url value='/typeProduct' />" + "?type=" + typeId, true);
	// 原本  xhr2.open("GET", "<c:url value='/ch04/_05/getBooksByPubllisher.json' />" + "?publisherId=" + publisherId, true);
	  // 送出請求
	  xhr2.send();
	  xhr2.onreadystatechange = function() {
		   if (xhr2.readyState == 4 && xhr2.status == 200) {
		    console.log(xhr2.responseText);
		    dataArea.innerHTML=processInstructorData(xhr2.responseText);    //原本displayPageBooks(xhr2.responseText); 
		   }
		  }
	  
	 }

	}
	
	function processInstructorData(jsonString) {
		let instructors = JSON.parse(jsonString);
		//取照片
		let segment = "<div class='row row-cols-1 row-cols-md-4 g-4'>";
		for (let n = 0; n < instructors.length; n++) {
			let instructor = instructors[n];

			segment += "<div class='col' id='products'>"
			segment += "<div class='card h-60' id='card'>"
			segment += "<img src=<c:url value='/consultion/getCoverImage' />?instructorId="
					+ instructor.instructorId
					+ " style='width:150px;height:150px;display:block;margin:auto;' />";
			segment += "<div class='card-body'>";
			segment += "<span class='card-title'  style='font-family:sans-serif;margin-right:5px;'>"
					+ instructor.instructorName + "</span>";
			segment += "<span class='card-text' style='color:red;'>" + "$"
					+ instructor.price + "元" + "</span>";
			// 			segment += "<p class='card-text'>" + instructor.type + "</p>";
			segment +="<br>"
			segment +="<a href='ModifyPage.controller?id="+instructor.instructorId+"' class='btn btn-outline-info'>修改</a>"
						
			segment +="<a href='javascript:if (confirm('你確定要刪除此筆資料嗎？')) location.href='deleteProduct.controller?id="+instructor.instructorId+"><button type='button' class='btn btn-outline-danger'>刪除</button></a>"
			
			segment += "<button href='#' class='btn btn-outline-secondary btn-sm mt-2 d-block' onclick=addCookie("
					+ instructor.instructorId
					+ ")><i class='fas fa-shopping-cart mr-1'></i>加入購物車</button>"
// 			segment += "<button href='#' class='btn btn-outline-secondary btn-sm mt-2 d-block' onclick=deleteCookie("
// 					+ instructor.instructorId
// 					+ ") id='addCookie' value='"
// 					+ instructor.instructorId
// 					+ "'><i class='fas fa-shopping-cart mr-1'></i>刪除購物車</button>"

			// 			segment += "<a href='#' class='btn btn-outline-secondary btn-sm mt-1 d-block'><i class='fas fa-shopping-cart mr-1'></i>加入購物車</a>"
			
// 			segment += "<div class='container'>"
// 			segment += "<div class='product-item'>";
// 			segment += "<div class='group-buttons'><button type='button' class='add-to-cart' data-toggle='tooltip' data-placement='top' title='Add to Cart'><span>Add to Cart</span> <i class='fa fa-shopping-cart'></i></button><button type='button' data-toggle='tooltip' data-placement='top' title='Add to Wishlist'><i class='pe-7s-like'></i></button></div>";
// 			segment += "</div>";
// 			segment += "</div>";
			
			// 							segment += "<div class='group-buttons'>"
			// 							segment += "<button type='button' class='add-to-cart' data-toggle='tooltip' data-placement='top' title='Add to Cart'><span>Add to Cart</span> <i class='fa fa-shopping-cart'></i></button>"
			// 			                segment += "<button type='button' data-toggle='tooltip' data-placement='top' title='Add to Wishlist'><i class='pe-7s-like'></i></button></div>"

			segment += "</div>";
			segment += "</div>";
			segment += "</div>";

		}
		segment += "</div>";

		return segment;
	}

	function addCookie(instructorId) {
		console.log(instructorId);
		let xhr2 = new XMLHttpRequest();
		xhr2.open("GET", "<c:url value='/cart/addProduct' />?productId="
				+ instructorId);
		xhr2.send();
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				console.log(xhr2.responseText);
			}
		}
	}

	function deleteCookie(instructorId) {
		console.log(instructorId); //顯示在檢查區有id
		let xhr3 = new XMLHttpRequest();
		xhr3.open("GET",
				"<c:url value='/cart/deleteProduct' />?deleteProductId="
						+ instructorId);
		xhr3.send();
		xhr3.onreadystatechange = function() {
			if (xhr3.readyState == 4 && xhr3.status == 200) {
				console.log(xhr3.responseText);
			}

		}
	}
</script>
<meta charset="UTF-8">
<title>Gold Loute Foods</title>
</head>
<body>

	<div class="topbar gray-bg">
		<div class="container">
			<div class="left-topbar">
				<a href="login-register.html">LOG IN</a> / <a
					href="login-register.html">REGISTRATION</a>
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
								<li><a href="wishlist.html"><i class="fa fa-heart"></i>
										Wish List (0)</a></li>
								<li><a href="shopping-cart.html"><i
										class="fa fa-shopping-cart"></i> Shopping Cart</a></li>
								<li><a href="check-out.html"><i class="fa fa-share"></i>
										Checkout</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.right-topbar -->
		</div>
	</div>



	<%-- <c:url value='/images/P1.jpg' /> --%>
	<!-- http://localhost:8080/PFF/consultion/images/P1.jpg 
<img src="../images/P1.jpg" style='width:150px;height:150px;display:block;margin:auto;'/> -->
	<div id="carouselExampleCaptions" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="../images/v1.jpg"
					style='width: 1080px; display: block; margin: auto;' alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1 style='color: #336666;'>Gold Loute Foods</h1>
					<p>Eat healthy, live better.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="../images/i1.jpg"
					style='width: 1080px; display: block; margin: auto;' alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>You are what you eat, so eat right.</h5>
					<!--         <p></p> -->
				</div>
			</div>
			<div class="carousel-item">
				<img src="../images/33.jpg"
					style='width: 1080px; display: block; margin: auto;' alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>The greatest wealth is Health.</h5>
					<!--         <p></p> -->
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<div class="container">
		產品類別: <select id='typeid'>
			<option value='beef'>牛肉</option>
			<option value='pork'>豬肉</option>
			<option value='seafood'>海鮮</option>
		</select>
	</div>

	<hr class="gray-line" />

	<div class="container" id='dataArea'>

		<!-- <div class='col-lg-6' > -->
	</div>

	<!-- /.brand-logos -->
	<hr class="gray-line" />
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<h3>聯絡資訊</h3>
					<div class="address">
						220新北市板橋區 <br />莊敬路153號3F
					</div>
					<p>
						Tel. <a href="tel:">(886) 0909242719</a>
					</p>
					<p>
						Email. <a href="mailto:info@yourdomain.com">PFF@gmail.com.tw</a>
					</p>
					<!--                         <ul class="list-social"> -->
					<!--                             <li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li> -->
					<!--                             <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li> -->
					<!--                             <li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li> -->
					<!--                             <li><a href="#" class="vk"><i class="fa fa-vk"></i></a></li> -->
					<!--                             <li><a href="#" class="behance"><i class="fa fa-behance"></i></a></li> -->
					<!--                         </ul> -->
					<!-- /.list-social -->
				</div>
				<div class="col-md-3 col-sm-6">
					<h3>購買</h3>
					<ul class="list-link">
						<li><a href="<c:url value='/calories'  />">熱量計算</a></li>
						<li><a href="#">所有商品分類</a></li>
						<li><a href="#">營養師專欄</a></li>
						<li><a href="#">品牌旗艦</a></li>
						<li><a href="#">客人問與答</a></li>
						<li><a href="#">團購專區</li>
						<li><a href="#">退貨政策</li>


					</ul>
				</div>
				<div class="col-md-3 col-sm-6">
					<h3>販售</h3>
					<ul class="list-link">
						<li><a href="#">我想在Gold Loute上販售</a></li>
						<li><a href="#">廠商問與答</a></li>
						<li><a href="#">廠商管理</a></li>
						<li><a href="#">訊息公告</a></li>

					</ul>
				</div>
				<div class="col-md-3 col-sm-6">
					<h3>關於我們</h3>
					<ul class="list-link">
						<li><a href="#">服務條款</a></li>
						<li><a href="#">媒體報導</a></li>
						<li><a href="#">工作機會</a></li>
						<li><a href="#">論壇專區</a></li>

					</ul>
				</div>
			</div>
			<div class="bottom-footer">
				<div class="copyright">
					© @2021 gold loute foods. All rights reserved <a
						href="https://gridgum.com/"></a>
				</div>
				<!-- /.copyright -->
				<!--                     <ul class="list-payment"> -->
				<!--                         <li><a href="#"><img src="assets/images/visa.png" alt="img" /></a></li> -->
				<!--                         <li><a href="#"><img src="assets/images/paypal.png" alt="img" /></a></li> -->
				<!--                         <li><a href="#"><img src="assets/images/2co.png" alt="img" /></a></li> -->
				<!--                         <li><a href="#"><img src="assets/images/ae.png" alt="img" /></a></li> -->
				<!--                         <li><a href="#"><img src="assets/images/skrill.png" alt="img" /></a></li> -->
				<!--                     </ul> -->
				<!-- /.list-payment -->
			</div>
		</div>
	</footer>
	<script src="../assets/scripts/libs/jquery-1.11.2.min.js"></script>
	<script src="../assets/scripts/libs/jquery-ui-1.11.4/jquery-ui.min.js"></script>
	<script src="../assets/scripts/libs/jquery.easing.1.3.js"></script>
	<script src="../assets/scripts/libs/bootstrap.min.js"></script>
	<script src="../assets/scripts/libs/fancySelect.js"></script>
	<script src="../assets/scripts/libs/jquery.fancybox.pack.js"></script>
	<script src="../assets/scripts/libs/jquery.ui.touch-punch.min.js"></script>
	<script src="../assets/scripts/libs/jquery.mousewheel.min.js"></script>
	<script src="../assets/scripts/libs/allinone_bannerRotator.js"></script>
	<script src="../assets/scripts/libs/owl.carousel.min.js"></script>
	<script src="../assets/scripts/libs/jquery.countdown.min.js"></script>
	<script src="../assets/scripts/libs/jquery.waypoints.min.js"></script>
	<script src="../assets/scripts/libs/jquery.mixitup.min.js"></script>
	<script src="../assets/scripts/functions.js"></script>

</body>
</html>