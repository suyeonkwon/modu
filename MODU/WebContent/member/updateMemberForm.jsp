<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${sessionScope.mem}" var="mem"/>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정 창</title>
<style type="text/css">
	#validPw, #checkBoxPW, #checkBoxNick{
		color:red;
    	font-weight: 600;
    	font-size: small;
	}
	div#withdraw {
    text-align: right;
}
a {
    color: #666F77;
    text-decoration: none;
}
input#joinbt, #updatePwBt {
    width: 30%;
}
div#update {
    text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<script type="text/javascript">	
var checknick=0;
var changenick=0;
$(function(){
	$('#nick').change(function(){
		var orgNick = $('#orgNick').val();
		var nick = $('#nick').val();
		if(orgNick!=nick){
			changenick=1; //닉네임이 변경됐는데 다를경우 check 필요함
		}
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
					$('#checkBoxNick').text("사용 가능한 닉네임입니다.");
					checknick=1;
				}
			},
			error:function(e){
				alert("오류"+e.status);
			}
		})
	})	
	
	$('#upload').click(function(event){
		popOpen();
	});
	
	function popOpen(){
		var url='pictureForm.jsp';
		var winWidth=550;
		var winHeight=600;
		var popX = (window.screen.width-winWidth)/2
		var popY = (window.screen.height-winHeight)/2;
		var popOption="width="+winWidth+",height="+winHeight
						+",left="+popX+",top="+popY;
		window.open(url,"",popOption);
	}
});

	function valid(){
		if(changenick==1 && checknick==0){
			alert("닉네임 중복체크를 해주세요");
			return false;
		}
		return true;
	}
	function deleteFunc(){
		$("#Userprofile").attr('src','../resource/images/user.png');
		$("#profile").val('');
	}
	function withdraw(){
		var check = confirm("탈퇴하시겠습니까?");
		if(check){
			location.href='withdraw.do?id=${param.id}';
		}
	}
</script>
</head>
<body>
<input type="hidden" id="orgNick" value="${mem.nick}">
<form action="updateMember.do?id=${param.id}" method="post" name="f" onsubmit="return valid()">
	<div class="div">
		<h4>회원정보 수정</h4>
		<div id="withdraw">
			<h6><a href="javascript:withdraw()">회원탈퇴</a></h6>
		</div>
	</div>
	<hr>
	<div class="div">
		<h4>닉네임</h4>
		<h6>다른 유저와 겹치지 않는 닉네임을 입력해주세요(2~10자)</h6>
		<input type="text" value="${mem.nick}" id="nick" name="nick">
		<input type="button" value="중복확인" class="ckbt" id="nickck">
		<div class="checkBox" id="checkBoxNick"></div>
	</div>
	<div class="div">
		<h4 style="display:inline-block;">프로필사진</h4>
		<input type="button" value="사진등록" class="ckbt" id="upload">
	</div>		
	<div class="div" id="prebox">
		<div id="preview">
			<c:if test="${!empty mem.profile}">
				<input type="hidden" name="profile" id="profile" value="${mem.profile}">
				<img src="../member/picture/${mem.profile}" id="Userprofile">
			</c:if>
			<c:if test="${empty mem.profile}">
				<input type="hidden" name="profile" value=" ">
				<img src="../resource/images/user.png" id="Userprofile">			
			</c:if>
			<a href="javascript:deleteFunc()">삭제</a>
		</div>
	</div>
	<div class="div" id="update">
		<input type="submit" value="회원 정보 수정" id="joinbt">
		<input type="button" value="비밀번호 수정" onclick="location.href='updatePwForm.do?id=${param.id}'">
	</div>			
</form>
</body>
</html>