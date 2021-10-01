<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShoppingCart</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/DataTables/datatables.min.css' />" />
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script> 
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

// console.log("cklist=");
// console.log(${cookieProductList}[0]==null);
// console.log("-----------------");

window.onload = function(){
	
	//console.log('${discountList}');
	
	var sendData = document.getElementById("sendData");
	
	sendData.onclick=function(){
		var cartvos=[];	
        let i=0;
        while(document.getElementById("productId"+i)!=null){	
		let Id_name = "productId"+i;
		let Name_name = "productName"+i;
		let price_name = "price"+i;
		let dc_name = "discount"+i;
		let qy_name = "quantity"+i;
		let money_name = "money"+i;

		console.log(Id_name);
		
		let productId = document.getElementById(Id_name).value;
		let productName = document.getElementById(Name_name).value;
		let price = document.getElementById(price_name).value;
		let discount = document.getElementById(dc_name).value;
		let quantity = document.getElementById(qy_name).value;
    let money = document.getElementById(money_name).value;

		let total = caculateTotal();
	    
		let jsonString=
		{
				"productId":productId,
				"productName":productName,
				"price":price,
				"discount":discount,
				"quantity":quantity,
				"money":money,
				"total":total
		};
		cartvos.push(jsonString);
        i++;
        }
        
        if('${loginAccount}' == ""){
        	if(window.confirm("您尚未登入")){
        		window.location.href = "<c:url value='/memberloginpage' />";
        		return;
        	}
        }
        
        
		let xhr =  new XMLHttpRequest();
		let url = "<c:url value='/cart/cartProductPage'/>";
		console.log(url);
		xhr.open("POST","<c:url value='/cart/sendorder' />");
		xhr.setRequestHeader("Content-Type", "application/json");//請求標頭
		console.log(cartvos);
		xhr.send(JSON.stringify(cartvos));
		xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status == 200){
					console.log(xhr.responseText);
					if(xhr.responseText=="done"){
						window.location.href = "<c:url value='/cart/paymentPage' />";
					}
				}	
			
			}	
	}
	
}		

function deletecookie(productId){
	console.log(productId);
	let xhr1 =  new XMLHttpRequest();
	xhr1.open("GET","<c:url value='/cart/deleteProduct' />?deleteProductId="+productId);
	xhr1.send();
	xhr1.onreadystatechange = function(){
			if (xhr1.readyState == 4 && xhr1.status == 200){
				console.log(xhr1.responseText);
				if(xhr1.responseText=="done"){
					window.location.href = "<c:url value='/cart/cartProductPage' />";
				}
			}	
		
		}
	
	
}

</script>
<body>
<%@include file="../Top.jsp"%>

<div align = 'center'>
<h2>購物車</h2>
<hr>
<table class="table table-striped" border = '1'  id = "mytab1">
<tr>
<th>產品Id</th>
<th>產品名稱</th>
<th>庫存</th>
<th>價格</th>
<th>熱量</th>
<th>折扣</th>
<th>修改數量</th>
<th>小計</th>
<th>取消商品</th>
</tr>
<c:if test = "${not empty cookieProductList && cookieProductList[0]!=null}">
<c:forEach varStatus = "vs" var='cookieProduct' items = '${cookieProductList}'>
<tr class="cart_item" height='50'>

<td>
<input id="productId${vs.index}" type='hidden' value='${cookieProduct.productId}' />
${cookieProduct.productId}</td>
<td>
<input id="productName${vs.index}" type='hidden' value='${cookieProduct.productName}' />
${cookieProduct.productName}</td>

<td>
<input id="onStock${vs.index}" type='hidden' value='${cookieProduct.onStock}' />
${cookieProduct.onStock}</td>
<td>
<input id="price${vs.index}" type='hidden' value="${cookieProduct.price}" />
<fmt:formatNumber type='number' value='${cookieProduct.price}' maxFractionDigits='0'/></td>
<td>
<input id="calories${vs.index}" type='hidden' value='${cookieProduct.calories}' />
${cookieProduct.calories}</td>
<td>
<input id="discount${vs.index}" type='hidden' value='${discountList[vs.index]}' /> 
${discountList[vs.index]}</td>

<td>
<button id="subtract${vs.index}" class="minus-btn" onclick='subtractfunction(${vs.index})' ><i class="fa fa-minus"></i></button>
<input  type="text" id="quantity${vs.index}" value="1" min = "1" readonly/>
<button type ='button' id="plus${vs.index}" onclick="plusfunction(${vs.index})" ><i class="fa fa-plus"></i></button>
			
</td>
<td>
<input name='money' type="number" id="money${vs.index}"  min = "0"  readonly value="<fmt:formatNumber type='number' value=' ${cookieProduct.price*discountList[vs.index]}' maxFractionDigits='0'/>"/></td><!--這裡單一金額-小記 -->
 <td>
 <button type = "button" name="deletecookie" id="deletecookie" onclick='deletecookie(${cookieProduct.productId})' class="btn btn-danger">刪除</button>
 </td><!-- 如何刪除COOKIE -->
</tr>
</c:forEach>
</c:if>
<tr>
<td id='total'></td>
<td></td>

</tr>
</table>
<hr>
</div>

	
<div align='center'>
<button id="sendData" class="btn btn-success">確認結帳</button>
</div>
<div align='center'>
<a href="<c:url value='/' />">回首頁</a>
</div>
<script type="text/javascript">
function plusfunction(index){
	
	//console.log(index);
	
	let plusQuantityName = "quantity"+index;
	let plusPriceName = "price"+index;
	
	let discount = ${discountList}[index];
	//console.log(${discountList}[index]);
	let i = document.getElementById(plusQuantityName).value;
	let price = document.getElementById(plusPriceName).value;
	
	
	i++;
	document.getElementById(plusQuantityName).value = i;
	document.getElementById("money"+index).value = i*price*discount;
	
	caculateTotal();
}

function subtractfunction(index){
	
	//console.log(index);
	
	let subtractQuantityName = "quantity"+index;
	let subtractPriceName = "price"+index;
	
	let discount = ${discountList}[index];
	//console.log(${discountList}[index]);
	let i = document.getElementById(subtractQuantityName).value;
	let price = document.getElementById(subtractPriceName).value;
	
	i--;
	
	if((i-1)>=0){
	document.getElementById(subtractQuantityName).value = i;
	document.getElementById("money"+index).value = i*price*discount;
	caculateTotal();
	};

}

function caculateTotal(){
	let total=0;
    //console.log(${cookieProductList.size()});
    for(let i=0; i < ${cookieProductList.size()}; i++){
    	let idname = "money"+i;
    	let moneyValue = document.getElementById(idname).value;
    	total += parseInt(moneyValue);
    	//console.log(typeof(total));

    }
	$("#total").html("總金額: "+total);//抓取total的值然後印在網也上
	return total;
}


</script>

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