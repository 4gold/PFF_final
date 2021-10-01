<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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

<script>
// 	window.onload = function() {
// 		var divResult = document.getElementById('resultMsg');
// 		var sendData = document.getElementById('sendData');

// 		sendData.onclick = function() {
// 			//讀欄位資料
// 			var wValue = document.getElementById("w").value;
// 			var hValue = document.getElementById("h").value;
// 			var aValue = document.getElementById("a").value;
// 			var gValue = document.getElementById("g").value;
// 			var bmr='';

// 			console.log(wValue);
// 			console.log(hValue);
// 			console.log(aValue);
		

			
			
			
// 			var xhr1 = new XMLHttpRequest();

// 			xhr1.open("POST", "<c:url value='/consultion/save' />", true);
// 			var jsoninstructor = {
// 				"instructorName" : nameValue,
// 				"price" : priceValue,
// 				"type" : typeValue,
// 				"fileDataURL" : fileDataURL

// 			}
// 			console.log(jsoninstructor);
// 			xhr1.setRequestHeader("Content-Type", "application/json");
// 			xhr1.send(JSON.stringify(jsoninstructor));
// 			xhr1.onreadystatechange = function() {
// 				if (xhr1.readyState == 4 && xhr1.status == 200) {
// 					result = JSON.parse(xhr1.responseText);
// 					if (xhr1.responseText != null) {
// 						divResult.innerHTML = "<font color='GREEN'>" + "新增成功"
// 								+ "</font>";
// 					} else {
// 						divResult.innerHTML = "<font color='red'>"
// 								+ result.fail + "</font>";
// 					}
// 				}
// 			}

// 		}
// 	}
	
// 	window.onload = function() {

// 		var sendData = document.getElementById('sendData');
// 		var dataArea = document.getElementById('dataArea');

// 		sendData.onclick = function() {
// 			//讀欄位資料
// 			var wValue = document.getElementById("w").value;
// 			var hValue = document.getElementById("h").value;
// 			var aValue = document.getElementById("a").value;
// 			var gValue = document.getElementById("g").value;
			
// 			var bmr;
// 			console.log(wValue);
// 			console.log(hValue);
// 			console.log(aValue);
			
// 			if(gValue="boy"){
// 				bmr=66 + (13.7 * wValue) + (5.0 * hValue) – (6.8 * aValue);
// 			}else{
// 				bmr= 655 + (9.6 * wValue) + (1.8 * hValue) – (4.7 * aValue);
// 			}
// 			console.log(bmr);

// 			if(){}

			// 		bmi=wValue/hValue/hValue;
			// 		if(bmi>24){
			// 			divResult.innerHTML="<font color='red'>"
			// 				   +"加緊運動!! 超標!!"+"</font>";
			// 		   }else{
			// 			   divResult.innerHTML="<font color='red'>"
			// 				   +"健康"+"</font>";
			// 		   }

			// 		var xhr1 = new XMLHttpRequest();

			// 		xhr1.open("POST","<c:url value='/consultion/save' />",true);
			// 		var calories ={
			// 				"w":wValue,
			// 				"h":hValue,
			// 				"a":aValue,
			// 		}
			// 		console.log(calories);
			// 		xhr1.setRequestHeader("Content-Type","application/json");
			// 		xhr1.send(JSON.stringify(calories));
			// 		xhr1.onreadystatechange = function(){
			// 			if(xhr1.readyState==4&&xhr1.status==200){
			// 				result = JSON.parse(xhr1.responseText);
			// 			   if(xhr1.responseText!=null){
			// 				   bmi=wValue/hValue/hValue;
			// 			   }else{
			// 				   divResult.innerHTML="<font color='red'>"
			// 					   +"加緊運動!! 超標!!"+"</font>";
			// 			   }
			// 			}
			// 		}
// 		}
// 	}
//計算公式如下：
			//男生 = 66 + (13.7 × 體重) + (5.0 × 身高) – (6.8 × 年齡)
			//女生 = 655 + (9.6 × 體重) + (1.8 × 身高) – (4.7 × 年齡)

			//每天活動量	活動量敘述	TDEE 計算方法
			//久坐	辦公室工作者，幾乎不運動	BMR × 1.2
			//輕度活動	每週輕鬆的運動3-5天	BMR × 1.375
			//中度活動	每週中等強度的運動3-5天	BMR × 1.55
			//高度活動	每週高強度運動6-7天	BMR × 1.725
			//非常高度活動	勞力密集工作或每天訓練者	BMR × 1.9
			
	//計算BMR
		var selectGElement = document.getElementById("g");
		var age = document.getElementById("age");
		var ActivityElement = document.getElementById("Activity");
		var BMR;
		 
		selectGElement.onchange = function(){
			var gid = selectGElement.options[ selectGElement.selectedIndex ].value;
			console.log(a);
			console.log(b);
			console.log(age);
			if(gid=="boy"){
				BMR=66 + (13.7 * b) + (5.0 * a) – (6.8 * age);
				
			}else if(gid=="girl"){
				BMR = 655 + (9.6 * b) + (1.8 * a) – (4.7 * age);
			}
	 }
	
	var BMI={};
