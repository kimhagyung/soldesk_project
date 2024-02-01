<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>포트폴리오</title>
    <!-- Bootstrap CSS 연결 -->
<script src="${root}/script/jquery-3.4.1.min.js"></script>
    <script src="${root }/jquery/locdata.js"></script>
    <script>
        var jq = $.noConflict();
        jq(function () {
            
        });
    </script>

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

</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container mt-5 mb-5">
    <div class="row justify-content-center">
        <div class="col-md-6 section-divider">
            <div>
                <h2><strong>포트폴리오</strong></h2>
            </div>
            <div class="col Subtitle mt-4"><strong>필수 정보*</strong></div>

            <div class="mt-4">
                <label for="validationTextarea" class="form-label" style="font-weight: bold;">서비스 종류</label>
                <div class="row">
                    <span class="col">변경으로 입력될 내용</span>
                    <div class="col text-end">
                        <button type="button" class="InvisibleButton AfterMD">변경</button>
                    </div>
                </div>
            </div>

            <form class="was-validated">
                <!-- 포트폴리오 제목 입력 -->
                <div class="mt-4">
                    <label for="validationTextarea" class="form-label" style="font-weight: bold;">포트폴리오 제목</label>
                    <input class="form-control" id="validationTextarea" placeholder="포트폴리오 제목을 입력해주세요."
                           required></input>
                    <div class="row">
                        <div class="col-auto invalid-feedback">제목을 입력해주세요.</div>
                        <div class="col text-end" style="color: #B5B5B5; font-size: 14px;"><span
                                id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/30자</div>
                    </div>
                </div>
            </form>

            <div class="mt-4">
                <label for="validationTextarea" class="form-label" style="font-weight: bold;">대표 이미지 등록</label>
                <div class="rounded-3 p-3 border" style="background-color: #D2D2D2;">
                    <i class="bi bi-exclamation-circle"
                       style="font-size: 14px;">&nbsp;이미지는 가로, 세로 600px 이상 1:1 비율로 권장합니다.</i>
                </div>
                <div class="photo_review mt-3">
                    <div id="representative-document-btn-container">
                        <label for="representative-document-fileInput">
                            <div id="representative-document-preview" class="d-none"></div>
                            <button class="btn" id="representative-document-btn"
                                    style="width: 100px; height: 100px; border: 1px dashed #d2d2d2;">
                                <i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>
                            </button>
                        </label>
                        <input type="file" id="representative-document-fileInput" style="display: none;" accept="image/*">
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <label for="validationTextarea" class="form-label" style="font-weight: bold;">상세 이미지 등록</label>
                <div class="rounded-3 p-3 border" style="background-color: #D2D2D2;">
                    <i class="bi bi-exclamation-circle"
                       style="font-size: 14px;">&nbsp;이미지는 가로, 세로 600px 이상 1:1 비율로 권장합니다. (최대 10장)</i>
                </div>
                <div class="photo_review" style="padding-top: 22.5px;">
                    <div id="document-btn-container" style="margin-top: 0.2%; margin-bottom: 20px;">
                        <button class="btn" id="document-btn"
                                style="width: 100px; height: 100px; border: 1px dashed #d2d2d2; margin-right: 5px;">
                            <i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>
                        </button>
                        <input type="file" id="document-fileInput" style="display: none;" accept="image/*">
                    </div>
                </div>
                <p></p>
                <p></p>
                <p></p>
            </div>
        </div>
    </div>
</div>

