<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고수페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>

<style>
	
	body > div, span, h5, button, h2, p {
		font-family:'Gothic A1' !important;	    
	}
	  
	#comments{
		color: #878787;
	}
	
	.Subtitle{ 
		font-size: 20px;
		font-weight: bold;
		color: #3E3E3E;
		
	}
	
	.Explanation{
		color: #B5B5B5;
		font-size: 16px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	.AfterMD{
		font-size: 13px;
		font-weight: bold;
		color: #85BCEB;
		text-align: right;
	}
	
	.BeforeMD{ 
		font-size: 13px;
		font-weight: bold;
		color: #F97373;
		text-align: right;
	}
	
	.content{
		font-size: 17px;
		color: #3E3E3E;
		text-align: left;
	}
	
	.InvisibleButton {
        background-color: transparent;
        border: none;
        
    }
    /*섹션 스타일*/
    .section-divider {
	    border-bottom: 1px solid #F2F2F2; /* 실선 스타일 및 색상 설정 */
	}
	/*! 아이콘 스타일*/
	.bi.bi-exclamation-circle {
    font-size: 15px;
}

	
</style>
<!-- style="background-color: palegreen" -->

<script src="${root }/jquery/address.js"></script> <!-- 도로주소명API 불러오기 -->


<script>
	$(function () {
	// "header.html" 파일을 로드하여 .header 클래스를 가진 요소에 삽입
	
	})
</script>

</head>
<!-- -->
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
    
    <div class="container mt-5"> <!-- 0.완성도 -->
        <div class="row justify-content-center">
            <div class="col-md-6 section-divider">
				<div class="row">
					<div class="col-md-2 Subtitle">완성도</div>
    				<div class="col-md-10" style="font-size: 20px; font-weight: bold; color: #85BCEB; ">15%</div>
				</div>
				<div class="row">
	                <div class="progress" role="progressbar" aria-label="Basic example" aria-valuenow="0"
	                     aria-valuemin="0" aria-valuemax="100" style="padding: 0;">
	                    <div class="progress-bar" style="width: 15%; border-radius: 10px; background-color: #85BCEB;"></div>
	                </div>
	            </div>
	            <p></p>
	            <p></p>
	            <p></p>
			</div>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 1.프로필 -->
	    <div class="col-md-6">
	        <div class="row">
	            <div class="col-md-4">
	                <div class="profilecontainer" style="margin-top: 8%; margin-bottom: 8%; position: relative;">
	                    <img class="uploaded-image" id="profile-image" src="../image/1.png" alt="프로필 이미지"
	                        style="width: 200px; height: 200px; border-radius: 30px; position: relative; border: 1px solid #F3F3F3;">
	                    <button id="profile-btn"
	                        style=" width: 40px; height: 40px; border: 1px solid #F3F3F3; position: absolute;
	                        bottom: 0; right: 0; border-top-left-radius: 20px; border-bottom-right-radius: 20px;background-color: #d2d2d2; padding: 5px;">
	                        <i class="bi bi-camera fs-5"></i>
	                    </button>
	                    <input type="file" name="profile-myfile" id="profile-myfile" accept="image/*" style="display: none;" />
	                </div>
	            </div>
	            <div class="col-md">
	                <div class="container">
					    <ul class="list-inline overview">
					        <li class="list-inline-item text-center mx-4">
					            <div style="font-size: 36px; font-weight: bold; color: #3E3E3E;">0</div>
					            <div style="font-size: 14px; color: #C0C0C0;">리뷰 평점</div>
					        </li>
					        <li class="list-inline-item separator">|</li>
					        <li class="list-inline-item text-center mx-4">
					            <div style="font-size: 36px; font-weight: bold; color: #3E3E3E;">0</div>
					            <div style="font-size: 14px; color: #C0C0C0;">리뷰수</div>
					        </li>
					        <li class="list-inline-item separator">|</li>
					        <li class="list-inline-item text-center mx-4">
					            <div style="font-size: 36px; font-weight: bold; color: #3E3E3E;">0</div>
					            <div style="font-size: 14px; color: #C0C0C0;">고용수</div>
					        </li>
					    </ul>
					</div>
	            </div>
			</div>
		</div>
	</div>
	<div class="container mt-5 d-flex justify-content-center"> <!-- 2.아숨 활동명 -->
	    <div class="col-md-6 section-divider">
	        <div class="row">
	            <span class="col Subtitle">아숨 활동명</span>
	            <div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn1">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn1">저장</button>
	            </div>
	        </div>
	        <p></p>
	        <div id="descriptionContainer1">
	            <p class="content">응우옌 민 찌옛</p>
	        </div>
	        <div id="editContainer1" class="d-none">
                <div class="d-flex justify-content-between">
                    <label class="AfterMD" for="editTextArea1">이름 또는 업체명을 입력해주세요</label>
                    <div class="text-muted charCount" style="color: #B5B5B5; font-size: 14px;">
                        <span id="charCount1" style="color: #85BCEB;">0&nbsp;</span>/30자
                    </div>
                </div>
                <input class="form-control" maxlength="30" id="editTextArea1" rows="1"
                    placeholder="이름 또는 업체명을 입력해주세요" oninput="countChars('editTextArea1', 'charCount1')"></input>
	        <p></p>
	        <p></p>
			</div>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 3.대표 서비스 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">대표 서비스</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton BeforeMD">등록하기</button>
				</div>
			</div>
			<p></p>
			<p class="content">웹 개발</p>
			<p></p>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 4.제공 서비스 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">제공 서비스</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton AfterMD">수정</button>
				</div>
			</div>
			<p></p>
			<p class="content">동그란 사각형</p>
			<p></p>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center">
	    <!-- 5.활동 지역 -->
	    <div class="col-md-6 section-divider">
	        <div class="row">
	            <span class="col Subtitle">활동 지역</span>
	            <div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" onclick="enableExecDaumPostcode()">수정</button>
	            </div>
	        </div>
	        <p></p>
	        <input type="text" id="sample6_address" placeholder="주소" style="border: none; cursor: default; outline: none; width: 400px;" readonly><br>
	        <input type="text" id="sample6_extraAddress" placeholder="참고항목" style="border: none; cursor: default; outline: none; width: 400px;" readonly>
	        <p></p>
	    </div>
	</div>

	<div class="container mt-3 d-flex justify-content-center"> <!-- 6.이동 가능 거리 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">이동 가능 거리</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton AfterMD">수정</button>
				</div>
			</div>
			<p></p>
			
			<div id="map" style="height:300px;"></div>
			<p></p>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 7.자격증 및 기타 서류 등록 -->
	       <div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">자격증 및 기타 서류 등록</span>
				<div class="review_textExplain Explanation">자격증 및 기타 서류</div>
				<!--<div class="col text-end">
					<button type="button" class="InvisibleButton AfterMD"></button>
				</div>-->
			</div>
			<div class="rounded-3 p-3 border" style="background-color: #D2D2D2; text-align: center;">
				<i class="bi bi-exclamation-circle">&nbsp;개인/민감 정보를 삭제 후 등록해야 하며, 허위정보에 대한 모든 책임은 본인에게 있습니다.</i>
			</div>
			<div class="photo_review" style="padding-top: 22.5px;">
	            <div id="document-btn-container" style="margin-top: 0.2%; margin-bottom: 20px;">
	                <label for="document-fileInput">
	                    <button class="btn" id="document-btn"
	                        style="width: 100px; height: 100px; border: 1px dashed #d2d2d2; margin-right: 5px;">
	                        <i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>
	                    </button>
	                </label>
	                <input type="file" id="document-fileInput" style="display: none;" accept="image/*">
	            </div>
	        </div>
		</div>
	</div>

	<div class="container mt-3 d-flex justify-content-center"> <!-- 8. 고수 서비스 상세설명 -->
	    <div class="col-md-6 section-divider">
	        <div class="row">
	            <span class="col Subtitle">고수 서비스 상세설명</span>
	            <div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn2">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn2">저장</button>
	            </div>
	        </div>
	        <p></p>
	        <div id="descriptionContainer2">
	            <p class="content">저의 웹개발은 다낭에서부터 시작되었으며...</p>
	        </div>
	        <div id="editContainer2" class="d-none">
	            <div class="d-flex justify-content-between">
	                <label class="AfterMD" for="editTextArea2">고수님의 서비스에 대한 상세설명을 입력해주세요</label>
	                <div class="text-muted charCount" style="color: #B5B5B5; font-size: 14px;">
						<span id="charCount2" style="color: #85BCEB;">0&nbsp;</span>/100 자
					</div>
	            </div>
	            <textarea class="form-control" maxlength="100" id="editTextArea2" rows="3" placeholder="고수님의 장점과 함께 서비스 특징, 서비스 제공 방법, 준비사항을 자세히 적어주세요!"></textarea>
	        </div>
	        <p></p>
	    </div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 9. 가격 -->
    <div class="col-md-6 section-divider">
        <div class="row">
            <span class="col Subtitle">가격</span>
            <div class="col text-end">
                <button type="button" class="InvisibleButton AfterMD" id="editBtn3">수정</button>
                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn3">저장</button>
            </div>
        </div>
        <p></p>
        <div id="descriptionContainer3">
            <p class="content">웹 디자인 - 10만/&nbsp;프론트 코딩 - 20만/&nbsp;백엔드 코딩 - 30만/&nbsp;프로그래밍 상담 - 5만</p>
        </div>
        <div id="editContainer3" class="d-none">
            <div class="d-flex justify-content-between">
                <label class="AfterMD" for="editTextArea3">고수님의 서비스에 대한 합당한 가격을 적어주세요</label>
                <div class="text-muted charCount" style="color: #B5B5B5; font-size: 14px;">
                    <span id="charCount3" style="color: #85BCEB;">0&nbsp;</span>/100 자
                </div>
            </div>
            <textarea class="form-control" maxlength="100" id="editTextArea3" rows="3" placeholder="고객이 알아야 할 가격 정책을 입력해 주세요	예) 예약금 10,000원, 환불정책 등"></textarea>
        </div>
        <p></p>
    </div>
</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 10.경력 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">경력</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton AfterMD" onclick="location.href='${root}/pro/career'">수정</button>
				</div>
			</div>
			<p></p>
			<p class="content">@경력 페이지에서 값 받아오는 곳@</p>
			<p></p>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 11.학력 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">학력</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton BeforeMD" onclick="location.href='${root}/pro/Education'">등록하기</button>
				</div>
			</div>
			<p></p>
			<p class="content">@학력 페이지에서 값 받아오는 곳@</p>
			<p></p>
		</div>
	</div>
	
	<div class="container mt-3 d-flex justify-content-center"> <!-- 12.포트폴리오 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">포트폴리오</span>
				<div class="col text-end">
					<button type="button" class="InvisibleButton BeforeMD" onclick="location.href='${root}/pro/Portfolio'">등록하기</button>
				</div>
			</div>
			<p></p>
			<p class="content">설명과 포트폴리오 등록버튼</p>
			<h5 class="content">@이동할 포폴 페이지 제작@</h5>
			<p></p>
		</div>
	</div>
	
	

<c:import url="/WEB-INF/views/include/footer.jsp" /> <!-- 푸터-->

<!-- -----script 영역------ -->


<!-- 프로필 섹션 스크립트 -->
<script>
    window.onload = function () {
        document.getElementById('profile-image').src = '../image/1.png';
    };

    document.getElementById('profile-btn').addEventListener('click', function () {
        document.getElementById('profile-myfile').click();
    });

    document.getElementById('profile-myfile').addEventListener('change', function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('profile-image').src = e.target.result;
        };
        reader.readAsDataURL(this.files[0]);
    });
