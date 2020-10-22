<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common_header.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="../topnav.jsp" %>

	<c:if test="${sName != null}">
		<div class="row">
		  <div class="card cardBoardReg">	
				<form name="newRegForm" method="post" action="boardReg.bo" enctype="multipart/form-data" onsubmit="return insertConfirm()">
		     		<input name="title" type="text" size="20" placeholder="제목" required>
		     		<br>
		     		<br>
		     		<font class="wdateCnt">공개 여부: 
						<input type="radio" name="isOpen" value="Y" style="height:auto" checked>공개
						<input type="radio" name="isOpen" value="N" style="height:auto" >비공개
					</font>
					<br>
					<div id="xImg" style="display:none">
						<a style="cursor:pointer"><img src="/img/빨강엑스.jpg" style="float:right; width:20px; height:20px; margin-right:50px" onclick="imageNone();"></a>
					</div>
					<div id="middleImg">
		     				<a style="cursor:pointer">
			     				<input type="file" name='file1' style='display:none;' accept="image/*" value="업로드" onchange="setThumbnail(event);" required>
								<input type='hidden' name='file2' id='file2'>
								<img src="/img/menuplus.png" style="border-radius:50%; width:250px; height:250px; margin-top:25px; margin-left:28%" 
								onclick='document.all.file1.click(); document.all.file2.value=document.all.file1.value'>    			
		     				</a>
		     			</div> 
		     		<div id="image_container" style="display:none"> 
		     		</div><br>
		     		
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
		     		<input type="submit" accept="image/*" value="게시">
		     		<input type="hidden" name="id" value="${sessId}">
		     		<input type="hidden" id="changing" value="notChanged">
		     	</form>
			</div>
		</div>
	</c:if>

<%@ include file="../footer.jsp" %>

<script src="/js/w3js.js"></script>

<script> 
function setThumbnail(event) { 
	var reader = new FileReader(); 
	
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		img.id = 'img';
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	
	document.getElementById("middleImg").style.display = "none";
	document.getElementById("image_container").style.display = "block";
	document.getElementById("changing").value = "changed";
	document.getElementById("xImg").style.display = "block";
} 

function imageNone() {
	var div = document.getElementById("image_container");
	var img = document.getElementById("img");
	div.removeChild(img);
	
	document.getElementById("middleImg").style.display = "block";
	document.getElementById("image_container").style.display = "none";
	document.getElementById("xImg").style.display = "none";
	document.getElementById("changing").value = "notChanged"
}

function insertConfirm() {
	if(document.getElementById("changing").value == "changed"){
		if (!confirm("등록 하시겠습니까?")){	
			return false;
		}
	} else {
		alert('사진을 업로드 해주세요');
		return false;
	}
}

</script>

</body>
</html>