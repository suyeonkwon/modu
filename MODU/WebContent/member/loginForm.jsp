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
			<input type="text" value="" placeholder="���̵�" id="id" name="id">
		</c:if>		
		<input type="password" value="" placeholder="��й�ȣ" id="pw" name="pw">
		<input type="submit" value="�α���" id="loginbt">
		<div>
			<h6><a href="findFormId.do">���̵�ã��</a><a href="findFormPw.do ">��й�ȣã��</a></h6>
		</div>
	</form>
</body>
</html>