<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='../DataTables/datatables.min.css' />" />
<script src="<c:url value='../js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='../DataTables/datatables.min.js' />"></script>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css' />"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link href="<c:url value='/css/sb-admin-2.min.css' />" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<title>修改商品</title>
<script>
let sid = "${idid}";
let productId  = 0;
window.onload = function() {
	var divResult   = document.getElementById('resultMsg');
	let productName = document.getElementById("productName");
	let productType = document.getElementById("productType");
	let onStock     = document.getElementById("onStock");
	let price       = document.getElementById("price");
	let calories 	= document.getElementById("calories");
	let ingredients = document.getElementById("ingredients");
	let remarks     = document.getElementById("remarks");
	let onSale      = document.getElementById("onSale");
    
	var fileDataURL='';
	if(!fileDataURL){
		console.log("no pic"+fileDataURL);
	}
	
	let xhr = new XMLHttpRequest();
	
	xhr.open("GET", "<c:url value='/partner/product?productId="+sid+"'/>");
	
	xhr.send();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			
			let product       = JSON.parse(xhr.responseText);
			console.log(product.productName);
			productName.value = product.productName;
			productType.value = product.productType;
			onStock.value 	  = product.onStock;
			price.value 	  = product.price;
			calories.value    = product.calories;
			ingredients.value = product.ingredients;
			remarks.value 	  = product.remarks;
			onSale.value   	  = product.onSale;
			
		
			
			productId = product.productId;
		}
	}
	
	inputFileToLoad.addEventListener('change',loadImageFileAsURL);
	
 	function loadImageFileAsURL(){
 		let filesSelected = document.getElementById("inputFileToLoad").files;
 		if(filesSelected.length>0){
 		    let fileToLoad = filesSelected[0];
			let fileReader = new FileReader();
			fileReader.onload = function(fileLoadedEvent){
				fileDataURL = fileLoadedEvent.target.result;
				showing.src = fileLoadedEvent.target.result;
				console.log(fileDataURL);
			};
			fileReader.readAsDataURL(fileToLoad);
			showing.style.display='block';
			showing.style.width='100px';
			showing.style.height='100px';
		}else{
			fileDataURL=null;
			console.log('未選擇檔案');
		}
}

	let sendData = document.getElementById("sendData");
	
	sendData.onclick = function(){
		let productNameValue  = document.getElementById("productName").value;
		let productTypeValue  = document.getElementById("productType").value;
		let onStockValue      = document.getElementById("onStock").value;
		let priceValue        = document.getElementById("price").value;
		let caloriesValue     = document.getElementById("calories").value;
		let ingredientsValue  = document.getElementById("ingredients").value;
		let remarksValue      = document.getElementById("remarks").value;
		let onSaleValue       = document.getElementById("onSale").value;
	
		
		let obj = {
		   "productId"  : productId,
		   "productName": productNameValue,
           "productType": productTypeValue,
		   "onStock"    : onStockValue,
		   "price"      : priceValue,
		   "calories"   : caloriesValue,
		   "ingredients": ingredientsValue,
		   "remarks"    : remarksValue,
		   "onSale"     : onSaleValue,
		   "fileDataURL"     : fileDataURL
		 
		};
		let xhr2 = new XMLHttpRequest();
		let url = "<c:url value='/partner/updateproduct/'  />" + productId;
		console.log(url);
		xhr2.open("PUT", url);
		xhr2.setRequestHeader("Content-Type", "application/json");
		xhr2.send(JSON.stringify(obj));
		xhr2.onreadystatechange = function(){
			if (xhr2.readyState == 4 && xhr2.status == 200){
				let result 		= JSON.parse(xhr2.responseText);
				if (result.fail) {
			 		  divResult.innerHTML = "<font color='red' >"
						+ result.fail + "</font>";
		  		} else if (result.success) {
					divResult.innerHTML = "<font color='GREEN'>"
						+ result.success + "</font>";
		  		}
				
			}
		}  
		

		
	}
	
}
</script>
<style>
     table{
   border: 0;
   display: block;
   overflow-x: auto;
   
   }
   th{
   text-align: center;
   }
   td{
   font-size:15px;
   }
