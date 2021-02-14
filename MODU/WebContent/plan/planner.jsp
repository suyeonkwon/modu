<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>플래너 게시판</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
section#main {
    padding: 5% 15%;
}
h2, h3, h4, p {
    display: inline-block;
    margin: 10px;
}
	#tripzone{
		width:100%;

	}
	.trip{
		background-color: rgba(144, 144, 144, 0.075);
		padding:20px;
		margin:20px;
		width:95%;
		height:120px;	
	}
	.update{
		text-align:right;
	}
	#addTripBt {
	width: 300px;
    height: 50px;
    padding: 0;
    background-color: #FE6667;
    color: aliceblue;
	}
	#newtrip{
		text-align:center;
	}
	input.sharebt {
        height: 35px;
    background-color: #FE6667;
    color: #ffffff;
	}
#top h2 {
    font-weight: 500;
}
</style>
</head>
<body>
<script type="text/javascript">
	function popOpen(){
		var url='addTripForm.do';
		var winWidth=500;
		var winHeight=800;
		var popX = (window.screen.width-winWidth)/2
		var popY = (window.screen.height-winHeight)/2;
		var popOption="width="+winWidth+",height="+winHeight
						+",left="+popX+",top="+popY;
		window.open(url,"",popOption);
	}
	
	function popShare(tripNo,share){
		if(share==1){
			alert('이미 공유한 여행입니다')
		}else{
			var url='shareForm.do?tripNo='+tripNo;
			var winWidth=600;
			var winHeight=600;
			var popX = (window.screen.width-winWidth)/2
			var popY = (window.screen.height-winHeight)/2;
			var popOption="width="+winWidth+",height="+winHeight
			+",left="+popX+",top="+popY;
			window.open(url,"",popOption);
		}

	}
</script>
<section id="main" class="wrapper style1">
	<div id="tripzone">
		<div id="top">
			<c:if test="${tripcnt==0}">
				<div class="triplist">
					<div class="trip">
						<h3>당신의 여행을 만들어 주세요!</h3>
					</div>
				</div>
			</c:if>
			<c:if test="${tripcnt>0}">
				<h2>내 여행</h2> <h2>${tripcnt}개</h2>
			</div>
			<c:forEach var="v" items="${list}">
				<div class="triplist">
					<div class="trip">
						<h3 style="font-weight:600;">${v.city}</h3><h4>${v.tripTitle}</h4>
							<fmt:formatDate value="${v.startDate}" pattern="yyyy-MM-dd" var="start"/>
							<fmt:formatDate value="${v.endDate}" pattern="yyyy-MM-dd" var="end"/>
						<h3>(${start} ~ ${end})</h3><br>
						<div class="update">
							<input type="button" value="공유" class="sharebt" onclick="popShare(${v.tripNo},${v.share})">
							<p><a href="schedule.do?tripNo=${v.tripNo}">수정</a></p>
							<p>
								<a href="deleteTrip.do?tripNo=${v.tripNo}" onclick="return confirm('여행을 삭제하시겠습니까?');">삭제</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		</c:if>
	<div id="newtrip">
		<input type="button" value="새여행 만들기" id="addTripBt" onclick="popOpen()">
	</div>
</section>
</body>
</html>