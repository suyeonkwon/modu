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
			 // alert("8자리 ~ 20자리 이내로 입력해주세요.");
			  $('#validPw').html('8~20자리 이내로 입력해주세요');
			  return false;
			 }else if(pw.search(/\s/) != -1){
			  //alert("비밀번호는 공백 없이 입력해주세요.");
			  $('#validPw').html('비밀번호는 공백 없이 입력해주세요');
			  return false;
			 }else if(num < 0 || eng < 0 || spe < 0 ){
			  //alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			  $('#validPw').html('영문, 숫자, 특수문자를 혼합하여 입력해주세요');
			  return false;
			 }else {
				validpw=1;
				$('#validPw').text(' ');
			    return true;
			 }
		
	})
	//비밀번호 확인 체크
	$('#pwck').keyup(function(){
		var pw1=$('#pw').val();
		var pw2=$('#pwck').val();
		if(pw1==pw2){
			$('#checkBoxPw').text("")
			checkpw=1;
		}else{
			$('#checkBoxPw').text('비밀번호가 일치하지않습니다.')
		}
	})
})

function valid(){
	if(checkpw==0 || validpw==0){
		alert("비밀번호를 확인해주세요");
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
		<h4>비밀번호 수정</h4>
	</div>
	<hr>
	<div class="div">
		<h4>새 비밀번호</h4>
		<h6>영문/숫자/특수문자 혼합하여, 8자~20자</h6>
		<input type="password" value="" id="pw" name="pw">
		<div class="checkBox" id="validPw"></div>
	</div>
	<div class="div">
		<h4>새 비밀번호 확인</h4>
		<input type="password" value="" id="pwck" name="pwck">
		<div class="checkBox" id="checkBoxPw"></div>
	</div>	
	<div class="div" id="update">
		<input type="submit" value="비밀번호 변경">
	</div>			
</form>
</body>
</html>