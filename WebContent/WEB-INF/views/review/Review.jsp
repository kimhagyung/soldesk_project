<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Review</title>
	<script src="${root}/script/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
  
<script type="text/javascript">
  
$(document).ready(function() {
    
    /* // 댓글 개수 조회 함수
    function updateReviewCount() {
        $.ajax({
            url: '${root}/reviewsCnt',
            type: 'GET',
            data: { pro_id: ${pro_id} },
            success: function(response) {
                $("#commentCount").text(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    } */

    /* // 댓글 목록 조회 함수
    function updateReviewList() {
        $.ajax({
            url: '${root}/reviews?pro_id=${pro_id}',
            type: 'GET',
            dataType: 'json',
            success: function(response) {
                $("#replySection").empty(); 
                $.each(response, function(index, review) {
                    var replyHtml = '<div class="reviewItem" id="replySection" style="margin-bottom: 4%;">' +
                                        '<div class="author" style="margin-bottom: 0.5%">' + review.writer_name + '</div>' +
                                        '<div class="serviceScore" style="display:flex; justify-content: space-between;">' +
                                        '<div><img src="../image/star-solid.svg" style="margin-top: -5px;" />' + 
                                        '<strong>' + review.rating.toFixed(1) + '</strong></div>';
                                        
                    if (review.user_id === loginUserBean.user_id) {
                        replyHtml += '<div>' +
                                          '<button style="border: none; border-radius: 8px;" onclick="deleteReview(' + review.review_id + ')">삭제</button>' +
                                          '</div></div><div class="reviewImg" style="margin-top: 5px; margin-bottom: 5px;">';
                    }
                    
                    if (review.photos !== null) {
                        var photoArray = review.photos.split(',');

                        for (var i = 0; i < photoArray.length; i++) {
                            var photoUrl = photoArray[i].trim(); // 각각의 사진 URL을 얻음

                            // 동적으로 생성한 img 태그를 reviewImgHtml에 추가
                            replyHtml += '<img src="' + photoUrl + '" style="width: 80px; height: 80px; border-radius: 8px; margin-right: 5px;">';
                        }
                    }

                    replyHtml += '</div>' +
                                 '<div class="reviewText">' + review.review_contents + '</div>' +
                                 '<div class="date" style="color: #787878; font-size: 12px">' + review.review_date + '</div>' +
                                 '</div>';

                    $("#replySection").append(replyHtml); 
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    } */
    
    // 리뷰 삭제
    function deleteReview(reviewId) {
        var isConfirmed = confirm('정말로 이 댓글을 삭제하시겠습니까?');
        
        if (isConfirmed) {
            $.ajax({
                url: '${root}/deleteReview',
                type: 'GET',
                data: { review_id: reviewId },
                success: function(response) {
                    alert('댓글이 성공적으로 삭제되었습니다.');
                    
                    /* // 댓글이 성공적으로 삭제된 후에 updateReplyList 함수 호출
                    updateReviewList();
                    //updateReviewCount(); */
                    
                    location.reload();
                },
                error: function(error) {
                    console.log(error);
                    alert('댓글 삭제에 실패했습니다.');
                }
            });
        }
    }
    
    // 초기 로딩 시 댓글 개수와 목록 업데이트
   // updateReviewCount();
    //updateReviewList();
    
    window.deleteReview = deleteReview;
    
});
</script>



	  
	<style>
		.nav-link {
			color: black;
			text-decoration: none;
		}

		.nav-link.active {
			color: #6387A6;
		}

		.account {
			font-size: 25px;
		}

		/* 헤더와 내비게이션을 감싸는 컨테이너 */
		#header-container {
			position: fixed;
			top: 0;
			width: 100%;
			background-color: white;
			z-index: 1000;
			/* 다른 요소 위에 표시 */
		}

		.container-content {
			padding-top: 100px;
		}

		.category {
			display: flex;
			flex-direction: row;
		}

		.subcategory {
			margin-right: 8px;
		}

		.introduce {
			font-size: 16px;
		}

		.basicInfo {
			background-color: #fafafa;
			border-radius: 8px;
			width: 100%;
			display: flex;
			justify-content: space-around;
			align-items: center;
			height: 9vh;
			margin-top: 20px;
			margin-bottom: 30px;
		}

		.employ_item {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}

		.review_item {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}

		.career_item {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}

		.businessSize {
			display: flex;
			flex-direction: row;
		}

		.activeTime {
			display: flex;
			flex-direction: row;
		}

		.payment {
			display: flex;
		}


		.reviewSummary {
			display: flex;
			flex-direction: row;
		}

		.reviewInfo {
			display: flex;
			flex-direction: column;
		}

		.photoReview {
			width: 105px;
			border: 1px solid #D9E8F5;
			background-color: #fff;
			border-radius: 10px;
			display: flex;
			justify-content: center;
			align-items: center;
			cursor: pointer;
		}

		.clickBackground {
			background-color: #D9E8F5;
		}

		.reviewCondition {
			display: flex;
			flex-direction: row;
			justify-content: space-between;
		}


		/* .dropdown-item.active, .dropdown-item:active에 배경색을 적용하는 경우 */
		.dropdown-item.active,
		.dropdown-item:active {
			background-color: #6387A6 !important;
		}

		.dropdown-toggle:focus {
			box-shadow: none !important;
			outline: none !important;
		}

		.evaluation {
			display: flex;
			flex-direction: row;
		}

		.reviewItem {
			font-size: 16px;
		}

		.readMoreBtn {
			background-color: #fff;
			border: none;
			color: #6387A6;
		}

		.careerDate {
			font-size: 14px;
			color: #737373;
		}

		.careerDescription {
			font-size: 14px;
			color: #B5B5B5;
		}

		.career {
			display: flex;
			flex-direction: column;
			margin-top: 30px;
			margin-bottom: 16px;
		}

		.careerContent {
			margin-bottom: 10px;
		}

		#carouselExampleIndicators {
			overflow: hidden;
		}

		.carousel-inner {
			display: flex;
			width: 300%;
			/* 캐러셀 내부의 모든 이미지 너비의 300%로 설정 */
			transition: transform 0.5s ease;
		}

		.carousel-item {
			width: 100%;
			/* 각 이미지의 너비를 100%로 설정 */
		}

		.carousel-item img {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}

		.carousel-control-prev-icon,
		.carousel-control-next-icon {
			background-color: gray;
			border-radius: 50%;
			width: 30px;
			height: 30px;
			display: flex;
			align-items: center;
			justify-content: center;
		}

		.btn_wrapper {
			display: flex;
			flex-direction: row;
		}

		.portfolio {
			position: relative;
			width: 150px;
			height: 150px;
			overflow: hidden;
		}

		.overlay {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0, 0, 0, 0.2);
			/* 배경 색상과 투명도 조절 */
			z-index: 1;
			/* 이미지 위에 표시되도록 설정 */
			border-radius: 10px;
		}

		.text-overlay {
			position: absolute;
			bottom: 0;
			left: 0;
			right: 0;
			color: #fff;
			padding: 8px;
			text-align: center;
			z-index: 2;
			/* 텍스트 오버레이가 배경 오버레이 위에 표시되도록 설정 */
		}

		.portfolioTitle {
			font-size: 14px;
		}

		.portfolioDescription {
			font-size: 12px;
			left: 0;
			text-align: left;
		}

		.portfolioTitle,
		.portfolioDescription {
			margin: 0;
			overflow: hidden;
			/* 텍스트가 너비를 넘어가면 숨기기 */
			white-space: nowrap;
		}

		.serviceli {
			list-style-type: none;
			border: 1px solid #6387A6;
			border-radius: 20px;
			margin-right: 8px;
			padding: 5px;
		}
		
	</style>
