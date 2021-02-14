<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프로필 사진 등록</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<style type="text/css">
	input[type="submit"] {
    font-size: small;
}
</style>
</head>
<body>
<form action="picture.do" method="post" enctype="multipart/form-data">
	<input type="file" name="picture" id="picture">
	<input type="submit" value="사진등록">
</form>
</body>
</html>