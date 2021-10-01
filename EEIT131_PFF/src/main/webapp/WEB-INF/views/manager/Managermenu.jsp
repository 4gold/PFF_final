<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' /> --%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>管理者頁面-首頁</title>
<!-- Custom fonts for this template-->
<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="<c:url value='/css/sb-admin-2.min.css' />" rel="stylesheet">
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
		<!-- 	結束左邊拉條 -->
		<!--------------------------------------------------------------------------------------------------------------------------------------->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->

					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<ul class="navbar-nav ml-auto">

						<li class="nav-item dropdown no-arrow">
							<!-- Nav Item - User Information -->
							<a
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
				<!-- End of Topbar -->
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												活動便條紙</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<a href="<c:url value='/manager/howmanyactivitypage' />">
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-calendar fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
							<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												便條紙</div>
												  <div class="row no-gutters align-items-center">
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
												<a href="<c:url value='/manager/howmanyactivitypage' />">
											</div>
										</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
								<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												解約廠商通知</div>
												  <div class="row no-gutters align-items-center">
											<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
												<a href="<c:url value='' />">
											</div>
										</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>JAVA程式設計就業養成班 &copy; EEIT131資策會 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->
		</div>
	</div>



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
<%-- 	<script src="<c:url value='/vendor/chart.js/Chart.min.js' />"></script> --%>

	<!-- Page level custom scripts -->
<%-- 	<script src="<c:url value='/js/demo/chart-area-demo.js' />"></script> --%>
<%-- 	<script src="<c:url value='/js/demo/chart-pie-demo.js' />"></script> --%>
</body>
</html>