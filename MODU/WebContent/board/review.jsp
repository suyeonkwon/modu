<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>후기 게시판</title>
<link rel="stylesheet" href="../resource/css/style-board.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#categoryzone h1{
		display:inline-block;
		padding:0 20px;
	}

	#categoryzone, #searchzone{
		display:flex;
		justify-content:center;
		align-items:center;
	}
	fieldset {
    	width: 400px;
	}

	#searchbt{
	    position: relative;
	 	top: -50px;
	    left: 88%;
	}
	#write{
		position:absolute;
		left:90%;
		top:220px;
		width:80px;
		padding:0;
		background-color:rgba(239,239,239,1);
		color:#bbb;
	}
	.img .content {
	    position: absolute;
	    top: 4%;
	    left: 3%;
	}

	.place img {
	    width: 15px;
	    height: 15px;
	}
	span.profile {
	    margin-right: 60%;
	}
</style>
<script type="text/javascript">
	function sortFunc(type){
		var find=$("#searchbox").val();
		var category=$("#category").val();
		form=document.form;
		if(find!=''){
			alert(find);
			form.action="review.do?type="+type+"&category="+category
			form.submit();
		}else{
			location.href="review.do?type="+type+"&category="+category;
		}
	}
	function catFunc(category){
		var find=$("#searchbox").val();
		if(find!=''){
			alert(find);
			form.action="review.do?type=1&category="+category
			form.submit();
		}else{
			location.href="review.do?type=1&category="+category;
		}
	}

	$(function(){
		$('#write').click(function(){
			location.href='writeForm.do';
		})
	})
</script>
</head>
<body>
<section id="main" class="wrapper style1">
<div id="searchzone">
	<form action="review.do?type=1" method="post" name="form">
		<fieldset>
			<input type="text" value="${param.find}" placeholder="도시명을 입력하세요" name="find" id="searchbox">
			<button type="submit" id="searchbt">
				<i class="fa fa-search"></i>
			</button>
		</fieldset>
	</form>
</div>
<div id="categoryzone">
	<input type="hidden" value="" id="category">
	<h1><a href="javascript:catFunc(1)">숙소</a></h1>
	<h1><a href="javascript:catFunc(2)">맛집</a></h1>
	<h1><a href="javascript:catFunc(3)">카페</a></h1>
	<h1><a href="javascript:catFunc(4)">액티비티/관광지</a></h1>
</div>
<input type="button" value="글쓰기" id="write">
<hr>
<div id="sort">
<%-- 	<p><a href="review.do?type=1">최신/</a></p>
	<p><a href="review.do?type=2">인기</a></p>--%>
	<p><a href="javascript:sortFunc(1)">최신/</a></p>
	<p><a href="javascript:sortFunc(2)">인기</a></p>
</div>
<div id="shareZone">
	<c:if test="${boardcnt==0}">
		<h1>등록된 게시글이 없습니다.</h1>
	</c:if>	
	<c:if test="${boardcnt>0}">
		<c:set var="i" value="0"/>
		<c:forEach items="${list}" var="v">
		<div class="trip" onclick="location.href='reviewInfo.do?reviewNo=${v.reviewNo}'">
			<div class="img" style="background-image:url(../board/imgfile/${v.file})">
				<div class="content">
					<div class="category">
						<c:choose>
						<c:when test="${v.category==1}">숙소</c:when>
						<c:when test="${v.category==2}">맛집</c:when>
						<c:when test="${v.category==3}">카페</c:when>
						<c:otherwise>액티비티/관광지</c:otherwise>
					</c:choose>					
					</div>
				</div>
				</div>
				<div class="tripdetail">
					<div class="subject">
						${v.subject}
					</div>
					<div class="place"><img src="../resource/images/marker3.png">${v.place}</div>
					<div class="pro">
						<span class="profile"><img src="../member/picture/${member[i].profile}">${member[i].nick}</span>
						<span class="like">
							<c:if test="${likechk[i]==0}">
								<a href='likefunc.do?likechk=${likechk[i]}&reviewNo=${v.reviewNo}&type=1'><img src="../resource/images/heart1.png"></a>
							</c:if>
							<c:if test="${likechk[i]==1}">
								<a href='likefunc.do?likechk=${likechk[i]}&reviewNo=${v.reviewNo}&type=1'><img src="../resource/images/heart2.png"></a>
							</c:if>${likecnt[i]}						
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