<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ include file="../header.jsp" %>

<%
int num= 0;
String [] memArr = null;
%>
</head>
<body>


<%@ include file="../menu.jsp" %>
<c:if test="${sessGrade == '1' || sessGrade == '2'}">
	<div id="noticeContents" class="noticePageStyle">
		<p class="notice">◎탈퇴 회원리스트</p>
		<br>
		<br>
		<br>
		<form name="memSearch" method="post" action="memDel.do" onsubmit="return dateCheck()">
			<input type="number" id="keyword" name="keyword" placeholder="탈퇴요청일 입력(yyyymmdd)"
			<c:if test="${keyword != null}">
	  			 value="${keyword}"
			</c:if> >
	  		<input type="submit" value="검색">
		</form>
		<br>
			
		<c:choose>
			<c:when test="${fn:length(list) gt 0}">
				<form name="delMember" method="post" action="delAllMem.do" onsubmit="return deleteCheck()">
					<input type="hidden" name="check" value="checked">
					<input class="del" type="button" onclick="selDelCheck()" value="회원 일괄 삭제">
					<input class="del" type="submit" value="선택 회원 삭제"><br>
					<input type="hidden" name="keyword" value="${keyword}">
					<font class="">인원수 ${fn:length(list)}명</font>
					<br>
					<br>
					<table border="1">
						<tr>
							<td class="smallLine">선택</td>
							<td class="smallLine">순번</td>
							<td class="third">ID</td>
							<td class="second">이름</td>
							<td class="smallLine">등급</td>
							<td class="second">가입일자</td>
							<td class="second">탈퇴요청일자</td>		
						</tr>			
				
						<c:forEach items="${list}" var="dto">
							<tr align="center" onClick="location.href='#?seqNum=#'" style="cursor:pointer">
							<td class="firstLine">
								<input type="checkbox" name="delid" value="${dto.id}">
							</td>
							<td> <%=++num %></td>	
							<td>${dto.id } </td>
							<td>${dto.name} </td>
							<td>${dto.grade} </td>
							<td>${dto.rDate} </td>
							<td>${dto.delDate} </td>
							</tr>
						</c:forEach>
					</table>
				</form>
			</c:when>
			<c:otherwise>
				<br>
				<hr>
				<br>
				<font style="margin-left:50px">탈퇴 요청 회원이 없습니다.</font><br>
			</c:otherwise>
		</c:choose>
		
	</div>	
	
	<%@ include file="../footer.jsp" %>
</c:if>

<%@ include file="../common/preAction.jsp" %>


<script type="text/javascript">
function deleteCheck() {
	if(!confirm('선택된 회원을 일괄 삭제 하시겠습니까?')){
		return false;
	}
}

function selDelCheck() {
	var keyword = document.forms["memSearch"]["keyword"].value;
	if(!confirm('회원을 일괄 삭제 하시겠습니까?')){
		return false;
	} else {
		location.href='delAllMem.do?keyword='+ keyword;
	}
}

function dateCheck() {
	
	var date = document.getElementById("keyword").value.length;
	if (date == 0) {
		return true;
	} else if(date != 8) {
		alert('형식에 맞게 입력해주세요(yyyymmdd)')
		return false;
	}
}
</script>

</body>
</html>