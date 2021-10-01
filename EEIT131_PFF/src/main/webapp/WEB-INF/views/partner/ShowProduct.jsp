<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/DataTables/datatables.min.css' />" />

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
<title>商品管理</title>
<script>
window.onload = function(){
	var detail = document.getElementById('detail');
	let dataArea = document.getElementById("dataArea");
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/partner/allProduct' />");
	xhr.send();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			dataArea.innerHTML = processProductData(xhr.responseText);
		}
	}
			
	let selectElement = document.getElementById("product");
    selectElement.onchange = function(){
    	let xhr2 = new XMLHttpRequest();
		xhr2.onreadystatechange = function() {
			if (xhr2.readyState == 4 && xhr2.status == 200) {
				console.log(xhr2.responseText);
				displayPageproducts(xhr2.responseText);    
			}
		}
		
		var productId = selectElement.options[ selectElement.selectedIndex ].value;
		
		xhr2.open("GET", "<c:url value='/partner/saleProduct' />" + "?onSale=" + productId, true);
		
		xhr2.send();
		
		
	}
	//價格排序
	var selectPriceElement = document.getElementById("priceid");
	selectPriceElement.onchange = function(){
		var priceid = selectPriceElement.options[ selectPriceElement.selectedIndex ].value;
		if(priceid=="lowTohigh"){
			console.log(priceid);
		     let xhr2 = new XMLHttpRequest();
			  xhr2.open("GET", "<c:url value='/priceProductUp' />");
			  xhr2.send();
			  xhr2.onreadystatechange = function() {
				   if (xhr2.readyState == 4 && xhr2.status == 200) {
				    console.log(xhr2.responseText);
				    dataArea.innerHTML=processProductData(xhr2.responseText);    //原本displayPageBooks(xhr2.responseText); 
				   }
				  }
		}else if(priceid=="highTolow"){
			console.log(priceid);
			 let xhr4 = new XMLHttpRequest();
			 xhr4.open("GET", "<c:url value='/priceProductDown' />");
			 xhr4.send();
			 xhr4.onreadystatechange = function() {
				   if (xhr4.readyState == 4 && xhr4.status == 200) {
				    console.log(xhr4.responseText);
				    dataArea.innerHTML=processProductData(xhr4.responseText);    //原本displayPageBooks(xhr2.responseText); 
				   }
				  }
		}

	}	
	
	//庫存排序
	var selectOnstockElement = document.getElementById("onStockid");
	selectOnstockElement.onchange = function(){
		var onStockid = selectOnstockElement.options[ selectOnstockElement.selectedIndex ].value;
		if(onStockid=="lowTohigh"){
			console.log(onStockid);
		     let xhr2 = new XMLHttpRequest();
			  xhr2.open("GET", "<c:url value='/onStockProductUp' />");
			  xhr2.send();
			  xhr2.onreadystatechange = function() {
				   if (xhr2.readyState == 4 && xhr2.status == 200) {
				    console.log(xhr2.responseText);
				    dataArea.innerHTML=processProductData(xhr2.responseText);    //原本displayPageBooks(xhr2.responseText); 
				   }
				  }
		}else if(onStockid=="highTolow"){
			console.log(onStockid);
			 let xhr4 = new XMLHttpRequest();
			 xhr4.open("GET", "<c:url value='/onStockProductDown' />");
			 xhr4.send();
			 xhr4.onreadystatechange = function() {
				   if (xhr4.readyState == 4 && xhr4.status == 200) {
				    console.log(xhr4.responseText);
				    dataArea.innerHTML=processProductData(xhr4.responseText);    //原本displayPageBooks(xhr2.responseText); 
				   }
				  }
		}

	}	
}



