<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Account Modify</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	
</script>
<style>
.profileContainer {
	display: flex;
	justify-content: center;
	align-items: center;
}

.profilecontainer {
	width: 100px;
	height: 100px;
	position: relative;
}

.account {
	font-size: 25px;
}

.custom-hr {
	border: 1px solid #b4b8c2;
}

#upload-btn-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

#btn {
	color: gray;
	background-color: white;
	border-radius: 50%;
	font-size: 20px;
	font-weight: bold;
	position: absolute;
	bottom: 0;
	right: 0;
	width: 32px;
	height: 32px;
}

#upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

#uploaded-image {
	max-width: 100%;
	height: auto;
	margin-top: 10px;
	display: block;
	position: relative;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-6">

				<div class="account">
					<strong>계정 설정</strong>
				</div>

				<!-- 프로필이미지 수정 공간 -->
				<div class="profileContainer">
					<!-- 프로필 이미지 가운데 배치 위한 -->
					<div class="profilecontainer"
						style="margin-top: 8%; margin-bottom: 8%;">
						<img class="uploaded-image" id="uploaded-image"
							src="../image/1.png" alt="이미지1"
							style="width: 100px; height: 100px; border-radius: 50%; position: relative; border: 1px solid #F3F3F3;">
						<button class="btn" id="btn" style="border: 1px solid #F3F3F3;">
							<i class="bi bi-camera"
								style="width: 32px; height: 32px; border-radius: 50%; position: absolute; bottom: 0; right: 0; padding-left: 2px; padding-top: 2px;"></i>
							<!-- <img class="image2" src="../image/2.png" alt="이미지2" > -->
						</button>
						<input type="file" name="myfile" id="myfile" accept="image/*"
							style="display: none;" />
					</div>
				</div>

				<!-- 이름 수정 공간 -->
				<div class="">
					<div class="name" style="color: #b4b8c2;">이름(아숨 활동명)</div>
					<div class="input-group mb-3 mt-1">
						<input type="text" class="form-control" id="nameInput" name="name"
							placeholder="OOO" vlaue="OOO">
					</div>
					<hr class="custom-hr" />
				</div>

				<!-- 이메일 수정 공간 -->
				<div class="">
					<div class="name" style="color: #b4b8c2;">이메일</div>
					<div class="input-group mb-3 mt-1">
						<input type="text" class="form-control" id="emailInput"
							name="email" placeholder="O@examile.com" vlaue="O@example.com">
					</div>
					<hr class="custom-hr" />
				</div>

				<!-- 비밀번호 수정 공간 -->
				<div class="">
					<div class="name" style="color: #b4b8c2;">기존 비밀번호</div>
					<div class="input-group mb-3 mt-1">
						<input type="text" class="form-control" name="existingPass"
							placeholder="현재 비밀번호를 입력해주세요">
					</div>
					<div class="name" style="color: #b4b8c2;">새로운 비밀번호</div>
					<div class="input-group mb-3 mt-1">
						<input type="text" class="form-control" name="newPass"
							placeholder="영문 + 숫자 조합 8자리 이상 입력해주세요">
					</div>
					<div class="name" style="color: #b4b8c2;">새로운 비밀번호 확인</div>
					<div class="input-group mb-3 mt-1">
						<input type="text" class="form-control" name="newPassCheck"
							placeholder="비밀번호를 한번 더 입력해주세요">
					</div>
					<hr class="custom-hr" />
				</div>

				<!-- 수정 완료 버튼 -->
				<div class="d-grid gap-2 d-md-flex justify-content-md-center">
					<button class="btn button-custom" type="button"
						style="margin-top: 5%; color: #ffffff;"
						onclick="moveToSettingPage()">수정 완료</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 페이지 로딩 시에 기본 이미지 설정
		window.onload = function() {
			document.getElementById('uploaded-image').src = '../image/1.png';
		};

		document.getElementById('btn').addEventListener('click', function() {
			document.getElementById('myfile').click();
		});

		//프로필 이미지 변경
		document
				.getElementById('myfile')
				.addEventListener(
						'change',
						function() {
							var reader = new FileReader();
							reader.onload = function(e) {
								document.getElementById('uploaded-image').src = e.target.result;
							};
							reader.readAsDataURL(this.files[0]);
						});

		function moveToSettingPage() {
			window.location.href = '${root}/user/AccountSetting.html';
		}
	</script>
</body>
</html>
