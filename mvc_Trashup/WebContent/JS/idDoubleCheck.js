function idDoubleCheck(ROOT_PATH){
	var id = document.forms["memReg"]["id"].value;
	
	var xhr = new XMLHttpRequest(); //ajax 객체 생성
	xhr.onreadystatechange = function(){
	
		if(xhr.readyState === 4) {
			if(xhr.status === 200){
				var idCheck = document.getElementById("isIdCheck");
				var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				var msg;
				if(id.match(regEmail) != null) {
					var data = xhr.responseText.trim();
					console.log(data);
					if(data == "0"){
						idCheck.value ="1";
						msg = "사용 가능한 아이디 입니다";
					} else {
						idCheck.value = "0";
						msg = "중복된 아이디 입니다";
					}
				} else {
					idCheck.value = "0";
					msg = "이메일 형식으로 작성해 주세요";
				}
				document.getElementById('idCheckRes').innerHTML = msg;
				
			} else {
				console.log('서버 에러(403, 404)');
			}		
		}
	};
	
	var url = ROOT_PATH + "/member/idSearch.jsp?id="+ id;
	xhr.open("get", url, true);
	xhr.send();
	
}
