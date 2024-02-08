<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root }/jquery/locdata.js"></script>
<style>
.Explanation {
	color: #B5B5B5;
	font-size: 16px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.Subtitle {
	font-size: 20px;
	font-weight: bold;
	color: #3E3E3E;
}

#InvisibleButton {
	background-color: transparent;
	border: none;
}

.AfterMD {
	font-size: 15px;
	font-weight: bold;
	color: #85BCEB;
	text-align: right;
}

.InvisibleButton {
	background-color: transparent;
	border: none;
}

/*섹션 스타일*/
.section-divider {
	border-bottom: 1px solid #F2F2F2; /* 실선 스타일 및 색상 설정 */
}
</style>


<script>

$(document).ready(function() {
  
    $(document).ready(function() {
        // 폼이 제출될 때 이벤트 핸들러 추가
        $("form").submit(function(event) {
            //event.preventDefault(); // 폼 제출 기본 동작 막기

            // 각 입력 요소에서 값을 가져와서 웹 콘솔에 출력
            var serviceType = $(".service").val();
            var portfolioTitle = $("#portfolio_title").val();
            var locationInfo = $(".locationBtn input").val();
            var finalAmount = $("#final_amount").val();
            var workYear = $("#yearSelect").val();
            var workPeriod = $("#work_period").val();
            var detailedIntroduction = $(".myTextarea").val();

            console.log("Service Type:", serviceType);
            console.log("Portfolio Title:", portfolioTitle);
            console.log("Location Info:", locationInfo);
            console.log("Final Amount:", finalAmount);
            console.log("Work Year:", workYear);
            console.log("Work Period:", workPeriod);
            console.log("Detailed Introduction:", detailedIntroduction);
        });
    });
    
 	// 리스트 아이템을 클릭할 때마다 실행될 함수
    $('.list-group-item').on('click', function(event) {
        // 선택된 값을 콘솔에 출력
        var selectedValue = $(this).text().trim();
        console.log('Selected value:', selectedValue);

        // 선택된 값 저장
        //$('.list-group-item').removeClass('active'); // 기존에 선택된 항목이 있다면 선택 해제
        $(this).addClass('active'); // 현재 클릭된 항목을 선택
    });
    // 선택 버튼을 클릭했을 때 실행될 함수
    $("#selectLocationBtn").click(function() {
        // 선택된 값 가져오기
        var selectedValue = $(".list-group-item.active").text().trim();

        // 콘솔에 선택된 값을 출력
        console.log('Selected value:', selectedValue);

        // 선택된 값이 있는지 확인
        if (selectedValue) {
            // 모달 닫기
            $("#locationModal").modal('hide');
            // 선택된 값으로 버튼 텍스트 설정
            $(".locationBtn").text(selectedValue);
        } else {
            console.log('Please select a value.');
        }  
    }); 

    // 연도 선택 스크립트
    var yearSelectElement = $('#yearSelect');
    var currentYear = new Date().getFullYear();

    for (var year = currentYear; year >= 1980; year--) {
        var option = $('<option>').attr('value', year).text(year);
        yearSelectElement.append(option);
    }

    // 파일 업로드를 처리하는 스크립트
    // 이미지 변경 처리 함수
    function handleImageChange(containerId, previewId) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var newImage = $('<img>').attr({
                src: e.target.result,
                alt: '대표 이미지',
                style: 'width: 100px; height: 100px; border: 1px dashed #d2d2d2; border-radius: 10px; margin-right: 5px;'
            });

            var documentContainer = $(containerId);
            documentContainer.empty(); // 이미지 미리보기를 하나만 허용하므로 기존 미리보기 삭제

            // 새로운 이미지를 추가
            documentContainer.append(newImage);

            // 삭제 버튼 생성 및 추가
            var deleteButton = createDeleteButton(containerId, previewId);
            documentContainer.append(deleteButton);
        };

        reader.readAsDataURL($('#representative-document-fileInput')[0].files[0]);
    }

    // 삭제 버튼 생성 함수
    function createDeleteButton(containerId, previewId) {
        var deleteButton = $('<button>').addClass('btn delete-icon p-0 position-relative').html('<i class="bi bi-x-circle-fill" style="color: #CC0000; position: absolute; top:-55px; right: 0;"></i>');
        deleteButton.click(function() {
            resetImagePreview(containerId, '#representative-document-fileInput', previewId);
        });

        return deleteButton;
    }

    // 이미지 초기화 함수
    function resetImagePreview(containerId, fileInputId, previewId) {
        var documentContainer = $(containerId);
        documentContainer.empty(); // 이미지 미리보기 및 삭제 버튼 제거
        $(fileInputId).val(''); // 파일 선택 input 초기화

        // 이미지 등록 버튼 생성 및 추가
        var newUploadButton = createUploadButton(containerId, previewId);
        documentContainer.append(newUploadButton);
    }

    // 이미지 업로드 버튼 생성 함수
    function createUploadButton(containerId, previewId) {
        var uploadButton = $('<label for="representative-document-fileInput">')
            .append('<div id="' + previewId.substring(1) + '" class="d-none"></div>')
            .append('<button class="btn" id="representative-document-btn" style="width: 100px; height: 100px; border: 1px dashed #d2d2d2;">' +
                '<i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>' +
                '</button>')
            .append('<input type="file" id="representative-document-fileInput" style="display: none;" accept="image/*">');

        return uploadButton;
    }
 

    // 상세 이미지 등록 처리
    $('#document-btn').click(function() {
        $('#document-fileInput').click();
    });

    // 상세 이미지 선택 시 처리
    $('#document-fileInput').change(function() {
        var currentImageCount = $('.uploaded-document-image').length;
        if (currentImageCount >= 10) {
            alert('최대 10장까지만 첨부할 수 있습니다.');
            return;
        }

        var reader = new FileReader();
        reader.onload = function(e) {
            var newImage = $('<img>').attr({
                src: e.target.result,
                alt: 'Uploaded Document',
                class: 'uploaded-document-image',
                style: 'width: 100px; height: 100px; border: 1px dashed #d2d2d2; border-radius: 10px; margin-right: 5px;'
            });

            var documentContainer = $('#document-btn-container');

            var imageContainer = $('<div>').css('display', 'inline-block').append(newImage);

            var deleteButton = $('<button>').addClass('btn delete-icon p-0 position-relative').html('<i class="bi bi-x-circle-fill" style="color: #CC0000; position: absolute; top:-55px; right: 0;"></i>');

            deleteButton.click(function() {
                imageContainer.remove();
            });

            imageContainer.append(deleteButton);

            documentContainer.append(imageContainer);
        };

        reader.readAsDataURL(this.files[0]);
    });
});

