<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>
<% int num = 1;%>
<c:if test="${sId != null}">
	<div class="row">
	  <div class="middleColum"> 
	  	<c:forEach items="${list}" var="dto">
		  <div class="card cardLeft">
		  	  <form name="boardDetailModify" method="post" action="boardUpdate.bo#${dto.seqNum}" onsubmit="boardModifyCheck()">
		  	  	 <input type="hidden" name="seqNum" value="${dto.seqNum}">
			  	 <input type="submit" style="float:right" value="완료">
			     <input type="text" name="title" size="50" maxlength="100"  value="${dto.title}"><br>
			      <font style="float:right" color="grey">작성일: ${dto.wDate}</font><br>
			      <font class="wdateCnt">공개 여부: 
					<input type="radio" name="isOpen" value="Y" onchange="changeCheck()" <c:if test="${dto.isOpen == 'Y'}"> checked </c:if>>공개
					<input type="radio" name="isOpen" value="N" onchange="changeCheck()" <c:if test="${dto.isOpen == 'N'}"> checked </c:if>>비공개
				 </font>
			  	 <div class="fakeimg">
				  	<img src="${dto.saveFile}" class="imgCircle" alt="게시물 ${dto.seqNum}" width="100%" height="100%"><br>
				  	<font color="blue" size="2px">사진을 변경하실 수 없습니다.</font><br><br> 
			  	 </div>
			  	 <div id="boardCheckBox">
				 	<c:if test="${dto.category != null}">
				 		<c:set var="category" value="${dto.category}"></c:set>
				 		<c:set var="categ" value="${fn:split(category, '#')}"> </c:set>
				 		<c:set var="array"> General, Plastic, Paper, Can, Glass, Other, Unknown </c:set>
			 			<c:forEach var="arry" items="${array}">
			 				<input type='checkbox' name='category' value='<%=num++%>' style='height:auto'
			 				<c:forEach var="cat" items="${categ}">
			 					<c:if test="${fn:trim(arry) == fn:trim(cat)}">
			 						checked
			 					</c:if>
			 				</c:forEach>
			 				>${arry}
			 			</c:forEach>
				 	</c:if>
			 	 </div>
				 <textarea name="content" rows="5" cols="70"> ${dto.content} </textarea>
			  	</form>
			</div>
		  </c:forEach>
		</div>
	</div>
</c:if>

<%@ include file="../footer.jsp" %>

<script src="/js/w3js.js"></script>
<script>
function boardModifyCheck() {
	if(!confirm("게시물을 수정하시겠습니까?")){
		return false;
	}	
}
</script>

</body>
</html>
