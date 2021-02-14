<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>새여행 추가 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<style type="text/css">
	h4,input[type="text"]{
		display:inline-block;
	}
	input[type="button"]{
		color: #666f77;
		height:34px;
		background-color:rgba(239,239,239,1);
		font-size:small;
	}
	div{
		margin:40px;
	}
	#addTrip{
		text-align:center;
	}
	#addTripBt{
		height:50px;
		width:120px;
	}
	input#searchCity, #addTripBt {
    background-color: #fe6667;
    color: #ffffff;
	}
	.ui-datepicker {
    font-size: 0.9em;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
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
		$("#date1").datepicker("option","maxDate",$("#date2").val());
		$('#date1').datepicker("option", "onClose", function ( selectedDate ) {
	        $("#date2").datepicker( "option", "minDate", selectedDate );
	    });

		$('#date2').datepicker({
			onSelect:function(date){
				$('#endDate').val(date);
			}
		})
		
		$('#date2').datepicker("option", "minDate", $("#date1").val());
    	$('#date2').datepicker("option", "onClose", function ( selectedDate ) {
        $("#date1").datepicker( "option", "maxDate", selectedDate );
    	});
		
		var windowObj; //자식창 window 객체를 저장할 변수
		$('#searchCity').click(function(){
			var option='height=' + 200 + ',width=' +600;

			//자식창 열고 자식창의 window 객체를 windowObj 변수에 저장 
			windowObj = window.open("searchFormCity.do","",option)

		})
		
		$('#addTrip').click(function(){
			var city=$("#city").val();
			var title=$("#tripTitle").val();
			var start=$("#startDate").val();
			var end = $("#endDate").val();
			if(city==''){
				alert("도시를 선택해주세요");
				return false;
			}
			if(title==''){
				alert("제목을 입력해주세요");
				return false;				
			}
			if(start==''){
				alert("여행 시작일을 입력해주세요");
				return false;				
			}
			if(end==''){
				alert("여행 종료일을 입력해주세요");
				return false;				
			}
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
<form action="addTrip.do" method="post" name="form" id="form">
	<input type="hidden" id="lat" value="" name="lat">
	<input type="hidden" id="lng" value="" name="lng">
	<input type="hidden" id="countryCode" value="" name="countryCode">
	<input type="hidden" value="${sessionScope.login}" id="id" name="id">
	<div>
		<h4>여행 도시명</h4>
		<input type="text" value="" id="city" name="city">
		<input type="button" value="검색" id="searchCity">
	</div>
	<div>
		<h4>여행 제  목</h4>
		<input type="text" value="" id="tripTitle" name="tripTitle">
		
	</div>
	<div>
		<h4>여행 출발일</h4>
		<input type="hidden" id="startDate" name="startDate">
		<input type="text" id="date1" name="date1">
	</div>
	<div>
		<h4>여행 도착일</h4>
		<input type="hidden" id="endDate" name="endDate">
		<input type="text" id="date2" name="date2">
	</div>
	<div id="addTrip">
		<input type="button" value="여행 추가" id="addTripBt">
	</div>
</form>
</body>
</html>