<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<script src="script/jquery-3.4.1.min.js"></script>

<script>
	$(function() {
		
		
	});
</script>

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
			</div>
		</div>
	</div>

<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>
</html>
