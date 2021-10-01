<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<%-- <link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' /> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align='center'>
		<h2>管理者頁面</h2>
		<hr>
		<a href="<c:url value='/user/allmemberpage'  />">會員資料列表</a><br>
		<a href="<c:url value='/user/addmember'  />">會員資料新增</a><br>     <!-- 會員簡單基本資料 -->
		<hr>
		<a href="<c:url value='/partner/allpartnerpage'  />">廠商資料列表</a><br>
		<a href="<c:url value=''  />">廠商資料新增</a><br>     <!-- 廠商簡單基本資料 -->
		<hr>
		<a href="<c:url value='/activity/allactivitypage'  />">活動資料列表</a><br>	
		<a href="<c:url value=''  />">活動資料新增</a><br>	    <!-- 活動資料包括圖片上傳 -->
		<hr>
		<hr>
		<a href="<c:url value='/partner/allProductpage'  />">商品資料列表</a><br>	
		<a href="<c:url value='/partner/addproduct'  />">商品資料新增</a><br> 	
		
		   <!-- 活動資料包括圖片上傳 -->
		<hr>
		Context Path(上下文路徑): ${pageContext.request.contextPath}<br>
		<hr>
	</div>
</body>
</html>