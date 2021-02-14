<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<style type="text/css">
	#validPw, #checkBoxPw, #checkBoxNick{
		color:red;
    	font-weight: 600;
    	font-size: small;
	}
</style>
<script type="text/javascript">
var checkpw=0;
var validpw=0;
$(function(){

	$('#pw').change(function(){
		 var pw = $("#pw").val();
		 var num = pw.search(/[0-9]/g);
		 var eng = pw.search(/[a-z]/ig);
		 var spe = pw.search(/[`~!@@#$%^&*|\\\'\';:\/?]/gi);
		
		 if(pw.length < 8 || pw.length > 20){
			 // alert("8�ڸ� ~ 20�ڸ� �̳��� �Է����ּ���.");
			  $('#validPw').html('8~20�ڸ� �̳��� �Է����ּ���');
			  return false;
			 }else if(pw.search(/\s/) != -1){
			  //alert("��й�ȣ�� ���� ���� �Է����ּ���.");
			  $('#validPw').html('��й�ȣ�� ���� ���� �Է����ּ���');
			  return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
			  //alert("����,����, Ư�����ڸ� ȥ���Ͽ� �Է����ּ���.");
			  $('#validPw').html('����, ����, Ư�����ڸ� ȥ���Ͽ� �Է����ּ���');
			  return false;
			 }else {
				validpw=1;
				$('#validPw').text(' ');
			    return true;
			 }
		
	})
	//��й�ȣ Ȯ�� üũ
	$('#pwck').keyup(function(){
		var pw1=$('#pw').val();
		var pw2=$('#pwck').val();
		if(pw1==pw2){
			$('#checkBoxPw').text("")
			checkpw=1;
		}else{
			$('#checkBoxPw').text('��й�ȣ�� ��ġ�����ʽ��ϴ�.')
		}
	})
})

function valid(){
	if(checkpw==0 || validpw==0){
		alert("��й�ȣ�� Ȯ�����ּ���");
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body>
<form action="updatePw.do?id=${param.id}" method="post" name="f" onsubmit="return valid()">
	<div class="div">
		<h4>��й�ȣ ����</h4>
	</div>
	<hr>
	<div class="div">
		<h4>�� ��й�ȣ</h4>
		<h6>����/����/Ư������ ȥ���Ͽ�, 8��~20��</h6>
		<input type="password" value="" id="pw" name="pw">
		<div class="checkBox" id="validPw"></div>
	</div>
	<div class="div">
		<h4>�� ��й�ȣ Ȯ��</h4>
		<input type="password" value="" id="pwck" name="pwck">
		<div class="checkBox" id="checkBoxPw"></div>
	</div>	
	<div class="div" id="update">
		<input type="submit" value="��й�ȣ ����">
	</div>			
</form>
</body>
</html>