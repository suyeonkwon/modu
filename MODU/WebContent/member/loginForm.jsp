<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
</head>
<body>
	<form action="login.do" name="f" id="login">
		<div class="title">
			<h1><a href="../main/main.jsp">MODU</a></h1>
		</div>
		<c:if test="${param.id!=null}">
			<input type="text" value="${param.id}" id="id" name="id">
		</c:if>
		<c:if test="${param.id==null}">
			<input type="text" value="" placeholder="아이디" id="id" name="id">
		</c:if>		
		<input type="password" value="" placeholder="비밀번호" id="pw" name="pw">
		<input type="submit" value="로그인" id="loginbt">
		<div>
			<h6><a href="findFormId.do">아이디찾기</a><a href="findFormPw.do ">비밀번호찾기</a></h6>
		</div>
	</form>
</body>
</html>