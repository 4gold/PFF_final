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

<title>會員付款資料</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/DataTables/datatables.min.css' />" />
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/DataTables/datatables.min.js' />"></script>
<script type="text/javascript">
	window.onload = function() {
		let dataArea = document.getElementById("dataArea");

		let xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/member/showsavedpayment' />");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				dataArea.innerHTML = showSavedPayment(xhr1.responseText);
			}
		}
		let update = document.getElementById("update");

		update.onclick = function() {
			let pId = document.querySelector('input[name="ra1"]:checked').value;
			console.log(pId);
			window.open("<c:url value='/member/updatepaymentpage/"+pId+"' />",
					'_blank', config = 'height=500,width=500');

		}
		
		let addPayment = document.getElementById("addPayment");
		
		addPayment.onclick = function(){
			window.open("<c:url value='/member/addpaymentpage' />", '_blank', config = 'height=500,width=500');
		}
		
		let deletePayment = document.getElementById("deletePayment");

		deletePayment.onclick = function() {
			let pId = document.querySelector('input[name="ra1"]:checked').value;
			console.log(pId);			
			let xhr2 = new XMLHttpRequest();
			xhr2.open("DELETE", "<c:url value='/member/deletepayment/"+pId+"' />");
	        
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
                    console.log(xhr2.responseText);
                    
				}
			}
			xhr2.send(null);
			location.reload(true);
		}

	}

	function showSavedPayment(JsonString) {
		let savedpayments = JSON.parse(JsonString);
		/* 		console.log(savedpayments); */
		let segment = "";

		for (let i = 0; i < savedpayments.length; i++) {

			let savedpayment = savedpayments[i];

			segment += "<tr class='cart_item'>";
			segment += "<td><input type='radio' name='ra1' value='"+savedpayment.savedPaymentId+"' style='display: none'></td>";
			segment += "<td align='left' >" + (i + 1) + "</td>";
			segment += "<td align='left'>" + savedpayment.payerName + "</td>";
			segment += "<td align='left'>" + savedpayment.cardId + "</td>";
			segment += "<td align='left'>" + savedpayment.phone + "</td>";
			segment += "<td align='left'>" + savedpayment.email + "</td>";
			segment += "<td align='left'>" + savedpayment.address + "</td>";
			segment += "<td align='left'>" + savedpayment.shopAddress + "</td>";
			segment += "</tr>";
		}
		/* segment += "</table>"; */

		return segment;
	}
</script>
<style type="text/css">
.one {
  /* background: black; */ 
  width: 15%;
  height: 500px;
  float: left;
}

.two {
  /* background: red;  */
  width: 75%;
  margin-left: 15%;
  height: 74vh;

}
 .buttonDiv{
  padding: 0;
  margin: 0;
  margin-left: 20px;
  width: 80vw;
  height: 10px;
} 
.div1{
  margin-left:50px;
  padding:0;
  
}

</style>
</head>
<body>

<%@include file="../Top.jsp"%>
<%@include file="Sidebar.jsp"%>

   <div class="main div1">
      <div class="container  two">
<!-- 	<div class="buttonDiv">
		<button id='cancel' style='display: none;'>取消</button>
		<button id='deletePayment' style='display: none; float: right'>刪除選擇</button>
		<button id='addPayment' style='display: none; float: right'>新增付款方式</button>
	</div>	 -->
	<br>
		<div class="header-page" style="text-align:center;">
                    <h4>會員付款資料</h4>
        </div> 
         <div class="main-content">
        <div class="table-responsive">
		<table style="width: 100%; text-align: center; " class="shop-table table">
			<thead >
			 <tr>
            <td colspan=3><button id='cancel' style='display: none;'>取消</button></td>
            <td colspan=3><button id='deletePayment' style='display: none; float: right'>刪除選擇</button></td>
            <td colspan=3><button id='addPayment' style='display: none; text-align:right;'>新增付款方式</button></td>
            </tr>
				<tr>
					<th></th>
					<th>編號</th>
					<th>付款人姓名</th>
					<th>信用卡</th>
					<th>聯絡電話</th>
					<th>Email</th>
					<th>送貨地址</th>
					<th>送貨店舖</th>
				</tr>
			</thead>
			<tbody id="dataArea">
			</tbody>
			<tfoot>
			<tr>
			    <td id='edit'><button class="update-cart-btn">編輯資料</button></td>
			    <td><button id='update' style='display: none;' class="checkout-btn" >修改</button></td>
			    
			</tr>
			</tfoot>
		</table>
		</div>
		</div>
	</div>
	<br>
	
	
	

</div>


<%@include file="../Footer.jsp"%>
	<script>
 		$(document).ready(function() {
			$("table").DataTable({
				"ordering" : false, //顯示排序
				"bPaginate" : false, // 顯示換頁
				"searching" : false, // 顯示搜尋
				"info" : false, // 顯示資訊
				"fixedHeader" : true
			// 標題置頂	
			});
		}); 
		$("#edit")
				.click(
						function() {
							$(this).attr("hidden", true);
							$("input[type=radio], #deletePayment, #update, #addPayment, #cancel")
									.css('display', 'inline');

						})
		$("#cancel")
				.click(
						function() {
							$(
									"input[type=radio], #deletePayment, #update, #addPayment, #cancel")
									.css('display', 'none');
							$("#edit").attr("hidden", false);

						})				
			
	</script>
	
	
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