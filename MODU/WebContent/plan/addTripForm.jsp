<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ �߰� ������</title>
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
		
		var windowObj; //�ڽ�â window ��ü�� ������ ����
		$('#searchCity').click(function(){
			var option='height=' + 200 + ',width=' +600;

			//�ڽ�â ���� �ڽ�â�� window ��ü�� windowObj ������ ���� 
			windowObj = window.open("searchFormCity.do","",option)

		})
		
		$('#addTrip').click(function(){
			var city=$("#city").val();
			var title=$("#tripTitle").val();
			var start=$("#startDate").val();
			var end = $("#endDate").val();
			if(city==''){
				alert("���ø� �������ּ���");
				return false;
			}
			if(title==''){
				alert("������ �Է����ּ���");
				return false;				
			}
			if(start==''){
				alert("���� �������� �Է����ּ���");
				return false;				
			}
			if(end==''){
				alert("���� �������� �Է����ּ���");
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
		<h4>���� ���ø�</h4>
		<input type="text" value="" id="city" name="city">
		<input type="button" value="�˻�" id="searchCity">
	</div>
	<div>
		<h4>���� ��  ��</h4>
		<input type="text" value="" id="tripTitle" name="tripTitle">
		
	</div>
	<div>
		<h4>���� �����</h4>
		<input type="hidden" id="startDate" name="startDate">
		<input type="text" id="date1" name="date1">
	</div>
	<div>
		<h4>���� ������</h4>
		<input type="hidden" id="endDate" name="endDate">
		<input type="text" id="date2" name="date2">
	</div>
	<div id="addTrip">
		<input type="button" value="���� �߰�" id="addTripBt">
	</div>
</form>
</body>
</html>