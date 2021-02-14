<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		<%-- 
			<table onClick = "location.href='reviewInfo.do?reviewNo='">
				<tr><th colspan="3">액티비티/ 관광지</th></tr>
				<tr><td colspan="3" id="imgbox"><img src="../resource/images/kapadokya.jpg"></td></tr>
				<tr><td colspan="3">신기한 벌룬</td></tr>
				<tr><td colspan="3">카파도키아</td></tr>
			</table>--%>
		<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="v">
			<table onClick = "location.href='../board/reviewInfo.do?reviewNo=${v.reviewNo}'">
				<tr><th colspan="3">
					<c:choose>
						<c:when test="${v.category==1}">숙소</c:when>
						<c:when test="${v.category==2}">맛집</c:when>
						<c:when test="${v.category==3}">카페</c:when>
						<c:otherwise>액티비티/관광지</c:otherwise>
					</c:choose></th></tr>
				<tr><td colspan="3" id="imgbox"><img src="../board/imgfile/${v.file}"></td></tr>
				<tr><td colspan="3">${v.subject}</td></tr>
				<tr><td colspan="3">${v.place}</td></tr>
				<tr>
					<fmt:formatDate value='${v.regdate}' var="regdate" pattern="yyyy-MM-dd HH:mm"/>
					<td style="text-align:right;" colspan="3">${regdate}</td></tr>
			</table>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>