<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ı� �۾��� �Խ���</title>
<link rel="stylesheet" href="../resource/css/style-board.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<script type="text/javascript" src=""></script>
<style type="text/css">
	td {
	    background-color: white;
	    width: 30px;
	}

section#main {
    margin: 0 20%;
}

</style>
<script type="text/javascript">
var citycheck=0;
var placecheck=0;
var city = $("#city").val();
var place=$("#place").val();
	function check(){
		if(form.category.value==''){
			alert("ī�װ��� �������ּ���");
			return false;
		}
		if(form.subject.value==''){
			alert("������ �Է����ּ���");
			return false;
		}
		if(CKEDITOR.instances['content1'].getData()==''){
			alert("������ �Է����ּ���");
			return false;
		}
		if(citycheck==0 || city==''){
			alert("���ø� �������ּ���");
			return false;
		}
		if(placecheck==0 || place==''){
			alert("��Ҹ� �������ּ���");
			return false;
		}
		return true;
	}
	
	var windowObj;
	function popSearchCity(){
		var winWidth=600;
		var winHeight=300;
		var popX = (window.screen.width-winWidth)/2
		var popY = (window.screen.height-winHeight)/2;
		var Option="width="+winWidth+",height="+winHeight
						+",left="+popX+",top="+popY;
		windowObj = window.open("searchFormCity.do","",Option)
		citycheck=1;
	}
	
	var windowObj2;
	function popSearchPlace(){
		if(citycheck==0 || city==''){
			alert("���ø� ���� �������ּ���");
			return false;
		}
		var code=$("#countryCode").val();
		var winWidth=600;
		var winHeight=300;
		var popX = (window.screen.width-winWidth)/2
		var popY = (window.screen.height-winHeight)/2;
		var Option="width="+winWidth+",height="+winHeight
						+",left="+popX+",top="+popY;
		windowObj2 = window.open("searchFormPlace.do?countryCode="+code,"",Option)
		placecheck=1;
	}

</script>
</head>
<body>
<section id="main" class="wrapper style1">
<form action="write.do" method="post" name="form" onsubmit="return check()">
<input type="hidden" id="url" name="url">
<input type="hidden" id="address" name="address"> 
<input type="hidden" id="countryCode" name="countryCode">
	<table>
		<tr><td>ī�װ�</td>
			<td><select id="category" name="category">
					<option value="" selected>ī�װ� ����</option>
					<option value="1">����</option>
					<option value="2">����</option>
					<option value="3">ī��</option>
					<option value="4">��Ƽ��Ƽ/������</option>
				</select>
			</td></tr>
			<tr><td>���ø�</td><td><input type="text" id="city" value="" name="city">
								<input type="button" name="search" class="search" id="searchCity" value="�˻�" onclick="popSearchCity()"></td></tr>			
			<tr><td>���</td><td><input type="text" id="place" value="" name="place">
								<input type="button" name="search" class="search" id="searchPlace" value="�˻�" onclick="popSearchPlace()"></td></tr>	
		<tr><td>����</td><td><input type="text" name="subject" id="subject"></td></tr>
	<tr><td colspan="2"><textarea rows="30" name="content" id="content1"></textarea></td></tr>
	<script type="text/javascript">CKEDITOR.replace("content1",
			{filebrowserImageUploadUrl: "imgupload.do"});</script>
		<tr><td colspan="2" id="submitzone">
			<input type="submit" value="���" id="write"></td></tr>
	</table>
</form>
</section>
</body>
</html>