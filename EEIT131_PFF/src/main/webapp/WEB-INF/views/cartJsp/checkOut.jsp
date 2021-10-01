<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
<link rel="stylesheet" type="text/css" href="<c:url value='../DataTables/datatables.min.css' />" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="<c:url value='../js/jquery-3.6.0.min.js' />"></script> 
<script type="text/javascript" src="<c:url value='/DataTables/datatables.min.js' />"></script>

<link rel="shortcut icon" href="<c:url value = '/assets/images/favicon.ico' />">
<link href="<c:url value = '/assets/styles/font-awesome.min.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css'/>"  rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/pe-icon-7-stroke/css/helper.css'/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/minimal-menu.css'/> " rel="stylesheet" type="text/css" />
        <!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="assets/styles/minimal-menu-ie.css" />
        <![endif]-->
<link href="<c:url value = '/assets/styles/flat-form.css '/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/fancySelect.css'/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/jquery.fancybox.css '/>" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/allinone_bannerRotator.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/owl.carousel.css'/> " rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/owl.theme.default.min.css' />" rel="stylesheet" type="text/css" />
<link href="<c:url value = '/assets/styles/styles.css" rel="stylesheet' />"  type="text/css" />
<script src="<c:url value = '/assets/scripts/libs/prefixfree.min.js' /> "></script>
<script src="<c:url value = '/assets/scripts/libs/modernizr.js'  />"></script>
        <!--[if lt IE 9]>
        <script src="assets/scripts/libs/html5shiv.js"></script>
        <script src="assets/scripts/libs/respond.js"></script>
        <![endif]-->

</head>
<script>

window.onload = function(){
	
	var confirmOrder = document.getElementById("confirmOrder");
	var cancelOrder  = document.getElementById("cancelOrder");
	
	confirmOrder.onclick = function(){
		hasError = false;
		
// 		let fk_memberId = document.getElementById("fk_memberId").value;
		let payerNameValue = document.getElementById("payerName").value;
		let emailValue = document.getElementById("email").value;
		let phoneValue = document.getElementById("phone").value;
		let cardIdValue = document.getElementById("cardId").value;
		let addressValue = document.getElementById("address").value;
		
		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');
		var div2 = document.getElementById('result2c');
		var div3 = document.getElementById('result3c');
		var div4 = document.getElementById('result4c');
		var divResult = document.getElementById('resultMsg');
		
		
		
		if (!payerNameValue){
			setErrorFor(div0, "請輸入姓名");
   		} 	else {
      		div0.innerHTML = "";
   		}
		if (!emailValue){
			setErrorFor(div1, "請輸入E-mail");
		} else {
			div1.innerHTML = "";
		}
		if (!phoneValue){
			setErrorFor(div2, "請輸入電話");
		} else {
			div2.innerHTML = "";
		}
		if (!addressValue){
			setErrorFor(div4, "請輸入地址");
		} else {
			div4.innerHTML = "";
		}
		
		if (!cardIdValue){
			setErrorFor(div3, "請輸入信用卡");
		} else {
			div3.innerHTML = "";
		}
		
		function setErrorFor(input, message){
			input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
		    hasError = true;
		}
		
		  function isEmail(email) {
				return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
			}
		
		var orderForm = document.getElementById("orderForm");
		if(hasError==false){
			orderForm.submit();
		}
		
	}
	cancelOrder.onclick = function(cancelOrder){
		console.log(cancelOrder);
		let xhr1 =  new XMLHttpRequest();
		xhr1.open("GET","<c:url value='/cart/removeCartSession' />");
		xhr1.send();
		xhr1.onreadystatechange = function(){
				if (xhr1.readyState == 4 && xhr1.status == 200){
					console.log(xhr1.responseText);
					if(xhr1.responseText=="done"){
						window.location.href = "<c:url value='/' />";
					}
				}	
			
			}
	}
	}

</script>
<body>
<%@include file="../Top.jsp"%>
	
<div class="card">
<div align = 'center'>

<!-- <h2>付款資訊</h2> -->

</div>
<div id = 'resultMsg' align = center>
<%-- ${Cart} --%>
<%-- ${Cart[0].productId} --%>
<%-- ${Cart[0].productId} --%>
<%-- ${Cart[0].productName} --%>
<%-- ${Cart[0].quantity} --%>
<%-- ${Cart[0].discount} --%>
<h3>購物清單</h3>
<table class="table table-striped" border = '1' >
<tr>
<th align ='center'> 產品Id</th>
<th align ='center'> 產品名稱</th>
<th align ='center'> 單價</th>
<th align ='center'> 折扣</th>
<th align ='center'> 購買數量</th>
<th align ='center'> 小計</th>
</tr>
<c:forEach varStatus = "vs" var='bean' items = '${Cart}'>
<tr height='16'>

