<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ ȭ��</title>
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
		<h4>���̵� ã�� ���</h4>
	</div>
	<hr>
	<div class="div">
		<h4>ȸ������ ���̵� ã�Ⱑ �Ϸ�Ǿ����ϴ�.</h4>
		<h6>���� ������ ���Ե� ���̵� �ֽ��ϴ�.</h6>
	</div>
	<div id="findresult">
		<span>�̸���:</span><span>${email}</span>
		<div id="id">${id}</div>
	</div>
	<div class="div" id="submit">
		<input type="button" value="�α���" id="login" onclick="popLogin()">
		<input type="button" value="��й�ȣã��" id="findPw" onclick="popFindPw()">
	</div>			
</form>
</body>
</html>