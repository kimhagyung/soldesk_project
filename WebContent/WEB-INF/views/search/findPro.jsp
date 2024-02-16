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
<script src="${root}/jquery/locdata.js"></script>
<script>
	$(document).ready(function() {
		// 각 후기 내용을 제한할 길이
		var maxCharacters = 40;

		// 각 후기 내용에 대해 실행
		$('.card-content').each(function() {
			var text = $(this).text();

			// 글자 수가 제한 길이를 초과하면 생략
			if (text.length > maxCharacters) {
				var truncatedText = text.substring(0, maxCharacters) + '...';
				$(this).text(truncatedText);
			}
		}); 

		$('.star-review').each(function() {
		    // 리뷰 평점의 원본 텍스트 추출
		    var reviewCount = $(this).find('.review-count').text();
		    var reviewRating = reviewCount.match(/[\d.]+/)[0]; // 평점만 추출

		    // 리뷰 평점의 숫자 값 추출
		    var reviewRatingValue = parseFloat(reviewRating);

		    // 리뷰 평점을 소수점 첫 번째 자리까지 반올림
		    var roundedRating = Math.round(reviewRatingValue * 10) / 10;

		    // 반올림된 값을 텍스트로 업데이트
		    var updatedReviewCount = reviewCount.replace(reviewRating, roundedRating.toFixed(1));
		    $(this).find('.review-count').text(updatedReviewCount);
		});
	});
</script> 

<script>
$(document).ready(function () {
    $('.selectedDetailCate').on('click', function () {
        var selectedCategory = $(this).text().trim();
        //var selectedLocation = $(".locationBtn").text().trim(); // Get selectedLocation
        $('#exampleModal').modal('hide');
        //console.log('선택된 디테일 카테고리:', selectedCategory,selectedLocation);
        console.log('선택된 디테일 카테고리:', selectedCategory);
        $(".categoryBtn").text(selectedCategory); 
        sendToServerCategory(selectedCategory);
        sendToServer(selectedCategory,selectedLocation); // Send both selectedCategory and selectedLocation
    });

    $('.selectedLocation').on('click', function() {
        var selectedLocation = $(this).text().trim();
        //var selectedCategory = $(".categoryBtn").text().trim(); // Get selectedCategory
        $('#locationModal').modal('hide');
        //console.log('선택된 위치:', selectedLocation,selectedCategory);
        console.log('선택된 위치:',selectedLocation);
        $(".locationBtn").text(selectedLocation);
        sendToServerLocation(selectedLocation);
        sendToServer(selectedCategory,selectedLocation); // Send both selectedCategory and selectedLocation
    }); 
});

function sendToServer(selectedCategory, selectedLocation) {
    // 값이 없을 때 디폴트로 null 설정 
    $.ajax({
        type: 'GET',
        url: '${root}/search/getCategoryInfo',
        data: {
            selectedCategory: selectedCategory,
            active_location: selectedLocation
        },
        success: function (data) {
            console.log("받아온 data:", data); 
           
            var outputContainer = $('.here > div'); 
            outputContainer.empty(); // 기존 내용을 비워줍니다.

            // 받아온 데이터를 반복하여 처리
            data.forEach(function(item) {
                var detailCategory = item.detailCategory;
                var detailedIntroduction = item.proDetailedIntroduction;
                var profileImage = item.proProfileImage;
                var experience = item.totalExperiencePeriod;

                // 카드 생성 및 내용 추가
                var card = $('<div class="card mb-3"></div>');
                var cardBodyRow = $('<div class="card-body row"></div>');
                var col10 = $('<div class="col-10"></div>');
                var boldText = $('<b style="font-size: 18px;"></b>').text(detailCategory);
                var cardContent = $('<div class="card-content"></div>').text(detailedIntroduction);
                var starReview = $('<div class="star-review mt-1"></div>').html('<i class="bi bi-star-fill star"></i> <span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>');
                var career = $('<div class="career mt-2 lig"></div>').html('<span>경력 ' + experience + '년</span>');

                col10.append(boldText, cardContent, starReview, career);

                var col2 = $('<div class="col-2 text-center mt-4"></div>').html('<img class="profileimage" src="' + profileImage + '">');

                cardBodyRow.append(col10, col2);
                card.append(cardBodyRow);

                outputContainer.append(card);
            });
        },
        error: function (error) {
            console.error('Error fetching category info:', error);
        }
    });
}


