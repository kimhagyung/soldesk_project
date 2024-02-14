<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

/* 4. 제공서비스 버튼, 숨겨진 상태로 설정 */
    .btn.btn-sm.btn-secondary {
        display: none;
    }
    
    .btn.btn-outline-primary.categoryBtn {
    display: none;
} 
	
</style>
<!-- style="background-color: palegreen" -->

<script src="${root}/jquery/locdata.js"></script> <!-- 카테고리.js 불러오기 -->


<script>
//상세설명 수정과 삽입....
$(document).ready(function() {
    // 수정 버튼 클릭 시
    $("#editBtn2").click(function() {
       
        // 이전에 저장된 상세설명 가져오기
        var savedDetailText = $("#descriptionContent").text();
        
     // 콘솔에 출력
        console.log("이전에 저장된 상세설명:", savedDetailText);
     
        $("#editTextArea2").val(savedDetailText);
    });

    // 저장 버튼 클릭 시
    $("#saveBtn2").click(function() {
        // 편집 중인 텍스트 내용 가져오기
        var detailText = $("#editTextArea2").val();
        
        

        // Ajax를 사용하여 서버로 데이터 전송
        $.ajax({
            type: "POST",
            url: "${root}/pro/expert_introductionModify/",
            contentType: "application/json",
            data: JSON.stringify({ pro_detailed_introduction: detailText }), // 데이터를 JSON 문자열로 변환
            success: function(response) {
                // 성공 시 서버 응답에 대한 처리
                console.log(response);
            },
            error: function(error) {
                // 오류 시 처리
                console.error("오류:", error);
            }
        });
    });
});

//가격
$(document).ready(function () {
    // 저장 버튼 클릭 시
    $("#saveBtn3").click(function () {
        // 편집 중인 텍스트 내용을 가져오기
        var editedPrice = $("#editTextArea3").val();

        // Ajax를 사용하여 서버로 데이터 전송
        $.ajax({
            type: "POST",
            url: "${root}/pro/expert_modify/",  // 수정이 필요한 엔드포인트로 변경
            contentType: "application/json",
            data: JSON.stringify({ price: editedPrice }),  // 데이터를 JSON 문자열로 변환
            success: function (response) {
                // 성공 시 서버 응답에 대한 처리
                console.log(response);
                // 수정된 내용을 화면에 업데이트
                $("#priceContent").text(editedPrice);
                // 편집 영역 감추기, 보여주기 등 필요한 로직 추가
            },
            error: function (error) {
                // 오류 시 처리
                console.error("Error:", error);
            }
        });
    });
});

//활동 지역
$(document).ready(function () {
//저장 버튼 클릭 시
	$("#saveBtn5").click(function() {
	    // 활동 지역 정보 가져오기
	    var selectedLocation = $("#locationContent").val();
	
	    // AJAX 요청을 사용하여 서버로 데이터 전송
	    $.ajax({
	        type: "POST",
	        url: "${root}/pro/expert_modify2/",
	        contentType: "application/json",
	        data: JSON.stringify({ active_location: selectedLocation, pro_id:"${param.id}" }),
	        success: function(response) {
	            // 성공 시 서버 응답 처리
	            console.log(response);
	        },
	        error: function(error) {
	            // 오류 시 처리
	            console.error("오류:", error);
	        }
	    });
	});
});

$(document).ready(function() {
    // 페이지가 로드될 때 데이터를 가져오는 함수 호출

function loadData() {
    $.ajax({
        url: '${root}/pro/expert/events', // 위에서 설정한 엔드포인트로 요청을 보냅니다.
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            // 성공적으로 데이터를 받아왔을 때의 처리
            console.log('데이터:', data); // 데이터를 콘솔에 출력
            
         // pro_detailed_introduction 값을 콘솔에 출력
             console.log('pro_detailed_introduction:', data[0].pro_detailed_introduction);
            console.log('pro_id: ' + data[0].pro_id);

            // 여기서 data를 사용하여 각 부분에 데이터를 채웁니다.
            // 활동 지역
            $('#active_locationContent').text(data[0].active_location);
            //$('#sample6_address').val(data.active_location);
            //$('#sample6_extraAddress').val(data.activityArea.extraAddress);

            // 나머지 부분들도 유사한 방식으로 데이터를 채워 넣어주면 됩니다.

            // 예시: 이동 가능 거리
            $('.content').text(data.movable_distance);

            // 자격증 및 기타 서류 등록 정보 - 여기에 자유롭게 추가

            // 고수 서비스 상세설명
          	$('#descriptionContent').html(data[0].pro_detailed_introduction);

            // 가격
            $('#priceContent').text(data[0].price);
            
           
        },
        error: function(err) {
            console.error('데이터 로딩 중 오류 발생:', err);
        }
    });
}
    
loadData();
});

