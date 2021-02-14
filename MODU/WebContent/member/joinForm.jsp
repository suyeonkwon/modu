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
	//��й�ȣ ��ȿ�� üũ
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
	
	$('#id').change(function(){
		var id = $('#id').val();
		if(!/^[a-z0-9]{4,16}$/.test(id)){
			$('#checkBoxId').text('���̵�� ���� �ҹ���/���� �������� 4~16�ڸ��� ����ϼ���')
		}else{
			$('#checkBoxId').text('')
			validid=1;
		}
	})
	
	//��й�ȣ Ȯ�� üũ
	$('#pwck').keyup(function(){
		var pw1=$('#pw').val();
		var pw2=$('#pwck').val();
		if(pw1==pw2){
			$('#checkBoxPw').text('');
			checkpw=1;
		}else{
			$('#checkBoxPw').text('��й�ȣ�� ��ġ�����ʽ��ϴ�.')
		}
	})
	
	$('#idck').click(function(){
		if(validid==0){
			alert("���̵� Ȯ�����ּ���")
			return false;
		}
		var id = $('#id').val();
		$.ajax("../ajax/checkid.do?id="+id,{
			success:function(data){
				if(data==1){
					//alert(data);
					$('#checkBoxId').text('�̹� ������� ���̵��Դϴ�.')
				}else{
					$('#checkBoxId').text('��밡���� ���̵��Դϴ�.')
					$('#checkBoxId').css('color','green')
					checkid=1;
				}
			},
			error:function(e){
				alert("����"+e.status);
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
					$('#checkBoxNick').text('�̹� ������� �г����Դϴ�.')
				}else{
	
					$('#checkBoxNick').text('��밡���� �г����Դϴ�.')
					$('#checkBoxNick').css('color','green')
					checknick=1;
				}
			},
			error:function(e){
				alert("����"+e.status);
			}
		})
	})
	

	$('#emailck').click(function(){
		var email = $('#email').val();
		if(email==''){
			alert('�̸����� �Է����ּ���');
			return false;
		}
		$.ajax("../ajax/checkemail.do?email="+email,{
			success:function(data){
				if(data==1){
					
					$('#checkBoxEmail').text('���ԵǾ��ִ� �̸����Դϴ�.')
				}else{
					$('#checkBoxEmail').text('��밡���� �̸����Դϴ�.')
					$('#checkBoxEmail').css('color','green')
					checkemail=1;
				}
			},
			error:function(e){
				alert("����"+e.status);
			}
		})
	})
	
	$("#joinbt").click(function(){
		if(checkid==0){
			alert("���̵� �ߺ�üũ�� ���ּ���");
			return false;
		}else if(checknick==0){
			alert("�г��� �ߺ�üũ�� ���ּ���");
			return false;
		}else if(checkpw==0 || validpw==0){
			alert("��й�ȣ�� Ȯ�����ּ���");
			return false;
		}else if(checknick==0){
			alert("�г��� �ߺ�üũ�� ���ּ���")
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
		<h4>ȸ������</h4>
	</div>
	<hr>
	<div class="div">
		<h4>���̵�</h4>
		<h6>���� �ҹ���/����, 4~16��</h6>
		<input type="text" value="" id="id" name="id">
		<input type="button" value="�ߺ�Ȯ��" class="ckbt" id="idck">
		<div class="checkBox" id="checkBoxId"></div>
	</div>
	<div class="div">
		<h4>��й�ȣ</h4>
		<h6>����/����/Ư������  ����, 8��~20��</h6>
		<input type="password" value="" id="pw" name="pw">
		<div class="checkBox" id="validPw"></div>
	</div>
	<div class="div">
		<h4>��й�ȣȮ��</h4>
		<input type="password" value="" id="pwck" name="pwck">
		<div class="checkBox" id="checkBoxPw"></div>
	</div>
	<div class="div">
		<h4>�г���</h4>
		<h6>�ٸ� ������ ��ġ�� �ʴ� �г����� �Է����ּ���(2~10��)</h6>
		<input type="text" value="" id="nick" name="nick">
		<input type="button" value="�ߺ�Ȯ��" class="ckbt" id="nickck">
		<div class="checkBox" id="checkBoxNick"></div>
	</div>
	<div class="div">
		<h4>�̸���</h4>
		<input type="text" value="" id="email" name="email">
		<input type="button" value="�ߺ�Ȯ��" class="ckbt" id="emailck">
		<div class="checkBox" id="checkBoxEmail"></div>
	</div>	
	<div class="div">
		<h4 style="display:inline-block;">�����ʻ���</h4>
		<input type="button" value="�������" class="ckbt" id="upload">
	</div>		
	<div class="div" id="prebox">
		<div id="preview">
			<input type="hidden" name="profile" value="">
			<img src="../resource/images/user.png" id="Userprofile">
		</div>
	</div>
	<div class="div">
		<input type="submit" value="ȸ�����ԿϷ�" id="joinbt">
	</div>			
</form>
</body>
</html>