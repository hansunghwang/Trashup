<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ page import="common.*" %>

<%-- <% 

SimpleDateFormat a= new SimpleDateFormat("yyyy년 MM월 dd");
sql = "SELECT count(*) cnt FROM tup_board where id = '"+ id +"'";
stmt = conn.prepareStatement(sql);
ResultSet rs2 = stmt.executeQuery();
rs2.next();
int boardCnt = rs2.getInt("cnt");

%>

<div id="noticeContents" class="noticePageStyle">
	<p class="notice">▣ 내 게시물</p>
	<br>
	<br>
	
<% if(boardCnt > 0) { %>
	<font class="noticeCnt">총 <%=boardCnt %> 개의 게시물</font>
	<br>
<%
// 2. SQL문 작성
sql = "SELECT * from tup_board where id = '"+ id +"'";
stmt = conn.prepareStatement(sql);
ResultSet rs3 = stmt.executeQuery();
rs3.last();

%> 
	<div class="myBoardAll">
<%
	if(rs3.getString("savefile") != null){
%> 
		<div class="myBoardStyle">
			<a href="boardDetail.jsp#<%=rs3.getString("seqNum") %>" style="width:60x;height:100px"><img src="<%=ROOT %>/fileUpload/<%=rs3.getString("savefile") %>" style="width:100%;height:100%"></a>
		</div>	
<%
	} else{
%>
		<div class="myBoardStyle">
			<a href="boardDetail.jsp#<%=rs3.getString("seqNum") %>"><%=rs3.getString("title") %></a>
		</div>
<%				
	}
		while(rs3.previous()){
			if(rs3.getString("savefile") != null){
%>
		<div class="myBoardStyle">
			<a href="boardDetail.jsp#<%=rs3.getString("seqNum") %>" style="width:60x;height:100px"><img src="<%=ROOT %>/fileUpload/<%=rs3.getString("savefile") %>" style="width:100%;height:100%"></a>
		</div>	
<%
			} else{
%>
		<div class="myBoardStyle">
			<a href="boardDetail.jsp#<%=rs3.getString("seqNum") %>"><%=rs3.getString("title") %></a>
		</div>
<%				
			}
		}

%>
	</div>
<% } else {%>
	<br>
	<hr>
	<br>
	<font style="margin-left:50px">등록된 게시물이 없습니다.</font><br>
<% }%>
</div> --%>
 
	ddd
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