</script>

<!--도로주소명API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!--이동가능거리API-->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f1d1be7f35b4c48c6c89640c05aaae"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5f1d1be7f35b4c48c6c89640c05aaae&libraries=services"></script>
<script type="text/javascript" src="${root}/jquery/address.js"></script>




<!--  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
<!-- 서류 섹션 스크립트 -->
<script>
    document.getElementById('document-fileInput').addEventListener('change', function () {
        var currentImageCount = document.querySelectorAll('.uploaded-document-image').length;
        if (currentImageCount >= 5) {
            alert('최대 5장까지만 첨부할 수 있습니다.');
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            var newImage = document.createElement('img');
            newImage.src = e.target.result;
            newImage.alt = 'Uploaded Document';
            newImage.className = 'uploaded-document-image';
            newImage.style.width = '100px';
            newImage.style.height = '100px';
            newImage.style.border = '1px dashed #d2d2d2';
            newImage.style.borderRadius = '10px';
            newImage.style.marginRight = '5px';

            var documentContainer = document.getElementById('document-btn-container');
            documentContainer.appendChild(newImage);

            // 이미지 삭제 기능 추가
            newImage.addEventListener('click', function () {
                documentContainer.removeChild(newImage);
            });
        };

        reader.readAsDataURL(this.files[0]);
    });

    document.getElementById('document-btn').addEventListener('click', function () {
        document.getElementById('document-fileInput').click();
    });