BMI.getBMI=function(a,b){
var bmi=b/((a/100)*(a/100));
return bmi;
};
BMI.idealweight=function(a){
var x=(a-100)*0.9;
return x;
};



function Cal(form){
	var a=eval(form.height.value);
	var b=eval(form.weight.value);
	var age=eval(form.age.value);
	console.log(a);
	console.log(b);
	console.log(age);
	

var bmi=eval(form.BMI.value);
var bmiValue =BMI.getBMI(a,b);
BMI.disp_alert(bmiValue );
form.IW.value=BMI.idealweight(a);
form.BMI.value= bmiValue ;
}
BMI.disp_alert = function(bmi){
if (bmi < 18.5)
{
alert("你的體重太輕,要多吃點喲!");
}
else if (bmi >= 18.5 && bmi < 25)
{
alert("親,你的體重正常,要繼續保持喲!");
}
else if (bmi >= 25 && bmi< 30)
{
alert("親,您的體重過重,要減肥了!");
}
else
{
alert("親,你確實要減肥了!");
}
}
	
</script>
<meta charset="UTF-8">
<title>calories</title>
</head>
<body>
<%@include file="../Top.jsp"%>

<div class="container" style="text-align:center;">
<fieldset style='display: inline-block; width: 250px'>
<form method=post>
性別: <select id='g'>
					<option name='boy'>男性</option>
					<option name='girl'>女性</option>
		 </select><br> 
你的身高(cm):<input type="text" name="height"><br>
<br/>
你的體重(kg):<input type="text" name="weight"><br>
<br/>
年齡:</label><input type='text' name='age' id='age'></input><br>日常活動量:
				<select id='Activity'>
					<option value='Zero'>辦公室工作者，幾乎不運動</option>
					<option value='One'>每週輕鬆的運動3-5天</option>
					<option value='Two'>每週中等強度的運動3-5天</option>
					<option value='Tree'>每週高強度運動6-7天</option>
					<option value='Four'>勞力密集工作或每天訓練者</option>
			</select>
			<br>
<input type="button" value="開始計算" onclick="Cal(this.form)" >
<br/>

<br/>
<b>你的理想體重:</b><input type="text" name="IW"><br/>
<br/>
<b>您的BMI:</b><input type="text" name="BMI">
<br/>
<b>您每日基礎代謝率:</b><input type="text" name="BMR">
</form>
</fieldset>
</div>
<!-- 	<div class="container" id='dataArea'> -->
<!-- 		<fieldset style='display: inline-block; width: 250px'> -->

<!-- 			<br> -->
<!-- 			<legend>計算熱量</legend> -->
<!-- 			<b>性別: <select id='g'> -->
<!-- 					<option value='boy'>男性</option> -->
<!-- 					<option value='girl'>女性</option> -->
<!-- 			</select></b><br> <label><b>體重 :</b></label><input type='text' name='w' -->
<!-- 				id='w'></input><br> <label><b>身高 :</b></label><input -->
<!-- 				type='text' name='h' id='h'></input><br> <label><b>年齡 -->
<!-- 					:</b></label><input type='text' name='a' id='a'></input><br> <b>日常活動量: -->
<!-- 				<select id='Activity'> -->
<!-- 					<option value='Zero'>辦公室工作者，幾乎不運動</option> -->
<!-- 					<option value='One'>每週輕鬆的運動3-5天</option> -->
<!-- 					<option value='Two'>每週中等強度的運動3-5天</option> -->
<!-- 					<option value='Tree'>每週高強度運動6-7天</option> -->
<!-- 					<option value='Four'>勞力密集工作或每天訓練者</option> -->
<!-- 			</select> -->
<!-- 			</b><br> -->

<!-- 			<button type="submit" id='sendData'>計算</button> -->

<!-- 		</fieldset> -->
<!-- 	</div> -->

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