function processProductData(jsonString){
	let products = JSON.parse(jsonString);	
    console.log(products);
    let selectElement = document.getElementById("product");
    var isOnSale = selectElement.options[ selectElement.selectedIndex ].value;
	let segment = "";
	//segment += "<tr><th colspan='11'>商品資料列表</th></tr>";
	//segment += "<tr><th>商品編號</th><th>產品名稱</th><th>產品分類</th><th>庫存量</th><th>金額</th><th>熱量</th><th>商品內容</th><th>商品敘述</th><th>上下架狀態</th><th>商品圖片</th></tr>";
	for(let n = 0 ; n < products.length; n++){
		console.log(n+ " is "+ products[n].onSale);

		if( products[n].onSale.trim() != isOnSale){
			continue;
		}
		let product = products[n];
		console.log(product.ingredients);
		segment += "<tr>";
		 
		let link = "<a href='" + "<c:url value='/partner/product/" + product.productId + "' />'>" + product.productId + "</a>";
		if (n == 0) {
		   console.log(link);
		}
		segment += "<td>" + link + "</td>";
		segment += "<td>" + product.productName + "</td>";
		segment += "<td>" + product.productType + "</td>";
		segment += "<td>" + product.onStock + "</td>";
		segment += "<td>" + product.price + "</td>";
		segment += "<td>" + product.calories + "</td>";
		segment += "<td>" + product.ingredients + "</td>";
		segment += "<td>" + product.remarks + "</td>";
		segment += "<td>" + product.onSale + "</td>";	
		segment += "<td><img src=<c:url value='/partner/getCoverImage' />?productId="
				+ product.productId
				+ " style='width:50px;height:50px;'/></td>";
		segment += "</tr>";
	}
	segment += "</table>";
	return segment;
}
    		
		function displayPageproducts(responseText){
			var products =  JSON.parse(responseText);
			var onSale = "";
			
			var imageURL = ("GET", "<c:url value='/partner/getCoverImage' />");
			var content ="";
			//content += "<tr><th>商品編號</th><th>產品名稱</th><th>產品分類</th><th>庫存量</th><th>金額</th><th>熱量</th><th>商品內容</th><th>商品敘述</th><th>上下架狀態</th><th>商品圖片</th></tr>";;
			for(var i=0; i < products.length; i++){

				if(products[0].onSale=='true'){
					onSale = '上架';
				}else{
					onSale = '下架';
				}
				let link = "<a href='" + "<c:url value='/partner/product/" + products[i].productId + "' />'>" + products[i].productId + "</a>";
				if (i == 0) {
				   console.log(link);
				}

				content += "<tr><td align='center'>" + link + "</td>" + 
				           "<td >" + products[i].productName + "</td>" +
				           "<td >" + products[i].productType + "</td>" +
				           "<td>" + products[i].onStock + "</td>" +
				           "<td align='right'>" + products[i].price + "</td>" +
				           "<td align='center'>" + products[i].calories + "</td>" +
				           "<td align='center'>" + products[i].ingredients + "</td>" +
				           "<td align='center'>" + products[i].remarks + "</td>" +
 				           "<td align='center'>" + products[i].onSale + "</td>";
 				          
 				try{
 					content += "<td><img  width='40' height='48' " +   
			           " src='" + imageURL + "?productId="+products[i].productId + "' /></td></tr>";	
 				}catch{

	
 				}

			
			}
			content += "</table>";
			dataArea.innerHTML = content;
			detail.innerHTML = onSale + "中目前共有" + (products.length) + "種商品";
		}		
		
		//SEARCH搜尋
		function search(){
			let keyword = document.getElementById("keyword").value;
			
			//console.log(keyword);
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/keywordsearch' />?keyword="+keyword);
			xhr.send();
			
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					console.log(xhr.responseText);
					dataArea.innerHTML = processProductData(xhr.responseText);    //原本displayPageBooks(xhr2.responseText); 
				}
			}
		}
		
		
</script>
<style>
   table{
   border: 1px black solid;
   display: block;
   overflow-x: auto;
   
   }
   th{
   text-align: center;
   }
   td{
   font-size:10px;
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
 
                                   
   <div id='detail'></div>
   <div class="main">
   <div class="container">
   <div class="row">
   <div class="col-md-22">
   <div class="main-content">
   <div class="list-posts">
   <div class="post-item">
      <h3 class="post-title" >產品管理</h3>
   <div>
         
      <a class="btn btn-info btn-icon-split">
      <span class="icon text-white-50">
      <i class="fas fa-info-circle"></i>
      </span>
      <span class="text">產品狀態:</span>
      <select id='product'>
          <option value='true'> 上架 </option>
          <option value='false'> 下架 </option>
       </select>
       </a>
            
            
      <a class="btn btn-secondary btn-icon-split">
      <span class="icon text-white-50">
      <i class=""></i>
      </span>
      <span class="text">價位高低:</span>
      <select id='priceid'>
          <option value='lowTohigh'>從低到高</option>
          <option value='highTolow'>從高到低</option>
       </select>
       </a>
       	  <a class="btn btn-danger btn-icon-split">
      <span class="icon text-white-50">
      <i class=""></i>
      </span>
      <span class="text">庫存高低:</span>
      <select id='onStockid'>
          <option value='lowTohigh'>從低到高</option>
          <option value='highTolow'>從高到低</option>
       </select>
       </a>     
         
            
      <a class="btn btn-secondary btn-icon-split">
      <span class="icon text-white-50">
      <i class="fas fa-flag"></i>
      </span>
      <span class="text">搜尋:</span>
            <input type="text" name="keyword" id='keyword' required />
            <input type="button" value="Search" onclick='search()'/>
      </a>     
            <!--            新增產品    -->
    
     <a href='<c:url value="/partner/addproduct" />' class="btn btn-success btn-icon-split">
      <span class="icon text-white-80">
      <i class="fas fa-check"></i>
      </span>
      <span class="text">新增產品</span>
      </a>
      

      </div>
      
        &nbsp;
      <table class="table table-bordered" id="dataTable" width="100%"
         cellspacing="0">
         <thead>
           	<tr><th colspan='11'>商品資料列表</th></tr>
	       <tr><th>商品編號</th><th>產品名稱</th><th>產品分類</th><th>庫存量</th><th>金額</th><th>熱量</th><th>商品內容</th><th width='100px'>商品敘述</th><th>上下架狀態</th><th>商品圖片</th></tr>
            
         </thead>
         <tbody id="dataArea">
         </tbody>
      </table>
   </div>
   <div align='center'></div>
   <a href="<c:url value='/partner/partner' />">回前頁</a>
   
   
   <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">銷售圖表Earnings Overview</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">商品分類Revenue Sources</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> 豬肉類
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> 牛肉類
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> 雞肉類
                                        </span>
                                    </div>
                                </div>
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
   
   <script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
   <script type="text/javascript"
	src="<c:url value='/DataTables/datatables.min.js' />"></script>
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