<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
section {
    margin: 0 20%;
    margin-bottom: 10%;
}

div#myInfo {
    border: 1px solid rgba(144,144,144,0.25);
    width: 25%;
    border-radius: 10px;
    float: left;
    padding-bottom: 5%;
}

div#profile {
    margin: 5% 20%;
}
input#updateMember {
    background-color: #FE6667;
    color: #ffffff;
}
div#nick,#id,#update {
    text-align:center;
}
div#update{
	margin-bottom:10%
}
	div#nick h1 {
	    font-weight: bold;
	    font-size: 25px;
	}
#profile img {
    width: 100%;
    border-radius: 150px;
}

#myInfo hr {
    margin: 10%;
}
div#myPost {
    display: inline-block;
    margin: 0 0 0 10%;
    width: 64%;
}
span {
    margin: 0 12%;
    font-size: 1em;
    font-weight: 600;
}
div#post span {
      margin: 0 9%;
}
div#postCnt span {
    margin: 0 15%;
}
div#message {
    text-align: center;
    margin: 30% 10%;
}


	h2,h3,p{
		display:inline-block;
		margin:10px;
	}
	#tripzone{
		position:relative;
		left: 23%;
		width:900px;
		margin: 10px 0 120px 0;
	}
.trip {
    background-color: rgba(144, 144, 144, 0.075);
    padding: 20px;
    margin: 5% 5%;
    width: 90%;
    border-radius: 10px;
}
.update {
    text-align: right;
}
	#addTripBt {
    	width: 300px;
   	 	height: 50px;
    	padding: 0;
    	background-color: rgba(239,239,239,1);
    	color: #bbb;
	}

	input.sharebt {
    	height: 35px;
	}
	a{
		
	}
	div#tripBox {
    position: relative;
    top: 20px;
    margin-bottom: 5%;
}


table {
    width: 285px;
    float: left;
    margin: 5%;
    border: 1px solid lightgray;
    border-radius: 5px;
}

table tbody tr {
    border: 0;
    /* border-left: 0; */
    /* border-right: 0; */
}
#imgbox img{
	width:260px;
	height:200px;
}

</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
var str;
	$(function(){
		getTrip();
	})
	function getTrip(){
		$.ajax("../ajax/getTrip.do?id=${param.id}",{
			success:function(data){
				console.log(data);
				str="";
				str+="<c:if test='${tripcnt==0}'><div id=message><h1>등록된 일정이 없습니다. 새로운 여행을 만들어보세요!</h1></div></c:if>"
				str+="<c:if test='${tripcnt>0}'>"
				str+=data;
				str+="</c:if>";
				$("#content").html(str);
			}
		})
	}
	function getReview(){
		$.ajax("../ajax/getReview.do?id=${param.id}",{
			success:function(data){
				console.log(data);
				str="";
				str+="<c:if test='${reviewcnt==0}'><div id=message><h1>등록된 리뷰가 없습니다. 리뷰를 등록해주세요!</h1></div></c:if>"
				str+="<c:if test='${reviewcnt>0}'>"
				str+=data;
				str+="</c:if>";
				$("#content").html(str);
			}			
		})
	}
	function getBook(){
		$.ajax("../ajax/getBook.do?id=${param.id}",{
			success:function(data){
				//alert(data);
				console.log(data);
				str="";
				str+="<c:if test='${bookcnt==0}'><div id=message><h1>추가된 북마크가 없습니다. 관심있는 일정을 모아보세요!</h1></div></c:if>"
				str+="<c:if test='${bookcnt>0}'>"
				str+=data;
				str+="</c:if>";
				$("#content").html(str);
			}			
		})		
	}
</script>
</head>
<body>
<section id="main" class="wrapper style1">
<div>
	<div id="myInfo">
		<div id="profile">
		<c:if test="${!empty mem.profile}">
		`	<img src="../member/picture/${mem.profile}">
		</c:if>
		<c:if test="${empty mem.profile || mem.profile==' '}">
			<img src="../resource/images/user.png">
		</c:if>
		</div>
		<div id="id">
			<h5>${sessionScope.login}</h5>
		</div>
		<div id="nick">
			<h1>${mem.nick}</h1>
		</div>
		<hr>
		<div id="update">
			<input type="button" value="회원정보수정" id="updateMember" onclick="location.href='updateMemberForm.do?id=${param.id}'">
		</div>
		<div id="post">
			<span>내여행</span><span>리뷰</span><span>북마크</span>
		</div>
		<div id="postCnt">
			<span>${tripcnt}</span><span>${reviewcnt}</span><span>${bookcnt}</span>
		</div>
	</div>
	<div id="myPost">
		<div>
			<span><a href="javascript:getTrip()">내여행</a></span>
			<span><a href="javascript:getReview()">리뷰</a></span>
			<span><a href="javascript:getBook()">북마크</a></span>
		</div>
		<div id="content">
		<%-- 
			<table onClick = "location.href='reviewInfo.do?reviewNo='">
				<tr><th colspan="3">액티비티/ 관광지</th></tr>
				<tr><td colspan="3" id="imgbox"><img src="../resource/images/kapadokya.jpg"></td></tr>
				<tr><td colspan="3">신기한 벌룬</td></tr>
				<tr><td colspan="3">카파도키아</td></tr>
			</table>--%>
			<%-- 
				<div class="triplist">
					<div class="trip">
						<h3>${v.city}</h3><h3>${v.tripTitle}</h3>
							<fmt:formatDate value="${v.startDate}" pattern="yyyy-MM-dd" var="start"/>
							<fmt:formatDate value="${v.endDate}" pattern="yyyy-MM-dd" var="end"/>
						<h3>${start} ~ ${end}</h3><br>
						<div class="update">
							<input type="button" value="공유" class="sharebt" onclick="popShare(${v.tripNo},${v.share})">
							<p><a href="schedule.do?tripNo=${v.tripNo}">수정</a></p>
							<p>
								<a href="deleteTrip.do?tripNo=${v.tripNo}" onclick="return confirm('여행을 삭제하시겠습니까?');">삭제</a>
							</p>
						</div>
					</div>
				</div>	--%>	
		</div>

	</div>
</div>
</section>
</body>
</html>