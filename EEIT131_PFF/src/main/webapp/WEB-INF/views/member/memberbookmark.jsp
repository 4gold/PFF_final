<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ζε‘ζΆθ</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/DataTables/datatables.min.css' />" />
<script src="<c:url value='/js/jquery-3.6.0.min.js' />"></script>
<script type="text/javascript" src="<c:url value='/DataTables/datatables.min.js' />"></script>

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
		/* let dataArea = document.getElementById("dataArea"); */

		let xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/member/showbookmark' />");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && xhr1.status == 200) {
				 $("#dataArea").html(showBookmark(xhr1.responseText)); 
				/* console.log(xhr1.responseText); */
				
			}
		}
		
/* 		$("#dataArea").innerHTML=function(){
			
			$("button").click(function(){
				console.log($(this));
			})
		} */
		
		
		let deleteBookmark = document.getElementById("deleteBookmark");

		/*deleteBookmark.onclick = function() {
		console.log("here");
		 let pId = document.querySelector('input[name="ra1"]:checked').value;
		 console.log(pId);			
		 let xhr2 = new XMLHttpRequest();
		 xhr2.open("DELETE", "<c:url value='/deletebookmark/"+pId+"' />");
		
		 xhr2.onreadystatechange = function() {
		 if (xhr2.readyState == 4 && xhr2.status == 200) {
		 console.log(xhr2.responseText);
		
		 }
		 }
		 xhr2.send(null);
		 location.reload(true); 
		 } */

	}
	
	function deleteBookmark(productId){
		console.log(productId);
		
		let xhr2 = new XMLHttpRequest();
		xhr2.open("DELETE", "<c:url value='/member/deletebookmark/"+productId+"' />");
	    xhr2.onreadystatechange = function() {
			 if (xhr2.readyState == 4 && xhr2.status == 200) {
			 console.log(xhr2.responseText);
			
			 }
		}
		xhr2.send(null);
		location.reload(true);   

	}

	function showBookmark(JsonString) {
	 let bookmarks = JSON.parse(JsonString);
	 /* console.log(bookmarks);  */
	 let segment = "";

	 for (let i = 0; i < bookmarks.length; i++) {
	 let bookmark = bookmarks[i];
	 
	 /* θηζ²ζζθΏ°ηεεε§ε?Ήζζ―undefined */
	 let remark = "";
	 /* console.log(typeof(bookmark.remarks)); */
	 if(typeof(bookmark.remarks) != 'undefined'){
		 remark = bookmark.remarks;
	 }
	 
     segment += "<div class='bookmarkCell_outer'><div class='bookmarkCell_inner'>";
	 segment += "<img src=<c:url value='/member/getProductImage' />?productId="
			+ bookmark.productId + " class='bookmarkImg' />";
     /* segment += "<img src='images/images01.jpg' class='bookmarkImg'>"; */
     segment += "<table style='table-layout: fixed;' >";
     segment += "<tr><td class='td1'>εεεη¨±</td><td><span id='name'>οΌ"+bookmark.productName+"</span></td></tr>";
     segment += "<tr><td class='td1'>εΉζ Ό</td><td><span id='price'>οΌ"+bookmark.price+"</span></td></tr>";
     segment += "<tr><td class='td1' valign='top'>εεε§ε?Ή</td><td>";
     segment += "<div class='wrap' id='remark'><p class='ellipsis'>οΌ"+remark+"</p></div></td></tr>";
     segment += "</table><br><hr style='margin: 20px'>";
     segment += "<div id='buttonDiv' align='center'>";
     segment += "<button id='deleteBookmark"+i+"' onclick='deleteBookmark("+bookmark.productId+")' value='"+bookmark.productId+"' style='margin-right: 50px;'>η§»ι€ζΆθ</button>";
     segment += "</div></div></div>";

	 } 

	 return segment;
	 }
</script>
<style type="text/css">
.bookmarkCell_outer {
	border: 1px lightgray solid;
	border-radius: 20px;
	width: 400px;
	height: 200px;
	margin-left: 50px;
	margin-top: 50px;
	float: left;
	font-size: 5px;
}

.bookmarkCell_inner {
	margin: 20px;
}

.bookmarkImg {
	width: 100px;
	float: left;
	margin-right: 5px;
}
/* tdθͺεζθ‘ */
.warp {
	width: 20px;
	white-space: normal;
	word-wrap: break-word;
	word-break: break-all;
	
}

.ellipsis {
	white-space: normal;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	margin:0;
}

table {
	table-layout: fixed;
	width: 250px;
	/* border: 1px solid red; */
}

td {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
/* 	border: 1px solid blue; */
	vertical-align:text-top;
	
}

.td1 {
	width: 20%;
}

.one {
  width: 15%;
  height: 500px;
  float: left;
}

.two {
  margin-left: 15%;
  height: 500px;

}
</style>
</head>
<body>
<%@include file="../Top.jsp"%>
<%@include file="Sidebar.jsp"%>
	<div class="two">
	
		<div id="dataArea">
		<!-- η±ζ­€ιε§θͺεηζ -->
		
			<!-- <div class='bookmarkCell_outer'>
				<div class='bookmarkCell_inner'>
					<img src='images/images01.jpg' class='bookmarkImg'>
					<table style='table-layout: fixed;' >
						<tr>
							<td class='td1'>εεεη¨±</td>
							<td>οΌ<span id='name'>θ²θ²ιΎ</span></td>
						</tr>
						<tr>
							<td class='td1'>εΉζ Ό</td>
							<td>οΌ<span id='price'>2000</span></td>
						</tr>
						<tr>
							<td class='td1' valign="top">εεε§ε?Ή</td>
							<td>
								<div class='wrap' id='remark'>
									<p class="ellipsis">οΌθ²θ²ιΎηι·ζΌθ²θ²ε³Άηθ²θ²ε°δΈη η©Άε?€</p>
								</div>
							</td>
						</tr>

					</table>
					<br>
					<hr style='margin: 20px'>
					<div id='buttonDiv' align='center'>
						<button id='deleteBookmark' style='margin-right: 50px;'>η§»ι€ζΆθ</button>
						<button id='productPage'>εει ι’</button>
					</div>
				</div>
			</div> -->
			
		<!-- η±ζ­€η΅ζθͺεηζ -->	
		</div>

	</div>
	<br>
	
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


	<script>
		/* 		$(document).ready(function() {
		 $("table").DataTable({
		 "ordering" : false, //ι‘―η€ΊζεΊ
		 "bPaginate" : false, // ι‘―η€Ίζι 
		 "searching" : false, // ι‘―η€Ίζε°
		 "info" : false, // ι‘―η€Ίθ³θ¨
		 "fixedHeader" : true
		 // ζ¨ι‘η½?ι 	
		 });
		 }); */

		
	</script>
</body>
</html>