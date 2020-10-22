<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, java.util.*, java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
    
<%@ include file="../header.jsp" %>
<%@ include file="../menu.jsp" %>
<%
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy년 MM월 dd일");
String today = formatter.format(new java.util.Date());
%>

</head>
<body>
<c:if test="${sessGrade == '1' || sessGrade == '2'}">
	<div>
		<form name="newRegForm" id="helpRegForm" class="noticePageStyle noticeRegForm" method="post" action="helpReg.he" onsubmit="return RegConfirm()" enctype="multipart/form-data">
			<p>▣ 공지사항</p>
				
			<input type="text" name="title" size="50" placeholder="제목" required>
			<br>
			<br>
			<font class="wdateCnt">공개 여부: 
				<input type="radio" name="isOpen" value="Y" checked>공개
				<input type="radio" name="isOpen" value="N" >비공개
			</font>
			<br><br>
			<div id="image_container"> <font id="middleText">사진</font> </div><br>
			<TEXTAREA name="content" COLS="70" ROWS="8" placeholder="내용" required></TEXTAREA>
			<br>
			<input type="file" name="file1" accept="image/*" value="업로드" onchange="setThumbnail(event); buttonNone();"/>
			<br>
			<input style="float:left" type="submit" value="등록">	
			<font style="float:left; margin-left:250px">작성일자: <%=today %></font>
			<input type="hidden" name="id" value="${sessId}">
			<br>
		</form>
	</div>
		
	<%@ include file="../footer.jsp" %>
</c:if>

<script>

function RegConfirm() {
	if (confirm("등록 하시겠습니까?")){	
	} else{		
		return false;
	}
}

function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		
		}; 
		reader.readAsDataURL(event.target.files[0]); 
} 

function buttonNone() {
	document.getElementById("middleText").style.display = "none";
}

</script>

</body>
</html>