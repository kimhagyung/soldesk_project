<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!-- 루트경로, 프로젝트시작할 때  -->
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>학력</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${root}/script/jquery-3.4.1.min.js"></script>

<style>
.Explanation {
	color: #B5B5B5;
	font-size: 16px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.Explanation2 {
	color: #3E3E3E;
	font-size: 14px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.Subtitle {
	font-size: 20px;
	font-weight: bold;
	color: #3E3E3E;
}

.Subtitle2 {
	font-size: 24px;
	font-weight: bold;
	color: #3E3E3E;
}

.AfterMD {
	font-size: 12px;
	font-weight: bold;
	color: #85BCEB;
	text-decoration: none;
}

/*섹션 스타일*/
.section-divider {
	border-bottom: 1px solid #F2F2F2; /* 실선 스타일 및 색상 설정 */
}
/*색 있는 버튼*/
.button1 {
	background-color: #85BCEB;
	font-weight: bold;
	margin-top: 20px;
	border: none;
}
</style>

<script>
	
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!-- 헤더 -->

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-6 section-divider">
				<div>
					<h2>
						<strong>학력</strong>
					</h2>
				</div>
				<div class="col Subtitle mt-4">
					<strong>학력 0/10</strong>
				</div>
				<div class="col Explanation">이전 학력부터 순차적으로 작성해주세요</div>
				<button type="button"
					class="btn btn-primary d-flex align-items-center"
					data-bs-toggle="modal" data-bs-target="#staticBackdrop"
					style="background-color: #ffffff; border-color: #85BCEB;">
					<i class="bi bi-plus" style="color: #85BCEB; font-size: 24px;"></i>
					<span class="AfterMD" style="font-size: 18px; color: #85BCEB;">추가하기</span>
				</button>
				<p></p>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
	</div>

	<div class="container md-5">
		<div class="justify-content-center">
			<div id="Explanation" class="col text-center Explanation">등록한 학력사항이 아직 없습니다.</div>
			<div class="col">
				<ul id="experienceList" class="list-unstyled">
					<!-- 학력 리스트는 여기에 동적으로 추가될 것입니다. -->
				</ul>
			</div>
		</div>
	</div>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<button type="button" class="btn btn-primary btn-lg"
					style="width: 100%; background-color: #85BCEB; font-weight: bold; margin-top: 20px; border: none;"
					onclick="location.href='${root}/pro/expert'">저장하기</button>
			</div>
		</div>
	</div>

	<!-- 추가하기 Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!--<div class="modal-header">-->
				<div class="modal-body">
					<div class="text-end">
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="row">
						<span class="col Subtitle2">학력</span>
						<div class="Explanation2">*필수 입력 항목입니다</div>
						<!--<div class="col text-end">
				<button type="button" class="InvisibleButton AfterMD"></button></div>-->
					</div>
					<div class="rounded-3 p-3 border"
						style="background-color: #D2D2D2; text-align: center;">
						<i class="bi bi-exclamation-circle"> &nbsp;<span
							style="font-size: 14px;"> 개인 정보 노출 및 허위 정보를 기재할 경우, 아숨 이용이
								제한될 수 있으며 사안에 따라 법적 책임을 물을 수 있습니다. </span></i>
					</div>
					<form class="was-validated">
						<!-- 학교명 입력 -->
						<div class="mt-4">
						    <label for="validationTextareaSchool" class="form-label">학교명*</label>
						    <input class="form-control" id="validationTextareaSchool" placeholder="ex. 아숨대학교" required></input>
						    <div class="row">
						        <div class="col-auto invalid-feedback">학교명을 입력해주세요.</div>
						        <div class="col text-end" style="color: #B5B5B5; font-size: 14px;">
						            <span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/40자
						        </div>
						    </div>
						</div>
					</form>
					<!-- 전공명 입력 -->
					<div class="mt-4">
					    <label for="validationTextareaMajor" class="form-label">전공명</label>
					    <input class="form-control" id="validationTextareaMajor" placeholder="ex. 경영학과" required></input>
					    <div class="row">
					        <div class="col-auto invalid-feedback">전공명을 입력해주세요.</div>
					        <div class="col text-end" style="color: #B5B5B5; font-size: 14px;">
					            <span id="titleCharCountMajor" style="color: #85BCEB;">0&nbsp;</span>/20자
					        </div>
					    </div>
					</div>
					<div class="mt-4">
						<label for="validationTextarea" class="form-label">입학 연월*</label>
						<div class="row">
							<div class="col">
								<select name="startYear" class="form-select"
									aria-invalid="false" id="startYear" aria-required="true">
									<option disabled selected value="">년</option>
								</select>
							</div>
							<div class="col">
								<select name="startMonth" class="form-select"
									aria-invalid="false" id="startMonth" aria-required="true">
									<option disabled selected value="">월</option>
								</select>
							</div>
						</div>
					</div>
					<div class="mt-4">
						<label for="validationTextarea" class="form-label">졸업 연월*</label>
						<div class="row">
							<div class="col">
								<select name="endYear" class="form-select" aria-invalid="false"
									id="endYear" aria-required="true">
									<option disabled selected value="">년</option>
								</select>
							</div>
							<div class="col">
								<select name="endMonth" class="form-select" aria-invalid="false"
									id="endMonth" aria-required="true">
									<option disabled selected value="">월</option>
								</select>
							</div>
						</div>
					</div>

					<div class="mt-4">
						<label for="validationTextarea" class="form-label">증빙 자료
							첨부</label>
						<div class="row">
							<div class="photo_review">
								<div id="document-btn-container"
									style="margin-top: 0.2%; margin-bottom: 20px;">
									<label for="document-fileInput">
										<button class="btn" id="document-btn"
											style="width: 100px; height: 100px; border: 1px dashed #d2d2d2; margin-right: 5px;">
											<i class="bi bi-plus-circle upload-icon"
												style="color: #6387A6"></i>
										</button>
									</label> <input type="file" id="document-fileInput"
										style="display: none;" accept="image/*">
								</div>
							</div>
						</div>
					</div>
					<!--<div class="modal-footer">-->

				</div>
				<div>
					<button type="button" class="btn btn-primary"
						style="width: 100%; background-color: #85BCEB; font-weight: bold; margin-top: 20px; border: none;">등록</button>
				</div>
			</div>
		</div>

<c:import url="/WEB-INF/views/include/footer.jsp" />

		<!-- JavaScript 부분 -->
		<script>
			// 학교명 입력 글자수 세기
			$('#validationTextareaSchool').on('input', function() {
				var enteredValue = $(this).val();
				var charCount = enteredValue.length;
				$('#titleCharCount').text(charCount + " ");

				// 40자 제한
				if (charCount > 40) {
					$(this).val(enteredValue.substring(0, 40));
					$('#titleCharCount').text("40" + " ");
				}
			});

			// 전공명 입력 글자수 세기
			$('#validationTextareaMajor').on('input', function() {
		        var enteredValue = $(this).val();
		        var charCount = enteredValue.length;
		        $('#titleCharCountMajor').text(charCount + " ");
		
		        // 20자 제한
		        if (charCount > 20) {
		            $(this).val(enteredValue.substring(0, 20));
		            $('#titleCharCountMajor').text("20" + " ");
		        }
		    });
		</script>


		<script>
			// select bar 스크립트
			$(function() {
				$('#totalPeriod').on('change', function() {
					var selectedValue = $(this).val();
					console.log('선택된 값: ' + selectedValue);
					// 선택된 값을 사용하여 무언가를 처리할 수 있습니다.
				});
			});
		</script>


		<script>
			//연월 select bar
			function initializeYearMonth(selectId, yearRange) {
				var yearSelect = document.getElementById(selectId + 'Year');
				var monthSelect = document.getElementById(selectId + 'Month');

				// 년 옵션 추가
				var currentYear = new Date().getFullYear();
				for (var i = 0; i <= yearRange; i++) {
					var option = document.createElement('option');
					option.value = currentYear - i;
					option.textContent = currentYear - i + '년';
					yearSelect.appendChild(option);
				}

				// 월 옵션 추가
				for (var i = 1; i <= 12; i++) {
					var option = document.createElement('option');
					option.value = i;
					option.textContent = i + '월';
					monthSelect.appendChild(option);
				}
			}

			document.addEventListener('DOMContentLoaded', function() {
				initializeYearMonth('start', 30);
				initializeYearMonth('end', 15);
			});

			// 문서 로드 시 시작 연월 초기화 함수 호출
			document.addEventListener('DOMContentLoaded',
					initializeStartYearMonth);
		</script>


		<!-- 증빙 자료 첨부 스크립트 -->
		<script>
			document
					.getElementById('document-fileInput')
					.addEventListener(
							'change',
							function() {
								var currentImageCount = document
										.querySelectorAll('.uploaded-document-image').length;
								if (currentImageCount >= 7) {
									alert('최대 7장까지만 첨부할 수 있습니다.');
									return;
								}

								var reader = new FileReader();
								reader.onload = function(e) {
									var newImage = document
											.createElement('img');
									newImage.src = e.target.result;
									newImage.alt = 'Uploaded Document';
									newImage.className = 'uploaded-document-image';
									newImage.style.width = '100px';
									newImage.style.height = '100px';
									newImage.style.border = '1px dashed #d2d2d2';
									newImage.style.borderRadius = '10px';
									newImage.style.marginRight = '5px';

									var documentContainer = document
											.getElementById('document-btn-container');
									documentContainer.appendChild(newImage);

									// 이미지 삭제 기능 추가
									newImage.addEventListener('click',
											function() {
												documentContainer
														.removeChild(newImage);
											});
								};

								reader.readAsDataURL(this.files[0]);
							});

			document.getElementById('document-btn').addEventListener('click',
					function() {
						document.getElementById('document-fileInput').click();
					});
		</script>



<!-- 모달 데이터 등록 스크립트(미완성) -->
<script>
    $(function () {
        var educationCounter = 1;

        // 학력 등록 함수
        function registerEducation() {
            var schoolName = $('#validationTextareaSchool').val().trim();
            var major = $('#validationTextareaMajor').val().trim();
            var startYear = $('#startYear').val();
            var startMonth = $('#startMonth').val();
            var endYear = $('#endYear').val();
            var endMonth = $('#endMonth').val();
            var documentFile = $('#document-fileInput')[0].files[0];

            // 필수 입력 항목 검증
            if (!schoolName || !startYear || !startMonth || !endYear || !endMonth) {
                alert('모든 필수 입력 항목을 입력해주세요.');
                return;
            }

            // 이미지를 미리 보여주기 위한 코드 (이미지 경로를 활용하거나 서버에 업로드하여 경로를 설정할 수 있습니다.)
            var imageUrl = '../image/1.png'; // 이미지가 업로드되지 않았을 경우 사용될 이미지 경로
            if (documentFile) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    imageUrl = e.target.result;
                };
                reader.readAsDataURL(documentFile);
            }

            var educationId = 'education' + educationCounter;

            var liElement = $('<li id="' + educationId + '">');
            liElement.append('<h5>' + schoolName + ' <i class="bi bi-x remove-education"></i></h5>');
            liElement.append('<span style="font-size: 12px; color: #C0C0C0;">' + startYear + '년 ' + startMonth + '월 - ' + endYear + '년 ' + endMonth + '월</span>');
            liElement.append('<p>전공: ' + major + '</p>');

            // 이미지를 미리 보여주기 위한 코드
            liElement.append('<div class="photo_review"><img src="' + imageUrl + '" class="uploaded-education-image" alt="Education Image" style="width: 100px; height: 100px; border: 1px dashed #d2d2d2; border-radius: 10px; margin-right: 5px;"></div>');

            liElement.append('<p class="section-divider">' + '</p>');

            $('#educationList').append(liElement);

            educationCounter++;

            // 입력란 초기화
            $('#validationTextareaSchool, #validationTextareaMajor').val('');
            $('#startYear, #startMonth, #endYear, #endMonth').val('');
            $('#document-fileInput').val('');

            // 모달 닫기
            $('#staticBackdrop').modal('hide');

            // 학력 리스트 텍스트 가시성 업데이트
            updateEducationTextVisibility();
        }

        // 학력 등록 버튼 클릭 시
        $('#staticBackdrop .btn-primary').on('click', function () {
            registerEducation();
        });

        // 학력 리스트 텍스트 가시성 업데이트 함수
        function updateEducationTextVisibility() {
            var educationListLength = $('#educationList li').length;
            $('#Explanation').toggle(educationListLength === 0);
        }
    });
</script>



</body>
</html>
