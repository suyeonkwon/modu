<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기 결과</title>
<style type="text/css">
div#submit {
    text-align: center;
}
input[type="button"]{
    width: 40%;
    font-size: 18px;
    height: 50px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
</head>
<body>
<form>
	<div class="title">
		<h1><a href="../main/main.jsp">MODU</a></h1>
	</div>
	<div class="div">
		<h4>비밀번호 찾기 결과</h4>
	</div>
	<hr>
	<div class="div">
		<h4>회원님의 비밀번호 찾기가 완료되었습니다.</h4>
	</div>
	<div id="findresult">
		<div id="id">회원가입시 설정한 이메일로 비밀번호가 발송되었습니다.</div>
	</div>
	<div class="div" id="submit">
		<input type="button" value="확인" onclick="location.href='../main/main.do'">
	</div>			
</form>
</body>
</html>