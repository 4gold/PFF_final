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

<title>新增商品</title>
<script>
window.onload=function(){
	var divResult = document.getElementById('resultMsg');
	var sendData=document.getElementById('sendData');
// 	var fileDataURL=document.getElementById('inputFileToLoad');
	inputFileToLoad.addEventListener('change',loadImageFileAsURL);
	var fileDataURL='';
// 	loadImageFileAsURL();
	if(!fileDataURL){
		console.log("no pic"+fileDataURL);
	}
	
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
	
	sendData.onclick=function(){
		//讀欄位資料
		var nameValue = document.getElementById("name").value;
		var priceValue = document.getElementById("price").value;
		var typeValue = document.getElementById("type").value;
		var caloriesValue = document.getElementById("calories").value;
		var ingredientsValue = document.getElementById("ingredients").value;
		var remarksValue = document.getElementById("remarks").value;
		var onSaleValue = document.getElementById("onSale").value;
		var onStockValue = document.getElementById("onStock").value;
// 		var fileDataURL = document.getElementById("inputFileToLoad").value;
// 		loadImageFileAsURL();
// 		if(!fileDataURL){
// 			console.log("no pic"+fileDataURL);
// 		}
		
		console.log(nameValue);
		console.log(priceValue);
		console.log(typeValue);
		console.log(fileDataURL);
if(fileDataURL==null || fileDataURL==''){
	alert("請選擇檔案");
	return ;
}
		var xhr1 = new XMLHttpRequest();
		
		xhr1.open("POST","<c:url value='/partner/addproductpage' />",true);
		var jsonProduct ={
				"productName":nameValue,
				"price":priceValue,
				"productType":typeValue,
				"onSale":onSaleValue,
				"calories":caloriesValue,
				"ingredients":ingredientsValue,
				"remarks":remarksValue,
				"onStock":onStockValue,
				"fileDataURL":fileDataURL
		}
		console.log(jsonProduct);
		xhr1.setRequestHeader("Content-Type","application/json");
		xhr1.send(JSON.stringify(jsonProduct));
		xhr1.onreadystatechange = function(){
			if(xhr1.readyState==4&&xhr1.status==200){
				 result = JSON.parse(xhr1.responseText);
			   if(result.fail==null){
				   divResult.innerHTML="<font color='GREEN'>"
					   +"新增成功"+"</font>";
			   }else{
				   divResult.innerHTML="<font color='red'>"
					   +result.fail+"</font>";
			   }
			}
		}
	}
}
//一鍵輸入
window.addEventListener('keydown', function(e){
	//讀欄位資料
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var type = document.getElementById("type").value;
	var calories = document.getElementById("calories");
	var ingredients = document.getElementById("ingredients");
	var remarks = document.getElementById("remarks");
	var onSale = document.getElementById("onSale");
	var onStock = document.getElementById("onStock");
	//取到按下的按鈕
    console.log(e.key);
    //指定按哪個鈕要把東西輸入
    if(e.key=="k"){
    	name.value = "豬肉滿福堡";
    	price.value= "100";
    	/* type.value = "豬肉"; */
    	$("option[value='pork']").attr("selected", true);
    	//console.log($("option[value='pork']"));
    	calories.value = "190";
    	ingredients.value = "豬肉、蔬菜、麵包";
    	remarks.value = "美味好吃香甜可口";
    	//onSale.value  = "true";
    	$("option[value='true']").attr("selected", true);
    	onStock.value ="100";
    	
    }
 });
</script>


<style>

    table{
    display: block;
    overflow-x: auto;
    
    }
    th{
    text-align: center;
    }
    td{
    font-size:10px;
    }
    label{
    font-size:18px;
    }
    input{
    width: 250px;
    height: 30px;
    }
    select{
    width: 250px;
    color: gray;
    font-size: 15px;
    text-align-last:center;
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
     
                        
   
   <div class="main">
   <div class="container">
   <div class="row">
   <div class="col-md-20">
   <div class="main-content">
   <div class="list-posts">
   <div class="post-item">
      <h3 class="post-title" style="margin-left: 34vw">新增產品</h3>
   


<div align='center' style='margin-left:10vw;'>
<fieldset  style='display:inline-block;  text-align:left; '>
<!-- <form enctype="multipart/form-data"> -->


<div id='resultMsg' style="height: 18px; font-weight: bold; margin-left: 26vw;"></div>
<br>
  <table class="" id="dataTable" width="100%"
          cellspacing="0" style="margin-left: 16vw;">
         
 
<tr><td colspan='3' style="text-align:center;"><legend>新增下列產品</legend></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td width='100px'><label><b>產品名稱 :</b></label></td><td><input type='text' name='name' id='name'></input></td></tr>
<tr><td><label><b>產品價格 :</b></label></td><td><input type='text' name='price' id='price'></input></td></tr>

<tr><td><label><b>產品類別 :</b></label ></td><td><select id='type'>
                           <option value='beef'>牛肉</option>
                           <option value='pork'>豬肉</option>
                           <option value='vegetable'>素食</option>
                           </select><br></td></tr>

<tr><td><label><b>熱量 :</b></label></td><td><input type='text' name='type' id='calories'></input><br></td></tr>
<tr><td><label><b>原料 :</b></label></td><td><input type='text' name='type' id='ingredients'></input><br></td></tr>
<tr><td><label><b>說明 :</b></label></td><td><input type='text' name='type' id='remarks'></input><br></td></tr>
<tr><td><label><b>上架 :</b></label></td><td><select id='onSale'>
                           <option value='true'>上架</option>
                           <option value='false'>下架</option>
                           </select><br></td></tr>
<tr><td><label><b>數量 :</b></label></td><td><input type='number' name='type' id='onStock'></input><br></td></tr>

<!-- <input type='hidden' id='fk_partnerId' value='1000' ></input> -->
<!-- <input type='hidden' id='imageName' value='P' ></input> -->
<!-- <input type='hidden' id='mimeType' value='1000' ></input> -->

<tr><td><label><b>圖片 :</b></label></td><td><input type='file' id='inputFileToLoad'  />
<img id="showing" src=""/></td></tr>
<tr><td colspan = "2" style="text-align:center"><button type="submit" id='sendData' style="font-size: 15px;">新增</button></td></tr>
<!-- onchange='loadImageFileAsURL()' -->
<!-- -->
<!-- </form> -->
    </table>
</fieldset>
 
</div>
</div>
</div>
</div>
</div>
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
//    $(document).ready(function() {
// 		$("table").DataTable({
// 			"ordering" : false, //顯示排序
// 			"bPaginate" : false, // 顯示換頁
// 			"searching" : false, // 顯示搜尋
// 			"info" : false, // 顯示資訊
// 			"fixedHeader" : true
// 		// 標題置頂	
		
		
// 		});
// 	}); 
   
   </script>
</body>
</html>