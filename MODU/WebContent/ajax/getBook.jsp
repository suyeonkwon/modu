<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="v">
			<table onClick = "location.href='../board/planInfo.do?tripNo=${v.tripNo}'">
				<tr><th colspan="3">${v.city}</th></tr>
				<tr><td colspan="3" id="imgbox"><img src="../plan/picture/${v.picture}"></td></tr>
					<fmt:formatDate value="${v.startDate}" var="startDate" pattern="yyyy-MM-dd"/>
				<tr><td colspan="2">${startDate}</td>
					<fmt:parseNumber value="${v.startDate.time/(24*60*60*1000)}" var="start"/>
					<fmt:parseNumber value="${v.endDate.time/(24*60*60*1000)}" var="end"/>
					<fmt:formatNumber value="${end-start}" var="diff" pattern="##"/>
					<td style="text-align:right;">${diff}DAYS</td></tr>
				<tr><td colspan="3">${v.tripTitle}</td></tr>
			</table>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>