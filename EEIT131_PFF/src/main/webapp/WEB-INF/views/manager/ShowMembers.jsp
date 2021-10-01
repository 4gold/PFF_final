<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/DataTables/datatables.min.css' />" />
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/DataTables/datatables.min.js' />"></script>
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
<title>會員資料列表</title>
<script>
	window.onload = function() {
		let dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/user/alluser' />");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				dataArea.innerHTML = processMemberData(xhr.responseText);
			}
		}
		let deleteMember = document.getElementById("deleteMember");

		deleteMember.onclick = function() {
			let mId = document.querySelector('input[name="ra1"]:checked').value;
			console.log(mId);
			let xhr2 = new XMLHttpRequest();
			xhr2.open("DELETE", "<c:url value='/user/deletemember/"+mId+"' />");

			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					console.log(xhr2.responseText);

				}
			}
			xhr2.send(null);
			location.reload(true);
		}

	}

	function processMemberData(jsonString) {
		let members = JSON.parse(jsonString);
		let segment = "";

		for (let n = 0; n < members.length; n++) {
			let member = members[n];
			segment += "<tr>";
			let link = "<a name='a1' href='<c:url value='/user/updatemembers' />?memberId="
					+ member.memberId + "'>"
					+ "<button class='btn btn-light btn-icon-split'>"
					+ "<span class='icon text-gray-600'>"
					+ "<i class='fas fa-arrow-right'>" + "</i>"
			"</span>" + "<span class='text'>" + "更新會員資料" + "</span>"
					+ "</button>" + "</a>";

			segment += "<td><input type='radio' name='ra1' value='"+member.memberId+"' style='display: none'></td>";
			segment += "<td>" + link + "</td>";
			segment += "<td>" + member.accountId + "</td>";
			segment += "<td>" + member.password + "</td>";
			segment += "<td>" + member.userName + "</td>";
			segment += "<td>" + member.birthday + "</td>";
			segment += "<td>" + member.email + "</td>";
			segment += "<td>" + member.address + "</td>";
			segment += "<td>" + member.phone1 + "</td>";
			segment += "<td>" + member.phone2 + "</td>";
			segment += "<td>" + member.phone3 + "</td>";
			segment += "<td>" + member.createTime + "</td>";
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
			<div id="content">
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
				<!-- --------------------------------右邊拉條都共同使用------------------------------------------------------------------- -->

				<div class="container-fluid">

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">會員資料列表管理</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<!-- 取消按鍵 -->
										<button id='cancel' class="btn btn-warning btn-icon-split"
											style='display: none;'>
											<span class="icon text-white-50"> <i
												class="fas fa-exclamation-triangle"></i>
											</span> <span class="text"> 取消</span>
										</button>
										<!-- 確認刪除按鍵 -->
									<button id="deleteMember" class="btn btn-danger btn-icon-split" style="display: none; float: right;">
											<span class="icon text-white-50"> <i class="fas fa-trash"></i>
											</span> <span class="text">確認刪除</span>
										</button>
										
										

												<tr>
													<th>刪除資料</th>
													<th>更新資料</th>
													<th>會員帳號</th>
													<th>會員密碼</th>
													<th>會員名稱</th>
													<th>生日</th>
													<th>Email</th>
													<th>地址</th>
													<th>電話一</th>
													<th>電話二</th>
													<th>電話三</th>
													<th>新增時間</th>
												</tr>
												</thead>
												<tfoot>
													<tr>
														<th>刪除資料</th>
														<th>更新資料</th>
														<th>會員帳號</th>
														<th>會員密碼</th>
														<th>會員名稱</th>
														<th>生日</th>
														<th>Email</th>
														<th>地址</th>
														<th>電話一</th>
														<th>電話二</th>
														<th>電話三</th>
														<th>新增時間</th>
													</tr>
												</tfoot>
												<tbody id="dataArea">
												</tbody>
											</table>
							</div>



                            <!-- 拉雞桶圈圈 -->
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
						<span>JAVA程式設計就業養成班 &copy; EEIT131資策會 2021</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>


							<script>
								$(document).ready(function() {
									$("table").DataTable({
										"ordering" : false, //顯示排序
										"bPaginate" : false, // 顯示換頁
										"searching" : false, // 顯示搜尋
										"info" : false, // 顯示資訊
										"fixedHeader" : true
									// 標題置頂	
									});
								});
								$("#edit")
										.click(
												function() {
													$(this)
															.attr("hidden",
																	true);
													$(
															"input[type=radio], #deleteMember, #cancel")
															.css('display',
																	'inline');
													$("a[name='a1']").css(
															'display', 'none');

												})
								$("#cancel")
										.click(
												function() {
													$(
															"input[type=radio], #deleteMember, #cancel")
															.css('display',
																	'none');
													$("#edit").attr("hidden",
															false);
													$("a[name='a1']")
															.css('display',
																	'inline');

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
<%-- 							<script src="<c:url value='/vendor/chart.js/Chart.min.js' />"></script> --%>

<!-- 							Page level custom scripts -->
<%-- 							<script src="<c:url value='/js/demo/chart-area-demo.js' />"></script> --%>
<%-- 							<script src="<c:url value='/js/demo/chart-pie-demo.js' />"></script> --%>
</body>
</html>