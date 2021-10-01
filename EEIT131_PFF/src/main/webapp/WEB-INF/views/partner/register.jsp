<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <link href="assets/styles/flat-form.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/fancySelect.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/jquery.fancybox.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/allinone_bannerRotator.css"
	rel="stylesheet" type="text/css" />
<link href="assets/styles/owl.carousel.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/owl.theme.default.min.css" rel="stylesheet"
	type="text/css" />
<link href="assets/styles/styles.css" rel="stylesheet"
	type="text/css" />
<script src="assets/scripts/libs/prefixfree.min.js"></script>
<script src="assets/scripts/libs/modernizr.js"></script>
<script src="assets/scripts/libs/html5shiv.js"></script>
<script src="assets/scripts/libs/respond.js"></script>
<script>
var hasError = false;
window.onload = function() {
	var alink = document.getElementById("uniformNumbers");
	var div = document.getElementById('result0c');
	alink.onclick = function() {
	  var uniformNumbersValue = document.getElementById("uniformNumbers").value;
	  if (!uniformNumbersValue) {
		div.innerHTML = "<font color='blue' size='-1'></font>";
		return;
	  }
	  var xhr = new XMLHttpRequest();
	  xhr.open("POST", "<c:url value='/partner/_02/CheckMemberId' />", true);
	  xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
	  xhr.send("uniformNumbers=" + uniformNumbersValue);
	  var message = "";
	  xhr.onreadystatechange = function() {
	    // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
		   var result = JSON.parse(xhr.responseText);
		   if (result.uniformNumbers.length == 0) {
			  message = "<font color='green' size='-2'>帳號可用</font>";
		   } else if (	result.uniformNumbers.startsWith("Error") ) {
			  message = "<font color='red' size='-2'>發生錯誤: 代號" + result.uniformNumbers + "</font>";
		   } else {
			  message = "<font color='red' size='-2'>帳號重複，請重新輸入帳號</font>"; 
		   }
		   div.innerHTML = message;
	    }
      }
   }
	
	//一鍵輸入
	   window.addEventListener('keydown', function(e) {
	    //取到按下的按鈕
	    console.log(e.key);
	    //指定按哪個鈕要把東西輸入
	    if (e.key == "k") {
	     uniformNumbers.value = "18884590";
	     companyName.value = "新德里企業股份有限公司";
	     phone.value = "0223455990";
	     password.value = "ABC@123";
	     email.value =	"abc123@gmail.com";
	     address.value = "台北市信義區忠孝東路152號2樓";
	     businessCategory.value = "food";
	     officialWebsite.value = "http://abc123.com.tw";
	     remarks.value = "新德里";
	     bankAccount.value = "18346570189";
	    }
	   });	
	
   var sendData = document.getElementById("sendData");
   sendData.onclick = function() {
		hasError = false;
   		// 讀取欄位資料	  
		var uniformNumbersValue = document.getElementById("uniformNumbers").value;
		var companyNameValue = document.getElementById("companyName").value;
		var phoneValue = document.getElementById("phone").value;
		var passwordValue = document.getElementById("password").value;
		var emailValue = document.getElementById("email").value;
		var addressValue = document.getElementById("address").value;
		var businessCategoryValue = document.getElementById("businessCategory").value;
		var officialWebsiteValue = document.getElementById("officialWebsite").value;
		var remarksValue = document.getElementById("remarks").value;
		var bankAccountValue = document.getElementById("bankAccount").value;
		
		var div0 = document.getElementById('result0c');
		var div1 = document.getElementById('result1c');
		var div2 = document.getElementById('result2c');
		var div3 = document.getElementById('result3c');
		var div4 = document.getElementById('result4c');
		var div5 = document.getElementById('result5c');
		var div6 = document.getElementById('result6c');
		var div7 = document.getElementById('result7c');
		var div8 = document.getElementById('result8c');
		var div9 = document.getElementById('result9c');
		var divResult = document.getElementById('resultMsg');
		
		if(uniformNumbersValue.length > 8){
			div0.style.color = "red";
			div0.innerHTML = "統編長度錯誤";
			return;
		}
		
		
		
		var xhr1 = new XMLHttpRequest();
   		xhr1.open("POST", "<c:url value='/register' />", true);
   		// 下方為一個Javascript物件
		var jsonMember = {
			"uniformNumbers": uniformNumbersValue,
			"companyName": companyNameValue,
			"phone": phoneValue,
			"password": passwordValue,
			"email": emailValue,
			"address": addressValue,
			"businessCategory": businessCategoryValue,
			"officialWebsite": officialWebsiteValue,
			"remarks": remarksValue,
			"bankAccount": bankAccountValue,
					
		}
		xhr1.setRequestHeader("Content-Type", "application/json");
  		xhr1.send(JSON.stringify(jsonMember));
   		console.log(JSON.stringify(jsonMember));
   		
  		/*
  		JSON.stringify(jsonMember);  // 將JavaScript物件轉換為JSON字串
  		
  		JSON.parse(jsonString);      // 將JSON字串轉換為JavaScript物件
  		*/
//      以下敘述錯誤  		
// 		xhr1.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
//    		xhr1.send("id=" + idValue + "&name=" + nameValue + "&balance=" 
//    				+ balanceValue + "&birthday=" + birthdayValue );

        
        
   		xhr1.onreadystatechange = function() 
   		{
				// 伺服器請求完成
   		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
      		result = JSON.parse(xhr1.responseText);
      		if (result.fail) {
		 		  divResult.innerHTML = "<font color='red' >"
					+ result.fail + "</font>";
					
	  		} else if (result.success) {
	  			window.location.assign("<c:url value='/partnerlogin' />");
/* 				divResult.innerHTML = "<font color='GREEN'>"
					+ result.success + "</font>"; */
/* 				div0.innerHTML = "";	
				div1.innerHTML = "";
				div2.innerHTML = "";
				div3.innerHTML = "";
				div4.innerHTML = "";
				div5.innerHTML = "";
				div6.innerHTML = "";
				div7.innerHTML = "";
				div8.innerHTML = "";
				div9.innerHTML = ""; */
		   		
			} else {
				if (result.uniformNumbersError) {
          			div0.innerHTML = "<font color='green' size='-2'>"
	     				+ result.uniformNumbersError + "</font>";
				} else {
          			div0.innerHTML = "";
				}
				if (result.companyNameError) {
	      			div1.innerHTML = "<font color='green' size='-2'>"
						+ result.companyNameError + "</font>";
				} else {
	      			div1.innerHTML = "";
	   			}
				if (result.phoneError) {
          			div2.innerHTML = "<font color='green' size='-2'>"
						+ result.phoneError + "</font>";
				} else {
          			div2.innerHTML = "";
    			}
				if (result.passwordError) {
	    			div3.innerHTML = "<font color='green' size='-2'>"
						+ result.passwordError + "</font>";
				} else {
          			div3.innerHTML = "";
				}
				if (result.emailError) {
	    			div4.innerHTML = "<font color='green' size='-2'>"
						+ result.emailError + "</font>";
				} else {
          			div4.innerHTML = "";
				}
				if (result.addressError) {
	    			div5.innerHTML = "<font color='green' size='-2'>"
						+ result.addressError + "</font>";
				} else {
          			div5.innerHTML = "";
				}
				if (result.businessCategoryError) {
	    			div6.innerHTML = "<font color='green' size='-2'>"
						+ result.businessCategoryError + "</font>";
				} else {
          			div6.innerHTML = "";
				}
				if (result.officialWebsiteError) {
	    			div7.innerHTML = "<font color='green' size='-2'>"
						+ result.officialWebsiteError + "</font>";
				} else {
          			div7.innerHTML = "";
				}
				if (result.remarksError) {
	    			div8.innerHTML = "<font color='green' size='-2'>"
						+ result.remarksError + "</font>";
				} else {
          			div8.innerHTML = "";
				}
				if (result.bankAccountError) {
	    			div9.innerHTML = "<font color='green' size='-2'>"
						+ result.bankAccountError + "</font>";
				} else {
          			div9.innerHTML = "";
				}
				 
			   }
      		
		     }
   		//window.location.href = "<c:url value='/partnerlogin' />";
   		
   		//window.location.assign("<c:url value='/partnerlogin' />");
   		   }
   		
   		}
       
      }