function sendToServerCategory(selectedCategory) {
	// 값이 없을 때 디폴트로 null 설정 
    $.ajax({
        type: 'GET',
        url: '${root}/search/getCategoryInfo',
        data: {
            selectedCategory: selectedCategory 
        },
        success: function (data) {
            console.log("받아온 data:", data); 
           
            var outputContainer = $('.here > div'); 
            outputContainer.empty(); // 기존 내용을 비워줍니다.

            for (var i = 0; i < data.length; i++) {
                var detailCategory = data[i];

                var card = $('<div class="card mb-3"></div>');
                var cardBodyRow = $('<div class="card-body row"></div>');
                var col10 = $('<div class="col-10"></div>');
                var boldText = $('<b style="font-size: 18px;"></b>').text(detailCategory);
                var cardContent = $('<div class="card-content">상세소개입니다... (여기에 실제 내용을 추가하세요)</div>');
                var starReview = $('<div class="star-review mt-1"></div>').html('<i class="bi bi-star-fill star"></i> <span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>');
                var career = $('<div class="career mt-2 lig"></div>').html('<span>경력 10년</span>');

                col10.append(boldText, cardContent, starReview, career);

                var col2 = $('<div class="col-2 text-center mt-4"></div>').html('<img class="profileimage" src="../image/logo4.png">');

                cardBodyRow.append(col10, col2);
                card.append(cardBodyRow);

                outputContainer.append(card);
            }
        },
        error: function (error) {
            console.error('Error fetching category info:', error);
        }
    });
}