</head>

<body>
	<!-- 헤더와 내비게이션을 감싸는 컨테이너 -->
	<div id="header-container">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/views/include/header.jsp" />

		<!-- 내비게이션 -->
		<ul class="nav justify-content-center nav-fill" style="margin-right: 13.4%; margin-left: 13.4%">
			<li class="nav-item">
				<a class="nav-link" href="#scrollspyHeading1" style="color: black;">일류 정보</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#scrollspyHeading2" style="color: black;">포트폴리오</a>
			</li>
			<!-- <li class="nav-item">
				<a class="nav-link" href="#scrollspyHeading3" style="color: black;">사진 / 동영상</a>
			</li> -->
			<li class="nav-item">
				<a class="nav-link" href="#scrollspyHeading4" style="color: black;">리뷰</a>
			</li>
		</ul>
		<hr style="margin-right: 13.4%; margin-left: 13.4%; margin-bottom: 0; margin-top: -0.2%" />
	</div>

	<!-- 컨테이너 내용 -->
	<div class="container mt-2 mb-5 container-content">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<hr style="margin-top: 0.7%; margin-bottom: 5%" />


				<div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%"
					data-bs-smooth-scroll="true" class="scrollspy-example p-3 rounded-2" tabindex="0">
					<div id="scrollspyHeading1" style="height: 3vh;"></div>
					<h5 class="fw-bold" style="margin-bottom: 2.5%;">일류 정보</h5>
					<p style="margin-bottom: 2.5%;">
					<div style="display: flex; align-items: center; ">
						<img src="../image/1.png"
							style="width: 125px; height: 125px; border-radius: 15px; border: 1px solid #F3F3F3; margin-right: 35px;">
						<div class="">
							<h1 class="nickname" style="font-size: 24px;"><strong>OOO</strong></h1>
							
							<div class="subcategory">반려동물 훈련</div>
							<div style="display: flex; align-items: center;">
								<i class="bi bi-geo-alt" style="font-size: 16px;"></i>
								<div class="address" style="font-size: 14px;">서울 관악구 / 100km 이동 가능</div>
							</div>
							
							<div class="introduce">자세한 사항은 상세 서비스를 읽어주세요!</div>
						</div>
						<div class="btn_wrapper"
							style="margin-left: auto; margin-bottom: auto;">
							<button id="like-button" class="like-button"
								style="border: none; background-color: #fff;"
								onclick="toggleInterest()">
								<i id="heartIcon" class="bi bi-heart"
									style="font-size: 30px; margin-top: 15px; margin-right: 20px;"></i>
							</button>
							<button
								style="background-color: #6387A6; border: #6387A6; border-radius: 10px; padding: 10px; color: #fff;">견적
								요청</button>
							<!-- 클릭 시 채팅화면으로 이동 -->
						</div>
					</div>
					<div class="basicInfo">
						<!-- <div class="employ_item">
							<span style="font-size: 14px;">고용</span>
							<span style="font-size: 20px;"><strong>n회</strong></span>
						</div> -->
						<div class="review_item">
							<span style="font-size: 14px;">리뷰</span>
							<div class="review_info">
								<img src="../image/star-solid.svg" style="width: 20px; height: 20px; margin-top: -8px;">
								<span style="font-size: 20px;"><strong><fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></strong></span>
							</div>
						</div>
						<div class="career_item">
							<span style="font-size: 14px;">총 경력</span>
							<span style="font-size: 20px;"><strong>n년</strong></span>
						</div>
					</div>
					<!-- <div class="addInfo">
						<div style="font-size: 16px; margin-top: 20px; margin-bottom: 8px"><strong>추가 정보</strong></div>
						<div class="businessSize">
							<i class="bi bi-people" style="margin-right: 10px;"></i>
							직원 수: &nbsp;<div class="size">1명</div>
						</div>
						<div class="activeTime">
							<i class="bi bi-clock" style="margin-right: 10px;"></i>
							연락 가능 시간: &nbsp;<div class="time">오전 12시 - 오전 12시</div>
						</div>
						<div class="payment">
							<i class="bi bi-credit-card-2-back" style="margin-right: 10px;"></i>
							<div class="pay">계좌이체, 현금결제 가능</div>
						</div>
					</div> -->

					<div class="serviceInfo" style="margin-top: 30px;">
						<div style="font-size: 16px; margin-bottom: 8px"><strong>서비스 상세설명</strong></div>

						<div class="partialContent">
							<!-- 더보기 클릭 전 보이는 내용 -->
							🧡고객님들의 새로운 보금자리를 만들어드리는 치워드림입니다.🧡 <br>
							🤍숨고 종합 카테고리 전체리뷰 1위🤍<br>
							💛 월 평균 1100집 청소! 압도적인 청소 경험치💛<br>
							💚수많은 시공과 청소로 다져진 타업체와 비교불가 노하우 보유.💚<br>
							💙3개월간 교육을 통해 투입되는 정식계약된 팀장님으로만 이루어지는 서비스💙<br>
							💜최신식 프리미엄 장비 보유. 구역별 걸레사용, 2회 사용시 걸레폐기가 원칙💜<br>
							🤎각종 맘카페, 입주민카페 선호도 만족도 1위🤎<br>
							<br>
						</div>
						<div class="fullContent" style="display: none;">
							<!-- 더보기 클릭 후 보이는 내용 -->
							🧡고객님들의 새로운 보금자리를 만들어드리는 치워드림입니다.🧡 <br>
							🤍숨고 종합 카테고리 전체리뷰 1위🤍<br>
							💛 월 평균 1100집 청소! 압도적인 청소 경험치💛<br>
							💚수많은 시공과 청소로 다져진 타업체와 비교불가 노하우 보유.💚<br>
							💙3개월간 교육을 통해 투입되는 정식계약된 팀장님으로만 이루어지는 서비스💙<br>
							💜최신식 프리미엄 장비 보유. 구역별 걸레사용, 2회 사용시 걸레폐기가 원칙💜<br>
							🤎각종 맘카페, 입주민카페 선호도 만족도 1위🤎<br>
							<br>
							💛치워드림 청소 차림표💛<br>
							* 외창을 제외한 모든 유리창 샷시 청소<br>
							창문 / 창틀 / 각종 틈새 / 샷시 / 방충망<br>
							<br>
							* 각종 수납장 및 등 커버 전체 탈거 청소<br>
							수납장 / 서랍장 / 전등갓<br>
							<br>
							* 화장실 전체 청소 및 소독 살균<br>
							천장 / 벽 / 바닥 / 수건장 / 세면대<br>
							변기 / 욕조 / 유리 / 환풍구 / 배수구<br>
							<br>
							* 주방의 가스레인지 및 후드 청소 및 소독 살균<br>
							싱크대 전체 청소 / 상부장 / 하부장<br>
							가스레인지 / 후드 / 걸레받이<br>
							<br>
							*구역별 다른 걸레 사용합니다.*<br>
							<br>
							*치워드림은 친환경 세제를 사용합니다.*<br>
							아이나 어린 친구들 반려동물에도 걱정이 없습니다. (당일 입주 가능)<br>
							<br>
							✔청소가 끝난 후 미흡한 부분이 발견될 시 즉시 수정 청소나 5일 이내에 연락주시면<br>
							사후A/S처리 진행 되오니 걱정마시고 믿고 맡겨주세요 '◡'✿<br>
							<br>
							단 한번도 남의 집을 청소한다는 생각으로 청소하지 않았습니다. 나의 가족이 거주 할 공간이라는 생각으로 청소해왔습니다.<br>
							한번 청소한 집은 끝까지 책임져야 한다는게 저의 모토입니다. 이사하시고 새로운 보금자리에서 행복한 일들만 있으시길 바랍니다.<br>
							<br>
							-치워드림 대표 올림-
							<p>
								<br>
						</div>
						<div style="display: flex; justify-content: center;">
							<button class="readMoreBtn" onclick="toggleFullContent()">더 보기 <i
									class="bi bi-chevron-down"></i></button>
						</div>
					</div>
					<div class="offerService" style="margin-top: 30px;">
						<div style="font-size: 16px; margin-bottom: 8px"><strong>제공 서비스</strong></div>
						<div class="offerServiceList">
							<ul style="padding: 0px; display: flex; flex-direction: row;">
								<li class="serviceli">이사/입주 청소업체</li>
								<li class="serviceli">거주 청소업체</li>
								<li class="serviceli">준공 청소</li>
								<li class="serviceli">줄눈 시공</li>
							</ul>
						</div>
					</div>
					<div class="career">
						<div style="font-size: 16px; margin-bottom: 8px"><strong>경력</strong></div>
						<div style="font-size: 16px; color: #6387A6; margin-bottom: 5px"><strong><i
									class="bi bi-briefcase" style="margin-right: 8px;"></i>총 경력 24년</strong></div>

						<div class="partialContent">
							<div class="careerContent">
								<div class="careerHeader">경인지역 청소협회 대표</div>
								<div class="careerDate">2018년 1월 ~ 현재 (6년 1개월)</div>
								<div class="careerDescription">경인지역 정소협쇠 대표업체</div>
							</div>
							<div class="careerContent">
								<div class="careerHeader">(주)이즈디자인 정식협력 업체</div>
								<div class="careerDate">2022년 2월 ~ 현재 (2년)</div>
								<div class="careerDescription">(주)이즈디자인 공식협력업체 인테리어 후 청소, 입주청소 부문</div>
							</div>
							<div class="careerContent">
								<div class="careerHeader">동탄 삼정그림코아 공동구매 진행</div>
								<div class="careerDate">2022년 11월 ~ 2323년 1월 (3개월)</div>
								<div class="careerDescription">동탄 삼정그린코아 200여 세대 공동구매 진행</div>
							</div>
						</div>

						<div class="fullContent" style="display: none;">
							<div class="careerContent">
								<div class="careerHeader">경인지역 청소협회 대표</div>
								<div class="careerDate">2018년 1월 ~ 현재 (6년 1개월)</div>
								<div class="careerDescription">경인지역 정소협쇠 대표업체</div>
							</div>
							<div class="careerContent">
								<div class="careerHeader">(주)이즈디자인 정식협력 업체</div>
								<div class="careerDate">2022년 2월 ~ 현재 (2년)</div>
								<div class="careerDescription">(주)이즈디자인 공식협력업체 인테리어 후 청소, 입주청소 부문</div>
							</div>
							<div class="careerContent">
								<div class="careerHeader">동탄 삼정그림코아 공동구매 진행</div>
								<div class="careerDate">2022년 11월 ~ 2323년 1월 (3개월)</div>
								<div class="careerDescription">동탄 삼정그린코아 200여 세대 공동구매 진행</div>
							</div>
							<div class="careerContent">
								<div class="careerHeader">동탄 삼정그림코아 공동구매 진행</div>
								<div class="careerDate">2022년 11월 ~ 2323년 1월 (3개월)</div>
								<div class="careerDescription">동탄 삼정그린코아 200여 세대 공동구매 진행</div>
							</div>
						</div>

						<div style="display: flex; justify-content: center;">
							<button class="readMoreBtn" onclick="toggleFullContent()">더 보기 <i
									class="bi bi-chevron-down"></i></button>
						</div>

					</div>
					<div class="education" style="margin-top: 30px; display: flex; flex-direction: column;">
						<div style="font-size: 16px; margin-bottom: 8px"><strong>학력</strong></div>
						<div>-</div>
						<p>

					</div>
					</p>
					<div id="scrollspyHeading2" style="height: 3vh;"></div>
					<h5 class="fw-bold" style="margin-bottom: 2.5%;">포트폴리오</h5>
					<p style="margin-bottom: 2.5%;">
						<!-- Button trigger modal -->

						<button type="button" class="btn btn-primary" data-bs-toggle="modal"
							data-bs-target="#exampleModal"
							style="width: 155px; height: 155px; border: none; background-color: #fff;">
							<div class="portfolio">
								<div class="overlay"></div>
								<img src="https://archivenew.vop.co.kr/images/90952a5d266e2222a78d4eb07938162f/2018-05/26023757_DeDeCbRVQAAhzEb.jpg"
									style="width: 100%; height: 100%; border-radius: 10px;">
								<div class="text-overlay">
									<div class="portfolioTitle">법무법인 로율 로고 디자인 건</div>
									<div class="portfolioDescription">로고 디자인</div>
								</div>
							</div>
						</button>

						<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-xl modal-dialog-centered">
							<div class="modal-content" style="display: flex; flex-direction: row;">

								<!-- 캐러셀 -->

								<div id="carouselExampleIndicators" class="carousel"
									style="height: 100%; width: 65%; margin-top: 50px; margin-bottom: 50px;">
									<div class="carousel-indicators">
										<button type="button" data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<button type="button" data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="1" aria-label="Slide 2"></button>
										<button type="button" data-bs-target="#carouselExampleIndicators"
											data-bs-slide-to="2" aria-label="Slide 3"></button>
									</div>
									<div class="carousel-inner">
										<div class="carousel-item active">
											<img src="../image/test5.png" class="d-block w-100 img-fluid" alt="..."
												style="object-fit: cover;">
										</div>
										<div class="carousel-item">
											<img src="../image/2.png" class="d-block w-100 img-fluid" alt="..."
												style="object-fit: cover;">
										</div>
										<div class="carousel-item">
											<img src="../image/It.png" class="d-block w-100 img-fluid" alt="..."
												style="object-fit: cover;">
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>

								</div>
								<div style="display: flex; flex-direction: column; width: 35%;">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="exampleModalLabel">동탄 입주청소</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="portfolioProfile"
											style="display: flex; flex-direction: row; margin-bottom: 10px;">
											<div class="portfolioProfile_img">
												<img src="https://ccdn.lezhin.com/v2/comics/5403861310570496/images/tall.jpg?updated=1643943172332&width=840"
													style="width: 46px; height: 46px; border-radius: 10px; margin-right: 10px;">
											</div>
											<div class="portfolioProfile_info">
												<div class="portfolioProfile_name" style="font-size: 14px;">윤아디자인</div>
												<div style="display: flex; flex-direction: row;">
													<div>
														<ul class="stars" style="padding: 0px 0px; margin: 0px 0px;">
															<script>
        var avgRating = ${reviewAvg};
        var fullStars = Math.floor(avgRating);  // 소수점 이하 버린 별

        // Full stars
        for (var i = 0; i < fullStars; i++) {
            document.write('<img src="../image/star-solid.svg" />');
        }

        // Determine the appropriate additional stars based on the decimal part
        var decimalPart = avgRating % 1;
        if (decimalPart >= 0.5) {
            document.write('<img src="../image/star-half.png" style="width:18px; height: 16px;"/>');
            fullStars++;  // 반개 별이 표시되었으므로 fullStars 증가
        }

        // Remaining empty stars
        var emptyStars = 5 - fullStars;
        for (var j = 0; j < emptyStars; j++) {
            document.write('<img src="../image/star-solid-gray.svg" />');
        }
    </script>
														</ul>
													</div>
													<div style="margin-top: 2px; color: #888888;">(${reviewCnt })</div>
												</div>
											</div>

										</div>
										<div class="portfolioProfile_detail">
											<div class="portfolioProfile_detail_service"
												style="color: #888888; display: flex; flex-direction: row;">
												<div style="width: 100px;">서비스 종류</div> <span
													style="color: #2D2D2D;">이사/입주 청소업체</span>
											</div>
											<div class="portfolioProfile_detail_area"
												style="color: #888888; display: flex; flex-direction: row;">
												<div style="width: 100px;">지역 정보</div> <span style="color: #2D2D2D;">경기
													파주시</span>
											</div>
											<div class="portfolioProfile_detail_cost"
												style="color: #888888; display: flex; flex-direction: row;">
												<div style="width: 100px;">가격대</div> <span
													style="color: #2D2D2D;">280,000원</span>
											</div>
											<div class="portfolioProfile_detail_year"
												style="color: #888888; display: flex; flex-direction: row;">
												<div style="width: 100px;">작업년도</div> <span
													style="color: #2D2D2D;">2022</span>
											</div>
											<div class="portfolioProfile_detail_description"
												style="color: #2D2D2D; margin-top: 16px;">초롱꽃마을 8단지 고객님댁입니다.</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</p>

					<!-- <div id="scrollspyHeading3" style="height: 3vh;"></div>
					<h5 class="fw-bold" style="margin-bottom: 2.5%;">사진 / 동영상</h5>
					<p style="margin-bottom: 2.5%;">
						<img src="../image//1.png"
							style="width: 120px; height: 120px; border-radius: 15px; margin-right: 10px;">
						<img src="../image//2.png"
							style="width: 120px; height: 120px; border-radius: 15px; margin-right: 10px;">
					</p> -->

					<div id="scrollspyHeading4" style="height: 3vh;"></div>
					<h5 class="fw-bold" style="margin-bottom: 2.5%;"><strong>리뷰</strong></h5>
					<p>
					<div class="reviewSummary">
						<div class="reviewScore" style="font-size: 40px; margin-right: 15px;"><strong><fmt:formatNumber value="${reviewAvg}" pattern="#,##0.0" /></strong></div>
						<div class="reviewInfo" style="margin-top: 0.8%;">
							<ul class="stars" style="padding: 0px 0px; margin: 0px 0px;">
								<!-- <img src="../image/star-solid.svg" />
								<img src="../image/star-solid.svg" />
								<img src="../image/star-solid.svg" />
								<img src="../image/star-solid.svg" />
								<img src="../image/star-solid.svg" /> -->
								<script>
        var avgRating = ${reviewAvg};
        var fullStars = Math.floor(avgRating);  // 소수점 이하 버린 별

        // Full stars
        for (var i = 0; i < fullStars; i++) {
            document.write('<img src="../image/star-solid.svg" />');
        }

        // Determine the appropriate additional stars based on the decimal part
        var decimalPart = avgRating % 1;
        if (decimalPart >= 0.5) {
            document.write('<img src="../image/star-half.png" style="width:18px; height: 16px;"/>');
            fullStars++;  // 반개 별이 표시되었으므로 fullStars 증가
        }

        // Remaining empty stars
        var emptyStars = 5 - fullStars;
        for (var j = 0; j < emptyStars; j++) {
            document.write('<img src="../image/star-solid-gray.svg" />');
        }
    </script>
							</ul>
							<div class="reviewCount" id="commentCount" style="font-size: 14px">${reviewCnt }개 리뷰</div>
						</div>
						<!-- <div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown"
								aria-expanded="false" style="background-color: #fff; color: black; border: none;">
								최신순
							</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">최신순</a></li>
								<li><a class="dropdown-item" href="#">별점 높은 순</a></li>
								<li><a class="dropdown-item" href="#">별점 낮은 순</a></li>
							</ul>
						</div> -->
					</div>
					<hr style="border: 1px solid #E1E1E1;" />
					</p>

					<!-- 리뷰 컨테이너 -->
					<div id="reviewContainer">

						<!-- 3개 리뷰 보임 -->
						<c:forEach var="obj" items="${reviewList }">
							<div class="reviewItem" id="replySection" style="margin-bottom: 4%;">
								<div class="author" style="margin-bottom: 0.5%">${obj.writer_name }</div>
								<div class="serviceScore" style="display:flex; justify-content: space-between;">
									<div>
										<img src="../image/star-solid.svg" style="margin-top: -5px;" />
										<strong><fmt:formatNumber value="${obj.rating}" pattern="#,##0.0" /></strong>
									</div>

									<c:if test="${obj.user_id eq loginUserBean.user_id}">
										<div>
											<%-- <button style="border: none; border-radius: 8px;" onclick="editComment(${obj.review_id})">수정</button> --%>
											<button style="border: none; border-radius: 8px;" onclick="deleteReview(${obj.review_id})">삭제</button>
										</div>
									</c:if>

								</div>
								<div class="reviewImg" style="margin-top: 5px; margin-bottom: 5px;">
									
									<c:if test="${obj.photos != null}">
									
										<c:forEach var="photo" items="${fn:split(obj.photos, ',')}" varStatus="loop">
											<img src="${root}/upload/${photo}" style="width: 80px; height: 80px; border-radius: 8px; margin-right: 5px;">
    									</c:forEach>
										
									</c:if>
									
								</div>
								<div class="reviewText">${obj.review_contents }</div>
								<div class="date" style="color: #787878; font-size: 12px">
									${obj.review_date }</div>
							</div>
						</c:forEach>



					</div>
					
					<button id="loadMoreButton">Load More</button>

					<!--
					<button class="btn btn-primary mt-3 d-md-flex justify-content-md-center mx-auto" id="loadMore"
						style="border: none; color: #6387A6; background-color: white;">
						리뷰 더보기 <i class="bi bi-chevron-down"></i>
					</button> -->

				</div>


			</div>
		</div>
	</div>
