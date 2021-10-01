<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<title>會員基本資料</title>
</head>
<body>
<body id="page-top">
	<div id="wrapper">

		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar"> 

			<a class="sidebar-brand d-flex align-items-center justify-content-center"
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
					class="fas fa-fw fa-cog"></i> <span>廠商管理</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">基本資料</h6>
						<a class="collapse-item"
							href="<c:url value='/partner/inquire'  />">查詢</a> <a
							class="collapse-item"
							href="<c:url value='/partner/revisePartnerPage'  />">修改</a>
					</div>
				</div></li>
			<!-- 左邊拉條會員管理選單 -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>訂單管理</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">訂單管理</h6>
						<a class="collapse-item"
							href="<c:url value='/partner/orderdetails'  />">訂單查詢</a>
							

					</div>
				</div></li>

			<!-- 左邊拉條廠商管理選單 -->
			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>商品管理</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">商品管理:</h6>
						<a class="collapse-item"
							href="<c:url value='/partner/allProductpage'  />">商品管理</a> 
					</div>
				</div></li>
		</ul>
		<div id="content-wrapper" class="d-flex flex-column" style=background-image:url(../images/bb333.jpg)>

			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<a href="<c:url value='/partner/partner' />"
					class="btn btn-secondary btn-icon-split"> <span
					class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">回企業首頁</span>
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
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">管理者</span>
							<img class="img-profile rounded-circle"
							src="<c:url value='/images/undraw_profile.svg' />">
					</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="<c:url value='/partner/logout'/>">
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 登出
							</a>
						</div>
					</li>
				</ul>
			</nav>
<div class="container-fluid"  align='center'>
<h2>會員基本資料</h2>
<hr>

<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>	
<div class="card shadow mb-4">
                       
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>企業ID</th>
                                            <th>統一編號</th>
                                            <th>公司名稱</th>
                                            <th>聯絡電話</th>
                                            <th>密碼</th>
                                            <th>電子郵件</th>
                                            <th>通訊地址</th>
                                            <th>產業類別</th>
                                            <th>官方網站</th>
                                            <th>附註</th>
                                            <th>銀行帳戶</th>
                                        </tr>
                                    </thead>
                                   
 <tbody>                                   
  <tr>
     <td>${sessionScope.loginPartner.partnerId}</td>
     <td>${sessionScope.loginPartner.uniformNumbers}</td>
     <td>${sessionScope.loginPartner.companyName}</td>
     <td>${sessionScope.loginPartner.phone}</td>
     <td>${sessionScope.loginPartner.password}</td>
     <td>${sessionScope.loginPartner.email}</td>
     <td>${sessionScope.loginPartner.address}</td>
     <td>${sessionScope.loginPartner.businessCategory}</td>
     <td>${sessionScope.loginPartner.officialWebsite}</td>
     <td>${sessionScope.loginPartner.remarks}</td>
     <td>${sessionScope.loginPartner.bankAccount}</td>
  </tr> 
  </tbody>      
  
  

</table>
<hr>
<a href="<c:url value='/partner/partner'  />">回前頁</a>
</div>
</div>
<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>JAVA程式設計就業養成班 &copy; EEIT131資策會 2021</span>
					</div>
				</div>
			</footer>
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
	<script src="<c:url value='/vendor/chart.js/Chart.min.js' />"></script>

	<!-- Page level custom scripts -->
	<script src="<c:url value='/js/demo/chart-area-demo.js' />"></script>
	<script src="<c:url value='/js/demo/chart-pie-demo.js' />"></script>
<%@include file="../Footer.jsp"%>	
</body>
</html>