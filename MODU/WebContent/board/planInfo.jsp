<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../resource/css/style-board.css" />
<style type="text/css">
section#main {
    margin: 0 20%;
}
	th#date {
    	font-weight: 300;
	}
	.place h5 {
	    color: darkgrey;
	    margin: 1%;
	}
	table#plantable {
	    width: 80%;
	    margin: 0 10% 0 10%;
	}
	td.place {
	    text-align: left;
	    border-bottom: 1px solid;
	}
	th.date {
	    width: 150px;
	}
	th#likebook {
	    padding-left: 35%;
	}
	#content div {
	    margin: 3% 0;
	}
</style>
</head>
<body>
<section id="main" class="wrapper style1">
	<table>
		<tr><th><img src="..//member/picture/${member.profile}" class="profile">&nbsp;${member.nick}</th>
			<th id="likebook"><c:if test="${likechk==0}">
					<a href='likefunc.do?likechk=${likechk}&tripNo=${list.tripNo}&type=2'>
					<img src="../resource/images/heart1.png" class="like"></a>
				</c:if>
				<c:if test="${likechk==1}">
					<a href='likefunc.do?likechk=${likechk}&tripNo=${list.tripNo}&type=2'>
					<img src="../resource/images/heart2.png" class="like"></a>
				</c:if> ${likecnt}
				<c:if test="${bookchk==0}">
					&nbsp;<a href='bookfunc.do?bookchk=${bookchk}&tripNo=${list.tripNo}'>
					<img src="../resource/images/book1.png" class="book"></a> 
				</c:if>
				<c:if test="${bookchk==1}">
					&nbsp;<a href='bookfunc.do?bookchk=${bookchk}&tripNo=${list.tripNo}'>
					<img src="../resource/images/book2.png" class="book"></a> 
				</c:if></th></tr>
		<tr><th colspan="2" id="title">${list.tripTitle}</th></tr>
		<tr><th colspan="2" id="date">
			<fmt:formatDate value="${list.startDate}" var="startDate" pattern="yyyy-MM-dd"/>
			${startDate} &nbsp; ${diffday}DAYS</th></tr>
		<tr><td colspan="2" id="content"><div>${list.comment}</div>
		<c:set var="i" value="1"/>
			<c:forEach items="${date}" var="d">
				<table id="plantable"><tr><th class="date">${d} D${i}</th><th colspan="3">&nbsp;</th></tr>
				<c:forEach items="${plan}" var="v">
					<fmt:formatDate value="${v.planDate}" var="date" pattern="yyyy-MM-dd"/>
					<c:if test="${d==date}">
						<tr><td class="time">${v.planTime}</td><td colspan="3" class="place">${v.place}
					<c:if test="${v.memo!=''}">
						<br><h6>${v.memo}</h6></td></tr>
					</c:if>
					<c:if test="${v.memo==''}">
						</td></tr>
					</c:if>
					</c:if>
				</c:forEach>
				</table>
			<c:set var="i" value="${i+1}"/>
			</c:forEach>
	</table>
</section>
</body>
</html>