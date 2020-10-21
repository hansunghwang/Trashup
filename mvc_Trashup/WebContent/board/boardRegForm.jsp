<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>

	<c:if test="${sName != null}">
		<div class="row">
		  <div class="card cardBoardReg">	
				<form name="newRegForm" method="post" action="boardReg.bo" enctype="multipart/form-data">
		     		<input name="title" type="text" size="20" placeholder="제목" required>
		     		<br>
		     		<br>
		     		<font class="wdateCnt">공개 여부: 
						<input type="radio" name="isOpen" value="Y" style="height:auto" checked>공개
						<input type="radio" name="isOpen" value="N" style="height:auto" >비공개
					</font>
					<br>
		     		<div id="image_container"> <font id="middleText">사진</font> </div><br>
		     		<div id="boardCheckBox">
			     		<input type="checkbox" name="category" value="1" style="height:auto">General
						<input type="checkbox" name="category" value="2" style="height:auto">Plastic
						<input type="checkbox" name="category" value="3" style="height:auto">Paper
						<input type="checkbox" name="category" value="4" style="height:auto">Can
						<input type="checkbox" name="category" value="5" style="height:auto">Glass
						<input type="checkbox" name="category" value="6" style="height:auto">Other
						<input type="checkbox" name="category" value="7" style="height:auto">Unknown
					</div>
		     		<textarea name="content" rows="8" cols="40"></textarea><br>
		     		<input type="file" name="file1" accept="image/*" value="업로드" onchange="setThumbnail(event); buttonNone();" multiple required/>
		     		<input type="button" value="정정" style="float:right; margin-right:10px" onclick="javascript:history.back();">
		     		<input type="submit" accept="image/*" value="게시" style="float:right">
		     		<input type="hidden" name="id" value="${sessId}">
		     	</form>
			</div>
		</div>
	</c:if>

<%@ include file="../footer.jsp" %>

<script src="JS/w3js.js"></script>

<script> 
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