</style>
</head>
<body id="page-top">
   <div id="wrapper">
   <ul
      class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
      id="accordionSidebar">
      <a
         class="sidebar-brand d-flex align-items-center justify-content-center"
         href="/PFF">
         <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
         </div>
         <div class="sidebar-brand-text mx-3">金蓮孕動中心</div>
      </a>
      <!-- Divider -->
      <hr class="sidebar-divider">
      <!-- Heading -->
      <div class="sidebar-heading">
         <h6>控制台</h6>
      </div>
      <!-- 左邊拉條活動管理選單 -->
      <li class="nav-item">
         <a class="nav-link collapsed"
            data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo"> <i
            class="fas fa-fw fa-cog"></i> <span>商品管理</span>
         </a>
         <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <h6 class="collapse-header">商品資料管理:</h6>
               <a class="collapse-item"
                  href="<c:url value='/partner/allProductpage' />">商品資料管理</a>
               <a class="collapse-item"
                  href="<c:url value='/partner/addproduct' />">新增商品資料</a> <a
                  class="collapse-item"
                  href="<c:url value='/partner/product/1005'  />">修改商品資料</a>
            </div>
         </div>
      </li>
      <!-- 左邊拉條會員管理選單 -->
      <li class="nav-item">
         <a class="nav-link collapsed"
            data-toggle="collapse" data-target="#collapseUtilities"
            aria-expanded="true" aria-controls="collapseUtilities"> <i
            class="fas fa-fw fa-wrench"></i> <span>企業會員管理</span>
         </a>
         <div id="collapseUtilities" class="collapse"
            aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <h6 class="collapse-header">企業會員資料管理:</h6>
               <a class="collapse-item"
                  href="<c:url value='/partner/inquire'  />">會員資料查詢</a> <a
                  class="collapse-item" href="<c:url value='/partner/revisePartnerPage'  />">會員資料修改</a>
            </div>
         </div>
      </li>
      <!-- 左邊拉條廠商管理選單 -->
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
         <a class="nav-link collapsed"
            data-toggle="collapse" data-target="#collapsePages"
            aria-expanded="true" aria-controls="collapsePages"> <i
            class="fas fa-fw fa-folder"></i> <span>訂單管理</span>
         </a>
         <div id="collapsePages" class="collapse"
            aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
               <h6 class="collapse-header">訂單資料管理:</h6>
               <a class="collapse-item"
                  href="<c:url value='/partner/orderdetails'  />">訂單資料列表</a> 
                  
                  
           
                
            </div>
         </div>
      </li>
   </ul>
   <div id="content-wrapper" class="d-flex flex-column" style=background-image:url(../images/bb333.jpg)>
   <nav
      class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
      <!-- Sidebar Toggle (Topbar) -->
      <a href="<c:url value='/partner/partner' />"
         class="btn btn-warning btn-icon-split"> <span
         class="icon text-white-50"> <i class="fas fa-arrow-right"></i>
      </span> <span class="text">回到企業管理頁面</span>
      </a>
      <button id="sidebarToggleTop"
         class="btn btn-link d-md-none rounded-circle mr-3">
      <i class="fa fa-bars"></i>
      </button>
      <ul class="navbar-nav ml-auto">
         <li class="nav-item dropdown no-arrow">
            <!-- Nav Item - User Information --> <a
               class="nav-link dropdown-toggle" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="mr-2 d-none d-lg-inline text-gray-600 small">廠商</span>
            <img class="img-profile rounded-circle"
               src="<c:url value='/images/undraw_profile.svg' />">
            </a>
            <div
               class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
               aria-labelledby="userDropdown">
               <a class="dropdown-item" href="<c:url value='/partnerlogin'/>">
               <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 登出
               </a>
            </div>
         </li>
      </ul>
   </nav>
   
   <div>
</head>
<body>
<div align='center' >
<h3>商品資料</h3>
<hr>

<div id='resultMsg' style="height: 18px; font-weight: bold; border:'0';"></div>
	<br>
	<fieldset style='display:block; width: 820px;'> 
	<legend>修改下列資料</legend>
	 <table class="" id="dataTable" width="100%"
         cellspacing="0" border="0" style="margin-left:50px;">
         <thead>
         
	       
            
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td>
			&nbsp;商品名稱: </td><td><input type="text" name="productName" id='productName'><br>
			<div style='font-size: 10pt; text-align: center;'>
