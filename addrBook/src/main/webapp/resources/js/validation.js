/**
 * 데이터 길이 확인
 */
 
 function checkform(){
	let form = document.loginform;
	let id = form.id.value;
	let pw = form.passwd.value;
	
	//아이디 길이 체크
	if(id.length < 4 || id.length > 12){
		alert("010101010!!!111010101!!!");
		form.id.focus();
		return false;
	}else if(pw.length != 5){
		alert("!!#!@#@!@$!@$!$$@");
		form.passwd.focus();
		return false;
	}else{
		form.submit();
	}
	
}