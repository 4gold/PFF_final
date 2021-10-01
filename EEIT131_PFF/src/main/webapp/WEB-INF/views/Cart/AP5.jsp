<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
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


<link rel="shortcut icon"
	href="<c:url value = '/assets/images/favicon.ico'  />" />


<link href="<c:url value = '/assets/styles/flat-form.css'  />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/fancySelect.css'  />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/jquery.fancybox.css'  />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value = '/assets/styles/allinone_bannerRotator.css'  />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/owl.carousel.css'  />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value = '/assets/styles/owl.theme.default.min.css'  />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/styles.css'  />"
	rel="stylesheet" type="text/css" />
<script
	src="<c:url value = '/assets/scripts/libs/prefixfree.min.js'  />"></script>
<script src="<c:url value = '/assets/scripts/libs/modernizr.js'  />"></script>
<script src="<c:url value = '/assets/scripts/libs/html5shiv.js'  />"></script>
<script src="<c:url value = '/assets/scripts/libs/respond.js'  />"></script>


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

		//價格高低
		var selectPriceElement = document.getElementById("priceid");
		selectPriceElement.onchange = function() {
			var priceid = selectPriceElement.options[selectPriceElement.selectedIndex].value;
			if (priceid == "lowTohigh") {
				console.log(priceid);
				let xhr2 = new XMLHttpRequest();
				xhr2.open("GET", "<c:url value='/ccpriceProductUp' />");
				xhr2.send();
				xhr2.onreadystatechange = function() {
					if (xhr2.readyState == 4 && xhr2.status == 200) {
						console.log(xhr2.responseText);
						dataArea.innerHTML = processInstructorData(xhr2.responseText); //原本displayPageBooks(xhr2.responseText); 
					}
				}
			} else if (priceid == "highTolow") {
				console.log(priceid);
				let xhr4 = new XMLHttpRequest();
				xhr4.open("GET", "<c:url value='/ccpriceProductDown' />");
				xhr4.send();
				xhr4.onreadystatechange = function() {
					if (xhr4.readyState == 4 && xhr4.status == 200) {
						console.log(xhr4.responseText);
						dataArea.innerHTML = processInstructorData(xhr4.responseText); //原本displayPageBooks(xhr2.responseText); 
					}
				}
			}
		}

		//產品分類
		var selectElement = document.getElementById("typeid");
	  
	    selectElement.onchange = function(){
	     let xhr3 = new XMLHttpRequest();
	  //使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
	  var typeId = selectElement.options[ selectElement.selectedIndex ].value;
	  // 定義open方法
	  xhr3.open("GET", "<c:url value='/typeProduct' />" + "?type=" + typeId, true);
	// 原本  xhr2.open("GET", "<c:url value='/ch04/_05/getBooksByPubllisher.json' />" + "?publisherId=" + publisherId, true);
	  // 送出請求
	  xhr3.send();
	  xhr3.onreadystatechange = function() {
		   if (xhr3.readyState == 4 && xhr3.status == 200) {
		    console.log(xhr3.responseText);
		    dataArea.innerHTML=processInstructorData(xhr3.responseText);    //原本displayPageBooks(xhr2.responseText); 
		   }
		  }
	  
	 }
	    
	
	    //windowLoad結束
	}
	//type img onclick
	 function selectType(type){
		  console.log(type);
	     let xhr3 = new XMLHttpRequest();
	  //使用者挑選的書籍之主鍵值是存放在selectElement.options[selectElement.selectedIndex].value中
	  //var typeId = selectElement.options[ selectElement.selectedIndex ].value;
	  // 定義open方法
	  xhr3.open("GET", "<c:url value='/typeProduct' />" + "?type=" + type, true);
	// 原本  xhr2.open("GET", "<c:url value='/ch04/_05/getBooksByPubllisher.json' />" + "?publisherId=" + publisherId, true);
	  // 送出請求
	  xhr3.send();
	  xhr3.onreadystatechange = function() {
		   if (xhr3.readyState == 4 && xhr3.status == 200) {
		    console.log(xhr3.responseText);
		    dataArea.innerHTML=processInstructorData(xhr3.responseText);    //原本displayPageBooks(xhr2.responseText); 
		   }
		  }
	  
	 }
	
	  //SEARCH搜尋
	function search(){
		let keyword = document.getElementById("keyword").value;

		//console.log(keyword);
		let xhr5 = new XMLHttpRequest();
		xhr5.open("GET", "<c:url value='/cckeywordsearch' />?keyword="
				+ keyword);
		xhr5.send();

		xhr5.onreadystatechange = function() {
			if (xhr5.readyState == 4 && xhr5.status == 200) {
				console.log(xhr5.responseText);
				dataArea.innerHTML = processInstructorData(xhr5.responseText); //原本displayPageBooks(xhr2.responseText); 
			}
		}
	}

	function processInstructorData(jsonString) {
		let products = JSON.parse(jsonString);
		//取照片
		let segment = "<div class='row row-cols-1 row-cols-md-4 g-4'>";
		for (let n = 0; n < products.length; n++) {
			let product = products[n];

			segment += "<div class='col' id='products'>"
			segment += "<div class='card h-60' id='card'>"
			segment += "<img src=<c:url value='/consultion/getCoverImage' />?productId="
					+ product.productId
					+ " style='width:150px;height:150px;display:block;margin:auto;' />";
			segment += "<div class='card-body'>";
			segment += "<span class='card-title'  style='font-family:sans-serif;margin-right:5px;'>"
					+ product.productName + "</span>";
			segment += "<span class='card-text' style='color:red;'>" + "$"
					+ product.price + "元" + "</span>&nbsp&nbsp<img src='<c:url value='/images/h1.png' />'style='width: 15px;'>";
			// 			segment += "<p class='card-text'>" + instructor.type + "</p>";
			segment += "<button href='#' class='btn btn-outline-secondary btn-sm mt-2 d-block' onclick=addCookie("
					+ product.productId

					+ ")><i class='fas fa-shopping-cart mr-1'></i>加入購物車</button>"
// <img src='<c:url value='/images/33.jpg' />'style='width: 30px;'> 
					
//segment += "<button href='#' class='btn btn-outline-secondary btn-sm mt-2 d-block' onclick=deleteCookie("
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

			// 										segment += "<div class='group-buttons'>"
			// 							segment += "<button type='button' class='add-to-cart' data-toggle='tooltip' data-placement='top' title='Add to Cart'><span>Add to Cart</span> <i class='fa fa-shopping-cart'></i></button>"
			// 						                segment += "<button type='button' data-toggle='tooltip' data-placement='top' title='Add to Wishlist'><i class='pe-7s-like'></i></button>"
			// 						                	 segment += "<button type='button'><i class='pe-7s-like'></i></button>"
			// 						                segment += ""
			// 						                		 segment += "<i class='pe-7s-like'></i>"

			// 						                "</div>"

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

	<%@include file="../Top.jsp"%>




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
				<img src="<c:url value='/images/v1.jpg' />"
					style='width: 1080px; display: block; margin: auto;' alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1 style='color: #336666;'>Gold Loute Foods</h1>
					<p>Eat healthy, live better.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/images/i1.jpg' />"
					style='width: 1080px; display: block; margin: auto;' alt="...">
				<div class="carousel-caption d-none d-md-block">
					<a href="<c:url value='/ShowActivitysFOR'  />">
					<h1 style='color: #336666;'>活動及優惠資訊</h1></a>
					<h5>You are what you eat, so eat right.</h5>
				</div>
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/images/33.jpg' />"
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

	<h3 style="text-align:center;color:#25282C">產品類別</h3>
	<div class="brand-logos">
            <div class="container">
                <div id="carousel-AAA">
                    <div>
                        <img class="img-responsive" src="assets/images/cow.png" style="height:100px" alt="img" onclick="selectType('beef')"/>
                    </div>
                    <div>
                        <img class="img-responsive" src="assets/images/PORK1.jpg" style="height:100px" alt="img" onclick="selectType('pork')"/>
                    </div>
                    <div>
                        <img class="img-responsive" src="assets/images/SEA1.jpg" style="height:100px" alt="img" onclick="selectType('seafood')"/>
                    </div>
                             <div>
                        <img class="img-responsive" src="assets/images/CH.jpg" style="height:100px" alt="img" onclick="selectType('chicken')"/>
                    </div>
<!--                 </div> -->
            </div>
        </div>
       

<div class="container" style='text-align:center;'>
	
<!-- 		產品類別: <select id='typeid'> -->
<!-- 			<option value='beef'>牛肉</option> -->
<!-- 			<option value='pork'>豬肉</option> -->
<!-- 			<option value='seafood'>海鮮</option> -->
<!-- 		</select> -->
<a class="btn btn-secondary btn-icon-split">
      <span class="icon text-white-50">
      <i class=""></i>
      </span>
      <span class="text">價位高低:</span>
      <select id='priceid'>
          <option value='lowTohigh'>從低到高</option>
          <option value='highTolow'>從高到低</option>
       </select>
       </a>
<!-- 		價位高低: <select id='priceid'> -->
<!-- 			<option value='lowTohigh'>從低到高</option> -->
<!-- 			<option value='highTolow'>從高到低</option> -->
<!-- 		</select> -->
		 
      <a class="btn btn-secondary btn-icon-split">
      <span class="icon text-white-50">
      <i class="fas fa-flag"></i>
      </span>
      <span class="text">搜尋:</span>
            <input type="text" name="keyword" id='keyword' required />
            <input type="button" value="Search" onclick='search()'/>
      </a>
<!-- 		 filter -->
<!-- 	     <input type="text" name="keyword" id='keyword' required /> -->
<!-- 	     &nbsp; -->
<!-- 	     <input type="button" value="Search" onclick='search()'/> -->
<!-- 	     &nbsp; -->
<!-- 	     <input type="button" value="Clear" />	 -->
	     <i class='pe-7s-like'></i>

	</div>
	<hr class="gray-line" />

	<div class="container" id='dataArea'>

		<!-- <div class='col-lg-6' > -->
	</div>
	<div class="testimonial-block testimonial-parallax parallax">
		<div class="bg-overlay"></div>
		<div class="container">
			<h3 style="color: #25282C">營養師專欄</h3>
			<h5 style="color: #25282C">WHAT THEY SAY</h5>
			<div id="carousel-8">
				<div class="testimonial-item">
					<div class="media">
						<div class="media-left">
							<img class="avatar img-responsive" src="assets/images/N2.jpg"
								style="height: 100px" alt="img" />
						</div>
						<div class="media-body">
							<a
								href="<c:url value='https://www.instagram.com/angela_dietitian/'  />"><h4
									style="color: #25282C">Angela營養師</h4></a>
							<h5 style="color: #25282C">外食三大困擾 你也有這些煩惱嗎？</h5>
							<div>
								<!--                                     <img class="quote" src="assets/images/quote2.png" alt="img" /> -->
								<p style="color: #888888">1.飲食不均衡 蔬果不足 2.外食油膩膩 油脂過高
									3.隱藏的糖和油脂 怕選錯食物 擔心吃錯又無法控制熱量 如果不計算熱量 自己能吃多少份量？﻿...</p>
							</div>
						</div>
					</div>
				</div>
				<div class="testimonial-item">
					<div class="media">
						<div class="media-left">
							<img class="avatar img-responsive" src="assets/images/N1.jpg"
								style="height: 100px" alt="img" />
						</div>
						<div class="media-body">
							<a
								href="<c:url value='https://www.facebook.com/dietitianOMG/'  />"><h4
									style="color: #25282C">歐乃嘉營養師</h4></a>
							<h5 style="color: #25282C">卡路里！！！有人真的去查卡路里是什麼意思嗎？</h5>
							<div>
								<!--                                     <img class="quote" src="assets/images/quote2.png" alt="img" /> -->
								<p style="color: #888888">在台灣有人真的去查卡路里是什麼意思嗎？感覺這個詞大家不知不覺中就知道這代表熱量
									而熱量第一個就讓人聯想到身材 ...</p>
							</div>
						</div>
					</div>
				</div>
				<div class="testimonial-item">
					<div class="media">
						<div class="media-left">
							<img class="avatar img-responsive" src="assets/images/N3.png"
								style="height: 100px" alt="img" />
						</div>
						<div class="media-body">
							<a href="<c:url value='https://www.facebook.com/arie.cc.rx/'  />"><h4
									style="color: #25282C">營養專科</h4></a>
							<h5 style="color: #25282C">除了勤洗手、戴口罩之外，正確的飲食可增強抵抗力、對抗各種疾病</h5>
							<div>
								<!--                                     <img class="quote" src="assets/images/quote2.png" alt="img" /> -->
								<p style="color: #888888">維生素 C： 🔸可以增加抗氧化力 🔸促進膠原蛋白合成
									🔸促進傷口癒合 🔸促進鐵質吸收 但如此重要的營養素，我們的人體竟然無法自行合成，100%需要從食物中攝取...</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--            品牌圖片輪轉 -->

	<h3 style="text-align: center; color: #25282C">廠商專區</h3>
	<br>
	<br>

	<div class="brand-logos">
		<div class="container">
			<div id="carousel-3">
				<div>
					<img class="img-responsive" src="assets/images/C1.jpg"
						style="height: 100px" alt="img" />
				</div>
				<div>
					<img class="img-responsive" src="assets/images/C2.jpg"
						style="height: 100px" alt="img" />
				</div>
				<div>
					<img class="img-responsive" src="assets/images/C3.jpg"
						style="height: 100px" alt="img" />
				</div>
				<div>
					<img class="img-responsive" src="assets/images/C4.jpg"
						style="height: 100px" alt="img" />
				</div>
				<div>
					<img class="img-responsive" src="assets/images/C5.jpg"
						style="height: 100px" alt="img" />
				</div>
				<div>

					<img class="img-responsive" src="assets/images/C6.jpg"
						style="height: 100px" alt="img" />
				</div>
				<!--                     <div> -->
				<!--                         <img class="img-responsive" src="assets/images/C7.jpgg" alt="img" /> -->
				<!--                     </div> -->

			</div>
		</div>
	</div>
	<%@include file="../Footer.jsp"%>

	<script
		src="<c:url value = '/assets/scripts/libs/jquery-1.11.2.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery-ui-1.11.4/jquery-ui.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.easing.1.3.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/bootstrap.min.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/fancySelect.js'/> "></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.fancybox.pack.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.ui.touch-punch.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.mousewheel.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/allinone_bannerRotator.js'/> "></script>
	<script
		src="<c:url value = '/assets/scripts/libs/owl.carousel.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.countdown.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.waypoints.min.js'/>"></script>
	<script
		src="<c:url value = '/assets/scripts/libs/jquery.mixitup.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/functions.js'/>"></script>

</body>
</html>
