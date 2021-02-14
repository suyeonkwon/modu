<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--				<div class="triplist">
					<div class="trip">
						<h3>${v.city}</h3><h3>${v.tripTitle}</h3>
							<fmt:formatDate value="${v.startDate}" pattern="yyyy-MM-dd" var="start"/>
							<fmt:formatDate value="${v.endDate}" pattern="yyyy-MM-dd" var="end"/>
						<h3>${start} ~ ${end}</h3><br>
						<div class="update">
							<input type="button" value="����" class="sharebt" onclick="popShare(${v.tripNo},${v.share})">
							<p><a href="schedule.do?tripNo=${v.tripNo}">����</a></p>
							<p>
								<a href="deleteTrip.do?tripNo=${v.tripNo}" onclick="return confirm('������ �����Ͻðڽ��ϱ�?');">����</a>
							</p>
						</div>
					</div>
				</div> --%>
<div id="tripBox">
<div class="triplist">
	<c:forEach items="${list}" var="v">
		<div class="trip">
			<h3>${v.city}</h3><h3>${v.tripTitle}</h3>
				<fmt:formatDate value="${v.startDate}" pattern="yyyy-MM-dd" var="start"/>
				<fmt:formatDate value="${v.endDate}" pattern="yyyy-MM-dd" var="end"/>
			<h3>${start} ~ ${end}</h3><br>
			<div class="update">
				<input type="button" value="����" class="sharebt" onclick="popShare(${v.tripNo},${v.share})">
				<p><a href="../plan/schedule.do?tripNo=${v.tripNo}">����</a></p>
				<p>
					<a href="deleteTrip.do?tripNo=${v.tripNo}" onclick="return confirm('������ �����Ͻðڽ��ϱ�?');">����</a>
				</p>
			</div>			
		</div>
	</c:forEach>
</div>
</div>