<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="<c:url value='/css/style.css' />" type="text/css" />
<title>Insert title here</title>
<script>
let sid = "${partnerId}";
/*let partnerId  = 1000 ;*/
window.onload = function() {
	var divResult           = document.getElementById('resultMsg');
	let uniformNumbers 		= document.getElementById("uniformNumbers");
	let companyName 		= document.getElementById("companyName");
	let password 	        = document.getElementById("password");
	let email 	            = document.getElementById("email");
	let address 	        = document.getElementById("address");
	let businessCategory    = document.getElementById("businessCategory");
	let officialWebsite 	= document.getElementById("officialWebsite");
	let remarks 	        = document.getElementById("remarks");
	let bankAccount 	    = document.getElementById("bankAccount");
	let sendData            = document.getElementById("sendData");

	let xhr = new XMLHttpRequest();
	let uniformNumbersValue = "";

	xhr.open("GET", "<c:url value='/partner/revises?partnerId=' />" + sid);
	xhr.send();
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			
			let partner 		    = JSON.parse(xhr.responseText);
			
			uniformNumbersValue = partner.uniformNumbers;
			
			uniformNumbers.innerHTML    = partner.uniformNumbers;
			companyName.value 	    = partner.companyName;
			phone.value 		    = partner.phone;
			password.value 		    = partner.password;
			email.value 		    = partner.email;
			address.value 		    = partner.address;
			businessCategory.value  = partner.businessCategory;
			officialWebsite.value   = partner.officialWebsite;
			remarks.value 		    = partner.remarks;
			bankAccount.value 	    = partner.bankAccount;
			
		}
	}
	
	sendData.onclick = function(){
		
		let companyNameValue = document.getElementById("companyName").value;
		let phoneValue = document.getElementById("phone").value;
		let passwordValue = document.getElementById("password").value;
		let emailValue = document.getElementById("email").value;
		let addressValue = document.getElementById("address").value;
		let businessCategoryValue = document.getElementById("businessCategory").value;
		let officialWebsiteValue = document.getElementById("officialWebsite").value;
		let remarksValue = document.getElementById("remarks").value;
		let bankAccountValue = document.getElementById("bankAccount").value;
		
		let obj = {
		   "partnerId":sid,
		   "uniformNumbers": uniformNumbersValue,
		   "companyName": companyNameValue,
		   "phone": phoneValue,
		   "password": passwordValue,
		   "email": emailValue,
		   "address": addressValue,
		   "businessCategory": businessCategoryValue,
		   "officialWebsite": officialWebsiteValue,
		   "remarks": remarksValue,
		   "bankAccount": bankAccountValue
		};
		
		let xhr2 = new XMLHttpRequest();
		let url = "<c:url value='/partner/revises/'  />" + sid;
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
</head>
<body>
<div align='center'>
<h3>修改會員資料</h3>
<hr>
<div id='resultMsg' style="height: 18px; font-weight: bold;"></div>
	<br>
	<fieldset style='display: inline-block; width: 820px;'> 
	<legend>修改下列資料</legend>
	<table border='1'>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;統一編號: <span name="uniformNumbers" id='uniformNumbers'></span><br>
			<div style='font-size: 10pt; text-align: center;'>
   				<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查帳號</a>
			</div>
		</td>
		<td width='200' style="vertical-align:top">
			<div id='result0c' style="height: 10px;"></div><br>
			<div id='result0s' style="height: 10px;"></div>
		</td>	
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;公司名稱: <input type="text" name="companyName" id='companyName'><br>
		</td>
		<td width='200' style="vertical-align:top">
			<div id='result1c' style="height: 10px;"></div><br>
			<div id='result1s' style="height: 10px;"></div>
		</td>	
	</tr>
	<tr height='60'>		
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;聯絡電話: <input type="text" name="phone" id='phone' size='24'>
		</td>	
		<td width='200'>
			<div id='result2c' style="height: 10px;"></div><br>
			<div id='result2s' style="height: 10px;"></div>			
		</td>	
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;密碼: <input type="text" name="password" id='password'><br>
		</td>
		<td width='200'>
			<div id='result3c' style="height: 10px;"></div><br>
			<div id='result3s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;電子郵件: <input type="text" name="email" id='email'><br>
		</td>
		<td width='200'>
			<div id='result4c' style="height: 10px;"></div><br>
			<div id='result4s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;通訊地址: <input type="text" name="address" id='address'><br>
		</td>
		<td width='200'>
			<div id='result5c' style="height: 10px;"></div><br>
			<div id='result5s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;產業類別: <input type="text" name="businessCategory" id='businessCategory'><br>
		</td>
		<td width='200'>
			<div id='result6c' style="height: 10px;"></div><br>
			<div id='result6s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;官方網站: <input type="text" name="officialWebsite" id='officialWebsite'><br>
		</td>
		<td width='200'>
			<div id='result7c' style="height: 10px;"></div><br>
			<div id='result7s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;標記: <input type="text" name="remarks" id='remarks'><br>
		</td>
		<td width='200'>
			<div id='result8c' style="height: 10px;"></div><br>
			<div id='result8s' style="height: 10px;"></div>
		</td>
	</tr>
	<tr height='60'>
		<td width='200'>&nbsp;</td>
		<td width='400'>
			&nbsp;銀行帳戶: <input type="text" name="bankAccount" id='bankAccount'><br>
		</td>
		<td width='200'>
			<div id='result9c' style="height: 10px;"></div><br>
			<div id='result9s' style="height: 10px;"></div>
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
</html>