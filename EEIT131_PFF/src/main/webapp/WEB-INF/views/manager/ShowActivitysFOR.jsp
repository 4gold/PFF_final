<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<!-- <script type="text/javascript" -->
<%-- 	src="<c:url value='/DataTables/datatables.min.js' />"></script> --%>

<link rel="shortcut icon"
	href="<c:url value = '/assets/images/favicon.ico' />">
<link href="<c:url value = '/assets/styles/font-awesome.min.css'/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value = '/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css'/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/pe-icon-7-stroke/css/helper.css'/> "
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/minimal-menu.css'/> "
	rel="stylesheet" type="text/css" />
<!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="assets/styles/minimal-menu-ie.css" />
        <![endif]-->
<link href="<c:url value = '/assets/styles/flat-form.css '/> "
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/fancySelect.css'/> "
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/jquery.fancybox.css '/>"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value = '/assets/styles/allinone_bannerRotator.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/owl.carousel.css'/> "
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value = '/assets/styles/owl.theme.default.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value = '/assets/styles/styles.css" rel="stylesheet' />"
	type="text/css" />
<script
	src="<c:url value = '/assets/scripts/libs/prefixfree.min.js' /> "></script>
<script src="<c:url value = '/assets/scripts/libs/modernizr.js'  />"></script>
<!--[if lt IE 9]>
        <script src="assets/scripts/libs/html5shiv.js"></script>
        <script src="assets/scripts/libs/respond.js"></script>
        <![endif]-->
<title>Insert title here</title>
<script>
	window.onload = function() {
		let dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/image/ShowActivitysFOR' />");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				dataArea.innerHTML = processActivityData(xhr.responseText);
			}
		}
	}
		function processActivityData(jsonString) {
			let activitys = JSON.parse(jsonString);
			let segment = "";
			for (let n = 0; n < activitys.length; n++) {
				let activity = activitys[n];

				segment += "<tr>";
				
				segment += "<td>" + activity.discount + "</td>";
				segment += "<td>" + activity.title + "</td>";
				segment += "<td>" + activity.content + "</td>";
				segment += "<td style='text-align:center;'>"
						+ "<img src=<c:url value='/image/getCoverImage' />?activityId="
						+ activity.activityId + " style='width:200px;'/> "
						+ "</td>";
				segment += "</tr>";
			}
			segment += "</table>";
			return segment;
		}
	
</script>
<style>
table {
	border: 1px black solid;
}

th {
	text-align: left;
}
</style>

</head>
<body>
	<%@include file="../Top.jsp"%>
	<header class="gray-bg">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value='/images/v1.jpg' />"
					style='width: 1080px; display: block; margin: auto;' alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1 style='color: #336666;'>Gold Loute Foods</h1>
					<p>Eat healthy, live better.</p>
				</div>
			</div>
		</div>
	</header>


	<div class="main">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="main-content">
						<div class="list-posts">
							<div class="post-item">
								<h3 class="post-title">活動相關內容</h3>
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>折扣方式</th>
											<th>活動名稱</th>
											<th>活動內容</th>
											<th>活動照片</th>
										</tr>
									</thead>
									<tbody id="dataArea">
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
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