function sendToServerLocation(selectedLocation) {
	// 값이 없을 때 디폴트로 null 설정 
    $.ajax({
        type: 'GET',
        url: '${root}/search/getCategoryInfo',
        data: { 
            active_location: selectedLocation
        },
        success: function (data) {
            console.log("받아온 data:", data); 
           
            var outputContainer = $('.here > div'); 
            outputContainer.empty(); // 기존 내용을 비워줍니다.

            for (var i = 0; i < data.length; i++) {
                var detailCategory = data[i];

                var card = $('<div class="card mb-3"></div>');
                var cardBodyRow = $('<div class="card-body row"></div>');
                var col10 = $('<div class="col-10"></div>');
                var boldText = $('<b style="font-size: 18px;"></b>').text(detailCategory);
                var cardContent = $('<div class="card-content">상세소개입니다... (여기에 실제 내용을 추가하세요)</div>');
                var starReview = $('<div class="star-review mt-1"></div>').html('<i class="bi bi-star-fill star"></i> <span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>');
                var career = $('<div class="career mt-2 lig"></div>').html('<span>경력 10년</span>');

                col10.append(boldText, cardContent, starReview, career);

                var col2 = $('<div class="col-2 text-center mt-4"></div>').html('<img class="profileimage" src="../image/logo4.png">');

                cardBodyRow.append(col10, col2);
                card.append(cardBodyRow);

                outputContainer.append(card);
            }
        },
        error: function (error) {
            console.error('Error fetching category info:', error);
        }
    });
}



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

		<div class="btn-catelocat mb-5">
			<button type="button"
				class="btn btn-outline-dark mt-4 btncommon categoryBtn"
				data-bs-toggle="modal" data-bs-target="#exampleModal"> 
			        카테고리 ⋁ 
			</button>
			<button type="button"
				class="btn btn-outline-dark ms-2 mt-4 btncommon locationBtn"
				data-bs-toggle="modal" data-bs-target="#locationModal"> 
			        지역 ⋁ 
			</button>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">카테고리 선택</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<%-- 서비스 카테고리 리스트 --%>
							<c:forEach var="category" items="${service_category_name}"
								varStatus="loop">
								<div class="accordion-item">
									<h2 class="accordion-header">
										<button class="accordion-button" type="button"
											data-bs-toggle="collapse" data-bs-target="#${category}">
											${category}</button>
									</h2>
									<div id="${category}" class="accordion-collapse collapse"
										data-bs-parent="#categoryAccordion">
										<ul class="list-group">
											<%-- 상세 카테고리 리스트 --%>
											<c:forEach var="detailCategory"
												items="${detailCategoryList[loop.index]}">
												<button type="button" 
													class="list-group-item list-group-item-action selectedDetailCate"
													id="selectCategoryBtn" name="category" >
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
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="accordion" id="categoryAccordion">
							<!-- 아래 스크립트를 body 내부에 추가하세요 -->
							<script>
								$.each(cityDatas,function(city, districts) {
													document.write('<div class="accordion-item">');
													document.write('<h2 class="accordion-header">');
													document.write('<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#' + city + '">'
																	+ city
																	+ '</button>');
													document.write('</h2>');
													document
															.write('<div id="' + city + '" class="accordion-collapse collapse" data-bs-parent="#categoryAccordion">');
													document
															.write('<ul class="list-group">');
													$
															.each(
																	districts,
																	function(
																			index,
																			district) {
																		document.write('<button type="button" class="list-group-item list-group-item-action selectedLocation">'
																				+ district
																				+ '</button>');

																	});
													document
															.write('</ul></div></div>');
												});
								// 콘솔에 출력하는 함수

								/* // 페이지로 이동하는 함수
								function redirectToPage(value) {
									console.log('선택한 값: ' + value);
									// 여기에 이동할 페이지 URL을 지정합니다.
									var pageURL = '${root}/search/findPro?${param.service_category_id}&detail_category_name=${param.detail_category_name }&location='
											+ value; // 예시 URL, 실제로 사용할 URL로 변경하세요.
									window.location.href = pageURL;
								} */
							</script>
						</div>
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

			<div class="col-9 here">
				<form action="${root }/search/searchProName" method="get">
					<div class="mb-5"
						style="display: flex; justify-content: space-between;">
						<input id="searchInput" name="searchInput" class="form-control"
							autocomplete="off" placeholder="어떤 서비스가 필요하세요?"
							style="width: 90%;"></input>
						<button id="searchButton" class="btn button-custom"
							style="color: white;"
							onclick="location.href='${root}/search/findPro?s=${searchInput }'">검색</button>
					</div>
				</form>
				<c:choose>
					<c:when test="${not empty search_proname}">
						<c:forEach var="proname" items="${search_proname}" varStatus="num" >
							<div class="card mb-3">
									<div class="card-body row">
										<div class="col-10">
											<b style="font-size: 18px;">${proname.pro_name }</b> 
											<div class="card-content">${ProprofileInfo[num.index].pro_detailed_introduction }</div>
											<div class="star-review mt-1">
												<i class="bi bi-star-fill star"></i> <span
													class="review-count" style="font-size: 13px;">${reviewAvgg[num.index] }(${reviewCnt[num.index]})</span>
											</div>  
											<div class="career mt-2 lig">
												<span>총 ${CareerInfo[num.index].total_experience_period }년</span>
											</div>
										</div>
	
										<div class="col-2 text-center mt-4">
											<img class="profileimage" src="${ProprofileInfo[num.index].pro_profile_image }">
										</div>
									</div>
								</div> 
						</c:forEach>
					</c:when>  
					 <c:otherwise>
						 <c:forEach var="proname" items="${pro_names}" varStatus="num" > 
								<div class="card mb-3">
									<div class="card-body row">
										<div class="col-10">
											<b style="font-size: 18px;">${proname.pro_name }</b> 
											<div class="card-content">${ProprofileInfo[num.index].pro_detailed_introduction }</div> 
												<c:choose>
													<c:when test="${not empty reviewAvgg[num.index]}">
														<div class="star-review mt-1">
															<i class="bi bi-star-fill star"></i> 
															<span class="review-count" style="font-size: 13px;">${reviewAvgg[num.index] }(${reviewCnt[num.index]})</span>
														</div> 
													</c:when>
													<c:otherwise>
													<p>
														<p style="color: grey;">리뷰없음</p>
													</c:otherwise>
												</c:choose>   
												<c:choose>
													<c:when test="${not empty CareerInfo[num.index].total_experience_period}">
														<span>총 ${CareerInfo[num.index].total_experience_period }년</span>
													</c:when>
													<c:otherwise> 
														<div class="career mt-2 lig">
															<span>총 0년</span>
														</div>
													</c:otherwise>
												</c:choose>   
										</div>
										<div class="col-2 text-center mt-4">
											<img class="profileimage" src="${ProprofileInfo[num.index].pro_profile_image }">
										</div>
									</div>
								</div> 
								
						</c:forEach>
						<!-- 페이징 처리 -->
								<div class="d-none d-md-block">
									<ul class="pagination justify-content-center">
										<c:choose>
										<c:when test="${pageBean.prevPage <= 0 }">
										<li class="page-item disabled">
											<a href="#" class="page-link">이전</a>
										</li>
										</c:when>
										<c:otherwise>
										<li class="page-item">
											<a href="${root }/search/findPro?page=${pageBean.prevPage}" class="page-link">이전</a>
										</li>
										</c:otherwise>
										</c:choose>
										
										
										<c:forEach var='idx' begin="${pageBean.min }" end='${pageBean.max }'>
										<c:choose>
										<c:when test="${idx == pageBean.currentPage }">
										<li class="page-item active">
											<a href="${root }/search/findPro?page=${idx}" class="page-link">${idx }</a>
										</li>
										</c:when>
										<c:otherwise>
										<li class="page-item">
											<a href="${root }/search/findPro?page=${idx}" class="page-link">${idx }</a>
										</li>
										</c:otherwise>
										</c:choose>
										
										</c:forEach>
												
										<c:choose>
										<c:when test="${pageBean.max >= pageBean.pageCnt }">
										<li class="page-item disabled">
											<a href="#" class="page-link">다음</a>
										</li>
										</c:when>
										<c:otherwise>
										<li class="page-item">
											<a href="${root }/search/findPro?page=${pageBean.nextPage}" class="page-link">다음</a>
										</li>
										</c:otherwise>
										</c:choose>
										
									</ul>
								</div>
					</c:otherwise>  
				</c:choose> 
				<div> </div>
			</div>
			<!-- 페이징 처리 -->

		</div> 
		

	</div>
	<!--여기까지 본문 -->
	<!--푸터-->
	<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>