<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	window.onload = function() {
		let dataArea = document.getElementById("dataArea");
		let xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/cart/readProduct' />");
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				dataArea.innerHTML = processMemberData(xhr.responseText);
			}
		}
	}
	function processMemberData(jsonString) {
		console.log(jsonString);//console.log印出是否有取到Json字串
		let productList = JSON.parse(jsonString);
		let segment = "<table border = '1'>";
		segment += "<tr><th colspan='6'> 商品資料表</th></tr>"
		segment += "<tr><th>產品編號</th><th>商品名稱</th><th>金額</th><th>庫存</th><th>評論</th><tr><th></th>";

		for (let n = 0; n < productList.length; n++) {
			let product = productList[n];
			segment += "<tr>";

			let link = "<a href='" + "<c:url value='/cart/readProduct' />?id="
					+ product.productId + "'>" + product.productId + "</a>";
			if (n == 0) {
				console.log(link);
			}

			segment += "<td>" + product.productId + "</td>";
			segment += "<td>" + product.productName + "</td>";
			segment += "<td>" + product.price + "</td>";
			segment += "<td>" + "<input type='number' value='"+product.onStock+"' id="+product.productId+" min=1 max='"+product.onStock+"'></td>";
			segment += "<td>" + product.remarks + "</td>";
			segment += "</tr>";
			
			//1. 要怎麼用id去區分不同商品? 
					//{
				      //"productId":product.productId;
					//}
		}
		segment += "</table>";
		return segment;
	}
	let insertbutton = document.getElementById("insertbutton");
	
	insertbutton.onclick=function(){
		let onStock = document.getElementById(product.productId);
		
		console.log(onStock.value);
	}
	
	let addProduct = doucument.getElementById("addProduct");
	addProduct.onclick = function(){
		
	}
	
	
</script>
<body>
	<div id='dataArea' align='center'></div>
	
	
	<div align="center">
	<button type = "button" name="orderproduct" id = "insertbutton">送出訂單</button>
	<button type = "button" name="deleteproduct" id="deletebutton">取消訂單</button>
	<button id="addProduct">加入購物車</button>
	</div>
	
	<div align='center'>
		<a href="<c:url value='/' />">回首頁</a>
	</div>

</body>
</html>