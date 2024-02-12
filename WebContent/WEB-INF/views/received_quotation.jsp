<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>received_quotation</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
		
		$(document).ready(function () {
			
		});

</script>
<style>
	#a_comment-board-title:hover {
		color: #fff;
	}

	.btnss {
		background-color: lightgray;
		border-radius: 5px;
		border: none;
		width: 70px;
		height: 35px;
	}
</style>

</head>

<body>
	<!-- 네비부분 -->
<c:import url="/WEB-INF/views/include/header.jsp" />

	<!--여기까지 네비부분-->
	<!--본문-->
	<div class="container mt-5 mb-5" style="width: 60%">
		<h2><strong>${param.reco } 에서 활동하는 일류들</strong></h2>
			<%-- <c:forEach var="obj" items="${proIds}" loop="i">
			  <div>recoProUser: ${recoProUsers[i.index]}</div>
			  <div>pro_id: ${proIds[i.index]}</div>
			</c:forEach> --%>
			
					<ul class="list-group list-group-flush mb-5 mt-5">
					<c:forEach var="obj" items="${recoProUsers}" varStatus="loop">
			    <li class="list-group-item">
			        <h4 class="mb-3"></h4>
			        <div class="fw-bold mb-3">${obj}일류님</div>
			        <span>받은 견적</span> &nbsp;
			        <span style="color: #00CDFF;">4개</span> &nbsp;
			        <span style="color: lightgray;">3시간 전</span>
			        <div class="btns mt-3">
			            <%--  <button class="btnss">${obj.active_detailcategory1 }</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            <button class="btnss">${obj.active_detailcategory2 }</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			            <button class="btnss">${obj.active_detailcategory3 }</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			             --%>
			        </div>
			        <hr>
			        <div class="row text-center">
			            <div class="col-6 fw-bold" style="cursor: pointer;">삭제하기</div>
			            <div class="col-6 fw-bold" style="color: #00CDFF; cursor: pointer;" onclick="location.href='${root}/chatting?pro_id=${proIds[loop.index]}'">채팅하기</div>
			        </div>
			    </li>
			</c:forEach>
		</ul>
	</div>


	<!--여기까지 본문 -->
	<!--푸터-->
<c:import url="/WEB-INF/views/include/footer.jsp" />
	
</body>

</html>