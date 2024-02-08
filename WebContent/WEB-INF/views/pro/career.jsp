<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>경력</title>
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
    
    .Subtitle{ 
		font-size: 20px;
		font-weight: bold;
		color: #3E3E3E;
		
	}
	
	.Subtitle2{ 
		font-size: 24px;
		font-weight: bold;
		color: #3E3E3E;
		
	}
	
	.AfterMD{
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
	$(function () {
	// "header.html" 파일을 로드하여 .header 클래스를 가진 요소에 삽입
	
	})
</script>

</head>
<body>
	
<c:import url="/WEB-INF/views/include/header.jsp" />

  <div class="container mt-5 mb-5">
    <div class="row justify-content-center">
      <div class="col-md-6 section-divider">
        <div>
          <h2><strong>경력</strong></h2>
        </div>
        <div class="col Subtitle mt-4"><strong>총 경력 기간</strong></div>
        <div class="col Explanation">전문 분야와 관련된 총 기간을 선택해주세요</div>
        <select name="totalPeriod" class="form-select" aria-invalid="false" id="totalPeriod" aria-required="true">
          <option disabled="disabled" value="-1">총 경력기간</option>
          <option value="1">1년</option>
          <option value="2">2년</option>
          <option value="3">3년</option>
          <option value="4">4년</option>
          <option value="5">5년</option>
          <option value="6">6년</option>
          <option value="7">7년</option>
          <option value="8">8년</option>
          <option value="9">9년</option>
          <option value="10">10년</option>
          <option value="11">11년</option>
          <option value="12">12년</option>
          <option value="13">13년</option>
          <option value="14">14년</option>
          <option value="15">15년</option>
          <option value="16">16년</option>
          <option value="17">17년</option>
          <option value="18">18년</option>
          <option value="19">19년</option>
          <option value="20">20년</option>
          <option value="21">21년</option>
          <option value="22">22년</option>
          <option value="23">23년</option>
          <option value="24">24년</option>
          <option value="25">25년</option>
          <option value="26">26년</option>
          <option value="27">27년</option>
          <option value="28">28년</option>
          <option value="29">29년</option>
          <option value="30">30년</option>
        </select>
		<div class="col Subtitle mt-4"><strong>경력 사항</strong></div>
		<div class="col Explanation">이전 경력부터 순차적으로 작성해주세요</div>
		<button type="button" class="btn btn-primary d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color: #ffffff; border-color: #85BCEB;">
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
      <div class="col text-center Explanation">등록한 경력사항이 아직 없습니다.</div>
       <div class="col">
      <ul id="experienceList" class="list-unstyled">
        <!-- 경력 리스트는 여기에 동적으로 추가될 것입니다. -->
      </ul>
      </div>
    </div>
  </div>
  
  <div class="container mt-5">
    <div class="row justify-content-center">
		<div class="col-md-6">
			<button type="button" class="btn btn-primary btn-lg" style="width: 100%; background-color: #85BCEB; font-weight: bold; margin-top: 20px; border: none;" onclick="redirectToExpertPage()">저장하기</button>
      	</div>
    </div>
  </div>
  
<!-- 추가하기 Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
	<!--<div class="modal-header">-->
      <div class="modal-body">
		<div class="text-end">
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
        <div class="row">
			<span class="col Subtitle2">경력</span>
			<div class="Explanation2">*필수 입력 항목입니다</div>
			<!--<div class="col text-end">
				<button type="button" class="InvisibleButton AfterMD"></button></div>-->
		</div>
		<div class="rounded-3 p-3 border" style="background-color: #D2D2D2; text-align: center;">
			<i class="bi bi-exclamation-circle">
				&nbsp;<span style="font-size: 14px;">
					개인 정보 노출 및 허위 정보를 기재할 경우, 아숨 이용이 제한될 수 있으며 사안에 따라 법적 책임을 물을 수 있습니다.
				</span></i>
		</div>
		<form class="was-validated">
		<!-- 경력 타이틀 입력 -->
			<div class="mt-4">
			    <label for="validationTextarea" class="form-label">경력 타이틀*</label>
			    <input class="form-control" id="validationTextarea" placeholder="ex. 회사명, 직함" required></input>
			    <div class="row">
			        <div class="col-auto invalid-feedback">경력을 입력해주세요.</div>
			        <div class="col text-end" style="color: #B5B5B5; font-size: 14px;"><span id="titleCharCount" style="color: #85BCEB;">0&nbsp;</span>/20자</div>
			    </div>
			</div>
		</form>
		<div class="mt-4">
		  <label for="validationTextarea" class="form-label">시작 연월*</label>
		  <div class="row">
		    <div class="col">
				<select name="startYear" class="form-select" aria-invalid="false" id="startYear" aria-required="true">
					<option disabled selected value="">년</option>
				</select>
		    </div>
		    <div class="col">
				<select name="startMonth" class="form-select" aria-invalid="false" id="startMonth" aria-required="true">
					<option disabled selected value="">월</option>
				</select>
		    </div>
		  </div>
		</div>
		<div class="mt-4">
		  <label for="validationTextarea" class="form-label">종료 연월*</label>
		  <div class="row">
		    <div class="col">
				<select name="endYear" class="form-select" aria-invalid="false" id="endYear" aria-required="true">
					<option disabled selected value="">년</option>
				</select>
		    </div>
		    <div class="col">
				<select name="endMonth" class="form-select" aria-invalid="false" id="endMonth" aria-required="true">
					<option disabled selected value="">월</option>
				</select>
		    </div>
		  </div>
		</div>
		<!-- 상세 설명 입력 -->
			<div class="mt-4">
			    <label for="myTextarea" class="form-label">상세 설명</label>
			    <div class="review_text">
			        <textarea class="form-control" id="myTextarea" style="border-radius: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;" placeholder="해당 경력에 대한 상세한 설명을 작성해 주세요." oninput="countChars()" rows="5"></textarea>
			        <div class="col text-end" style="color: #B5B5B5; font-size: 14px;"><span id="descriptionCharCount" style="color: #85BCEB;">0&nbsp;</span>/40자</div>
			    </div>
			</div>


      <!--<div class="modal-footer">-->
	  
    </div>
    <div>
        <button type="button" class="btn btn-primary" style="width: 100%; background-color: #85BCEB; font-weight: bold; margin-top: 20px; border: none;">등록</button>
      </div>
  </div>
</div>


<!-- JavaScript 부분 -->
<script>
    // 경력 타이틀 입력 글자수 세기
    $('#validationTextarea').on('input', function () {
        var enteredValue = $(this).val();
        var charCount = enteredValue.length;
        $('#titleCharCount').text(charCount + " ");

        // 20자 제한
        if (charCount > 20) {
            $(this).val(enteredValue.substring(0, 20));
            $('#titleCharCount').text("20"+" ");
        }
    });

    // 상세 설명 입력 글자수 세기
    function countChars() {
        var enteredValue = $('#myTextarea').val();
        var charCount = enteredValue.length;
        $('#descriptionCharCount').text(charCount + " ");

        // 40자 제한
        if (charCount > 40) {
            $('#myTextarea').val(enteredValue.substring(0, 40));
            $('#descriptionCharCount').text("40"+" ");
        }
    }
</script>


<script> // select bar 스크립트
    $(function () {
      $('#totalPeriod').on('change', function () {
        var selectedValue = $(this).val();
        console.log('선택된 값: ' + selectedValue);
        // 선택된 값을 사용하여 무언가를 처리할 수 있습니다.
      });
    });
</script>
  
  
<script> //연월 select bar
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

  document.addEventListener('DOMContentLoaded', function () {
    initializeYearMonth('start', 30);
    initializeYearMonth('end', 15);
  });
  
    // 문서 로드 시 시작 연월 초기화 함수 호출
  document.addEventListener('DOMContentLoaded', initializeStartYearMonth);
</script>

<script> // 고수 프로필로 이동하는 버튼<저장하기>
  function redirectToExpertPage() {
    window.location.href = 'expert.html';
  }
</script>

<!-- 모달 데이터 등록 스크립트(미완성 상태)
<script>
    $(function () {
        var experienceCounter = 1;

        // 경력 등록 함수
        function registerExperience() {
            var title = $('#validationTextarea').val();
            var startYear = $('#startYear').val();
            var startMonth = $('#startMonth').val();
            var endYear = $('#endYear').val();
            var endMonth = $('#endMonth').val();
            var description = $('#myTextarea').val();

            var experienceId = 'experience' + experienceCounter;

            var liElement = $('<li id="' + experienceId + '">');
            liElement.append('<h4>' + title + '</h4>');
            liElement.append('<span>' + startYear + '년 ' + startMonth + '월 - ' + endYear + '년 ' + endMonth + '월</span>');
            liElement.append('<p>' + description + '</p>');
            liElement.append('<i class="bi bi-x remove-experience"></i>'); // 삭제 버튼 추가

            $('#experienceList').append(liElement);

            experienceCounter++;

            // 입력란 초기화
            $('#validationTextarea').val('');
            $('#startYear, #startMonth, #endYear, #endMonth').val('');
            $('#myTextarea').val('');

            // 모달 닫기
            $('#staticBackdrop').modal('hide');

            // 경력 리스트 텍스트 가시성 업데이트
            updateExperienceTextVisibility();
        }

        // 경력 리스트에서 경력 항목 삭제 함수
        $('#experienceList').on('click', '.remove-experience', function (event) {
            event.stopPropagation(); // 경력 항목 클릭 이벤트 방지
            $(this).closest('li').remove(); // 해당 경력 항목 제거
            updateExperienceTextVisibility(); // 경력 리스트 텍스트 가시성 업데이트
        });

        // 경력 리스트에서 경력 항목 클릭 시
        $('#experienceList').on('click', 'li', function () {
            var experienceId = $(this).attr('id');
            populateModalForEdit(experienceId);
            $('#staticBackdrop').modal('show');
        });

        // 초기 경력 리스트 텍스트 가시성 업데이트
        updateExperienceTextVisibility();

        // 경력 등록 버튼 클릭 시
		$('#staticBackdrop .btn-primary').on('click', function () {
		    registerExperience();
		
		    // 모달 닫기 추가
		    $('#staticBackdrop').modal('hide');
		});

        // 경력 리스트 텍스트 가시성 업데이트 함수
		function updateExperienceTextVisibility() {
		    var experienceListLength = $('#experienceList li').length;
		
		    // 클래스 선택자 수정
		    $('.Explanation').toggle(experienceListLength === 0);
        }
    });
</script> -->


</body>
</html>
