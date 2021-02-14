
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>일정공유 게시판</title>
<link rel="stylesheet" href="../resource/css/style-board.css" />
<style>
	#searchzone{
		position:relative;
		display:flex; 
		justify-content:center;
	}
	#searchbt{
 	-webkit-transform: translate(-50px, 0);
          transform: translate(-50px, 0);
	}

	.like img {
	    position: relative;
    	top: 6px;
	}
	.img .content {
    	position: absolute;
    	top: 65%;
    	left: 3%;
	}
	span.like {
    	margin-left: 40%;
	}

</style>
<script type="text/javascript">
	function sortFunc(type){
		var find = $("#searchbox").val();
		if(find!=''){
			form = document.form;
			form.action="planboard.do?type="+type;
			form.submit();
		}else{
			location.href="planboard.do?type="+type;
		}
	}
</script>
</head>
<body>
<section id="main" class="wrapper style1">
<div id="searchzone">
	<form action="planboard.do?type=1" method="post" name="form">
		<fieldset>
			<input type="text" value="${param.find}" placeholder="도시명을 입력하세요" name="find" id="searchbox">
			<button type="submit" id="searchbt">
				<i class="fa fa-search"></i>
			</button>
		</fieldset>
	</form>
</div>
<hr>
<div id="sort">
<%--<p><a href="planboard.do?type=1">최신/</a></p>
	<p><a href="planboard.do?type=2">인기</a></p>--%>
	<p><a href="javascript:sortFunc(1)">최신/</a></p>
	<p><a href="javascript:sortFunc(2)">인기</a></p>
</div>
<div id="shareZone">
	<c:if test="${boardcnt==0}">
		<h1>공유된 일정이 없습니다. 다른 사람들과 일정을 공유해보세요!</h1>
	</c:if>
	<c:if test="${boardcnt>0}">
		<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="v">
			<div class="trip" onclick="location.href='planInfo.do?tripNo=${v.tripNo}'">
				<div class="img" style="background-image: url(../plan/picture/${v.picture});">
					<div class="content">
						<fmt:formatDate value="${v.startDate}" var="startDate" pattern="yyyy-MM-dd"/>
							<h5>${startDate}</h5>
						<fmt:parseNumber value="${v.startDate.time/(24*60*60*1000)}" var="start"/>
						<fmt:parseNumber value="${v.endDate.time/(24*60*60*1000)}" var="end"/>
						<fmt:formatNumber value="${end-start}" var="diff" pattern="##"/>
							<h5>${diff}DAYS</h5>
							<h5>${v.city}</h5>
						</div>
					</div>
				<div class="tripdetail">
					<div class="subject">
						${v.tripTitle}
					</div>
					<div class="pro">
						<span class="profile">
						<c:if test="${!empty member[i].profile}">
							<img src="../member/picture/${member[i].profile }">
						</c:if>
						<c:if test="${empty member[i].profile}">
							<img src="../resource/images/user.png">
						</c:if>						
						${member[i].nick}</span>
						<span class="like">
							<c:if test="${likechk[i]==0}">
								<a href='likefunc.do?likechk=${likechk[i]}&tripNo=${v.tripNo}&type=1'>
								<img src="../resource/images/heart1.png" class="like"></a>
							</c:if>
							<c:if test="${likechk[i]==1}">
								<a href='likefunc.do?likechk=${likechk[i]}&tripNo=${v.tripNo}&type=1'>
								<img src="../resource/images/heart2.png" class="like"></a>
							</c:if>	${likecnt[i]}	
						</span>
					</div>
				</div>
			</div>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</c:if>
</div>
</section>
</body>
</html>