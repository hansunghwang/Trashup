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
		<form name="noticeDetailFrom" method="post" action="noticeDelete.ad" onsubmit="return delConfirm()" >
			<p>▣ 공지사항</p>
			<c:forEach items="${list}" var="dto">
				<div id="noticeDetail">
					<input type="hidden" name="delSeqNum" value="${dto.seqNum}">
					<label>제목: </label> ${dto.title}
					<br>
					<br>
					<font class="wdateCnt">작성일자: ${dto.wDate}</font>
					<br>
					<font class="wdateCnt">조회수: ${dto.cnt}</font>
					<br>
					<font class="wdateCnt">작성자: ${dto.id}</font>
					<br>
					<font class="wdateCnt">공개 여부: ${dto.isOpen}</font>
					<br>
					<br>
					<c:if test="${dto.saveFile != null}">
						<div style="max-width:600px">
							<img src="<%=ROOT %>/fileUpload/${dto.saveFile}" class="imgCircle" alt="게시물-${dto.id}" width="100%" height="100%">
						</div>
					</c:if>
					<br>
					<label>내용 </label><br> 
					<div class="contentDetail">
						<font>${dto.content}</font>
					</div>
				</div>	
				<br>
				<br>
				<c:if test="${dto.id == sessId}">	
					<input type="button" value="수정" onclick="noticeModify()">	
					<input type="submit" value="삭제">
				</c:if>	
			</c:forEach>
		</form>
	</div>
	
	<!-- 수정 페이지 -->
	<div id="noticeRegForm" class="noticePageStyle" style="display:none" >
		<form name="noticeModifyForm" method="post" action="noticeModify.ad" onsubmit="return modifyConfirm()" enctype="multipart/form-data" >
			<p>▣ 공지사항</p>
			<c:forEach items="${list}" var="dto">
				<input type="hidden" name="seqNum" value="${dto.seqNum}">
				<input type="hidden" name="fileSeqNum" value="${dto.fileSeqNum}">
				<label>제목: </label>
				<input name="title" type="text" size="50" value="${dto.title}" onchange="changeCheck()"> 	 
				<br>
				<br>
				<font class="wdateCnt">작성일자: ${dto.wDate}</font>
				<br>
				<font class="wdateCnt">조회수: ${dto.cnt}</font>
				<br>
				<font class="wdateCnt">작성자: ${dto.id}</font>
				<br>
				<font class="wdateCnt">공개 여부: 
					<input type="radio" name="isOpen" value="Y" onchange="changeCheck()" <c:if test="${dto.isOpen == 'Y'}"> checked </c:if>>공개
					<input type="radio" name="isOpen" value="N" onchange="changeCheck()" <c:if test="${dto.isOpen == 'N'}"> checked </c:if>>비공개
				</font>
				<br>
				<br>
				<input type="file" name='file1' style='display:none;' accept="image/*" value="업로드" onchange="setThumbnail(event)">
				<input type='hidden' name='file2' id='file2'>
				
				<div id="xImg" <c:if test="${dto.saveFile == null}"> style="display:none"</c:if>>	
					<a style="cursor:pointer"><img src="<%=ROOT %>/img/빨강엑스.jpg" style="float:right; width:20px; height:20px; margin-right:50px" onclick="imageNone(); changeCheck()"></a>
				</div>
				
				<div <c:if test="${dto.saveFile == null}"> style="display:none"</c:if> id="oldImg" class="profileStyle">
					<a style="cursor:pointer">
						<img src="${dto.saveFile}" style="border-radius:50%; width:80%; height:50%" 
							onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>
					</a>
				</div>
					
				<div <c:if test="${dto.saveFile != null}"> style="display:none" </c:if> id="image_plus" class="profileStyle">
					<a style="cursor:pointer">
						<img src="<%=ROOT %>/img/menuplus.png" style="border-radius:50%; width:250px; height:250px; margin-top:25px; margin-left:28%" 
							onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>
					</a>
				</div>
				
				<div style="display:none" id="image_container" class="profileStyle">
				</div>
				
				<input name="delCheck" type="hidden" value="imgYes">
				<input type="hidden" name="oldFileCheck" value=
					<c:if test="${dto.saveFile == null}"> "fileNo" </c:if>
					<c:if test="${dto.saveFile != null}"> "fileYes" </c:if>>
				<br>
				<label>내용 </label><br>
				<textarea id="textModify" COLS="70" ROWS="8" name="content" onchange="changeCheck()">${dto.content}</textarea>
				<input type="hidden" id="changing" value="notChanged">
				<br>
				<input type="submit" value="완료">
			</c:forEach>	
		</form>
	</div>
	<%@ include file="../footer.jsp" %>
</c:if>

<%@ include file="../common/preAction.jsp" %>

<script>

function noticeModify() {
	document.getElementById("noticeRegForm").style.display="block";
	document.getElementById("noticeShow").style.display="none";
}

function delConfirm() {
	if (!confirm("삭제 하시겠습니까?")){	
		return false;
	} 
}

function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		img.id = 'img';
		}; 
		reader.readAsDataURL(event.target.files[0]); 
		
		document.getElementById("changing").value = "changed";
		document.getElementById("image_container").style.display = "block";
		document.getElementById("oldImg").style.display = "none";
		document.getElementById("image_plus").style.display = "none";
		document.getElementById("xImg").style.display = "block";
		document.forms["noticeModifyForm"]["delCheck"].value = "imgYes";
} 


function imageNone() {
	document.getElementById("oldImg").style.display = "none";
	document.getElementById("image_plus").style.display = "block";
	document.getElementById("xImg").style.display = "none";
	document.getElementById("image_container").style.display = "none";
	document.forms["noticeModifyForm"]["delCheck"].value = "imgNo";
	document.getElementById("changing").value = "changed";
	
	if (document.getElementById("image_container") != null) {
		var div = document.getElementById("image_container");
		var img = document.getElementById("img");
		div.removeChild(img);
	}
}

function modifyConfirm() {
	if(document.getElementById("changing").value == "changed"){
		if (!confirm("수정 하시겠습니까?")){	
			return false;
		}
	} else {
		alert('내용을 수정해 주세요');
		return false;
	}
}

function changeCheck(){
	document.getElementById("changing").value = "changed";
}

</script>


</body>
</html>