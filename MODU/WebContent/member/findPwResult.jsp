<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��й�ȣ ã�� ���</title>
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
		<h4>��й�ȣ ã�� ���</h4>
	</div>
	<hr>
	<div class="div">
		<h4>ȸ������ ��й�ȣ ã�Ⱑ �Ϸ�Ǿ����ϴ�.</h4>
	</div>
	<div id="findresult">
		<div id="id">ȸ�����Խ� ������ �̸��Ϸ� ��й�ȣ�� �߼۵Ǿ����ϴ�.</div>
	</div>
	<div class="div" id="submit">
		<input type="button" value="Ȯ��" onclick="location.href='../main/main.do'">
	</div>			
</form>
</body>
</html>