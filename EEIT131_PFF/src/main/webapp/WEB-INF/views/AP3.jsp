<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<script>
	window.onload = function() {
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
	}
	function processInstructorData(jsonString) {
		let instructors = JSON.parse(jsonString);
		//取照片
		let segment = "<div class='row row-cols-1 row-cols-md-4 g-4'>";
		for (let n = 0; n < instructors.length; n++) {
			let instructor = instructors[n];

			segment += "<div class='col'>"
			segment += "<div class='card h-60'>"
			segment += "<img src=<c:url value='/consultion/getCoverImage' />?instructorId="
					+ instructor.instructorId
					+ " style='width:150px;height:150px;'/>";
			segment += "<div class='card-body'>";
			segment += "<h4 class='card-title'>" + instructor.instructorName
					+ "</h4>";
			segment += "<p class='card-text'>" + "$" + instructor.price + "元"
					+ "</p>";
			segment += "<p class='card-text'>" + instructor.type + "</p>";
			
			segment +="<a href='#' class='btn btn-outline-secondary btn-sm mt-2 d-block'><i class='fas fa-shopping-cart mr-1'></i>加入購物車</a>"

// 				segment += " <div class='group-buttons'><button type='button' class='add-to-cart' data-toggle='tooltip' data-placement='top' title='Add to Cart'>
// 				segment += "<span>Add to Cart</span> <i class='fa fa-shopping-cart'></i></button>"
// 				segment += " <button type='button' data-toggle='tooltip' data-placement='top' title='Add to Wishlist'><i class='pe-7s-like'></i></button></div>"
			segment += "</div>";
			segment += "</div>";
			segment += "</div>";

		}
		segment += "</div>";

		return segment;
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">

<link rel="stylesheet"
	href="path/to/pe-icon-7-stroke/css/pe-icon-7-stroke.css">

<!-- Optional - Adds useful class to manipulate icon font display -->
<link rel="stylesheet" href="path/to/pe-icon-7-stroke/css/helper.css">


<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="images/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap"
	rel="stylesheet">
<!-- Core theme CSS (includes Bootstrap)-->

<!--Boostrap CDN-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<!-- <script src="js/scripts.js"></script> -->
<!--SB Forms JS-->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- <link href="assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css" /> -->
</head>
<body>

	<div class="container" id='dataArea'>

		<!-- <div class='col-lg-6' > -->
	</div>


</body>
</html>