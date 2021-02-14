<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<style type="text/css">
input#email,#id {
    width: 30em;
}
input[type="submit"] {
    width: 40%;
    height:50px;
}
div#submit {
    text-align: center;
}
</style>
<script type="text/javascript">	
	function check(){
		var email = $("#email").val();
		var id = $("#id").val();
		if(email==''){
			alert("이메일을 입력해주세요")
			return false;
		}
		if(id==''){
			alert("아이디를 입력해주세요")
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="findPw.do" method="post" name="f" id="findPw" onsubmit="return check()">
	<div class="title">
		<h1><a href="../main/main.jsp">MODU</a></h1>
	</div>
	<div class="div">
		<h4>비밀번호 찾기</h4>
	</div>
	<hr>
	<div class="div">
		<h4>아이디</h4>
		<h6>회원가입시 입력한 아이디를 입력해주세요</h6>
		<c:if test="${param.id!=null}">
			<input type="text" value="${param.id}" id="id" name="id">
		</c:if>
		<c:if test="${param.id==null}">
			<input type="text" value="" id="id" name="id">
		</c:if>
	</div>	
	<div class="div">
		<h4>이메일</h4>
		<h6>회원가입시 입력한 이메일을 입력해주세요</h6>
		<input type="text" value="" id="email" name="email">
	</div>
	<div class="div" id="submit">
		<input type="submit" value="확인">
	</div>			
</form>
</body>
</html>