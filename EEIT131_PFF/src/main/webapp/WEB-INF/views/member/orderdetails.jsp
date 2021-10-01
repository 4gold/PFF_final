<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script> 

<link rel="shortcut icon" href="<c:url value='/assets/images/favicon.ico' />" />
<link href="<c:url value='/assets/styles/font-awesome.min.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css' />"
	rel="stylesheet" type="text/css" />
<link href="<c:url value='/assets/pe-icon-7-stroke/css/helper.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/minimal-menu.css' />" rel="stylesheet"
	type="text/css" />
<!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="<c:url value='assets/styles/minimal-menu-ie.css' />" />
        <![endif]-->
<link href="<c:url value='/assets/styles/flat-form.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/fancySelect.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/jquery.fancybox.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/allinone_bannerRotator.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/owl.carousel.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/owl.theme.default.min.css' />" rel="stylesheet"
	type="text/css" />
<link href="<c:url value='/assets/styles/styles.css' />" rel="stylesheet" type="text/css" />
<script src="<c:url value='/assets/scripts/libs/prefixfree.min.js' />"></script>
<script src="<c:url value='/assets/scripts/libs/modernizr.js' />"></script>

<script type="text/javascript">
window.onload = function() {
	let dataArea = document.getElementById("dataArea");

	//從網址取要得值
	var url = location.href;
	var ary1 = url.split('/');
	var orderId = ary1[ary1.length-1];
	console.log(orderId)//網址最後的數字
	
	let xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "<c:url value='/member/showorderdetails/"+orderId+"' />");
	xhr1.send();
	xhr1.onreadystatechange = function() {
		if (xhr1.readyState == 4 && xhr1.status == 200) {
			console.log(xhr1.responseText); 
/* 			let orders = JSON.parse(xhr1.responseText);
			console.log(orders[0].salesOrders[0].product.productName); */
			let orderId_th = document.getElementById("orderId_th");
			orderId_th.innerHTML = "訂單編號為 "+orderId;
			dataArea.innerHTML = showOrders(xhr1.responseText);   
		}
	}


}

function showOrders(JsonString) {
	let order = JSON.parse(JsonString);
	/* 		console.log(savedpayments); */
	let segment = "";
	let total = 0;
	
	for(let i = 0; i < order.salesOrders.length; i++){

        
        let paymentMethod="";
        let orderStatus="";
        var discount = 1;
		
        
		segment += "<tr class='cart_item'>";
		segment += "<td align='left'>"+order.salesOrders[i].product.productName+ "</td>";
		
		segment += "<td align='left'>"+order.salesOrders[i].product.price+ "</td>";
		
		segment += "<td align='left'>";
 		
		segment += order.salesOrders[i].quantity+"<br>";

		 
		segment += "</td>";
	    try {
	 	     if (typeof(order.salesOrders[i].discount) != 'undefined' && order.salesOrders[i].discount!=null){
	 	         discount=order.salesOrders[i].discount;
	 	     }
	 	}catch{
	 	      discount = 1;
	 	};
		
		segment += "<td align='left'>"+discount+ "</td>";
		segment += "<td align='left'>" + (order.salesOrders[i].quantity*order.salesOrders[i].product.price)*discount + "</td>";
		
		total = total + (order.salesOrders[i].quantity*order.salesOrders[i].product.price)*discount;
		
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
		segment += "<td align='left'>" + order.remarks + "</td>";
		segment += "</tr>";
		
	
	}
    segment += "<tr><td align='left'> 訂單總額：" + total + "</td></tr>";
	return segment;
    
}

function showOrderDetails(orderId){
	window.location.replace("<c:url value='/member/orderdetailspage/"+orderId+"' />");
}


</script>
<title>訂單明細</title>

</head>
<body>
	<div class="main" >
		<div class="container">
			<a href="<c:url value='/member/purchaserecordpage'/>"><button>回上一頁</button></a>
			<div>

				<div class="header-page" style="text-align: center;">
					<h3>購買記錄</h3>
				</div>
				<div class="main-content">
				   <!-- 訂單資料表格 -->
					<div class="table-responsive">
						<table style="width: 100%; text-align: center;"
							class="shop-table table">
							<thead>
							<tr><th id="orderId_th" style="border:0"></th></tr>
								<tr>
								    
									<th>商品名稱</th>
									<th>單價</th>
									<th>數量</th>
									<th>折扣</th>
									<th>商品總額</th>
									<th>處理狀態</th>
									<th>其他</th>
								</tr>
							</thead>
							<tbody id="dataArea">
							
							</tbody>
							
						</table>
					</div>
					<!-- 訂單資料表格結束 -->
					<!-- 付款資訊 -->
					
					<!-- 付款資訊結束 -->
				</div>
			</div>
			<br>




		</div>
	</div>
</body>
</html>