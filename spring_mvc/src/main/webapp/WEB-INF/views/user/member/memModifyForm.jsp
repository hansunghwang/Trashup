<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page import="com.trashup.mapper.*" %>
 
<c:if test="${sId != null}">
    <!-- 회원 정보 상세 보기 -->
    <div class="form" id="myInfoView">
		<form class="formSet" name="memReg" method="post" action="withdrawal.do" onsubmit="return delConfirm()">
			<input type="hidden" name="id" value="${sId}">
			<label>아이디</label> : ${sId} <br><br>
			<label>이름</label> : ${sName} <br><br>
			<label>별명</label> : ${sNickname} <br><br><br><br>
			<input type="button" value="수정하기" onclick="memModify(1)">
			<input type="submit" value="탈퇴하기">
		</form>
	</div>
     
    <!-- 회원 정보 수정 -->
    <div class="form" id="myInfoModify" style="display:none">
		<form class="formSet" name="memReg" method="post" action="memberModify.do?div_sel_value=3" onsubmit="return formCheck2()">
			<div>
				
				<input type="text" name="id" size="20" placeholder="아이디" value="${sId}" readOnly>
				<font style="font-size:8px; color:red">변경 불가</font>
				<br>
				<input type="text" name="name" maxlength="20" size="20" placeholder="이름" value="${sName}"> <br>
				<input type="text" name="nickname" maxlength="20" size="20" placeholder="별명" value="${sNickname}"> <br>
				 <br>
				
				
				<input type="submit" value="수정완료">
				<input type="reset" value="정정">
				<input type="button" value="취소" onclick="memModify(2)">
			</div>
		</form>
	</div>	
</c:if>
<script>

function delConfirm() {
	if (!confirm("회원 탈퇴 하시겠습니까?")){
		return false	
	}
}

function memModify(num) {
	if (num == 1) {
		document.getElementById("myInfoView").style.display = "none";
		document.getElementById("myInfoModify").style.display = "block";
	} else {
		if (confirm("입력한 정보가 사라집니다. 취소 하시겠습니까?")){	
			document.getElementById("myInfoView").style.display = "block";
			document.getElementById("myInfoModify").style.display = "none";
		}
	}
}

</script>