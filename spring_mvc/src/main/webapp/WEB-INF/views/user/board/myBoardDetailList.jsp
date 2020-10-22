<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>

<%
int num =0;
%>
<c:if test="${sId != null}">
	<div class="row">
	  <div class="leftcolumn"> 
		<c:choose>
			<c:when test="${fn:length(list) gt 0}">
				<c:forEach items="${list}" var="dto">
					<form name="boardDetailListForm" method="post" action="/board/boardDelete" onsubmit="return boardDeleteConfirm()">
						<div class="card cardLeft" id="${dto.seqNum}">
							<input type="hidden" name="seqNum" value="${dto.seqNum}">
							<input type="submit" class="boardModify_cancel" value="삭제">
					  		<input type="button" onclick="location.href='/board/boardModify?ref=${dto.seqNum}'" class="boardModify_cancel" value="수정">
						    <h3>${dto.title}</h3>
						    <font style="float:right" color="grey">작성일: ${dto.wDate}</font>
						    <font style="float:left" color="grey">작성자: ${dto.nickname}</font><br>
						    <hr>
					     <div class="fakeimg">
						    <img src="#" class="imgCircle" alt="게시물<%=++num %>" width="100%" height="100%">
						 </div>
					 		<p>${dto.category}</p>
					        <p>${dto.content}</p>
					        <hr>
						    <a onclick="alert('좋아요')" class="likeButton" title="like"><img src="/img/하트.png" width = "25" height="20"></a>
					    </div>
				   	</form>
				</c:forEach>
			</c:when>
			<c:otherwise>
	
			  	<div class="card cardLeft">
			  	게시물이 없습니다.
			  	</div>
		  	</c:otherwise>
		 </c:choose>
	   </div>
	</div>
</c:if>

<%@ include file="../footer.jsp" %>

<script src="/js/w3js.js"></script>
<script>
function boardDeleteConfirm() {
	if(!confirm("게시물을 삭제 하시겠습니까?")){
		return false;
	}	
}
</script>

</body>
</html>
