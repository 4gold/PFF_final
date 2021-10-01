<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script> 

<link rel="shortcut icon"
	href="<c:url value='/assets/images/favicon.ico' />" />
<link href="<c:url value='/assets/styles/font-awesome.min.css' />"
	rel="stylesheet" type="text/css" />
<link
	href="<c:url value='/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/pe-icon-7-stroke/css/helper.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/minimal-menu.css' />"
	rel="stylesheet" type="text/css" />
<!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="<c:url value='assets/styles/minimal-menu-ie.css' />" />
        <![endif]-->
<link href="<c:url value='/assets/styles/flat-form.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/fancySelect.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/jquery.fancybox.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/allinone_bannerRotator.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/owl.carousel.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/owl.theme.default.min.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/styles/styles.css' />"
	rel="stylesheet" type="text/css" />
<script src="<c:url value='/assets/scripts/libs/prefixfree.min.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/modernizr.js' />"></script>
<script src="<c:url value='/js/JSOG.js' />" ></script>

<script type="text/javascript">
window.onload = function() {
	let dataArea = document.getElementById("dataArea");

	let xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "<c:url value='/member/showpurchaserecord' />");
	xhr1.send();
	xhr1.onreadystatechange = function() {
		if (xhr1.readyState == 4 && xhr1.status == 200) {
			/*console.log(xhr1.responseText); */
/* 			let orders = JSON.parse(xhr1.responseText);
			console.log(orders[0].salesOrders[0].product.productName); */
			dataArea.innerHTML = showOrders(xhr1.responseText);  
		}
	}
	

}

	

function showOrders(JsonString) {
	
	let s = "["+JsonString+"]";
	//console.log(s);
	
	let orders = JSON.parse(s);
	
	let segment = "";
	
    console.log(orders);

	for (let i = 0; i < orders.length ; i++) {

		let order = orders[i];
        let total = 0;
        let paymentMethod="";
        let orderStatus="";
        var discount = 1;
        
        //console.log(order.salesOrders.length);
         
		segment += "<tr class='cart_item'>";
		segment += "<td><button onclick='showOrderDetails("+order.orderId+")'>查看訂單明細</button></td>";
		segment += "<td align='left' >" + order.orderId + "</td>";
		segment += "<td align='left'>" + order.orderTime + "</td>";
		switch (order.paymentMethod) {
        case 'creditCard':
        	paymentMethod = "信用卡";
            break;
        case 'paypal':
        	paymentMethod = "Paypal";
            break;
        case 'cashOnDelivery':
        	paymentMethod = "貨到付款";
            break;
        default:
    	    paymentMethod = "";
    }
		segment += "<td align='left'>" + paymentMethod + "</td>";
		segment += "<td align='left'>";
 		for(let j = 0; j < order.salesOrders.length; j++){
			segment += order.salesOrders[j].product.productName+"<br>";
		} 
		segment += "</td>";
		segment += "<td align='left'>";
 		for(let j = 0; j < order.salesOrders.length; j++){
 	        try {
 	           if (typeof(order.salesOrders[j].discount) != 'undefined' && order.salesOrders[j].discount!=null){
 	           	discount=order.salesOrders[j].discount;
 	           }
 	        }catch{
 	           	 discount = 1;
 	        };
			segment += order.salesOrders[j].quantity+"<br>";
		    total = total + (order.salesOrders[j].quantity*order.salesOrders[j].product.price)*discount;
		} 
		segment += "</td>";
		segment += "<td align='left'>" + total + "</td>";
		total = 0;
		switch (order.orderStatus) {
	        case 'dealing':
	            orderStatus = "處理中";
	            break;
	        case 'checked':
	    	    orderStatus = "已確認";
	            break;
	        case 'finished':
	    	    orderStatus = "已完成";
	            break;
	        case 'cancelled':
	    	    orderStatus = "已取消";
	            break;
	    default:
	    	    orderStatus = "";
	    }
		segment += "<td align='left'>" + orderStatus + "</td>";
		segment += "</tr>";
	}

	return segment;
}

function showOrderDetails(orderId){
	window.location.replace("<c:url value='/member/orderdetailspage/"+orderId+"' />");
}


</script>

<style>
.one {
  width: 15%;
  height: 500px;
  float: left;
}

.two {
  margin-left: 20%;
  height: 200px;

}
</style>

<title>購物紀錄</title>
</head>
<body>
<%@include file="../Top.jsp"%>

<%@include file="Sidebar.jsp"%>

<div style="height: 800px;">
	<div class="main two">
		<div class="container">
			<div>

				<div class="header-page" style="text-align: center;">
					<h3>購買記錄</h3>
				</div>
				<div class="main-content">
					<div class="table-responsive">
						<table style="width: 80%; text-align: center;"
							class="shop-table table">
							<thead>
								<tr>
									<th></th>
									<th>訂單編號</th>
									<th>訂購時間</th>
									<th>付款方式</th>
									<th>商品名稱</th>
									<th>數量</th>
									<th>訂單金額</th>
									<th>處理狀態</th>
								</tr>
							</thead>
							<tbody id="dataArea">

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br>




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