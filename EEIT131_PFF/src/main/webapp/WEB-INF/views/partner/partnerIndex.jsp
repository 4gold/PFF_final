<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
<link href="assets/styles/flat-form.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/fancySelect.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/jquery.fancybox.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/allinone_bannerRotator.css"
	rel="stylesheet" type="text/css" />
<link href="assets/styles/owl.carousel.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/owl.theme.default.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/styles.css" rel="stylesheet"
	type="text/css" />
<script src="assets/scripts/libs/prefixfree.min.js"></script>
<script src="assets/scripts/libs/modernizr.js"></script>
<script src="assets/scripts/libs/html5shiv.js"></script>
<script src="assets/scripts/libs/respond.js"></script>

<meta charset="UTF-8">
<title>企業會員</title>
</head>
<body>
<%@include file="../Top.jsp"%>
<body id="page-top">
   <div id="wrapper">
	<div align='center'>
	  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
         <a href="<c:url value='/ ' /> "><img src="images/gold loute.jpg" style="width:140px"> </a>	 
	  </ul> 
  </div>	
	
 <div class="container-fluid"  align='center'>
		<h2>企業會員</h2>
		<hr>
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>		
		<a id= "logon" href="<c:url value='/partnerlogin'  />">登入</a><br>
		<a href="<c:url value='/register'  />">註冊</a><br>
    <!--<a href="<c:url value='/partner/inquire'  />">查詢</a><br>
		<a href="<c:url value='/partner/inquireAll'  />">查詢全部</a><br>
		<hr>
		<a href="<c:url value='/partner/revisePartnerPage'  />">修改</a><br>
		<a href="<c:url value='/partner/reviseForm'  />">修改全部</a><br>
		<a href="<c:url value='/partner/orderdetails'  />">訂單管理</a><br>-->
		
		
</div>		
</div>	  
    
<%@include file="../Footer.jsp"%>	
</body>
</html>