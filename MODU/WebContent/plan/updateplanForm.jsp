<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-login-join.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	/*basic*/
	div {
    margin: 10% 0;
}
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

</style>
<script type="text/javascript">
	$(function(){
		$('#planAddbt').click(function(){
			var f = document.forms.form;
			opener.name="Page";
			f.target=opener.name;
			f.submit();
			window.close();
		})
		
		var windowObj; //자식창 window 객체를 저장할 변수
		$('#searchplace').click(function(){
			var option='height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes';
			//자식창 열고 자식창의 window 객체를 windowObj 변수에 저장 
			windowObj = window.open("searchForm.do?tripNo="+$("#tripNo").val(),"",option)
		})
		
	})
	function check(){
		var data = $("#planDate").val();
		var time=$("#planTime").val();
		var place=$("#place").val();
		if(data==''){
			alert("날짜를 입력해주세요");
			return false;
		}
		if(time==''){
			alert("시간을 입력해주세요");
			return false;
		}
		if(place==''){
			alert("장소를 입력해주세요");
			return false;
		}
		return true;
	}
	function deleteFunc(){
		var check = confirm("삭제하시겠습니까?");
		if(check){
			opener.location.href="deleteplan.do?planSeq=${param.planSeq}&tripNo=${param.tripNo}"
			window.close();
		}
	}
</script>
</head>
<body>
<form action="updateplan.do?planSeq=${param.planSeq}&tripNo=${param.tripNo}"name="form" id="form" method="post" onsubmit="return check()">
<input type="hidden" name="tripNo" id="tripNo" value="${param.tripNo}">
<input type="hidden" name="lat" value="${plan.lat}">
<input type="hidden" name="lng" value="${plan.lng}">
<div id="selectbox">
	<span>
		<h4>날짜</h4>
			<fmt:formatDate value="${plan.planDate}" var="planDate" pattern="yyyy-MM-dd"/>
			<input type="text" value="${planDate}" name="planDate" id="planDate">
	</span>
	<span>
		<h4>시간</h4>
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
		<h4>메모</h4>
		<textarea id="memo" name="memo" wrap="hard" maxlength="50">${plan.memo}</textarea>
	</div>
	<div>
		<h4>위치</h4>
		<input type="text" id="place" name="place" value="${plan.place}">
		<input type="button" value="검색" id="searchplace">
		<input type="hidden" value="" id="lat" name="lat">
		<input type="hidden" value="" id="lng" name="lng">
	</div>
	<div id="tripAdd">
		<input type="submit" value="일정 수정" id="planAddbt">
		<input type="button" value="삭제" id="deletebt" onclick="deleteFunc()">
	</div>
</form>
</body>
</html>