function setErrorFor(input, message){
	input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
    hasError = true;
}

function dateValidation(str) {
	  var re = new RegExp("^([0-9]{4})[.-]{1}([0-9]{1,2})[.-]{1}([0-9]{1,2})$");
	  var days = [0, 31, 28, 31, 30,  31, 30, 31, 31, 30, 31, 30, 31];
	  var strDataValue;
	  var valid = true;
	  if ((strDataValue = re.exec(str)) != null) {
	    var y, m, d;
	    y = parseFloat(strDataValue[1]);
	    if (y <= 0 || y > 9999) { /*年*/
	      return false;
	    } 
	    m = parseFloat(strDataValue[2]);
	    
	    if (m < 1 || m > 12) { /*月*/
	        return false;
	    }
	    d = parseFloat(strDataValue[3]);
	    if ( y % 4 == 0 && y % 100 != 0 || y % 400 == 0 ){
	       days[2] = 29;
	    }  else {
	       days[2] = 28;
	    }
	    if (d <= 0 || d > days[m]) { /*日*/
	      valid = false;
	    }
	  } else {
	    valid = false;
	  }  
	  return valid;
	}

	function isEmail(email) {
		return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
	}	
	
	function CheckUniformNumbers(){
		let uniformNumbersObj = document.getElementById("uniformNumbers");
		let uniformNumbersObjVal = uniformNumbersObj.value;
		 if (uniformNumbersObjVal == null || uniformNumbersObjVal == "") {
             document.getElementById("idsp0").innerHTML = "<font color='red'>請輸入統一編號</font>";
         }
		 if (uniformNumbersObjVal.length != 8){
			 document.getElementById("idsp0").innerHTML = "<font color='red'>統一編號格式錯誤</font>";
		 }
		 else{
		     if (uniformNumbersObjVal.length = 8){
			     document.getElementById("idsp0").innerHTML = "<font color='green'>可以使用</font>";
		 }
	   }	     
	}
		
	function checkCompanyName() {
        let nameObj = document.getElementById("companyName");
        let nameObjVal = nameObj.value;
        let flag1 = false;
        if (nameObjVal == "") {
            document.getElementById("idsp1").innerHTML = "<font color='red'>請輸入公司名稱</font>";
        } else if (nameObjVal.length >= 2) {
            for (let i = 0; i < nameObjVal.length; i++) {
                let nameCh = nameObjVal.charCodeAt([i]);
                if (nameCh >= 0x4e00 && nameCh <= 0x9fff) {
                    flag1 = true;
                    break;
                }
            }
            if (flag1) {
                document.getElementById("idsp1").innerHTML = "<font color='green'>可以使用</font>";
            } else {
                document.getElementById("idsp1").innerHTML = "<font color='red'>請輸入中文名稱</font>";
            }
        } else {
            document.getElementById("idsp1").innerHTML = "<font color='red'>請輸入至少兩個字中文公司名稱</font>";
        }
    }
	
	function checkphone() {
        let thephoneObj = document.getElementById("phone");
        let thephoneObjVal = thephoneObj.value
        if (thephoneObjVal == "") {
            document.getElementById("idsp2").innerHTML = "<font color='red'>請輸入聯絡電話</font>";
        }
        else if (thephoneObjVal.length != 10) {
            document.getElementById("idsp2").innerHTML = "<font color='red'>聯絡電話格式不正確</font>";
        }
        else {
            if (thephoneObjVal.length = 10) {
                document.getElementById("idsp2").innerHTML = "<font color='green'>可以使用</font>";
            }
        }
    }
	
	function checkPwd() {
        let thePwdObj = document.getElementById("password");
        let thePwdObjVal = thePwdObj.value;
        let thePwdObjValLen = thePwdObjVal.length;
        let spPWD = document.getElementById("idsp3");
        let Ans = 0;
        const rules = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*\d)[a-zA-Z\d!@#$%^&*]{6,}$/;
        const rules1 = /^[0-9!@#$%^&*]*$/;
        const rules2 = /^[a-zA-Z!@#$%^&*]*$/;
        const rules3 = /^[a-zA-Z0-9]*$/;
        const rules4 = /^[!@#$%^&*]*$/;
        const rules5 = /^[0-9]*$/;
        const rules6 = /^[a-zA-Z]*$/;
        console.log(typeof thePwdObjVal)
        console.log(thePwdObjVal)
        console.log(typeof thePwdObj)
        console.log(thePwdObj)


        if (thePwdObjVal == "") {
            Ans = 1;
        } else if (thePwdObjValLen < 6) {
            Ans = 2;
        }
        else if (rules4.test(thePwdObjVal)) {
            Ans = 3;
        }
        else if (rules5.test(thePwdObjVal)) {
            Ans = 4;
        }
        else if (rules6.test(thePwdObjVal)) {
            Ans = 5;
        }
        else if (rules1.test(thePwdObjVal)) {
            Ans = 6;
        }
        else if (rules2.test(thePwdObjVal)) {
            Ans = 7;
        } else if (rules3.test(thePwdObjVal)) {
            Ans = 8;
        } else if (rules.test(thePwdObjVal)) {
            Ans = 9;
        }

        switch (Ans) {
            case 1: spPWD.innerHTML = "<font color='red'>請輸入密碼</font>"; break;
            case 2: spPWD.innerHTML = "<font color='red'>密碼至少6個字</font>"; break;
            case 3: spPWD.innerHTML = "<font color='red'>需要有英文跟數字</font>"; break;
            case 4: spPWD.innerHTML = "<font color='red'>需要有英文跟特殊符號</font>"; break;
            case 5: spPWD.innerHTML = "<font color='red'>需要有數字跟特殊符號!@#$%^&*</font>"; break;
            case 6: spPWD.innerHTML = "<font color='red'>需要有英文</font>"; break;
            case 7: spPWD.innerHTML = "<font color='red'>需要有數字</font>"; break;
            case 8: spPWD.innerHTML = "<font color='red'>須要有特殊符號</font>"; break;
            case 9: spPWD.innerHTML = "<font color='green'>可以使用</font>"; break;
        }
    }
	
	 function checkEmail(remail) {
         let emailObj = document.getElementById("email");
         let emailObjVal = emailObj.value;
         if (emailObjVal == null || emailObjVal == "") {
             document.getElementById("idsp4").innerHTML = "<font color='red'>請輸入電子郵件</font>";
         }
         var regExp = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
         if (!regExp.test(emailObjVal)) {
             document.getElementById("idsp4").innerHTML = "<font color='red'>請輸入正確的電子郵件</font>";
         }
         if (regExp.test(emailObjVal)) {
             document.getElementById("idsp4").innerHTML = "<font color='green'>可以使用</font>";
         }
     }
	 
	 function checkBusinessCategory() {
         let businessCategoryObj = document.getElementById("businessCategory");
         let businessCategoryObjVal = businessCategoryObj.value;
         let flag1 = false;
         if (businessCategoryObjVal == "") {
             document.getElementById("idsp6").innerHTML = "<font color='red'>請輸入產業類別</font>";
         } else if (businessCategoryObjVal != "") {
             document.getElementById("idsp6").innerHTML = "<font color='green'>可以使用</font>";
             } 
     }
	 
	 function checkAddress() {
         let addressObj = document.getElementById("address");
         let addressObjVal = addressObj.value;
         let flag1 = false;
         if (addressObjVal == "") {
             document.getElementById("idsp5").innerHTML = "<font color='red'>請輸入通訊地址</font>";
         } else if (addressObjVal != "") {
             document.getElementById("idsp5").innerHTML = "<font color='green'>可以使用</font>";
             } 
     }
	 
	 function checkofficialWebsite() {
         let officialWebsiteObj = document.getElementById("officialWebsite");
         let officialWebsiteObjVal = officialWebsiteObj.value;
         let flag1 = false;
         if (officialWebsiteObjVal == "") {
             document.getElementById("idsp7").innerHTML = "<font color='red'>請輸入官方網站</font>";
         } else if (officialWebsiteObjVal != "") {
        	 document.getElementById("idsp7").innerHTML = "<font color='green'>可以使用</font>";
             } 
     }
	 
	 function checkbankAccount() {
		 let bankAccountObj = document.getElementById("bankAccount");
	        let bankAccountObjVal = bankAccountObj.value
	        if (bankAccountObjVal == "") {
	            document.getElementById("idsp8").innerHTML = "<font color='red'>請輸入銀行帳戶</font>";
	        }
	        else if (bankAccountObjVal.length != 11) {
	            document.getElementById("idsp8").innerHTML = "<font color='red'>帳戶格式不正確</font>";
	        }
	        else {
	            if (bankAccountObjVal.length = 11) {
	                document.getElementById("idsp8").innerHTML = "<font color='green'>可以使用</font>";
	            }
	        }
	    }
</script>

<meta charset="UTF-8">
<title>企業註冊</title>
</head>
<body class="bg-gradient-primary">
<%@include file="../Top.jsp"%>
 <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">

<h3>輸入會員資料</h3>
<hr>
<div id="resultMsg"></div>
<div class="row">
    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
      <div class="col-lg-7">
        <div class="p-5">
		<div class="text-center">
       <h1 class="h4 text-gray-900 mb-4">填寫會員資料</h1>
       </div>
   	<!-- <form class="user"> -->
	<div class="form-group ">
	    <div class="col-sm-7 mb-3 mb-sm-0">
		    &nbsp;統一編號: <input type="text" class="form-control form-control-user" name="uniformNumbers" id='uniformNumbers' onblur="CheckUniformNumbers()" required placeholder="請輸入統一編號(帳號)" autocomplete="on"><br>
			<span id="idsp0"></span>
			<div style='font-size: 10pt; text-align: center;'>
   				<a href='#' id='accountCheck' style='font-size: 10pt;'></a>
			<div id='result0c' style="height: 10px;"></div><br>
			<div id='result0s' style="height: 10px;"></div>
			</div>
		</div>
	</div>	
    <div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;公司名稱: <input type="text" class="form-control form-control-user" name="companyName" id='companyName' onblur="checkCompanyName()" required placeholder="請輸入公司名稱" autocomplete="on"><br>
			<span id="idsp1"></span>
		    <div style='font-size: 10pt; text-align: center;'>
			<div id='result1c' style="height: 10px;"></div><br>
			<div id='result1s' style="height: 10px;"></div>
		</div>
	</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;聯絡電話: <input type="text" class="form-control form-control-user" name="phone" id='phone' size='24' onblur="checkphone()" required placeholder="請輸入聯絡電話" autocomplete="on">
			<span id="idsp2"></span>
		<div style='font-size: 10pt; text-align: center;'>
			<div id='result2c' style="height: 10px;"></div><br>
			<div id='result2s' style="height: 10px;"></div>			
		</div>
		</div>	
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;密碼: <input type="text" class="form-control form-control-user" name="password" id='password' onblur="checkPwd()" required placeholder="請輸入密碼" autocomplete="on"><br>
			 <span id="idsp3"></span>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result3c' style="height: 10px;"></div><br>
			<div id='result3s' style="height: 10px;"></div>
		</div>
		</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;電子郵件: <input type="text" class="form-control form-control-user" name="email" id='email' onblur="checkEmail()" required placeholder="請輸入信箱" autocomplete="on"><br>
			 <span id="idsp4"></span>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result4c' style="height: 10px;"></div><br>
			<div id='result4s' style="height: 10px;"></div>
		</div>
		</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;通訊地址: <input type="text" class="form-control form-control-user" name="address" id='address' onblur="checkAddress()" required placeholder="請輸入通訊地址" autocomplete="on"><br>
			<span id="idsp5"></span>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result5c' style="height: 10px;"></div><br>
			<div id='result5s' style="height: 10px;"></div>
		</div>
		</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;產業類別: <input type="text" class="form-control form-control-user" name="businessCategory" id='businessCategory' onblur="checkBusinessCategory()" required placeholder= "請輸入產業類別" autocomplete="on"><br>
			<span id="idsp6"></span>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result6c' style="height: 10px;"></div><br>
			<div id='result6s' style="height: 10px;"></div>
		</div>
		</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;官方網站: <input type="text" class="form-control form-control-user" name="officialWebsite" id='officialWebsite' onblur="checkofficialWebsite()" required placeholder= "請輸入官方網站" autocomplete="on"><br>
			<span id="idsp7"></span>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result7c' style="height: 10px;"></div><br>
			<div id='result7s' style="height: 10px;"></div>
		</div>
		</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
		&nbsp;標記: <input type="text" class="form-control form-control-user" name="remarks" id='remarks' autocomplete="on"><br>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result8c' style="height: 10px;"></div><br>
			<div id='result8s' style="height: 10px;"></div>
		</div>
		</div>
	<div class="col-sm-7 mb-3 mb-sm-0">
			&nbsp;銀行帳戶: <input type="text" class="form-control form-control-user" name="bankAccount" id='bankAccount' onblur="checkbankAccount()" required placeholder= "請輸入銀行帳戶" autocomplete="on"><br>
			<span id="idsp8"></span>
		<div style='font-size: 10pt; text-align: center;'>	 
			<div id='result9c' style="height: 10px;"></div><br>
			<div id='result9s' style="height: 10px;"></div>
		</div>
		</div>
	<tr height='50'>		
		<td colspan='3' align='center' class="btn btn-primary btn-user btn-block"><button class="btn btn-primary btn-user btn-block" id='sendData' >送出</button></td>
	</tr>		
			</table>
		</fieldset>
	<hr>
	<!-- </form>	 -->
	
	<p>	
	<a href="<c:url value='/partnerlogin'  />">回前頁</a>
<hr>
</div>
</div>
</div>
</div>
</div>
</div>
<%@include file="../Footer.jsp"%>
</body>
</html>