<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root}/jquery/location2.js"></script>

<script>
$(function() {
	
	// 비밀번호 일치 여부 확인
	$('#password, #confirmPassword').on('keyup', function() {
		var password = $('#password').val();
		var confirmPassword = $('#confirmPassword').val();
		var message = $('#message');

		// 사용자가 입력한 password 값이 비어있거나 confirmPassword 값이 비어있으면 메시지를 표시하지 않음
		if (!password || !confirmPassword) {
			message.html('');
			return;
		}

		if (password === confirmPassword) {
			message.html('비밀번호가 일치합니다.').css('color', 'green');
		} else {
			message.html('비밀번호가 일치하지 않습니다.').css('color', 'red');
		}
	});
	 

});
</script>

<style>
#username, #email, #password, #confirmPassword {
	font-size: 18px;
}

.card-body {
	background-color: #C6D7E0;
}
</style>
</head>

<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="w-75 mx-auto">
		<div class="row justify-content-center mx-auto">
			<div class="col-md-5" style="width: 35%;">
				<h2 class="card-title text-center mb-5 mt-5 fw-bold">아숨에 오신 것을
					환영합니다!</h2>
				<div class="card">
					<div class="card-body" style="padding: 30px; font-size: 20px;">
						 <form:form action="${root }/user/join_Prouser" method="post" modelAttribute="joinProuserBean">
							<div class="mb-3">
								<label for="username" class="form-label">이름</label> <input
									type="text" class="form-control" id="username"
									placeholder="사용자 이름을 입력하세요" required>
								<div class="invalid-feedback">이름을 입력하세요.</div>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">이메일 주소</label> <input
									type="email" class="form-control" id="email"
									placeholder="이메일 주소를 입력하세요" required>
								<div class="invalid-feedback">올바른 이메일 주소를 입력하세요.</div>
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">비밀번호</label> <input
									type="password" class="form-control" id="password"
									placeholder="비밀번호를 입력해주세요" required>
							</div>
							<div class="mb-3">
								<label for="confirmPassword" class="form-label">비밀번호 확인</label>
								<input type="password" class="form-control" id="confirmPassword"
									placeholder="비밀번호를 입력해주세요" required>
								<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
							</div>
							<!-- 추가된 부분 비밀번호 메시지-->
							<div id="message"></div>

							<div class="mt-3">
								<label for="servicecategory" class="form-label">활동 분야를
									선택해주세요</label>
							</div>
								<div class="accordion" id="category">
	
								  <script>
								    const categories = [
								      { id: "test_license", title: "시험/자격증", items: ["sports", "korean", "history", "info", "computer"] },
								      { id: "interior", title: "인테리어", items: ["reform", "bath", "papering", "kitchen", "light"] },
								      { id: "home_appliances", title: "가전제품", items: ["Electronic", "computer_repair", "bidet", "air_conditioner", "refrigerator"] },
								      { id: "clean", title: "청소", items: ["clean_air", "bug", "clean_furniture", "clean_stair_toilet", "fire_recovery"] },
								      { id: "translate", title: "번역", items: ["chinese", "english", "germany", "japanese", "Vietnamese"] },
								      { id: "document", title: "문서", items: ["write", "ppt", "subtitles", "subtitle", "data"] },
								      { id: "develop", title: "외주(개발)", items: ["web", "game", "iOS", "qa", "erp"] },
								      { id: "pet", title: "반려동물", items: ["walk", "beauty", "snack", "training", "funeral"] }
								    ];
								
								    categories.forEach(category => {
								        <c:out value="<div class='accordion-item'>"/>
								        <c:out value="<h2 class='accordion-header'>"/>      
								        <c:out value="<button class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#${category.id}'" />
								        <c:out value="aria-expanded='false' aria-controls='${category.id}'>"/>
								        <c:out value="${category.title}"/>
								        <c:out value="</button>"/>
								        <c:out value="</h2>"/>
								        <c:out value="<div id='${category.id}' class='accordion-collapse collapse' data-bs-parent='#category'>"/>
								        <c:out value="<div class='accordion-body'>"/>
								        <c:out value="<ul class='list-group'>"/>
								      
								      ${category.items.forEach(item => {
								        <c:out value="<li class='list-group-item'>"/>
								        <c:out value="<input class='form-check-input me-1' type='checkbox' value='${item}' id='${item}'/>"/>
								        <c:out value="<label class='form-check-label stretched-link' for='${item}'>${item.replace('_', ' ')}</label>"/>    
								        <c:out value="</li>"/>
								      })}
								
								        <c:out value="</ul>"/>
								        <c:out value="</div>"/>
								        <c:out value="</div>"/>
								        <c:out value="</div>"/>
								    });
								  </script>
								</div>
								<div class="container mt-4">
									<label for="locationselect" class="form-label">활동 지역를
										선택해주세요</label>

									<div class="form-group">
										<label for="selectProvince">시/도</label> <select
											class="form-control" id="selectProvince">
											<!-- 시/도 목록 -->
											<option value="seoul" selected>서울</option>
											<option value="busan">부산</option>
											<option value="incheon">인천</option>
											<option value="daejun">대전</option>
											<option value="daegu">대구</option>
											<option value="ulsan">울산</option>
											<option value="kwangju">광주</option>
											<option value="jeju">제주</option>
											<option value="sejong">세종</option>
											<option value="Gyeonggi_do">경기</option>
											<option value="Gangwon">강원</option>
											<option value="Chungcheongbuk">충북</option>
											<option value="Chungcheongnam">충남</option>
											<option value="Gyeongsangbuk">경북</option>
											<option value="Gyeongsangnam">경남</option>
											<option value="Jeollabuk">전북</option>
											<option value="Jeollanam">전남</option>
										</select>
									</div>

									<div class="form-group">
										<label for="selectCity">군/구</label> <select
											class="form-control" id="selectCity">
											<!-- 선택한 시/도에 따른 군/구 목록은 JavaScript로 동적으로 추가됩니다. -->
										</select>
									</div>
								</div>
									<div class="d-grid gap-2 mt-5">
										<button type="submit" class="btn button-custom py-2 fs-5"
										id="joinButton"	style="color: white;">가입하기</button>
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