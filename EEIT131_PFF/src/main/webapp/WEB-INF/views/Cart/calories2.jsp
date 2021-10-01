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
        <!--[if lt IE 9]>
        <script src="assets/scripts/libs/html5shiv.js"></script>
        <script src="assets/scripts/libs/respond.js"></script>
        <![endif]-->
<script>

//BMI = 體重(公斤) / (身高(公尺) x 身高(公尺)) 
//計算功能寫在外面，另外的功能應另外寫出來。

//宣告 DOM
let bmiText =document.querySelector('#bmiText');
bmiText.style.display="none";
//事件點擊按鈕 
let btn =document.querySelector('.calcualteBMI');
let reset =document.querySelector('.reset');

//計算BMI

function bmi(weight,height){
let w = parseInt(weight);
let h = parseInt(height)/100;//因為公分要轉公尺所以除以100
let bmi = (w/(h*h)).toFixed(2);//toFixed讓小數點4捨5入只有2位
return bmi;

}

var selectElement = document.getElementById("typeid");
var typeId = selectElement.options[ selectElement.selectedIndex ].value;
//取出輸入值寫入畫面
function calculateBMI(){
let bodyWeight =document.querySelector('.bodyWeight').value;
let bodyHeight =document.querySelector('.bodyHeight').value;
let resultText =document.querySelector('#resultText');
let bmiText =document.querySelector('#bmiText');
//  印出值來
if((bodyWeight !="" ) && (bodyHeight != "")){

  bmiText.style.display="block";
  resultText.innerHTML = bmi(bodyWeight,bodyHeight);
  bmiText.innerHTML =  checkBMI(bmi(bodyWeight,bodyHeight));
 
}else{
   bmiText.style.display="none";
   alert("請輸入身高體重！")
   return
}
   resultText.innerHTML = bmi(bodyWeight,bodyHeight);

}
//bmi 範圍
function checkBMI(bmi){

 if( bmi < 18.5){
 return "太輕了"
 }else if( bmi >=18.5 &&  bmi < 24){
 return "體重正常 "
 }else if( bmi >=24 &&  bmi < 27){
 return "過重 "
 }else if( bmi >=27 &&  bmi < 30){
 return "輕度肥胖 "
 }else if( bmi >=30 &&  bmi < 35){
 return "中度肥胖 "
 }else if( bmi  >=35){
 return "重度肥胖 "
 }


}
//清空值
function undo(e){
document.querySelector('.bodyWeight').value ='';
document.querySelector('.bodyHeight').value ='';
bmiText.style.display="none";
resultText.innerHTML = 0;
return
}

//事件監聽
btn.addEventListener('click',calculateBMI);
reset.addEventListener('click',undo);

</script>
<meta charset="UTF-8">
<title>calories</title>
</head>
<body>
<%@include file="../Top.jsp"%>
<%-- <jsp:include page="Top.jsp"> --%>
<%-- 	<jsp:directive.include file="<c:url value='../Top.jsp' />" /> --%>

<section class="calculator">
    <section class="fields">
      <h1 >BMI 計算機</h1>
     
      <div class="bmi_calcu">
        <label for="bodyHeight">身高 :</label>
        <input type="number" class="bodyHeight" min="0">cm
      
      
        <label for="bodyWeight">體重:</label>
        <input type="number" class="bodyWeight" min="0">Kg
      </div>
      <div class="btn_block">
      <input type="submit" value="計算"  class="calcualteBMI"> 
      <i class="fas fa-undo reset" title="重新整理"></i>
        </div>
      
   
    </section>

    <section class="result">
      <h2 class="result_txt">你的BMI：</h2>
       
      <p id="bmiText"></p>
      <p id="resultText">0</p>
     
    </section>
  <section class="bottom">
    
    
  </section>
  

  </section>


<!-- <div class="container"> -->
<!-- <fieldset style='display: inline-block; width: 250px'> -->
<!-- <form method=post> -->
<!-- 性別: <select id='g'> -->
<!-- 					<option name='boy'>男性</option> -->
<!-- 					<option name='girl'>女性</option> -->
<!-- 		 </select><br>  -->
<!-- 你的身高(cm):<input type="text" name="height"><br> -->
<!-- <br/> -->
<!-- 你的體重(kg):<input type="text" name="weight"><br> -->
<!-- <br/> -->
<!-- 年齡:</label><input type='text' name='a' id='a'></input><br>日常活動量: -->
<!-- 				<select id='Activity'> -->
<!-- 					<option value='Zero'>辦公室工作者，幾乎不運動</option> -->
<!-- 					<option value='One'>每週輕鬆的運動3-5天</option> -->
<!-- 					<option value='Two'>每週中等強度的運動3-5天</option> -->
<!-- 					<option value='Tree'>每週高強度運動6-7天</option> -->
<!-- 					<option value='Four'>勞力密集工作或每天訓練者</option> -->
<!-- 			</select> -->
<!-- 			<br> -->
<!-- <input type="button" value="開始計算" onclick="Cal(this.form)"> -->
<!-- <br/> -->
<!-- <br/> -->
<!-- <b>你的理想體重:</b><p name="IW"></p><br/> -->
<!-- <!-- <input type="text" name="IW"> --> -->
<!-- <br/> -->
<!-- <b>您的BMI:</b><input type="text" name="BMI"> -->
<!-- <br/> -->
<!-- <b>您每日基礎代謝率:</b><input type="text" name="BMR"> -->
<!-- </form> -->
<!-- </fieldset> -->
<!-- </div> -->


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
<%-- <jsp:include page="Footer.jsp"> --%>

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