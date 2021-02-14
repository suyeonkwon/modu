<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${sessionScope.mem}" var="mem"/>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ���� â</title>
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
			changenick=1; //�г����� ����ƴµ� �ٸ���� check �ʿ���
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
					$('#checkBoxNick').text('�̹� ������� �г����Դϴ�.')
				}else{
					$('#checkBoxNick').text("��� ������ �г����Դϴ�.");
					checknick=1;
				}
			},
			error:function(e){
				alert("����"+e.status);
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
			alert("�г��� �ߺ�üũ�� ���ּ���");
			return false;
		}
		return true;
	}
	function deleteFunc(){
		$("#Userprofile").attr('src','../resource/images/user.png');
		$("#profile").val('');
	}
	function withdraw(){
		var check = confirm("Ż���Ͻðڽ��ϱ�?");
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
		<h4>ȸ������ ����</h4>
		<div id="withdraw">
			<h6><a href="javascript:withdraw()">ȸ��Ż��</a></h6>
		</div>
	</div>
	<hr>
	<div class="div">
		<h4>�г���</h4>
		<h6>�ٸ� ������ ��ġ�� �ʴ� �г����� �Է����ּ���(2~10��)</h6>
		<input type="text" value="${mem.nick}" id="nick" name="nick">
		<input type="button" value="�ߺ�Ȯ��" class="ckbt" id="nickck">
		<div class="checkBox" id="checkBoxNick"></div>
	</div>
	<div class="div">
		<h4 style="display:inline-block;">�����ʻ���</h4>
		<input type="button" value="�������" class="ckbt" id="upload">
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
			<a href="javascript:deleteFunc()">����</a>
		</div>
	</div>
	<div class="div" id="update">
		<input type="submit" value="ȸ�� ���� ����" id="joinbt">
		<input type="button" value="��й�ȣ ����" onclick="location.href='updatePwForm.do?id=${param.id}'">
	</div>			
</form>
</body>
</html>