<div class="container mb-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="col Subtitle mt-4"><strong>상세 정보</strong></div>
            <div class="mt-4 d-flex flex-column">
                <label for="validationTextarea" class="form-label" style="font-weight: bold;">지역 정보</label>
                <div>
                    <button type="button" class="btn btn-outline-dark btncommon locationBtn"
                            data-bs-toggle="modal" data-bs-target="#locationModal"
                            style="width: 100%; padding: 0; border: none; position: relative;">
                        <input type="text" class="form-control w-100"
                               placeholder="시/군/구를 선택해주세요." readonly>
                    </button>
                </div>

            </div>

            <div class="mt-4">
                <label for="validationTextarea" class="form-label" style="font-weight: bold;">최종 금액</label>
                <input class="form-control" id="validationTextarea" placeholder="최종 금액을 입력해주세요."
                       required></input>
            </div>

            <div class="row">
                <div class="col-md-6 mt-4" style="margin-right: 0;">
                    <label for="validationTextarea" class="form-label"
                           style="font-weight: bold;">작업 연도</label>
                    <select class="form-control" id="yearSelect" required>
                        <!-- 연도 선택 스크립트 -->
                    </select>
                </div>
                <div class="col-md-6 mt-4" style="margin-right: 0;">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="durationNumber" class="form-label"
                                   style="font-weight: bold;">작업 소요기간</label>
                            <input type="number" class="form-control" id="durationNumber" placeholder="소요기간"
                                   required min="1">
                        </div>
                        <div class="col-md-6">
                            <label for="durationUnit" class="form-label"
                                   style="font-weight: bold;">&nbsp;</label>
                            <select class="form-control" id="durationUnit" required>
                                <option value="hours">시간</option>
                                <option value="days">일</option>
                                <option value="weeks">주</option>
                                <option value="months">개월</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <div class="mt-4">
                <label for="validationTextarea" class="form-label" style="font-weight: bold;">상세 설명</label>
                <div class="review_text">
                    <textarea class="form-control" id="myTextarea" style="border-radius: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;"
                              placeholder="해당 경력에 대한 상세한 설명을 작성해 주세요." oninput="countChars()" rows="5"></textarea>
                    <div class="col text-end" style="color: #B5B5B5; font-size: 14px;"><span
                            id="descriptionCharCount" style="color: #85BCEB;">0&nbsp;</span>/100자
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <button type="button" class="btn btn-primary btn-lg" style="width: 100%; background-color: #85BCEB;
            font-weight: bold; margin-top: 20px; border: none;" onclick="redirectToExpertPage()">등록하기</button>
        </div>
    </div>
</div>

<!-- 지역 모달 -->
<div class="modal fade" id="locationModal" tabindex="-1" aria-labelledby="locationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="locationModalLabel">지역 선택</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="accordion" id="categoryAccordion">
                    <!-- 아래 스크립트를 body 내부에 추가하세요 -->
                    <script>
                        jq.each(cityDatas, function (city, districts) {
                            document.write('<div class="accordion-item">');
                            document.write('<h2 class="accordion-header">');
                            document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">' + city + '</button>');
                            document.write('</h2>');
                            document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
                            document.write('<ul class="list-group">');
                            jq.each(districts, function (index, district) {
                                document.write('<button type="button" class="list-group-item list-group-item-action selected">' + district + '</button>');
                            });
                            document.write('</ul></div></div>');
                        });
                    </script>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="selectLocationBtn">선택</button>
            </div>
        </div>
    </div>
</div>

<script>
    // 포트폴리오 제목 입력 글자수 세기
    jq('#validationTextarea').on('input', function () {
        var enteredValue = jq(this).val();
        var charCount = enteredValue.length;
        jq('#titleCharCount').text(charCount + " ");

        // 20자 제한
        if (charCount > 30) {
            jq(this).val(enteredValue.substring(0, 30));
            jq('#titleCharCount').text("30" + " ");
        }
    });

    // 상세 설명 입력 글자수 세기
    function countChars() {
        var enteredValue = jq('#myTextarea').val();
        var charCount = enteredValue.length;
        jq('#descriptionCharCount').text(charCount + " ");

        // 100자 제한
        if (charCount > 100) {
            $('#myTextarea').val(enteredValue.substring(0, 100));
            $('#descriptionCharCount').text("100"+" ");
        }
    }
</script>

<script>
    // 연도 선택 스크립트
    var yearSelectElement = document.getElementById("yearSelect");
    var currentYear = new Date().getFullYear();

    for (var year = currentYear; year >= 1980; year--) {
        var option = document.createElement("option");
        option.value = year;
        option.text = year;
        yearSelectElement.add(option);
    }
</script>

