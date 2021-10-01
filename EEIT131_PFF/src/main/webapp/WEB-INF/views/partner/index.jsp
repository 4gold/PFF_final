<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
		<h2>Spring Boot 範例</h2>
		<hr>
		<a id= "logon" href="<c:url value='/partnerloginpage'  />">登入</a><br>
		<a href="<c:url value='/partnerregister'  />">註冊</a><br>
		<a href="<c:url value='/partner/inquire'  />">查詢</a><br>
		<a href="<c:url value='/partner/inquireAll'  />">查詢全部</a><br>
		<hr>
		<a href="<c:url value='/partner/revisePartnerPage'  />">修改</a><br>
		<a href="<c:url value='/partner/reviseForm'  />">修改全部</a><br>
		<a href="<c:url value='/partner/orderdetails'  />">訂單管理</a><br>
		
		<hr>
		Context Path(上下文路徑): ${pageContext.request.contextPath}<br>
<%-- 		<img width='60' src='${pageContext.request.contextPath}/images/PDF.png' /> --%>
		<hr>
		
	</div>
</body>
</html>