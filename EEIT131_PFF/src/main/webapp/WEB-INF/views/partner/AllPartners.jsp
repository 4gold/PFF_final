<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<%-- <link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" /> --%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload = function(){
	let dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/partner/allpartner' />");
	xhr.send();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			dataArea.innerHTML = processMemberData(xhr.responseText);
		}
	}
}

function processMemberData(jsonString){
	let members = JSON.parse(jsonString);
	let segment = "<table border='1'>";
	segment += "<tr><th colspan='11'>廠商資料列表</th></tr>";
	segment += "<tr><th>廠商編號</th><th>統編</th><th>廠商名稱</th><th>廠商電話</th><th>密碼</th><th>email</th><th>地址</th><th>商業類別</th><th>廠商官網</th><th>廠商簡介</th><th>銀行帳戶</th></tr>";
	for(let n = 0 ; n < members.length; n++){
		let member = members[n];
		segment += "<tr>";
		 
		if (n == 0) {
		}
		segment += "<td>" + member.partnerId + "</td>";
		segment += "<td>" + member.uniformNumbers + "</td>";
		segment += "<td>" + member.companyName + "</td>";
		segment += "<td>" + member.phone + "</td>";
		segment += "<td>" + member.password + "</td>";
		segment += "<td>" + member.email + "</td>";
		segment += "<td>" + member.address + "</td>";
		segment += "<td>" + member.businessCategory + "</td>";
		segment += "<td>" + member.officialWebsite + "</td>";
		segment += "<td>" + member.remarks + "</td>";
		segment += "<td>" + member.bankAccount + "</td>";
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