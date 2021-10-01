<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
		
		xhr1.open("POST","<c:url value='/consultion/save' />",true);
		var jsoninstructor ={
				"instructorName":nameValue,
				"price":priceValue,
				"type":typeValue,
				"fileDataURL":fileDataURL

		}
		console.log(jsoninstructor);
		xhr1.setRequestHeader("Content-Type","application/json");
		xhr1.send(JSON.stringify(jsoninstructor));
		xhr1.onreadystatechange = function(){
			if(xhr1.readyState==4&&xhr1.status==200){
				result = JSON.parse(xhr1.responseText);
			   if(xhr1.responseText!=null){
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



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align='center'>
<h3>新增產品</h3>
<fieldset style='display:inline-block; width:250px'>
<!-- <form enctype="multipart/form-data"> -->


<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
<br>

<legend>新增下列產品</legend>
<label><b>名稱 :</b></label><input type='text' name='name' id='name'></input><br>
<label><b>價格 :</b></label><input type='text' name='price' id='price'></input><br>
<label><b>說明 :</b></label><input type='text' name='type' id='type'></input><br>


<!-- <input type='hidden' id='fk_partnerId' value='1000' ></input> -->
<!-- <input type='hidden' id='imageName' value='P' ></input> -->
<!-- <input type='hidden' id='mimeType' value='1000' ></input> -->
<br>
<label><b>圖片 :</b></label><input type='file' id='inputFileToLoad'  />
<img id="showing" src=""/>
<button type="submit" id='sendData'>新增</button>
<!-- onchange='loadImageFileAsURL()' -->
<!-- -->
<!-- </form> -->
</fieldset>
</div>
</body>
</html>