<td align ='center'>
<input id="productId" type='hidden' value='${bean.productId}' />
${bean.productId}
</td>

<td align ='center'>
<input id="productName" type='hidden' value='${bean.productName}' />
${bean.productName}
</td>

<td align ='center'>
<input id="productPrice" type='hidden' value='${bean.price}' />
<fmt:formatNumber type='number' value='${bean.price}' maxFractionDigits='0'/>
</td>

<td align ='center'>
<input id="productDiscount" type='hidden' value='${bean.discount}' />
${bean.discount}
</td>

<td align ='center'>
<input id="productQuantity" type='hidden' value='${bean.quantity}' />
${bean.quantity}
</td>
<td align ='center'>
<input id="productMoney" type='hidden' value='${bean.money}' />
${bean.money}
</td>
</tr>
</c:forEach>
</table>
<div align="right">
<th><h3>總金額</h3></th>
<th>${Cart[0].total}</th>
</div>

</div>

<div align = 'center'>
<fieldset style='display: inline-block; width: 320px;'>
<form id="orderForm" action="/PFF/cart/orderResult" method="Post">
<legend>請填入付款資訊</legend>
<table  border="1">
<tr>
<td align = 'center'>
     <select name="paymentMethod">
     <option value="cashOnDelivery">貨到付款</option>
     <option value="paypal">Paypal</option>
     </select>
</td>
<td  align = 'center'>
     <select name="shippingMethod"> 
     <option value="home">宅配到府</option>
     <option value="store">超商取貨</option>
     <option value="meet">面交</option>
     </select>
</td>
</tr>
<tr height = '50'>
<td width='300'>
	&nbsp;帳號: ${loginAccount.accountId}<input  type="hidden"  id = "fk_memberId" value = "${loginAccount.accountId}" readonly />
</td>
</tr>
<tr height = '50'>
<td width='300'>
	&nbsp;姓名:<input  type="text"  id = "payerName" name="payerName" value = "${savedPayment123.payerName}"  />
</td>
<td width='200'>
			<div id='result0c' style="height: 10px;"></div><br>
</td>
</tr>
<tr height = '50'>
<td width='300'>
	&nbsp;信箱:<input  type="text"  id = "email"  name = "email" value = "${savedPayment123.email}"  />
</td>
		<td width='200' style="vertical-align:top">
			<div id='result1c' style="height: 10px;"></div><br>
		</td>	
</tr>

<tr height = '50'>
<td width='300'>
	&nbsp;聯絡電話:<input  type="text"  id = "phone"  name="phone" value = "${savedPayment123.phone}"  />
</td>
		<td width='200' style="vertical-align:top">
			<div id='result2c' style="height: 10px;"></div><br>
		</td>	
</tr>

<tr height = '50'>
<td width='300'>
	&nbsp;信用卡號:<input  type="text"  id = "cardId"  name = "cardId" value = "${savedPayment123.cardId}"  />
</td>
		<td width='200'>
			<div id='result3c' style="height: 10px;"></div><br>
		</td>	
</tr>

<tr height = '50'>
<td width='300'>
	&nbsp;收貨地址:<input  type="text"  id = "address" name = "address" value = "${savedPayment123.address}"  />
</td>
		<td width='200'>
		<div id='result4c' style="height: 10px;"></div><br>	
		</td>
</tr>
</table>
</form>
</fieldset>

<div>
<button type = "button" class="btn btn-primary" id = "confirmOrder" onclick = 'confirmOrder()' >確認送出訂單</button>
<button type = "button" class="btn btn-dark" id = "cancelOrder" onclick = 'cancelOrder()' >取消訂單</button>
</div>
</div>

</div>
	
<%@include file="../Footer.jsp"%>

	<script src="<c:url value = '/assets/scripts/libs/jquery-1.11.2.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery-ui-1.11.4/jquery-ui.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.easing.1.3.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/bootstrap.min.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/fancySelect.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.fancybox.pack.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.ui.touch-punch.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.mousewheel.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/allinone_bannerRotator.js'/> "></script>
	<script src="<c:url value = '/assets/scripts/libs/owl.carousel.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.countdown.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/libs/jquery.mixitup.min.js'/>"></script>
	<script src="<c:url value = '/assets/scripts/functions.js'/>"></script>
	
</body>

</html>