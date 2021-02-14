<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style type="text/css">
input[type="text"] {
    width: 50%;
    display: inline-block;
    text-align: center;
}
div {
    margin: 10%;
}
label#tripTitle {
    margin: 3%;
}
input#updateTripBt {
    width: 50%;
}
</style>
<script type="text/javascript">
	$.datepicker.setDefaults({
		dateFormat:'yy-mm-dd',
		prevText:'���� ��',
		nextText:'���� ��',
	    monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
	    monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
	    dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	    dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	    dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
	    showMonthAfterYear: true,
	    yearSuffix: '��'
	})
	$(function(){
		$('#date1').datepicker({
			onSelect:function(date){
				$('#startDate').val(date);
			}
		})
		
		$('#date2').datepicker({
			onSelect:function(date){
				$('#endDate').val(date);
			}
		})
		
		
		$('#addTrip').click(function(){
			alert($('#location').val());
			var f = document.forms.form;
			opener.name="Page";
			f.target=opener.name;
			f.submit();
			window.close();
		})	
		
		$("#updateTripBt").click(function(){
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
<form action="updateTrip.do?tripNo=${param.tripNo}" method="post" name="form" id="form">
	<div>
		<label id="tripTitle">��������</label>
			<input type="text" value="${t.tripTitle}" id="tripTitle" name="tripTitle">
	</div>
	<div>
		<label>���� �����</label>
			<input type="hidden" id="startDate" name="startDate">
			<fmt:formatDate value="${t.startDate}" var="start" pattern="yyyy-MM-dd"/>
			<input type="text" value="${start}"id="date1" name="date1">
	</div>
	<div>
		<label>���� ������</label>
			<input type="hidden" id="endDate" name="endDate">
			<fmt:formatDate value="${t.endDate}" var="end" pattern="yyyy-MM-dd"/>
			<input type="text" value="${end}"id="date2" name="date2">
	</div>
	<div id="updateTrip">
		<input type="button" value="Ȯ��" id="updateTripBt">
	</div>
</form>
</body>
</html>