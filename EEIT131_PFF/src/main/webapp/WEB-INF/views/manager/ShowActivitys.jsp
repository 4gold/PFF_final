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
<title>Insert title here</title>
<script>
	window.onload = function() {
		let dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/manager/allactivity' />");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				dataArea.innerHTML = processActivityData(xhr.responseText);
			}
		}
		let deleteActivity = document.getElementById("deleteActivity");

		deleteActivity.onclick = function() {
			let aId = document.querySelector('input[name="ra1"]:checked').value;
			console.log(aId);
			let xhr2 = new XMLHttpRequest();
			xhr2.open("DELETE",
					"<c:url value='/manager/deleteactivity/"+aId+"' />");

			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					console.log(xhr2.responseText);

				}
			}
			xhr2.send(null);
			location.reload(true);
		}

	}

	function processActivityData(jsonString) {
		let activitys = JSON.parse(jsonString);
		let segment = "";
		for (let n = 0; n < activitys.length; n++) {
			let activity = activitys[n];
			//console.log(activity.activityImages);
			segment += "<tr>";
			let link = "<a name='a1' href='"
					+ "<c:url value='/manager/updateactivitys' />?activityId="
					+ activity.activityId + "'>"
					+ "<button class='btn btn-light btn-icon-split'>"
					+ "<span class='icon text-gray-600'>"
					+ "<i class='fas fa-arrow-right'>" + "</i>"
			"</span>" + "<span class='text'>" + "??????????????????" + "</span>"
					+ "</button>" + "</a>";

			segment += "<td><input type='radio' name='ra1' value='"+activity.activityId+"' style='display: none'></td>";
			segment += "<td>" + link + "</td>";
			segment += "<td>" + activity.discount + "</td>";
			segment += "<td>" + activity.title + "</td>";
			segment += "<td>" + activity.content + "</td>";
			segment += "<td>"
					+ "<img src=<c:url value='/image/getCoverImage' />?activityId="
					+ activity.activityId
					+ " style='width:150px;height:150px;'/> " + "</td>";
			segment += "</tr>";
		}
		segment += "</table>";
		return segment;
	}
</script>
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
				<div class="sidebar-brand-text mx-3">??????????????????</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">
				<h6>?????????</h6>
			</div>
			<!-- ?????????????????????????????? -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>????????????</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">??????????????????:</h6>
						<a class="collapse-item"
							href="<c:url value='/manager/allactivitypage'  />">??????????????????</a> <a
							class="collapse-item"
							href="<c:url value='/manager/addactivity'  />">????????????</a>
					</div>
				</div></li>
			<!-- ?????????????????????????????? -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>????????????</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">??????????????????:</h6>
						<a class="collapse-item"
							href="<c:url value='/user/allmemberpage'  />">??????????????????</a> <a
							class="collapse-item" href="<c:url value='/user/addmember'  />">????????????</a>

					</div>
				</div></li>

			<!-- ?????????????????????????????? -->
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>????????????</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">??????????????????:</h6>
						<a class="collapse-item"
							href="<c:url value='/manager/allpartnerpage'  />">??????????????????</a> <a
							class="collapse-item"
							href="<c:url value='/manager/addpartner'  />">????????????</a>
					</div>
				</div></li>
		</ul>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<a href="<c:url value='/manager/page' />"
						class="btn btn-secondary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
					</span> <span class="text">?????????????????????</span>
					</a>


					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<ul class="navbar-nav ml-auto">


						<li class="nav-item dropdown no-arrow">
							<!-- Nav Item - User Information -->
							<div ></div> <a
							class="nav-link dropdown-toggle" id="userDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								<span class="mr-2 d-none d-lg-inline text-gray-600 small">???????????????</span>
								<img class="img-profile rounded-circle"
								src="<c:url value='/images/ET.png' />">
						</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="dropdown-item" href="<c:url value='/managerlogout'/>">
									<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> ??????
								</a>
							</div>
						</li>
					</ul>
				</nav>


				<!-- --------------------------------???????????????????????????------------------------------------------------------------------- -->


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">????????????????????????</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
									<thead>
										<!-- ???????????? -->
										<button id='cancel' class="btn btn-warning btn-icon-split"
											style='display: none;'>
											<span class="icon text-white-50"> <i
												class="fas fa-exclamation-triangle"></i>
											</span> <span class="text"> ??????</span>
										</button>
										<!-- ?????????????????? -->
										<button id='deleteActivity'
											class="btn btn-danger btn-icon-split"
											style='display: none; float: right'>
											<span class="icon text-white-50"> <i
												class="fas fa-trash"></i>
											</span> <span class="text">????????????</span>
										</button>
										<table style="width: 100%; text-align: center"
											class="display compact">

											<tr>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
												<th>????????????</th>
											</tr>
											</thead>
											<tfoot>
												<tr>
													<th>????????????</th>
													<th>????????????</th>
													<th>????????????</th>
													<th>????????????</th>
													<th>????????????</th>
													<th>????????????</th>
												</tr>
											</tfoot>
											<tbody id="dataArea">
											</tbody>
										</table>
							</div>



							<br>
							<button id='edit' class="btn btn-danger btn-circle">
								<i class="fas fa-trash"></i>
							</button>




						</div>
					</div>
				</div>
			</div>
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>JAVA??????????????????????????? &copy; EEIT131????????? 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>

		<script>
			$(document).ready(function() {
				$("table").DataTable({
					"ordering" : false, //????????????
					"bPaginate" : false, // ????????????
					"searching" : false, // ????????????
					"info" : false, // ????????????
					"fixedHeader" : true
				// ????????????	
				});
			});
			$("#edit").click(
					function() {
						$(this).attr("hidden", true);
						$("input[type=radio], #deleteActivity, #cancel").css(
								'display', 'inline');
						$("a[name='a1']").css('display', 'none');

					})
			$("#cancel").click(
					function() {
						$("input[type=radio], #deleteActivity, #cancel").css(
								'display', 'none');
						$("#edit").attr("hidden", false);
						$("a[name='a1']").css('display', 'inline');

					})
		</script>


		<!-- Bootstrap core JavaScript-->
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