</script>

</head>
<body>

<c:import url="/WEB-INF/views/include/header.jsp" />

<div class="container mt-3 d-flex justify-content-center"> <!-- 4.제공 서비스 -->
		<div class="col-md-6 section-divider">
			<div class="row">
				<span class="col Subtitle">제공 서비스</span>
				<div class="col text-end">
	                <button type="button" class="InvisibleButton AfterMD" id="editBtn4">수정</button>
	                <button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn4">저장</button>
	            </div>
			</div>
			<p></p>
			<div>
			    <ul class="list-group list-group-provided-services" id="providedServicesList">
			        <li class="list-group-item d-flex justify-content-between align-items-center">
			            <button type="button" class="btn btn-outline-primary categoryBtn"
						data-bs-toggle="modal" data-bs-target="#exampleModal">서비스 추가</button>
			        </li>
			        <li class="list-group-item d-flex justify-content-between align-items-center">
			        정보처리기사 준비 <button class="btn btn-sm btn-secondary" onclick="removeService(this)">삭제</button>
			        </li>
			        <li class="list-group-item d-flex justify-content-between align-items-center">
			        QA 테스트 <button class="btn btn-sm btn-secondary" onclick="removeService(this)">삭제</button>
			        </li>
			        <li class="list-group-item d-flex justify-content-between align-items-center">
			        베트남어 번역 <button class="btn btn-sm btn-secondary" onclick="removeService(this)">삭제</button>
			        </li>
			    </ul>
			</div>

			<p></p>
		</div>
	</div>
	
	<!-- 카테고리 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">서비스 추가</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<script>
								$.each(categoryData, function(cate, districts) {
									document.write('<div class="accordion-item">');
									document.write('<h2 class="accordion-header">');
									document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + cate + '">'+ cate + '</button>');
									document.write('</h2>');
									document.write('<div id="' + cate + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
									document.write('<ul class="list-group">');
								$.each(districts, function(index, district) {
									document.write('<button type="button" class="list-group-item list-group-item-action selected">'+ district + '</button>');
									});
									document.write('</ul></div></div>');
								});
							</script>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="selectCategoryBtn">선택</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container mt-3 d-flex justify-content-center">	<!-- 5.활동 지역 -->
		    <div class="col-md-6 section-divider">
		        <div class="row">
		            <span class="col Subtitle">활동 지역</span>
		            <div class="col text-end">
		                <button type="button" class="InvisibleButton AfterMD" id="editBtn5">수정</button>
	                	<button type="button" class="d-none InvisibleButton BeforeMD" id="saveBtn5">저장</button>
		            </div>
		        </div>
		        <p></p>
		        <p id="locationContent"></p>
		        <p></p>
		    </div>
		</div>
		
		<!-- 지역 모달 -->
		<div class="modal fade" id="locationModal" tabindex="-1"
			aria-labelledby="locationModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="locationModalLabel">지역 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<!-- 아래 스크립트를 body 내부에 추가하세요 -->
							<script>
								$.each(cityDatas, function(city, districts) {
									document.write('<div class="accordion-item">');
									document.write('<h2 class="accordion-header">');
									document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">' + city + '</button>');
									document.write('</h2>');
									document.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
									document.write('<ul class="list-group">');
								$.each(districts, function(index, district) {
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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<script> // 4. 제공 서비스
$(function () {
    // selectCategoryBtn 버튼에 대한 클릭 이벤트 핸들러 추가
    $("#selectCategoryBtn").click(function () {
        // 선택된 리스트 항목의 텍스트 내용 가져오기
        var selectedCategory = $(".list-group-item.selected").text();

        // 카테고리가 선택되었는지 확인
        if (selectedCategory) {
            console.log('선택된 카테고리:', selectedCategory);
            // 모달 닫기
            $("#exampleModal").modal('hide');

         // 동적으로 리스트 아이템 생성 및 추가 (제공 서비스 섹션에만 추가)
            var newItem = $("<li class='list-group-item d-flex justify-content-between align-items-center' id='providedServiceItem'>" + selectedCategory + "<button class='btn btn-sm btn-secondary ml-auto' onclick='removeService(this)' style='display: inline-block;'>삭제</button></li>");

            // 클릭된 항목에 "selected" 클래스 추가
            newItem.find("button").click(function () {
                newItem.remove();
            });

            // 리스트에 추가 (제공 서비스 섹션에만 추가)
            $(".list-group-provided-services").append(newItem);
        } else {
            console.log('카테고리를 선택하세요.');
        }
    });

    // list-group 아이템에 대한 클릭 이벤트 핸들러 추가하여 "selected" 클래스를 토글함
    $(".list-group-item").click(function () {
        // 모든 항목에서 "selected" 클래스 제거
        $(".list-group-item").removeClass("selected");

        // 클릭된 항목에 "selected" 클래스 추가
        $(this).addClass("selected");
    });
    
    $(function () {
        // 수정 버튼 클릭 시 처리
        $("#editBtn4").click(function () {
            // 수정 버튼 클릭 시 처리
            $(this).addClass("d-none");
            $("#saveBtn4").removeClass("d-none");
            $(".deleteBtn").addClass("d-none");
            // 수정 모드일 때 입력창 나타남
            $(".list-group-provided-services .btn-secondary").attr("disabled", false).show();
            // 서비스 추가 버튼 나타남
            $(".list-group-item .categoryBtn").show();
        });

        // 저장 버튼 클릭 시 처리
        $("#saveBtn4").click(function () {
            // 저장 버튼 클릭 시 처리
            $("#editBtn4").removeClass("d-none");
            $(this).addClass("d-none");
            $(".deleteBtn").removeClass("d-none");
            // 저장 모드일 때 입력창 사라짐
            $(".list-group-provided-services .btn-secondary").attr("disabled", true).hide();
            // 서비스 추가 버튼 사라짐
            $(".list-group-item .categoryBtn").hide();
        });

        // 서비스 삭제 버튼 클릭 시 처리
        $(".deleteBtn").click(function () {
            $(this).closest("li").remove();
        });
    });

});

// 제공 서비스 섹션에서 삭제 버튼 클릭 시 해당 li 제거
function removeService(button) {
    $(button).closest("li").remove();
}

</script>

<script> // 5. 활동 지역
$(function () {
    // 수정 버튼 클릭 시 처리
    $("#editBtn5").click(function () {
        // 수정 버튼 클릭 시 처리
        $(this).addClass("d-none");
        $("#saveBtn5").removeClass("d-none");
        // 수정 모드일 때 입력창 나타남
        $("#locationModal").modal('show');
    });

    // 저장 버튼 클릭 시 처리
    $("#saveBtn5").click(function () {
        // 저장 버튼 클릭 시 처리
        $("#editBtn5").removeClass("d-none");
        $(this).addClass("d-none");
        // 저장 모드일 때 입력창 사라짐
        $("#locationContent").show();
        // 여기서 저장된 내용을 서버로 전송하는 코드를 추가해야 합니다.
    });

    // list-group 아이템에 대한 클릭 이벤트 핸들러 추가하여 "selected" 클래스를 토글함
    $(".list-group-item").click(function () {
        // 모든 항목에서 "selected" 클래스 제거
        $(".list-group-item").removeClass("selected");

        // 클릭된 항목에 "selected" 클래스 추가
        $(this).addClass("selected");
    });

    // selectLocationBtn 버튼에 대한 클릭 이벤트 핸들러 추가
    $("#selectLocationBtn").click(function () {
        // 선택된 리스트 항목의 텍스트 내용 가져오기
        var selectedLocation = $(".list-group-item.selected").text();

        // 활동 지역이 선택되었는지 확인
        if (selectedLocation) {
            console.log('선택된 활동 지역:', selectedLocation);
            // 모달 닫기
            $("#locationModal").modal('hide');

            // 선택된 활동 지역을 페이지에 표시
            $("#locationContent").text(selectedLocation);
        } else {
            console.log('활동 지역을 선택하세요.');
        }
    });
});

</script>

</body>
</html>