<!-- 대표 이미지 등록 스크립트 -->
<script>
    jq(document).ready(function () {
        // 대표 이미지 파일이 변경되었을 때
        jq(document).on('change', '#representative-document-fileInput', function () {
            handleImageChange('#representative-document-btn-container', '#representative-document-preview');
        });

        // 이미지 삭제 버튼이 클릭되었을 때
        jq(document).on('click', '#representative-document-btn-container .delete-icon', function () {
            resetImagePreview('#representative-document-btn-container', '#representative-document-fileInput', '#representative-document-preview');
        });

        // 이미지 업로드 버튼이 클릭되었을 때
        jq(document).on('click', '#representative-document-btn', function () {
            jq('#representative-document-fileInput').click();
        });
    });

    // 이미지 변경 처리 함수
    function handleImageChange(containerId, previewId) {
        var reader = new FileReader();
        reader.onload = function (e) {
            // 새로운 이미지 엘리먼트 생성
            var newImage = jq('<img>').attr({
                src: e.target.result,
                alt: '대표 이미지',
                style: 'width: 100px; height: 100px; border: 1px dashed #d2d2d2; border-radius: 10px; margin-right: 5px;'
            });

            var documentContainer = jq(containerId);
            documentContainer.empty(); // 이미지 미리보기를 하나만 허용하므로 기존 미리보기 삭제

            // 새로운 이미지를 추가
            documentContainer.append(newImage);

            // 삭제 버튼 생성 및 추가
            var deleteButton = createDeleteButton(containerId, previewId);
            documentContainer.append(deleteButton);
        };

        reader.readAsDataURL(jq('#representative-document-fileInput')[0].files[0]);
    }

    // 삭제 버튼 생성 함수
	function createDeleteButton(containerId, previewId) {
	    var deleteButton = jq('<button>').addClass('btn delete-icon p-0 position-relative').html('<i class="bi bi-x-circle-fill" style="color: #CC0000; position: absolute; top:-55px; right: 0;"></i>');
	    deleteButton.click(function () {
	        resetImagePreview(containerId, '#representative-document-fileInput', previewId);
	    });
	
	    return deleteButton;
	}



    // 이미지 초기화 함수
    function resetImagePreview(containerId, fileInputId, previewId) {
        var documentContainer = jq(containerId);
        documentContainer.empty(); // 이미지 미리보기 및 삭제 버튼 제거
        jq(fileInputId).val(''); // 파일 선택 input 초기화

        // 이미지 등록 버튼 생성 및 추가
        var newUploadButton = createUploadButton(containerId, previewId);
        documentContainer.append(newUploadButton);
    }

    // 이미지 업로드 버튼 생성 함수
    function createUploadButton(containerId, previewId) {
        var uploadButton = jq('<label for="representative-document-fileInput">')
            .append('<div id="' + previewId.substring(1) + '" class="d-none"></div>')
            .append('<button class="btn" id="representative-document-btn" style="width: 100px; height: 100px; border: 1px dashed #d2d2d2;">' +
                '<i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>' +
                '</button>')
            .append('<input type="file" id="representative-document-fileInput" style="display: none;" accept="image/*">');

        return uploadButton;
    }
</script>



<!-- 상세 이미지 등록 스크립트 -->
<script>
    jq(document).ready(function () {
        jq('#document-btn').click(function () {
            jq('#document-fileInput').click();
        });

        jq('#document-fileInput').change(function () {
            var currentImageCount = jq('.uploaded-document-image').length;
            if (currentImageCount >= 10) {
                alert('최대 10장까지만 첨부할 수 있습니다.');
                return;
            }

            var reader = new FileReader();
            reader.onload = function (e) {
                var newImage = jq('<img>').attr({
                    src: e.target.result,
                    alt: 'Uploaded Document',
                    class: 'uploaded-document-image',
                    style: 'width: 100px; height: 100px; border: 1px dashed #d2d2d2; border-radius: 10px; margin-right: 5px;'
                });

                var documentContainer = jq('#document-btn-container');

                var imageContainer = jq('<div>').css('display', 'inline-block').append(newImage);

                var deleteButton = jq('<button>').addClass('btn delete-icon p-0 position-relative').html('<i class="bi bi-x-circle-fill" style="color: #CC0000; position: absolute; top:-55px; right: 0;"></i>');

                deleteButton.click(function () {
                    imageContainer.remove();
                });

                imageContainer.append(deleteButton);

                documentContainer.append(imageContainer);
            };

            reader.readAsDataURL(this.files[0]);
        });
    });
</script>

<script> // 고수 프로필 페이지로 이동하는 버튼
    function redirectToExpertPage() {
      window.location.href = 'expert.html';
    }
</script>

<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>