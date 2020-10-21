<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page import="common.*" %>

<% 

%>
    
    <!-- 비밀번호 변경 -->
    <br>
    <div class="form" id="myPwChange">
		<form name="pwChangeForm" action="pwChange.jsp" onsubmit="return formCheck()" >
			<input type="password" name="newPw" maxlength="20" size="20" placeholder="새로운 비밀번호" required><br>
			<input type="password" name="newPwConfirm" maxlength="20" size="20" placeholder="새로운 비밀번호 확인" onchange="pwDoubleCheck()" required>
			<span id="pwCheckRes2" style="font-size:10px; color:red"></span>
			<input type="hidden" name="isPwCheck2" id="isPwCheck2" value="0"><br>
			<input type="submit" value="변경">
			<input type="button" value="취소" onclick="location.href='mypage.jsp'">
		</form>
	</div>
 
	
<script>
function formCheck(){
	var isPwCheck2 = document.getElementById("isPwCheck2").value;
	if (isPwCheck2 == "0"){
		alert("회원정보를 확인해 주세요");
		return false;
	} else {
		return confirm("비밀번호를 변경 하시겠습니까?");
	}
}


function pwDoubleCheck() {
	var newPw = document.forms["pwChangeForm"]["newPw"].value;
	var newPwConfirm = document.forms["pwChangeForm"]["newPwConfirm"].value;
	var msg ="";
	if (newPw == newPwConfirm) {
		document.getElementById("isPwCheck2").value = "1";
		msg = "일치합니다";
	} else {
		document.getElementById("isPwCheck2").value = "0";
		msg = "일치하지 않습니다";
	}
	
	document.getElementById('pwCheckRes2').innerHTML = msg;
	
}

</script>