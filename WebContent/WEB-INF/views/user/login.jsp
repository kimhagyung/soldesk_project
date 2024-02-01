<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>

<script src="script/jquery-3.4.1.min.js"></script>
<script src="${root}/script/jquery-3.4.1.min.js"></script>

<style>
.card-body {
	background-color: #C6D7E0;
}

#email, #password {
	font-size: 18px;
}
</style>

</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-5">
				<h2 class="card-title text-center mb-5 mt-5 fw-bold">로그인</h2>
				<div class="card">
					<div class="card-body" style="padding: 30px; font-size: 20px;">
						<form>
							<div class="mb-3">
								<label for="email" class="form-label">이메일 주소</label> <input
									type="email" class="form-control" id="email"
									placeholder="이메일 주소를 입력하세요" required>

							</div>
							<div class="mb-3">
								<label for="password" class="form-label">비밀번호</label> <input
									style="font-size: 18px;" type="password" class="form-control"
									id="password" placeholder="비밀번호를 입력해주세요" required>
							</div>

						</form>
					</div>
				</div>
				<div class="d-grid gap-2 mt-5 text-center">
					<button type="submit" class="btn button-custom py-2 fs-5"
						style="color: white;">이메일 로그인</button>
					<hr />
					<div class="naverlogin"></div>
				</div>
						<c:if test="${fail==true }">
							<div class="alter alter-danger">
								<h3>로그인 실패</h3>
								<p>아이디 비밀번호를 확인해 주세요
							</div>
						</c:if>
						<form:form action="${root }/user/login_pro" method="post"
							modelAttribute="tempLoginUserBean">
							<div class="mb-3">
								<form:label path="user_email">이메일</form:label>
								<form:input path="user_email" class="form-control" type="email"
									placeholder="이메일 주소를 입력하세요" />
							</div>
							<div class="mb-3">
								<form:label path="user_pwd">비밀번호</form:label>
								<form:input path="user_pwd" class="form-control"
									placeholder="비밀번호를 입력해주세요" />
							</div>

							<div class="form-group" style="display: flex; justify-content: flex-end;">
							    <form:button class="btn button-custom" style="color: white;">로그인</form:button>
							    <a href="${root}/user/join" class="btn button-custom">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>


<c:import url="/WEB-INF/views/include/footer.jsp" />


</body>
</html>
