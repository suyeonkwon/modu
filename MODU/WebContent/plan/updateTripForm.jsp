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
		prevText:'이전 달',
		nextText:'다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
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
		<label id="tripTitle">여행제목</label>
			<input type="text" value="${t.tripTitle}" id="tripTitle" name="tripTitle">
	</div>
	<div>
		<label>여행 출발일</label>
			<input type="hidden" id="startDate" name="startDate">
			<fmt:formatDate value="${t.startDate}" var="start" pattern="yyyy-MM-dd"/>
			<input type="text" value="${start}"id="date1" name="date1">
	</div>
	<div>
		<label>여행 도착일</label>
			<input type="hidden" id="endDate" name="endDate">
			<fmt:formatDate value="${t.endDate}" var="end" pattern="yyyy-MM-dd"/>
			<input type="text" value="${end}"id="date2" name="date2">
	</div>
	<div id="updateTrip">
		<input type="button" value="확인" id="updateTripBt">
	</div>
</form>
</body>
</html>