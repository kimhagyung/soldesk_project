<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPro</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<%-- <script src="${root}/jquery/locdata.js"></script> --%>
<script>
	

	$(document).ready(function() {
		// 각 후기 내용을 제한할 길이
		var maxCharacters = 100;

		// 각 후기 내용에 대해 실행
		$('.card-content').each(function() {
			var text = $(this).text();

			// 글자 수가 제한 길이를 초과하면 생략
			if (text.length > maxCharacters) {
				var truncatedText = text.substring(0, maxCharacters) + '...';
				$(this).text(truncatedText);
			}
		});
	});
	
	$(function() {
		// Add a click event handler for the selectCategoryBtn button
		<!--
		$("#selectCategoryBtn").click(function() {
			// Get the text content of the selected list item
			var selectedCategory = $(".list-group-item.selected").text();
			
			// Check if a category is selected
			if (selectedCategory) {
				console.log('Selected category:', selectedCategory);
				// Close the modal
				$("#exampleModal").modal('hide');
				//$(".categoryBtn").text(selectedCategory);  
			} else {
				console.log('Please select a category.');
			}
		});-->

		$("#selectLocationBtn").click(function() {
			// Get the text content of the selected list item 
			var selectedLocation = $(".list-group-item.selected").text();

			// Check if a category is selected
			if (selectedLocation) {
				console.log('Selected category:', selectedLocation);
				// Close the modal
				$("#locationModal").modal('hide');
				$(".locationBtn").text(selectedLocation);
			} else {
				console.log('Please select a category.');
			}
		});

		// Add a click event handler for the list-group items to toggle the "selected" class
		$(".list-group-item").click(function() {
			// Remove the "selected" class from all items
			$(".list-group-item").removeClass("selected");

			// Add the "selected" class to the clicked item
			$(this).addClass("selected");
		});
	});
</script>

<script>
	$(document).ready(function() {
		function searchFunction() {
			var searchText = $('#searchInput').val().toLowerCase();
			var found = false;

			$('.card').each(function() {
				var cardText = $(this).text().toLowerCase();
				if (cardText.includes(searchText)) {
					$(this).show();
					found = true;
				} else {
					$(this).hide();
				}
			});

			if (!found) {
				alert("검색 결과가 없습니다.");
			}
		}

		$('#searchButton').click(function() {
			searchFunction();
		});

		// 엔터 키 입력 이벤트
		$('#searchInput').keyup(function(event) {
			if (event.keyCode === 13) { // 13은 엔터 키의 키코드
				searchFunction();
			}
		});
	});
</script>

<style>
#a_comment-board-title:hover {
	color: #fff;
}

.star {
	color: #FFE500;
}

.lig {
	color: grey;
}

.profileimage {
	width: 70px;
	height: 90px;
}
</style>
</head>

<body>
	<!-- 네비부분 -->
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->
	<!--본문-->


	<div class="container mx-auto mt-5 mb-5" style="width: 60%;">

		<div class=" mt-5">
			<h2>
				<strong>일류 찾기</strong>
			</h2>
		</div>

		<div class="btn-catelocat">
			<button type="button"
        class="btn btn-outline-dark ms-5 mt-4 btncommon categoryBtn"
        data-bs-toggle="modal" data-bs-target="#exampleModal">
    <c:if test="${not empty param.detail_category_name}">
        ${param.detail_category_name}
    </c:if>
    <c:if test="${empty param.detail_category_name}">
        카테고리 ⋁
    </c:if>
