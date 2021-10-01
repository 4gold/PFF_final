<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align='center'>
<h2>會員列表</h2>
<hr>
<table border='1'>
<tr><th>企業ID</th><th>統一編號</th><th>公司名稱</th><th>聯絡電話</th><th>密碼</th><th>電子郵件</th><th>通訊地址</th><th>產業類別</th><th>官方網站</th><th>標記</th><th>銀行帳戶</th></tr>
<c:forEach var='partner' items='${partner123}'>
  <tr>
     <td>${partner.partnerId}</td>
     <td>${partner.uniformNumbers}</td>
     <td>${partner.companyName}</td>
     <td>${partner.phone}</td>
     <td>${partner.password}</td>
     <td>${partner.email}</td>
     <td>${partner.address}</td>
     <td>${partner.businessCategory}</td>
     <td>${partner.officialWebsite}</td>
     <td>${partner.remarks}</td>
     <td>${partner.bankAccount}</td>
  </tr>   
</c:forEach>
</table>
<hr>
<a href="<c:url value='/partner/partner'  />">回前頁</a>
</div>
</body>
</html>