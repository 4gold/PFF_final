<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<script src="//apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

<title>後台管理者登入</title>
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript">
	window.onload = function() {
		let sendData = document.getElementById("sendData");
		let sendSub = document.getElementById("sendSub");
		let accountId = document.getElementById("accountId");
		let password = document.getElementById("password");
		let msg1 = document.getElementById("msg1");
		let msg2 = document.getElementById("msg2");
		let msg3 = document.getElementById("msg3");
		let flag1,flag2 = false;

		sendSub.disabled = true;

		accountId.onfocus = function() {
			msg3.innerHTML = "";
		}
		password.onfocus = function() {
			msg3.innerHTML = "";
		}

		accountId.onblur = function() {
			if (!accountId.value) {
				sendSub.disabled = true;
				flag1 = false;
				msg1.innerHTML = "請輸入帳號";
			} else {
				flag1 = true;
				msg1.innerHTML = "";
				if (flag1 && flag2)
					sendSub.disabled = false;
			}
		}
		password.onblur = function() {
			if (!password.value) {
				sendSub.disabled = true;
				flag2 = false;
				msg2.innerHTML = "請輸入密碼";
			} else {
				flag2 = true;
				msg2.innerHTML = "";
				if (flag1 && flag2)
					sendSub.disabled = false;
			}
		}
	}
</script>
</head>
<body class="bg-gradient-primary">
	<div class="container">
		<div class="row justify-content-center">
		<a href="<c:url value='/'  />"><button class="btn btn-facebook btn-user btn-block">回首頁</button></a>
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">管理員登入</h1>
									</div>
									<form class="user">
										<div class="form-group">
											&nbsp;帳號:<input type="text" class="form-control form-control-user"
												name="accountId" id="accountId" placeholder="請輸入帳號"><br>
											<span id=msg1>${errors.userName}</span><br>
										</div>
										<div class="form-group">
											 &nbsp;密碼:<input type="password"
												class="form-control form-control-user" name="password"
												id="password" placeholder="請輸入密碼"> <br>
												<span id=msg2>${errors.userPwd}</span><br>
										</div>
										<div class="form-group">
											<span id=msg3>${errors.msg}</span><br>
										</div>

										<input type="submit" id="sendSub" formaction="<c:url value='/managerlogin' />"
											formmethod="post" class="btn btn-primary btn-user btn-block"
											value="登入"> <br>
										
										<hr>
										(Only For Manager) <br>
										<hr>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="<c:url value='/vendor/jquery/jquery.min.js' />"></script>
	<script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

	<!-- Core plugin JavaScript-->
	<script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js' />"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/js/sb-admin-2.min.js' />"></script>
</body>
</html>