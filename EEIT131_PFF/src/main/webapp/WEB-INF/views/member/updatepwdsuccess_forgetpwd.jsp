<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<meta charset="UTF-8">
<title>修改成功</title>
</head>
<body>
    <div align="center">
        <span>修改成功！請重新登入</span>
        <br><a href="<c:url value='/memberloginpage'/>"><button>回到登入</button></a>
    </div>
</body>
</html>