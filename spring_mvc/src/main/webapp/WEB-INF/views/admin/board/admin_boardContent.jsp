<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%@ include file="../header.jsp" %>

</head>
<body>
<%@ include file="../menu.jsp" %>
<c:if test="${sessGrade == '1' || sessGrade == '2'}">
	<!-- 세부 내용 -->
	<div id="noticeShow" class="noticePageStyle">
		<form name="noticeDetailFrom" method="post" action="boardDelete.bo" onsubmit="return delConfirm()" >
			<p>▣ 게시물</p>
			<hr>
				<c:forEach items="${list}" var="dto">
					<div id="noticeDetail">
						<label>제목: </label> ${dto.title}
						<br>
						<br>
						<font class="wdateCnt">작성일자: ${dto.wDate}</font>
						<br>
						<font class="wdateCnt">좋아요: ${dto.cnt}</font>
						<br>
						<font class="wdateCnt">작성자: ${dto.id}</font>
						<br>
						<font class="wdateCnt">공개여부: ${dto.isOpen}</font>
						<br>
						<br>
						<c:if test="${dto.saveFile != null}">
							<div style="max-width:600px">
								<img src="<%=ROOT %>/fileUpload/${dto.saveFile}" class="imgCircle" alt="게시물-${dto.id}" width="100%" height="100%">
							</div>
						</c:if>
						<br>
						<p>카테고리: ${dto.category}</p>
						<label>내용 </label><br> 
						<div class="contentDetail">
							<font>${dto.content}</font>
						</div>
						<input name="delSeqNum" type="hidden" value="${dto.seqNum}">
					</div>
				</c:forEach>			
			<br>
			<br>
			<input type="submit" value="삭제">	
		</form>
	</div>	
	
	<%@ include file="../footer.jsp" %>
</c:if>

<script>
function delConfirm() {
	if (confirm("삭제 하시겠습니까?")){		
	} else{		
		return false;
	}
}

</script>

</body>
</html>