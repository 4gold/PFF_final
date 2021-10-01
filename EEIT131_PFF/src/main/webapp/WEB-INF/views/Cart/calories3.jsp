<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 載入JQUERY -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%-- <script type="text/javascript" src="<c:url value='/DataTables/datatables.min.js' />"></script> --%>

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

<meta charset="UTF-8">
<title>calories</title>
</head>
<body>
<%@include file="../Top.jsp"%>

    <div class="container-liquid" style="width:400px;margin:0 auto;"><span style="color: #990000; font-size: large;"><b>BMI、BMR、TDEE 線上計算機</b></span>
        <form id="BMR">
            <div class="mb-4" id="input_height">
                <label class="form-label">身高（公分）：</label>
                <input class="form-control" name="height" placeholder="公分" style="height: 30px; margin-bottom: 10px;" type="number">
            </div>
            <div class="mb-4" id="input_weight">
                <label class="form-label">體重（公斤）：</label>
                <input class="form-control" name="weight" placeholder="公斤" style="height: 30px; margin-bottom: 10px;" type="number">
            </div>
            <div class="mb-4" id="input_age">
                <label class="form-label">年紀：</label>
                <input class="form-control" name="age" placeholder="歲" style="height: 30px; margin-bottom: 10px;" type="number">
            </div>
            <div class="mb-4" id="input_gender">
                <label>性別：</label>
                <div class="form-check">
                    <label class="form-check-label">
                        <input id="male" name="gender" type="radio" value="1">
                        男　　</label>
                </div>
                <div class="form-check">
                    <label class="form-check-label">
                        <input id="female" name="gender" type="radio" value="0">
                        女</label>
                </div>
            </div>
            <div class="mb-3" id="input_activity">
                <label>活動程度：</label>
                <select name="activity_level" style="height: 30px; width: 100%;">
                    <option value="1.2">整天坐著、躺著(1.2)</option>
                    <option value="1.3">坐著工作, 沒有在運動(1.3)</option>
                    <option value="1.4">坐著工作, 輕微的運動(1.4)</option>
                    <option value="1.5">適度的體力工作, 沒有在運動(1.5)</option>
                    <option value="1.6">適度的體力工作, 輕微的運動(1.6)</option>
                    <option value="1.7">適度的體力工作, 劇烈的運動(1.7)</option>
                    <option value="1.8">繁重的工作/劇烈的運動(1.8)</option>
                    <option value="2.2">超過平均的體力工作/運動(2.0-2.4)</option>
                </select>
            </div>

            <button class="btn btn-primary btn-lg btn-block mb-4" id="btn" name="calculate" type="submit">計算</button>

            <div class="mb-4" id="input_result">
                <label class="form-label">基礎代謝率 BMR（大卡）：</label>
                <output id="result" style="font-size: x-large; height: 30px; margin-bottom: 40px;">
            </output></div>
            <div class="mb-4" id="input_result2">
                <label class="form-label">一天總消耗熱量 TDEE（大卡）：</label>
                <output id="result2" style="font-size: x-large; height: 30px; margin-bottom: 10px;">
            </output></div>
            <div class="mb-4" id="input_result3">
                <label class="form-label">BMI：</label>
                <output id="result3" style="font-size: x-large; height: 30px; margin-bottom: 10px;">
            </output></div>
        </form>
    </div>
 <script>

        $(document).ready(function () {
            $("#BMR").submit(function (e) {
                e.preventDefault();
                var weight = $("[name='weight']").val();
                var height = $("[name='height']").val();
                var gender = $("[name='gender']").val();
                var age = $("[name='age']").val();
                var activity = $("[name='activity_level']").val();
                var bmr;
                var bmi;
                var calories;
                if (weight > 0 && height > 0) {
                    if (gender == 0) {
                    	bmi = Math.round(weight /(height*height/10000));
                        bmr = Math.round((weight * 10) + (6.25 * height) - (5 * age) - 161);
                        calories = Math.round(bmr * activity);
                    } else {
                    	bmi = Math.round(weight /(height*height/10000));
                        bmr = Math.round((weight * 10) + (6.25 * height) - (5 * age) + 5);
                        calories = Math.round(bmr * activity);
                    }
                    $("#result").val(bmr);
                    $("#result2").val(calories);
                    $("#result3").val(bmi);
                    
                	if (bmi < 18.5)
                	{
                	alert(" 親親~ 你的體重太輕,要多吃點喲!");
                	}
                	else if (bmi >= 18.5 && bmi < 25)
                	{
                	alert("Dear 親,你的體重正常,要繼續保持喲!");
                	}
                	else if (bmi >= 25 && bmi< 30)
                	{
                	alert("Dear 親,您的體重過重,要減肥了!");
                	}
                	else
                	{
                	alert("Dear 親,你確實要減肥了!");
                	}
                    
                }
            });
        });

    </script>

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