</script>

 <script> // 2. 아숨 활동명
        // input 글자수 세기
        function countChars(textAreaId, charCountId) {
            var textarea = document.getElementById(textAreaId);
            var charCountSpan = document.getElementById(charCountId);
            var charCount = textarea.value.length;
            charCountSpan.textContent = charCount;
        }

        // 이벤트 리스너 등록
        document.getElementById('editBtn1').addEventListener('click', function () {
            // "수정" 버튼 클릭 시 처리
            document.getElementById('descriptionContainer1').classList.add('d-none');
            document.getElementById('editContainer1').classList.remove('d-none');
            document.getElementById('editTextArea1').value = document.getElementById('descriptionContainer1').innerText.trim();
            document.getElementById('editTextArea1').focus();
            document.getElementById('editBtn1').classList.add('d-none');
            document.getElementById('saveBtn1').classList.remove('d-none');
            countChars('editTextArea1', 'charCount1');
        });

        document.getElementById('saveBtn1').addEventListener('click', function () {
            // "저장" 버튼 클릭 시 처리
            var editedText = document.getElementById('editTextArea1').value;
            document.getElementById('descriptionContainer1').classList.remove('d-none');
            document.getElementById('editContainer1').classList.add('d-none');
            document.getElementById('descriptionContainer1').getElementsByTagName('p')[0].innerText = editedText;
            document.getElementById('editBtn1').classList.remove('d-none');
            document.getElementById('saveBtn1').classList.add('d-none');

            // 최대 글자 수 초과 시 입력 막기
            var maxLength = parseInt(document.getElementById('editTextArea1').getAttribute('maxlength'));
            if (editedText.length > maxLength) {
                document.getElementById('editTextArea1').value = editedText.substring(0, maxLength);
            }

            countChars('editTextArea1', 'charCount1');
        });

        document.addEventListener('DOMContentLoaded', function () {
            // 초기에 텍스트 길이를 가져와서 표시
            var initialText = document.getElementById('descriptionContainer1').innerText.trim();
            var maxLength = parseInt(document.getElementById('editTextArea1').getAttribute('maxlength'));
            var initialCharCount = initialText.length;
            document.getElementById('charCount1').innerText = initialCharCount + '/' + maxLength + ' 자';

            document.getElementById('editTextArea1').addEventListener('input', function () {
                countChars('editTextArea1', 'charCount1');
            });
        });