<!--    				<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查帳號</a> -->
			</div>
		</td>
		<td width='200'>
			<div id='result0c' style="height: 10px;"></div><br>
			<div id='result0s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td >
			&nbsp;商品分類: </td><td><input type="text" name="productType" id='productType'><br>
		</td>
		<td width='200' style="vertical-align:top">
			<div id='result1c' style="height: 10px;"></div><br>
			<div id='result1s' style="height: 10px;"></div>
		</td>	
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td>
			&nbsp;庫存量: </td><td><input type="text" name="onStock" id='onStock'><br>
		</td>
		<td width='200' style="vertical-align:top">
			<div id='result1c' style="height: 10px;"></div><br>
			<div id='result1s' style="height: 10px;"></div>
		</td>	
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td >
			&nbsp;金額: </td><td><input type="text" name="price" id='price'><br>
		</td>
		<td width='200' style="vertical-align:top">
			<div id='result2c' style="height: 10px;"></div><br>
			<div id='result2s' style="height: 10px;"></div>
		</td>	
	</tr>
	<tr height='60'>		
		<td width='200'>&nbsp;</td>
		<td >
			&nbsp;熱量: </td><td><input type="text" name="calories" id='calories'>
		</td>	
		<td width='200'>
			<div id='result3c' style="height: 10px;"></div><br>
			<div id='result3s' style="height: 10px;"></div>			
		</td>	
	</tr>
		<tr height='60'>		
		<td width='200'>&nbsp;</td>
		<td >
			&nbsp;商品內容: </td><td><input type="text" name="ingredients" id='ingredients'>
		</td>	
		<td width='200'>
			<div id='result3c' style="height: 10px;"></div><br>
			<div id='result3s' style="height: 10px;"></div>			
		</td>	
	</tr>
			<tr height='60'>		
		<td width='200'>&nbsp;</td>
		<td >
			&nbsp;商品敘述: </td><td><input type="text" name="remarks" id='remarks'>
		</td>	
		<td width='200'>
			<div id='result3c' style="height: 10px;"></div><br>
			<div id='result3s' style="height: 10px;"></div>			
		</td>	
	</tr>
			<tr height='60'>		
		<td width='200'>&nbsp;</td>
		<td >
		&nbsp;上下架狀態: <td ><select  name="onSale" id='onSale'><br> 
		
                          <option value='true'>上架</option>
                           <option value='false'>下架</option>
                           </select></td>
		</td>	
		<td width='200'>
			<div id='result3c' style="height: 10px;"></div><br>
			<div id='result3s' style="height: 10px;"></div>			
		</td>	
	</tr>
	
          <tr height='60'>
					<td width='200'>&nbsp;</td>
					<td>&nbsp;圖片 : </td><td><input type="file" name="content"
						id='inputFileToLoad'><br> <img id="showing" src="" /><br>
					</td>
					<td width='200'>&nbsp;</td>
				</tr>
				<tr height='50'>
				<td width='200' colspan='3' align='center'>
<!-- 					<button type="submit" id='sendData'>新增</button> -->
					</td>
				</tr>
	
	<tr height='50'>		
		<td colspan='3' align='center'><button id='sendData'>送出</button></td>
	</tr>		
	
			</table>
		</fieldset>
	<hr>	
	<p>	
	<a href="<c:url value='/partner/partner'  />">回前頁</a>
<hr>
</div>
</body>
</div>
</div>
</div>


<script src="<c:url value='/vendor/jquery/jquery.min.js' />"></script>
	<script
		src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js' />"></script>

	<!-- Custom scripts for all pages-->
	<script src="<c:url value='/js/sb-admin-2.min.js' />"></script>

	<!-- Page level plugins -->
	<script src="<c:url value='/vendor/chart.js/Chart.min.js' />"></script>

	<!-- Page level custom scripts -->
	<script src="<c:url value='/js/demo/chart-area-demo.js' />"></script>
	<script src="<c:url value='/js/demo/chart-pie-demo.js' />"></script>

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
	}); </script>
</body>
</html>