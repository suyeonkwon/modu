<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
textarea#comment {
    width: 100%;
}
</style>
<script type="text/javascript">
$(function(){
	$("#share").click(function(){			
	var f = document.forms.form;
	opener.name="Page";
	f.target=opener.name;
	f.submit();
	window.close();
	})
})
</script>
</head>
<body>
<form action="share.do?tripNo=${param.tripNo}" name="form" method="post" enctype="multipart/form-data">
<h1>���������ϱ�</h1>
<hr>
<label>����
<textarea rows="10" id="comment" name="comment" placeholder="�̹� ���࿡ ���� �Ұ����� �ۼ��� ������:)"></textarea>
</label>
<label>���� ��ǥ �̹���
	<input type="file" id="picutre" name="picture">
</label>
<hr>
<input type="submit" value="����" id="share" name="share">
</form>
</body>
</html>