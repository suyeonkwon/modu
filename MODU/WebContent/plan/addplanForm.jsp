<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
input#planDate {
    width: 25%;
    display: inline-block;
}
select#planTime {
    display: inline-block;
}
textarea#memo {
    /* margin: 0 24%; */
    /* display: inline-block; */
    width: 93%;
    margin-bottom: 3%;
}
input#place {
    display: inline-block;
}
input#searchplace {
    height: 2em;
    font-size: large;
    line-height: 0;
}
	div {
    margin: 10% 0;
}	
</style>
<script type="text/javascript">
	$(function(){
		$('#tripAddbt').click(function(){
			if($('#planTime').val()=='00:00'){
				alert("�ð��� �������ּ���");
				return false;
			}
			if($('#place').val()==''){
				alert("��ġ�� �������ּ���");
				return false;
			}
			var f = document.forms.form;
			opener.name="Page";
			f.target=opener.name;
			f.submit();
			window.close();
		})
		
		var windowObj; //�ڽ�â window ��ü�� ������ ����
		$('#searchplace').click(function(){
			var option='height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes';
			//�ڽ�â ���� �ڽ�â�� window ��ü�� windowObj ������ ���� 
			windowObj = window.open("searchForm.do?tripNo="+$("#tripNo").val(),"",option)
		})
		
	})
</script>
</head>
<body>
<form action="addplan.do?tripNo=${param.tripNo}"name="form" id="form" method="post">
<input type="hidden" name="tripNo" id="tripNo" value="${param.tripNo}">
<div id="selectbox">
	<span>
		<h4>��¥</h4>
			<input type="text" value="${param.Date}" name="planDate" id="planDate">
	</span>
	<span>
		<h4>�ð�</h4>
		<select id="planTime" name="planTime">
			<c:forEach var="h" begin="0" end="24">
				<c:forEach var="m" begin="0" end="30" step="30">
					<c:choose>
						<c:when test="${h<10 && m==0}">
							<option value="0${h}:${m}0">0${h}:${m}0</option>
						</c:when>
						<c:when test="${h<10 && m!=0}">
							<option value="0${h}:${m}">0${h}:${m}</option>
						</c:when>						
						<c:when test="${h>=10 && m==0}">
							<option value="${h}:${m}0">${h}:${m}0</option>
						</c:when>
						<c:otherwise>
							<option value="${h}:${m}">${h}:${m}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:forEach>
		</select>
	</span>
</div>
	<div>
		<h4>�޸�</h4>
		<textarea id="memo" name="memo" wrap="hard" maxlength="50"></textarea>
	</div>
	<div>
		<h4>��ġ</h4>
		<input type="text" id="place" name="place">
		<input type="button" value="�˻�" id="searchplace">
		<input type="hidden" value="" id="lat" name="lat">
		<input type="hidden" value="" id="lng" name="lng">
	</div>
	<div id="tripAdd">
		<input type="submit" value="���� �߰�" id="tripAddbt">
	</div>
</form>
</body>
</html>