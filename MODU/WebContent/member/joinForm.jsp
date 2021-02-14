<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입 화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<style type="text/css">
	.checkBox{
		font-weight:bold;
		font-size:12px;
		color:red;
	}
</style>
<script type="text/javascript">	
var checkid=0;
var checknick=0;
var checkpw=0;
var checkemail=0;
var validpw=0;
var validid=0;

$(function(){
	//비밀번호 유효성 체크
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
	
	$('#id').change(function(){
		var id = $('#id').val();
		if(!/^[a-z0-9]{4,16}$/.test(id)){
			$('#checkBoxId').text('아이디는 영문 소문자/숫자 조합으로 4~16자리를 사용하세요')
		}else{
			$('#checkBoxId').text('')
			validid=1;
		}
	})
	
	//비밀번호 확인 체크
	$('#pwck').keyup(function(){
		var pw1=$('#pw').val();
		var pw2=$('#pwck').val();
		if(pw1==pw2){
			$('#checkBoxPw').text('');
			checkpw=1;
		}else{
			$('#checkBoxPw').text('비밀번호가 일치하지않습니다.')
		}
	})
	
	$('#idck').click(function(){
		if(validid==0){
			alert("아이디를 확인해주세요")
			return false;
		}
		var id = $('#id').val();
		$.ajax("../ajax/checkid.do?id="+id,{
			success:function(data){
				if(data==1){
					//alert(data);
					$('#checkBoxId').text('이미 사용중인 아이디입니다.')
				}else{
					$('#checkBoxId').text('사용가능한 아이디입니다.')
					$('#checkBoxId').css('color','green')
					checkid=1;
				}
			},
			error:function(e){
				alert("오류"+e.status);
			}
		})
	})
	
	$('#nickck').click(function(){
		
		var nick = $('#nick').val();
		
		$.ajax({
			type:"post",
			url:"../ajax/checknick.do",
			dataType:"text",
			data:{'nick':nick},
			success:function(data){
				if(data==1){
					$('#checkBoxNick').text('이미 사용중인 닉네임입니다.')
				}else{
	
					$('#checkBoxNick').text('사용가능한 닉네임입니다.')
					$('#checkBoxNick').css('color','green')
					checknick=1;
				}
			},
			error:function(e){
				alert("오류"+e.status);
			}
		})
	})
	

	$('#emailck').click(function(){
		var email = $('#email').val();
		if(email==''){
			alert('이메일을 입력해주세요');
			return false;
		}
		$.ajax("../ajax/checkemail.do?email="+email,{
			success:function(data){
				if(data==1){
					
					$('#checkBoxEmail').text('가입되어있는 이메일입니다.')
				}else{
					$('#checkBoxEmail').text('사용가능한 이메일입니다.')
					$('#checkBoxEmail').css('color','green')
					checkemail=1;
				}
			},
			error:function(e){
				alert("오류"+e.status);
			}
		})
	})
	
	$("#joinbt").click(function(){
		if(checkid==0){
			alert("아이디 중복체크를 해주세요");
			return false;
		}else if(checknick==0){
			alert("닉네임 중복체크를 해주세요");
			return false;
		}else if(checkpw==0 || validpw==0){
			alert("비밀번호를 확인해주세요");
			return false;
		}else if(checknick==0){
			alert("닉네임 중복체크를 해주세요")
		}else{
			$("#f").submit();	
		}
		
	})
	
	$('#upload').click(function(event){
		popOpen();
	});
	
	function popOpen(){
		var url='pictureForm.jsp';
		var winWidth=550;
		var winHeight=200;
		var popX = (window.screen.width-winWidth)/2
		var popY = (window.screen.height-winHeight)/2;
		var popOption="width="+winWidth+",height="+winHeight
						+",left="+popX+",top="+popY;
		window.open(url,"",popOption);
	}
})
</script>
</head>
<body>
<form action="join.do" method="post" name="f" id="join">
	<div class="title">
		<h1><a href="../main/main.jsp">MODU</a></h1>
	</div>
	<div class="div">
		<h4>회원가입</h4>
	</div>
	<hr>
	<div class="div">
		<h4>아이디</h4>
		<h6>영문 소문자/숫자, 4~16자</h6>
		<input type="text" value="" id="id" name="id">
		<input type="button" value="중복확인" class="ckbt" id="idck">
		<div class="checkBox" id="checkBoxId"></div>
	</div>
	<div class="div">
		<h4>비밀번호</h4>
		<h6>영문/숫자/특수문자  조합, 8자~20자</h6>
		<input type="password" value="" id="pw" name="pw">
		<div class="checkBox" id="validPw"></div>
	</div>
	<div class="div">
		<h4>비밀번호확인</h4>
		<input type="password" value="" id="pwck" name="pwck">
		<div class="checkBox" id="checkBoxPw"></div>
	</div>
	<div class="div">
		<h4>닉네임</h4>
		<h6>다른 유저와 겹치지 않는 닉네임을 입력해주세요(2~10자)</h6>
		<input type="text" value="" id="nick" name="nick">
		<input type="button" value="중복확인" class="ckbt" id="nickck">
		<div class="checkBox" id="checkBoxNick"></div>
	</div>
	<div class="div">
		<h4>이메일</h4>
		<input type="text" value="" id="email" name="email">
		<input type="button" value="중복확인" class="ckbt" id="emailck">
		<div class="checkBox" id="checkBoxEmail"></div>
	</div>	
	<div class="div">
		<h4 style="display:inline-block;">프로필사진</h4>
		<input type="button" value="사진등록" class="ckbt" id="upload">
	</div>		
	<div class="div" id="prebox">
		<div id="preview">
			<input type="hidden" name="profile" value="">
			<img src="../resource/images/user.png" id="Userprofile">
		</div>
	</div>
	<div class="div">
		<input type="submit" value="회원가입완료" id="joinbt">
	</div>			
</form>
</body>
</html>