</script>
    
<script> // 5. 고수 서비스 상세설명
    // textarea 글자수 세기
    function countChars(textAreaId, charCountId) {
        var textarea = document.getElementById(textAreaId);
        var charCountSpan = document.getElementById(charCountId);
        var charCount = textarea.value.length;
        charCountSpan.textContent = charCount;
    }

    // 이벤트 리스너 등록
    document.getElementById('editBtn2').addEventListener('click', function () {
        // "수정" 버튼 클릭 시 처리
        document.getElementById('descriptionContainer2').classList.add('d-none');
        document.getElementById('editContainer2').classList.remove('d-none');
        document.getElementById('editTextArea2').value = document.getElementById('descriptionContainer2').innerText.trim();
        document.getElementById('editTextArea2').focus();
        document.getElementById('editBtn2').classList.add('d-none');
        document.getElementById('saveBtn2').classList.remove('d-none');
        countChars('editTextArea2', 'charCount2');
    });

    document.getElementById('saveBtn2').addEventListener('click', function () {
        // "저장" 버튼 클릭 시 처리
        var editedText = document.getElementById('editTextArea2').value;
        document.getElementById('descriptionContainer2').classList.remove('d-none');
        document.getElementById('editContainer2').classList.add('d-none');
        document.getElementById('descriptionContainer2').getElementsByTagName('p')[0].innerText = editedText;
        document.getElementById('editBtn2').classList.remove('d-none');
        document.getElementById('saveBtn2').classList.add('d-none');

        // 최대 글자 수 초과 시 입력 막기
        var maxLength = parseInt(document.getElementById('editTextArea2').getAttribute('maxlength'));
        if (editedText.length > maxLength) {
            document.getElementById('editTextArea2').value = editedText.substring(0, maxLength);
        }

        countChars('editTextArea2', 'charCount2');
    });

    document.addEventListener('DOMContentLoaded', function () {
        // 초기에 텍스트 길이를 가져와서 표시
        var initialText = document.getElementById('descriptionContainer2').innerText.trim();
        var maxLength = parseInt(document.getElementById('editTextArea2').getAttribute('maxlength'));
        var initialCharCount = initialText.length;
        document.getElementById('charCount2').innerText = initialCharCount + '/' + maxLength + ' 자';

        document.getElementById('editTextArea2').addEventListener('input', function () {
            countChars('editTextArea2', 'charCount2');
        });
    });