</script>

</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-6 section-divider">
				<div>
					<h2>
						<strong>포트폴리오</strong>
					</h2>
				</div>

				<div class="col Subtitle mt-4">
					<strong>필수 정보*</strong>
				</div>

				<form:form action="${root}/pro/ProPortfolio" method="post" modelAttribute="Proportfolio_pro" enctype="multipart/form-data">

					<div class=form-container><!--enctype="multipart/form-data"  -->
						<div class="mt-4">
							<form:label path="service_type" class="form-label"
								style="font-weight: bold;">서비스 종류</form:label>
							<form:input path="service_type" autocomplete="off"
								class="form-control required service"
								placeholder="서비스한 활동명을 입력해 주세요" />
							<div class="row">
								<div class="col text-end"
									style="color: #B5B5B5; font-size: 14px;">
									<span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/30자
								</div>
							</div>
						</div>

						<div class="was-validated">
							<!-- 포트폴리오 제목 입력 -->
							<div class="mt-4">
								<form:label path="portfolio_title" class="form-label"
									style="font-weight: bold;">포트폴리오 제목</form:label>
								<form:input path="portfolio_title" autocomplete="off"
									class="form-control" placeholder="포트폴리오 제목을 입력해주세요." />
								<!-- <div class="row">
								<div class="col text-end"
									style="color: #B5B5B5; font-size: 14px;">
									<span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/30자
								</div>
							</div> -->
							</div>
						</div>

						<div class="mt-4">
							<div class="form-label" style="font-weight: bold;">상세 이미지
								등록</div>
							<div class="rounded-3 p-3 border"
								style="background-color: #D2D2D2;">
								<i class="bi bi-exclamation-circle" style="font-size: 14px;">&nbsp;이미지는
									가로, 세로 600px 이상 1:1 비율로 권장합니다. (최대 10장)</i>
							</div>
							<div class="photo_review" style="padding-top: 22.5px;">
								<div id="document-btn-container"
									style="margin-top: 0.2%; margin-bottom: 20px;">
									<form:label path="detailed_images" class="btn "
										id="document-btn"
										style="width: 100px; height: 100px; border: 1px dashed #d2d2d2; margin-right: 5px;">
										<i class="bi bi-plus-circle upload-icon mt-5"
											style="color: #6387A6"></i>
									</form:label>
									<input type="file" name="uploadFiles" type="file"
										id="document-fileInput" style="display: none;"
										accept="image/*" />
								</div>
							</div>
							<p></p>
							<p></p>
							<p></p>
						</div>
						<div class="container mb-5">
							<div class="row justify-content-center">
								<div class="col-md">
									<div class="col Subtitle mt-4">
										<strong>상세 정보</strong>
									</div>
									<div class="mt-4 d-flex flex-column">
										<label class="form-label" style="font-weight: bold;">지역
											정보</label>
										<div>
											<div class="text-decoration-none" data-bs-toggle="modal"
												data-bs-target="#locationModal"
												style="width: 100%; padding: 0; border: none; position: relative; color: black;">
												<input class="form-control w-100 "
													placeholder="시/군/구를 선택해주세요." />
											</div>
										</div>
										<!-- 지역 모달 -->
										<div class="modal fade" id="locationModal" tabindex="-1"
											aria-labelledby="locationModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-dialog-scrollable">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="locationModalLabel">지역
															선택</h1>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="accordion" id="categoryAccordion">
															<!-- 아래 스크립트를 body 내부에 추가하세요 -->
															<script>
									                        $.each(cityDatas, function (city, districts) {
									                            document.write('<div class="accordion-item">');
									                            document.write('<h2 class="accordion-header">');
									                            document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">' + city + '</button>');
									                            document.write('</h2>');
									                            document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
									                            document.write('<ul class="list-group">');
									                            $.each(districts, function (index, district) {
									                                document.write('<button type="button" class="list-group-item list-group-item-action selected">' + district + '</button>'); 
									                            });
									                            document.write('</ul></div></div>');
									                        });
									                        
									                    </script>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="button" class="btn btn-primary"
															id="selectLocationBtn">선택</button>
													</div>
												</div>
											</div>
										</div>

									</div>

									<div class="mt-4">
										<form:label path="final_amount" class="form-label"
											style="font-weight: bold;">최종 금액</form:label>
										<form:input path="final_amount" class="form-control"
											placeholder="최종 금액을 입력해주세요." />
									</div>

									<div class="row">
										<div class="col-md-6 mt-4" style="margin-right: 0;">
											<form:label path="work_year" class="form-label"
												style="font-weight: bold;">작업 연도</form:label>
											<form:select path="work_year" class="form-control required"
												id="yearSelect">
												<!-- 연도 선택 스크립트 -->
											</form:select>
										</div>
										<div class="col-md-6 mt-4" style="margin-right: 0;">
											<div class="row">
												<div class="col-md">
													<form:label path="work_period" class="form-label"
														style="font-weight: bold;">작업 소요기간</form:label>
													<form:input path="work_period"
														class="form-control required"
														placeholder="소요기간(ex.4개월, 1년반)" min="1" />
												</div>
												<!-- <div class="col-md-6">
											<label for="durationUnit" class="form-label"
												style="font-weight: bold;">&nbsp;</label> <select
												class="form-control" id="durationUnit" required>
												<option value="hours">시간</option>
												<option value="days">일</option>
												<option value="weeks">주</option>
												<option value="months">개월</option>
											</select>
										</div> -->
											</div>
										</div>



									</div>

									<div class="mt-4">
										<form:label path="detailed_introduction" class="form-label"
											style="font-weight: bold;">상세 설명</form:label>
										<div class="review_text">
											<form:textarea path="detailed_introduction"
												class="form-control myTextarea"
												style="border-radius: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;"
												placeholder="해당 경력에 대한 상세한 설명을 작성해 주세요."
												oninput="countChars()" rows="5"></form:textarea>
											<div class="col text-end"
												style="color: #B5B5B5; font-size: 14px;">
												<span id="descriptionCharCount" style="color: #85BCEB;">0&nbsp;</span>/100자
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="container mt-5">
							<div class="row justify-content-center">
								<div class="col-md-6 me-4">
									<form:button class="btn button-custom"
										style="width:110%; font-weight: bold; margin-top: 20px; ">등록하기</form:button>
								</div>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>