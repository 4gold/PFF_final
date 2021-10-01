<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
	let dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/partner/showAllOrder' />");
	xhr.send();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			dataArea.innerHTML = processMemberData(xhr.responseText);
		}
	}
}

function processMemberData(jsonString){
	let partners = JSON.parse(jsonString);
	let segment = "<table border='1'>";
	segment += "<tr><th colspan='11'>會員資料列表</th></tr>";
	segment += "<tr><th>訂單編號</th><th>訂單狀態</th><th>付款狀態</th><th>付款方式</th><th>出貨狀態</th><th>出貨方式</th><th>訂購時間</th><th>備註</th><th>完成時間</th></tr>";
	for(let n = 0 ; n < partners.length; n++){
		let partner = partners[n];
		segment += "<tr>";
		 
		let link = "<a href='" + "<c:url value='/editOrderForm' />?partnerId=" + partner.partnerId + "'>" + partner.partnerId + "</a>";
		if (n == 0) {
		   console.log(link);
		}
		segment += "<td>" + link + "</td>";
		segment += "<td>" + orderdetails.orderId + "</td>";
		segment += "<td>" + orderdetails.orderStatus + "</td>";
		segment += "<td>" + orderdetails.paymentStatus + "</td>";
		segment += "<td>" + orderdetails.paymentMethod + "</td>";
		segment += "<td>" + orderdetails.shippingStatus + "</td>";
		segment += "<td>" + orderdetails.shippingMethod + "</td>";
		segment += "<td>" + orderdetails.orderTime + "</td>";
		segment += "<td>" + orderdetails.remarks + "</td>";
		segment += "<td>" + orderdetails.finishedTime + "</td>";
		
		segment += "</tr>";
	}
	segment += "</table>";
	return segment;
}


</script>
</head>
<body>
<div id='dataArea' align='center'>

</div>
<div align='center'>
  <a href="<c:url value='/partner/partner' />">回前頁</a>
</div>
</body>
</html>