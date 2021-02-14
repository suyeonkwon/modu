<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>댓글 &nbsp;&nbsp;<span id="cnt">${cnt}</span></div>
<c:set value="0" var="i"/>
<c:forEach items="${list}" var="v">
<div>
	<c:if test="${!empty mem[i].profile}">
		<img alt="" src="../member/picture/${mem[i].profile}" class="profile">
	</c:if>
	<c:if test="${empty mem[i].profile}">
		<img alt="" src="../resource/images/user.png" class="profile">
	</c:if>
	<div class="nick">${mem[i].nick}</div>
	<div id='${v.commentNo}No' class=comment>${v.comment}</div>
	<div class=regdate>${regdate[i]}</div>
	<c:if test="${mem[i].id == sessionScope.login}">
	<div class="update">
		<a href='javascript:editComment(${v.commentNo})'>수정</a>
		<a href='javascript:deleteComment(${v.commentNo})'>삭제</a>
	</div>
	</c:if>
</div>
<c:set value="${i+1}" var="i"/>
</c:forEach>


