<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<style type="text/css">
div#submit {
    text-align: center;
}
input#login, #findPw {
    width: 40%;
    font-size: 18px;
    height: 50px;
}
div#findresult {
    margin: 10% 0;
    font-weight: 500;
}
div#id {
    margin: 5% 0;
    font-weight: 600;
}
</style>
<script type="text/javascript">	
	function popLogin(){
		location.href='loginForm.do?id=${id}';
	}
	function popFindPw(){
		location.href='findFormPw.do?id=${id}';
	}
</script>
</head>
<body>
<form>
	<div class="title">
		<h1><a href="../main/main.jsp">MODU</a></h1>
	</div>
	<div class="div">
		<h4>아이디 찾기 결과</h4>
	</div>
	<hr>
	<div class="div">
		<h4>회원님의 아이디 찾기가 완료되었습니다.</h4>
		<h6>다음 정보로 가입된 아이디가 있습니다.</h6>
	</div>
	<div id="findresult">
		<span>이메일:</span><span>${email}</span>
		<div id="id">${id}</div>
	</div>
	<div class="div" id="submit">
		<input type="button" value="로그인" id="login" onclick="popLogin()">
		<input type="button" value="비밀번호찾기" id="findPw" onclick="popFindPw()">
	</div>			
</form>
</body>
</html>