</button>


			<button type="button"
				class="btn btn-outline-dark ms-2 mt-4 btncommon locationBtn"
				data-bs-toggle="modal" data-bs-target="#locationModal">지역 ⋁</button> 
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
				<div class="modal-body">
				    <div class="accordion" id="categoryAccordion">
				      <%-- 서비스 카테고리 리스트 --%>
						<c:forEach var="category" items="${service_category_name}" varStatus="loop">
						    <div class="accordion-item">
						        <h2 class="accordion-header">
						            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#${category}">
						               ${category}
						            </button>
						        </h2>
						        <div id="${category}" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">
						            <ul class="list-group">
						                <%-- 상세 카테고리 리스트 --%>
						                <c:forEach var="detailCategory" items="${detailCategoryList[loop.index]}">
						                    <button type="button" class="list-group-item list-group-item-action selected" id="selectCategoryBtn"
						                     onclick="location.href='${root}/search/findPro?service_category_id=${detailCategory.service_category_id}&detail_category_name=${detailCategory.detail_category_name }'">
						                        ${detailCategory.detail_category_name}
						                    </button>
						                </c:forEach>
						            </ul>
						        </div>
						    </div>
						</c:forEach> 
				    </div>
				</div>  
				</div>
			</div>
		</div>
		<!-- 추가된 locationModal -->
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


		<div class="row">
			<div class="col-3">
				<div class="card border-0" style="background-color: #f4f4f4;">
					<div class="card-body p-4">

						<p>서비스 분야를 선택해 주세요.</p>
						<span style="color: #888888;"> 서비스 분야를 선택하면 나에게 딱 맞는 고수를
							필터링해 찾아볼 수 있어요! </span>

					</div>
				</div>
			</div>
			
			<div class="col-9">

				<div class="mb-5"
					style="display: flex; justify-content: space-between;">
					<input id="searchInput" class="form-control"
						placeholder="어떤 서비스가 필요하세요?" style="width: 90%;"></input>
					<button id="searchButton" class="btn button-custom"
						style="color: white;">검색</button>
				</div>

				<div class="card mb-3">
					<div class="card-body row">
						<div class="col-10">
							<b style="font-size: 18px;">일류 이름입니다. </b>
							<div class="card-content">상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 /
								회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
								발음 교정 전문’입니다. ✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에
								익숙해지는 훈련을 합니다. ✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
								✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다. * 화상강의는 ZOOM으로 진행.</div>

							<div class="star-review mt-1">
								<i class="bi bi-star-fill star"></i> <span class="review-count"
									style="font-size: 13px;">5.0(리뷰 수)</span>
							</div>

							<div class="career mt-2 lig">
								<span>경력 10년</span>
							</div>
						</div>

						<div class="col-2 text-center mt-4">
							<img class="profileimage" src="../image/logo4.png">
						</div>
					</div>
				</div>

				<div class="card mb-3">
					<div class="card-body row">
						<div class="col-10">
							<b style="font-size: 18px;">일류 이름입니다. </b>
							<div class="card-content">상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 /
								회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
								발음 교정 전문’입니다. ✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에
								익숙해지는 훈련을 합니다. ✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
								✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다. * 화상강의는 ZOOM으로 진행.</div>

							<div class="star-review mt-1">
								<i class="bi bi-star-fill star"></i> <span class="review-count"
									style="font-size: 13px;">5.0(리뷰 수)</span>
							</div>

							<div class="career mt-2 lig">
								<span>경력 20년</span>
							</div>
						</div>
						<div class="col-2 text-center mt-4">
							<img class="profileimage" src="../image/logo4.png">
						</div>
					</div>
				</div>

				<div class="card mb-3">
					<div class="card-body row">
						<div class="col-10">
							<b style="font-size: 18px;">일류 이름입니다. </b>
							<div class="card-content">상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 /
								회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
								발음 교정 전문’입니다. ✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에
								익숙해지는 훈련을 합니다. ✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
								✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다. * 화상강의는 ZOOM으로 진행.</div>

							<div class="star-review mt-1">
								<i class="bi bi-star-fill star"></i> <span class="review-count"
									style="font-size: 13px;">5.0(리뷰 수)</span>
							</div>

							<div class="career mt-2 lig">
								<span>경력 30년</span>
							</div>
						</div>
						<div class="col-2 text-center mt-4">
							<img class="profileimage" src="../image/logo4.png">
						</div>
					</div>
				</div>

				<div class="card mb-3">
					<div class="card-body row">
						<div class="col-10">
							<b style="font-size: 18px;">일류 이름입니다. </b>
							<div class="card-content">상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 /
								회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
								발음 교정 전문’입니다. ✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에
								익숙해지는 훈련을 합니다. ✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
								✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다. * 화상강의는 ZOOM으로 진행.</div>

							<div class="star-review mt-1">
								<i class="bi bi-star-fill star"></i> <span class="review-count"
									style="font-size: 13px;">5.0(리뷰 수)</span>
							</div>

							<div class="career mt-2 lig">
								<span>경력 40년</span>
							</div>
						</div>
						<div class="col-2 text-center mt-4">
							<img class="profileimage" src="../image/logo4.png">
						</div>
					</div>
				</div>

				<div class="card mb-3">
					<div class="card-body row">
						<div class="col-10">
							<b style="font-size: 18px;">일류 이름입니다. </b>
							<div class="card-content">상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 /
								회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
								발음 교정 전문’입니다. ✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에
								익숙해지는 훈련을 합니다. ✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
								✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다. * 화상강의는 ZOOM으로 진행.</div>

							<div class="star-review mt-1">
								<i class="bi bi-star-fill star"></i> <span class="review-count"
									style="font-size: 13px;">5.0(리뷰 수)</span>
							</div>

							<div class="career mt-2 lig">
								<span>경력 50년</span>
							</div>
						</div>
						<div class="col-2 text-center mt-4">
							<img class="profileimage" src="../image/logo4.png">
						</div>
					</div>
				</div>

				<div class="card mb-3">
					<div class="card-body row">
						<div class="col-10">
							<b style="font-size: 18px;">일류 이름입니다. </b>
							<div class="card-content">상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 /
								회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
								발음 교정 전문’입니다. ✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에
								익숙해지는 훈련을 합니다. ✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
								✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다. * 화상강의는 ZOOM으로 진행.</div>

							<div class="star-review mt-1">
								<i class="bi bi-star-fill star"></i> <span class="review-count"
									style="font-size: 13px;">5.0(리뷰 수)</span>
							</div>

							<div class="career mt-2 lig">
								<span>경력 60년</span>
							</div>
						</div>
						<div class="col-2 text-center mt-4">
							<img class="profileimage" src="../image/logo4.png">
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--여기 -->

	</div>
	<!--여기까지 본문 -->
	<!--푸터-->
<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>