</script>

<script> // 8. 가격
    // textarea 글자수 세기
    function countChars(textAreaId, charCountId) {
        var textarea = document.getElementById(textAreaId);
        var charCountSpan = document.getElementById(charCountId);
        var charCount = textarea.value.length;
        charCountSpan.textContent = charCount;
    }

    // 이벤트 리스너 등록
    document.getElementById('editBtn3').addEventListener('click', function () {
        // "수정" 버튼 클릭 시 처리
        document.getElementById('descriptionContainer3').classList.add('d-none');
        document.getElementById('editContainer3').classList.remove('d-none');
        document.getElementById('editTextArea3').value = document.getElementById('descriptionContainer3').innerText.trim();
        document.getElementById('editTextArea3').focus();
        document.getElementById('editBtn3').classList.add('d-none');
        document.getElementById('saveBtn3').classList.remove('d-none');
        countChars('editTextArea3', 'charCount3');
    });

    document.getElementById('saveBtn3').addEventListener('click', function () {
        // "저장" 버튼 클릭 시 처리
        var editedText = document.getElementById('editTextArea3').value;
        document.getElementById('descriptionContainer3').classList.remove('d-none');
        document.getElementById('editContainer3').classList.add('d-none');
        document.getElementById('descriptionContainer3').getElementsByTagName('p')[0].innerText = editedText;
        document.getElementById('editBtn3').classList.remove('d-none');
        document.getElementById('saveBtn3').classList.add('d-none');

        // 최대 글자 수 초과 시 입력 막기
        var maxLength = parseInt(document.getElementById('editTextArea3').getAttribute('maxlength'));
        if (editedText.length > maxLength) {
            document.getElementById('editTextArea3').value = editedText.substring(0, maxLength);
        }

        countChars('editTextArea3', 'charCount3');
    });

    document.addEventListener('DOMContentLoaded', function () {
        // 초기에 텍스트 길이를 가져와서 표시
        var initialText = document.getElementById('descriptionContainer3').innerText.trim();
        var maxLength = parseInt(document.getElementById('editTextArea3').getAttribute('maxlength'));
        var initialCharCount = initialText.length;
        document.getElementById('charCount3').innerText = initialCharCount + '/' + maxLength + ' 자';

        document.getElementById('editTextArea3').addEventListener('input', function () {
            countChars('editTextArea3', 'charCount3');
        });
    });
</script>

</body>
</html>
