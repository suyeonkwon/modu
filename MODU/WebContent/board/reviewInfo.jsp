<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set value="${sessionScope.mem}" var="mem"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>리뷰 상세페이지</title>
<link rel="stylesheet" href="../resource/css/style-board.css" />
<style type="text/css">
section#main {
    margin: 0 20%;
}
img.profile {
    position: relative;
    top: 15px;
}
div #detail{
	background-color:#EEEEEE;
	border-radius: 10px;
    	width: auto;
    	padding: 5%;
}	
img#marker {
    position: relative;
    top: 5px;
    left: 5px;
}
td#placedetail {
    padding: 0 30%;
}
#detail h1 {
    display: inline-block;
    font-size: 17px;
    font-weight: bold;
}
.commentBox {
    width: 100%;
    margin: 20px 55px;
}
input#commentText {
    display: inline-block;
    width: 80%;
}
div#inputcomment {
    margin: 30px 0;
}

input#commentAddBt {
    background-color: #fe6667;
    color: #ffffff;
}

div .comment {
    margin: 10px 20px;
    position: relative;
    width: 75%;
}

#main th {
    font-weight: 300;
    font-size: 18px;
}

.nick, .regdate, .update, .comment {
    display: inline-block;
}
.regdate {
    margin-right: 3%;
}
input#edit {
    margin: 2% 0;
}
.comment a {
    margin-right: 1%;
}

.comment, .update a {
    font-size: small;
}
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	<%--var id = '<%=session.getAttribute("login")%>';--%>
	var id = '${sessionScope.login}';
	
	function popOpen(url){
		window.open(url,'','');
	}
	
	function commentAdd(){
		if(${sessionScope.login==null}){
			alert("회원만 등록 가능합니다");
			$("#commentText").val('');
		}else{
			var commentText=$("#commentText").val();
			$.ajax({
				type:"post",
				url:"../ajax/commentAdd.do?reviewNo=${param.reviewNo}",
				dataType:"text",
				data:{'comment':commentText,'id':id},
				success:function(data){
					if(data==1){
						alert("댓글 등록 완료!");
					}
					getComment();
					$("#commentText").val("");
				},
				error:function(e){
					alert("서버오류:"+e.status);
				}
			});
		}
	}
	
	$(function(){
		getComment();	
	})

	function getComment(){
		$.ajax("../ajax/comment.do?reviewNo=${param.reviewNo}",{
			success:function(data){
				console.log(data);
				$("#commentall").html(data);
			},
			error:function(e){
				alert("서버오류:"+e.status);
			}
		})
	}	
	
	function editComment(commentNo){
		var html="";
		html+="<div id='No"+commentNo+"'><input type='text' id='edit' name='edit'>";
		html+="<a href='javascript:updateComment("+commentNo+")'>수정</a>&nbsp;<a href='javascript:getComment()'>취소</a>";
		html+="</div>"
		
		$("#"+commentNo+"No").replaceWith(html);
		$("#"+commentNo+"No #edit").focus();
	}
	
	function updateComment(commentNo){
		var editText=$("#edit").val();
		$.ajax({
			type:"post",
			url:"../ajax/commentUpdate.do?commentNo="+commentNo,
			dataType:"text",
			data:{'comment':editText},
			success:function(data){
				if(data==1){
					alert("수정 완료!");
				}
				getComment();
			},
			error:function(e){
				alert("서버오류:"+e.status);
			}
		});		
	}
	function deleteComment(commentNo){
		var check=confirm("댓글을 삭제하시겠습니까?")
		if(check){
			$.ajax("../ajax/commentDelete.do?commentNo="+commentNo,{
				success:function(data){
					if(data==1){
						alert("삭제 완료!");
					}
					getComment();
				},
				error:function(e){
					alert("서버오류:"+e.status);
				}
			});			
		}else{
			getComment();
		}

	}

	
	
</script>
</head>
<body>
<section id="main" class="wrapper style1">
<input type="hidden" value="${sessionScope.login}" id="id" name="id">
	<table>
		<tr><th><img src="..//member/picture/${member.profile}" class="profile">&nbsp;${member.nick}</th>
		<th id="likebook"><c:if test="${likechk==0}">
				<a href='likefunc.do?likechk=${likechk}&reviewNo=${list.reviewNo}&type=2'>
				<img src="../resource/images/heart1.png" class="like"></a>
			</c:if>
			<c:if test="${likechk==1}">
				<a href='likefunc.do?likechk=${likechk}&reviewNo=${list.reviewNo}&type=2'>
				<img src="../resource/images/heart2.png" class="like"></a>
			</c:if> &nbsp; ${likecnt}</th></tr>
		<tr><th id="title">${list.subject}</th>
			<fmt:formatDate value='${list.regdate}' var="regdate" pattern="yyyy-MM-dd HH:mm"/>
			<th id="regdate">${regdate}</th></tr>
		<tr><td colspan="2" id="content">${list.content}</td></tr>
		<tr><td colspan="2" id="placedetail"><a href="javascript:popOpen('${list.url}')">
			<div id="detail"><img src="../resource/images/marker3.png" id="marker">
			<h1>${list.place}</h1><br>${list.address}</div></a></td></tr>
		<c:if test="${member.id==sessionScope.login}">
		<tr><td colspan="2" style="text-align:right;"><a href="updateFormReview.do?reviewNo=${list.reviewNo}">수정</a>
													<a href="deleteReview.do?reviewNo=${list.reviewNo}">삭제</a></td></tr>
		</c:if>
	</table>
	<div class="commentBox">
		<div id="inputcomment">
		<c:if test="${!empty mem.profile}">
			<img alt="" src="../member/picture/${mem.profile}" class="profile">
		</c:if>
		<c:if test="${empty mem.profile}">
			<img alt="" src="../resource/images/user.png" class="profile">
		</c:if>
			<input type="text" id="commentText" name="commentText">
			<input type="button" value="등록" id="commentAddBt" onclick="javascript:commentAdd()">
		</div>
		<div id="commentall">
		</div>
	</div>
</section>
</body>
</html>