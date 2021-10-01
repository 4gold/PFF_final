<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
window.onload = function() {
	
	//從網址取要得值
	var url = location.href;
	var ary1 = url.split('/');
	var svId = ary1[ary1.length-1];
	console.log(svId)//網址最後的數字
	
	let payerName = document.getElementById("payerName");
	let email = document.getElementById("email");
	let phone = document.getElementById("phone");
	let address = document.getElementById("address");
	let shopAddress = document.getElementById("shopAddress");
	
	let msg = document.getElementById("msg");
	
 	let xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "<c:url value='/member/showsavedpayment/"+svId+"' />");
	xhr1.send();
	xhr1.onreadystatechange = function() {
		if (xhr1.readyState == 4 && xhr1.status == 200) {
			console.log(xhr1.responseText);
			let savedpayment = JSON.parse(xhr1.responseText);
			
			payerName.value = savedpayment.payerName;
/* 			cardId.value = savedpayment.cardId; */
			phone.value = savedpayment.phone;
			address.value = savedpayment.address;
			email.value = savedpayment.email;
			shopAddress.value = savedpayment.shopAddress;
		}
	} 
	let sendData = document.getElementById("sendData");

	sendData.onclick = function() {
		if (window.confirm("確定修改？")){
		//將四個信用卡值的欄位加總
		let cardIdValue = document.getElementById("cardId1").value+document.getElementById("cardId2").value+document.getElementById("cardId3").value+document.getElementById("cardId4").value;
        console.log(cardIdValue.length);
		if(cardIdValue.length!=16){
			msg.innerHTML="信用卡號碼錯誤！";
			return;
		}
        var jsonPayment = {
                "payerName": payerName.value,
                "cardId": cardIdValue,
                "phone": phone.value,
                "email": email.value,
                "address": address.value,
                "shopAddress": shopAddress.value
            }
	

		
		//"<c:url value='/updatepayment/"+pId+"' />"
        let xhr2 = new XMLHttpRequest();
        xhr2.open("PUT", "<c:url value='/member/updatepayment/"+svId+"' />", true);
   		xhr2.setRequestHeader("Content-Type", "application/json");
        xhr2.send(JSON.stringify(jsonPayment));
        xhr2.onreadystatechange = function(){
        	if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
        		console.log(xhr2.responseText);
        		//如果成功就關閉視窗
               if( xhr2.responseText == 'true'){
            	    
            		  
            	   window.close();
               }else{
            	   msg.innerHTML = xhr2.responseText;
               }

        	}
        }
		}
    }
	
	let closeWin = document.getElementById("close");
	closeWin.onclick=function(){
		window.close();
	}
	

}



//關閉子視窗時重新整理父視窗
window.onunload = refreshParent;
function refreshParent() {
    window.opener.location.reload();
}
</script>
<title>修改資料</title>
</head>
<body>
	<button id='close'>關閉視窗</button>
	<div style="padding: 30px">
		<div id='msg' style="color:red;"></div>
		<table>

			<tr>
				<td>付款人姓名：</td>
				<td><input type="text" name="payerName" id="payerName"
					autofocus /></td>
			</tr>
			<tr>
				<td>信用卡：</td>
				<td><input type="text" name="cardId" id="cardId1" size="4" maxlength="4" autofocus />-
				<input type="text" name="cardId" id="cardId2" size="4" maxlength="4" autofocus />-
				<input type="text" name="cardId" id="cardId3" size="4" maxlength="4" autofocus />-
				<input type="text" name="cardId" id="cardId4"size="4" maxlength="4" autofocus /></td>
			</tr>
			<tr>
				<td>E-mail：</td>
				<td><input type="email" name="email" id="email" autofocus /></td>
			</tr>
			<tr>
				<td>聯絡電話（：</td>
				<td><input type="text" name="phone" id="phone" autofocus /></td>
			</tr>
			<tr>
				<td>送貨地址：</td>
				<td><input type="text" name="address" id="address" autofocus /></td>
			</tr>
			<tr>
				<td>送貨店舖：</td>
				<td><input type="text" name="shopAddress" id="shopAddress"
					autofocus /></td>
			</tr>

			<tr>
				<td><button id="sendData">修改資料</button></td>
			</tr>
		</table>


	</div>
</body>
</html>