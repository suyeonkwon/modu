<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	h2,h3,p{
		display:inline-block;
		margin:10px;
	}
	input[type="button"]{
		color: #666f77;
		height:34px;
		background-color:rgba(239,239,239,1);
		font-size:small;
	}
	table{
		width:850px;
	}
	td.place {
    border-bottom: 1px solid;
}
	th.date{
		width:150px;
		text-align:center;
	}
	td.time{
		text-align:right;
	}
	#planzone{
		position:relative;
		left:16%;
		width:900px;
		margin: 10px 0 120px 0;
	}
	#planlist{
		position:relative;
		left:-5%;
		top:10px;
	}

	#addPlanbt {
    	width: 300px;
   	 	height: 50px;
    	padding: 0;
    	background-color: rgba(239,239,239,1);
    	color: #bbb;
	}
	#addPlan{
		text-align:center;
	}
	section#main {
    padding: 5% 15%;
}
tr#add {
    text-align: center;
}
.place h5 {
    color: darkgrey;
    margin: 1%;
}
input.addPlanbt {
    width: 60px;
    height: 60px;
    border-radius: 150px;
    text-align: center;
    color: #FE6667;
    background-color: #ffffff;
    font-size: 35px;
}
</style>
<script type="text/javascript">	

		function popOpen(date){
			var url='addplanForm.do?tripNo='+${param.tripNo}+'&Date='+date;
			var winWidth=500;
			var winHeight=800;
			var popX = (window.screen.width-winWidth)/2
			var popY = (window.screen.height-winHeight)/2;
			var popOption="width="+winWidth+",height="+winHeight
							+",left="+popX+",top="+popY;
			window.open(url,"일정창",popOption);
		}
		
		function popMap(cityLat, cityLng, date){
			var url='mapForm.do?tripNo='+${param.tripNo}+'&cityLat='+cityLat+'&cityLng='+cityLng+"&planDate="+date;
			var popOption='height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes';
			window.open(url,"지도",popOption);
		}
		
		var winObj;
		function popUpdate(){
			var a = '${t.tripTitle}';
			var url='updateTripForm.do?tripNo='+${param.tripNo};
			var winWidth=500;
			var winHeight=500;
			var popX = (window.screen.width-winWidth)/2
			var popY = (window.screen.height-winHeight)/2;
			var popOption="width="+winWidth+",height="+winHeight
							+",left="+popX+",top="+popY;
			winObj=window.open(url,"날짜수정창",popOption);
		}
		var winObj2;
		function planUpdate(planSeq){
			var a = '${t.tripTitle}';
			var url='updateplanForm.do?planSeq='+planSeq+'&tripNo=${param.tripNo}';
			var winWidth=500;
			var winHeight=500;
			var popX = (window.screen.width-winWidth)/2
			var popY = (window.screen.height-winHeight)/2;
			var popOption="width="+winWidth+",height="+winHeight
							+",left="+popX+",top="+popY;
			winObj2=window.open(url,"날짜수정창",popOption);			
		}

</script>
</head>
<body>
<section id="main" class="wrapper style1">
	<div id="planzone">
		<div id="top">
			<input type="hidden" value="${t.tripTitle}" id="title">
			<h2>${t.tripTitle}</h2>
			<fmt:formatDate value="${t.startDate}" var="start" pattern="yyyy-MM-dd"/>
			<fmt:formatDate value="${t.endDate}" var="end" pattern="yyyy-MM-dd"/>
			<p>${start}~${end}</p>
			<input type="button" value="수정" id="dateModify" onclick="popUpdate()">
		</div>
		<div id="planlist">
		<c:set var="i" value="1"/>
			<c:forEach items="${date}" var="d">
				<table><tr><th class="date">${d} D${i}</th>
				<th colspan="3"><input type="button" value="지도" class="map" onclick="popMap(${t.cityLat},${t.cityLng},'${d}')"></th></tr>
				<c:forEach items="${list}" var="v">
					<fmt:formatDate value="${v.planDate}" var="date" pattern="yyyy-MM-dd"/>
					<c:if test="${d==date}">
						<tr><td class="time">${v.planTime}</td>
							<td colspan="3" class="place" onclick="javascript:planUpdate(${v.planSeq})">${v.place}
					<c:if test="${v.memo!=''}">
						<br><h6>${v.memo}</h6></td></tr>
					</c:if>
					<c:if test="${v.memo==''}">
						</td></tr>
					</c:if>
					</c:if>
				</c:forEach>
						<tr id="add"><td colspan="4"><input type="button" value="+" class="addPlanbt" onclick="popOpen('${d}')"></td></tr>
				</table>
			<c:set var="i" value="${i+1}"/>
			</c:forEach>
		</div>
	</div>
</section>
</body>
</html>