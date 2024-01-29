<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	// 폼 제출 시 필드가 비어있는지 확인
    $('form').on('submit', function(event) {
        var valid = true;
        
        // 각 필드를 확인하고 비어있으면 메시지 표시
        if ($('#username').val() === '') {
            $('#username').next('.invalid-feedback').html('사용자 이름을 입력하세요.').show();
            valid = false;
        } else {
            $('#username').next('.invalid-feedback').hide();
        }

        if ($('#email').val() === '') {
            $('#email').next('.invalid-feedback').html('이메일 주소를 입력하세요.').show();
            valid = false;
        } else {
            $('#email').next('.invalid-feedback').hide();
        }

        if ($('#password').val() === '') {
            $('#password').next('.invalid-feedback').html('비밀번호를 입력하세요.').show();
            valid = false;
        } else {
            $('#password').next('.invalid-feedback').hide();
        }

        if ($('#confirmPassword').val() === '') {
            $('#confirmPassword').next('.invalid-feedback').html('비밀번호를 입력하세요.').show();
            valid = false;
        } else {
            $('#confirmPassword').next('.invalid-feedback').hide();
        }

        return valid;
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

	<div class=" ">
		<div class="row justify-content-center mx-auto">
			<div class="col-md-5" style="width: 35%;">
				<h2 class="card-title text-center mb-5 mt-5 fw-bold">아숨에 오신 것을
					환영합니다!</h2>
				<div class="card">
					<div class="card-body" style="padding: 30px; font-size: 20px;">
						<form class="needs-validation" novalidate>
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
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#test_license"
											aria-expanded="false" aria-controls="test_license">
											시험/자격증</button>
									</h2>
									<div id="test_license" class="accordion-collapse collapse"
										data-bs-parent="#category">
										<div class="accordion-body">
											<ul class="list-group">
												<li class="list-group-item"><input
													class="form-check-input me-1" type="checkbox"
													value="sports" id="sports"> <label
													class="form-check-label stretched-link" for="sports">스포츠지도사
														준비</label></li>
												<li class="list-group-item"><input
													class="form-check-input me-1" type="checkbox"
													value="korean" id="korean"> <label
													class="form-check-label stretched-link" for="korean">한국어능력시험
														준비</label></li>
												<li class="list-group-item"><input
													class="form-check-input me-1" type="checkbox"
													value="history" id="history"> <label
													class="form-check-label stretched-link" for="history">한국사능력시험
														준비</label></li>
												<li class="list-group-item"><input
													class="form-check-input me-1" type="checkbox" value="info"
													id="info"> <label
													class="form-check-label stretched-link" for="info">정보처리기사
														준비</label></li>
												<li class="list-group-item"><input
													class="form-check-input me-1" type="checkbox"
													value="computer" id="computer"> <label
													class="form-check-label stretched-link" for="computer">컴퓨터활용능력
														준비</label></li>
											</ul>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#interior"
												aria-expanded="false" aria-controls="interior">
												인테리어</button>
										</h2>
										<div id="interior" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="reform" id="reform"> <label
														class="form-check-label stretched-link" for="reform">가구
															리폼</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="bath"
														id="bath"> <label
														class="form-check-label stretched-link" for="bath">욕실/화장실
															리모델링</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="papering" id="papering"> <label
														class="form-check-label stretched-link" for="papering">도배
															시공</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="kitchen" id="kitchen"> <label
														class="form-check-label stretched-link" for="kitchen">주방
															리모델링</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="light" id="light"> <label
														class="form-check-label stretched-link" for="light">조명
															인테리어</label></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#home_appliances"
												aria-expanded="false" aria-controls="home_appliances">
												가전제품</button>
										</h2>
										<div id="home_appliances" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="Electronic" id="Electronic"> <label
														class="form-check-label stretched-link" for="Electronic">전자제품
															수리</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="computer_repair" id="computer_repair"> <label
														class="form-check-label stretched-link"
														for="computer_repair">컴퓨터 수리</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="bidet" id="bidet"> <label
														class="form-check-label stretched-link" for="bidet">비데
															렌탈/구입/청소</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="air_conditioner" id="air_conditioner"> <label
														class="form-check-label stretched-link"
														for="air_conditioner">에어컨 설치 및 수리</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="refrigerator" id="refrigerator"> <label
														class="form-check-label stretched-link" for="refrigerator">냉장고
															설치 및 수리</label></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#clean"
												aria-expanded="false" aria-controls="clean">청소</button>
										</h2>
										<div id="clean" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="clean_air" id="clean_air"> <label
														class="form-check-label stretched-link" for="clean_air">에어컨
															청소</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="bug"
														id="bug"> <label
														class="form-check-label stretched-link" for="bug">바퀴벌레
															퇴치</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="clean_furniture" id="clean_furniture"> <label
														class="form-check-label stretched-link"
														for="clean_furniture">가구 청소</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="clean_stair_toilet" id="clean_stair_toilet">
														<label class="form-check-label stretched-link"
														for="clean_stair_toilet">계단/화장실 청소</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="fire_recovery" id="fire_recovery"> <label
														class="form-check-label stretched-link"
														for="fire_recovery">화재 복구/청소</label></li>
												</ul>
											</div>
										</div>
									</div>


									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#translate"
												aria-expanded="false" aria-controls="translate">번역
											</button>
										</h2>
										<div id="translate" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="chinese" id="chinese"> <label
														class="form-check-label stretched-link" for="chinese">한문
															번역</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="english" id="english"> <label
														class="form-check-label stretched-link" for="english">영어
															번역</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="germany" id="germany"> <label
														class="form-check-label stretched-link" for="germany">독일어
															번역</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="japanese" id="japanese"> <label
														class="form-check-label stretched-link" for="japanese">일본어/일어
															번역</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="Vietnamese" id="Vietnamese"> <label
														class="form-check-label stretched-link" for="Vietnamese">베트남어
															번역</label></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#document"
												aria-expanded="false" aria-controls="document">문서</button>
										</h2>
										<div id="document" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="write" id="write"> <label
														class="form-check-label stretched-link" for="write">문서/글
															작성</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="ppt"
														id="ppt"> <label
														class="form-check-label stretched-link" for="ppt">PPT
															제작</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="subtitles" id="subtitles"> <label
														class="form-check-label stretched-link" for="subtitles">자막
															제작</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="business" id="subtitle"> <label
														class="form-check-label stretched-link" for="subtitle">사업계획서
															작성</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="data"
														id="data"> <label
														class="form-check-label stretched-link" for="data">교정/교열
															</label></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#develop"
												aria-expanded="false" aria-controls="develop">
												외주(개발)</button>
										</h2>
										<div id="develop" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="web"
														id="web"> <label
														class="form-check-label stretched-link" for="web">웹
															개발</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="game"
														id="game"> <label
														class="form-check-label stretched-link" for="game">게임
															개발</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="iOS"
														id="iOS"> <label
														class="form-check-label stretched-link" for="iOS">iOS
															개발</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="qa"
														id="qa"> <label
														class="form-check-label stretched-link" for="qa">QA
															테스트</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="erp"
														id="erp"> <label
														class="form-check-label stretched-link" for="erp">ERP
															개발</label></li>
												</ul>
											</div>
										</div>
									</div>

									<div class="accordion-item">
										<h2 class="accordion-header">
											<button class="accordion-button collapsed" type="button"
												data-bs-toggle="collapse" data-bs-target="#pet"
												aria-expanded="false" aria-controls="pet">반려동물</button>
										</h2>
										<div id="pet" class="accordion-collapse collapse"
											data-bs-parent="#category">
											<div class="accordion-body">
												<ul class="list-group">
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox" value="walk"
														id="walk"> <label
														class="form-check-label stretched-link" for="walk">반려견
															산책</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="beauty" id="beauty"> <label
														class="form-check-label stretched-link" for="beauty">반려동물
															미용</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="snack" id="snack"> <label
														class="form-check-label stretched-link" for="snack">반려동물
															수제간식 만들기</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="training" id="training"> <label
														class="form-check-label stretched-link" for="training">반려동물
															훈련</label></li>
													<li class="list-group-item"><input
														class="form-check-input me-1" type="checkbox"
														value="funeral" id="funeral"> <label
														class="form-check-label stretched-link" for="funeral">반려동물
															장례</label></li>
												</ul>
											</div>
										</div>
									</div>
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
						</form>
					</div>
				</div>

			</div>
			<div class="d-grid gap-2 mt-5">
				<button type="submit" class="btn button-custom py-2 fs-5"
					style="color: white;">가입하기</button>
			</div>
		</div>
	</div>


<c:import url="/WEB-INF/views/include/footer.jsp" />



</body>

</html>