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
input#email {
    width: 30em;
}
input[type="submit"] {
    width: 40%;
}
div#submit {
    text-align: center;
}
</style>
<script type="text/javascript">	
	function check(){
		var email = $("#email").val();
		if(email==''){
			alert("�̸����� �Է����ּ���")
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<form action="findId.do" method="post" name="f" id="findId" onsubmit="return check()">
	<div class="title">
		<h1><a href="../main/main.jsp">MODU</a></h1>
	</div>
	<div class="div">
		<h4>���̵� ã��</h4>
	</div>
	<hr>
	<div class="div">
		<h4>�̸���</h4>
		<h6>ȸ�����Խ� �Է��� �̸����� �Է����ּ���</h6>
		<input type="text" value="" id="email" name="email">
	</div>
	<div class="div" id="submit">
		<input type="submit" value="Ȯ��">
	</div>			
</form>
</body>
</html>