<c:import url="/WEB-INF/views/include/footer.jsp" />

	<script>
	
	var page = 2; // 초기 페이지 값 설정
    $(document).ready(function () {
        $("#loadMoreButton").click(function () {
            loadMoreReviews();
        });
    });

    function loadMoreReviews() {
        $.ajax({
            type: "GET",
            url: "/moreReviews", // ReviewController의 매핑 경로
            data: { page: page, pageSize: 3 }, // 페이지 및 페이지 크기 전달
            success: function (data) {
                if (data.length > 0) {
                    // 받아온 리뷰를 reviewContainer에 추가
                    $("#reviewContainer").append(data);
                    // 페이지 값 업데이트
                    page++;
                } else {
                    // 불러올 리뷰가 없으면 "Load More" 버튼 숨기기
                    $("#loadMoreButton").hide();
                }
            },
            error: function () {
                alert("Error loading reviews.");
            }
        });
    }
    
	/* 	$(document).ready(function () {

			$('#carouselExampleIndicators').carousel();

			var visibleItemCount = 3; //리뷰 3개

			$('#loadMore').on('click', function () {

				var additionalItemCount = 3; //추가 리뷰 3개

				for (var i = 0; i < additionalItemCount; i++) {
					var newReviewItem = $('<div class="reviewItem">' + (visibleItemCount + i + 1) + '. 추가 리뷰 내용</div>');
					$('#reviewContainer').append(newReviewItem);
				}

				visibleItemCount += additionalItemCount;
			});

			// 최신순으로 드롭다운 버튼의 텍스트와 배경색 설정
			var defaultSelectedText = "최신순";

			$('.btn-secondary').text(defaultSelectedText);
			changeColor($('.dropdown-item').filter(function () {
			    return $(this).text() === defaultSelectedText;
			}));

		}); */

		// 드롭다운 메뉴 아이템을 클릭했을 때 스크롤 이동 방지
		$('.dropdown-menu a').on('click', function (e) {

			e.preventDefault(); //기본 이벤트 막기
			var selectedText = $(this).text();
			$('.btn-secondary').text(selectedText);

			changeColor(this);
		});

		//페이지 로드 후 드롭다운 최신순 색 지정
		$('.dropdown-menu li:first-child a').css('background-color', '#6387A6');

		// 드롭다운 메뉴 아이템을 클릭했을 때 이벤트 처리
		$('.dropdown-menu a').on('click', function (e) {

			e.preventDefault();
			$('.dropdown-menu li a').css('background-color', '#fff');
			$(this).css('background-color', '#6387A6');
		});

		function changeColor(element) {

			// 모든 드롭다운 아이템의 배경 색을 원래대로 초기화
		    $('.dropdown-item').css('background-color', '#fff');

		    // 선택된 드롭다운 아이템에 배경 색을 지정
		    $(element).css('background-color', '#6387A6');
		}

		function toggleBgcolor() {
			var button = document.querySelector('.photoReview');

			// 현재 클래스 리스트에 redBackground 클래스가 있는지 확인
			var hasClickBackground = button.classList.contains('clickBackground');

			// redBackground 클래스가 있으면 제거
			if (hasClickBackground) {
				button.classList.remove('clickBackground');
			} else {
				button.classList.add('clickBackground');
			}
		}

		function toggleFullContent() {
			var partialContents = document.getElementsByClassName('partialContent');
			var fullContents = document.getElementsByClassName('fullContent');
			var readMoreBtns = document.getElementsByClassName('readMoreBtn');

			for (var i = 0; i < partialContents.length; i++) {
				if (fullContents[i].style.display === 'none' || fullContents[i].style.display === '') {
					partialContents[i].style.display = 'none';
					fullContents[i].style.display = 'block';
					readMoreBtns[i].innerHTML = '접기 <i class="bi bi-chevron-up"></i>';
				} else {
					partialContents[i].style.display = 'block';
					fullContents[i].style.display = 'none';
					readMoreBtns[i].innerHTML = '더 보기 <i class="bi bi-chevron-down"></i>';
				}
			}
		}
		
		function toggleInterest() {
		    var heartIcon = document.getElementById("heartIcon");

		    // 현재 클래스를 확인하여 아이콘 변경
		    if (heartIcon.classList.contains("bi-heart")) {
		      heartIcon.classList.remove("bi-heart");
		      heartIcon.classList.add("bi-heart-fill");
		       heartIcon.style.color = "red";
		       alert("일류를 찜 했습니다")
		    } else {
		      heartIcon.classList.remove("bi-heart-fill");
		      heartIcon.classList.add("bi-heart");
		      heartIcon.style.color = ""; // 스타일 초기화
		      alert("찜을 취소했습니다")
		    } 
		    
		    var pro_id = <%= request.getParameter("pro_id") %>;
		    
		    $.ajax({
                type: "POST",
                url: "toggleInterest",
                data: {
                	pro_id: pro_id
                },
                success: function (response) {
                    if (response === "Liked toggled successfully") {
                        $("#likeButton").toggleClass("liked");
                    }
                },
                error: function (error) {
                    console.error("Error toggling like: " + error);
                }
            });
		  }



	</script>
</body>

</html>