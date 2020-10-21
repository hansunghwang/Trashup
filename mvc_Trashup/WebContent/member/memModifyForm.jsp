<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page import="common.*" %>

<%-- <% 

//1. db연결
Connection conn = DB.getConnect();
request.setCharacterEncoding("utf-8");

//2. sql문 작성
String sql = "SELECT * FROM tup_member WHERE ID = ?";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1,id);

//3. sql문 실행
ResultSet rs = stmt.executeQuery();

//4. id중복검사 결과 값
rs.next();

%> --%>
 
    <!-- 회원 정보 상세 보기 -->
    <div class="form" id="myInfoView">
		<form class="formSet" name="memReg" >
			<%-- <label>아이디</label> : <%=rs.getString("id") %> <br><br>
			<label>이름</label> : <%=rs.getString("name") %> <br><br>
			<label>별명</label> : <%=rs.getString("nickname")%><br><br><br><br> --%>
			<input type="button" value="수정하기" onclick="memModify(1)">
			<input type="button" value="탈퇴하기" onclick="delConfirm()">
		</form>
	</div>
     
    <!-- 회원 정보 수정 -->
    <div class="form" id="myInfoModify" style="display:none">
		<form class="formSet" name="memReg" method="post" action="<%=ROOT %>/member/modifyProc.jsp" onsubmit="return formCheck2()">
			<div>
				
				<%-- <input type="text" name="id" size="20" placeholder="아이디" value="<%=rs.getString("id") %>" readOnly>  --%>
				<font style="font-size:8px; color:red">변경 불가</font>
				<br>
				<%-- <input type="text" name="name" maxlength="20" size="20" placeholder="이름" value="<%=rs.getString("name") %>"> <br>
				<input type="text" name="nickname" maxlength="20" size="20" placeholder="별명" value="<%=rs.getString("nickname") %>"> <br> --%>
				 <br>
				
				
				<input type="submit" value="수정완료">
				<input type="reset" value="정정">
				<input type="button" value="취소" onclick="memModify(2)">
			</div>
		</form>
	</div>	
<script>

function delConfirm() {
	if (confirm("회원 탈퇴 하시겠습니까?")){
		location.href="memDel.jsp"		
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