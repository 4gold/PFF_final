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
	xhr.open("GET", "<c:url value='/partner/revise' />");
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
	segment += "<tr><th>企業ID</th><th>統一編號</th><th>公司名稱</th><th>聯絡電話</th><th>密碼</th><th>電子郵件</th><th>通訊地址</th><th>產業類別</th><th>官方網站</th><th>標記</th><th>銀行帳戶</th></tr>";
	for(let n = 0 ; n < partners.length; n++){
		let partner = partners[n];
		segment += "<tr>";
		 
		let link = "<a href='" + "<c:url value='/partner/editForm' />?partnerId=" + partner.partnerId + "'>" + partner.partnerId + "</a>";
		if (n == 0) {
		   console.log(link);
		}
		segment += "<td>" + link + "</td>";
		segment += "<td>" + partner.uniformNumbers + "</td>";
		segment += "<td>" + partner.companyName + "</td>";
		segment += "<td>" + partner.phone + "</td>";
		segment += "<td>" + partner.password + "</td>";
		segment += "<td>" + partner.email + "</td>";
		segment += "<td>" + partner.address + "</td>";
		segment += "<td>" + partner.businessCategory + "</td>";
		segment += "<td>" + partner.officialWebsite + "</td>";
		segment += "<td>" + partner.remarks + "</td>";
		segment += "<td>" + partner.bankAccount + "</td>";
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