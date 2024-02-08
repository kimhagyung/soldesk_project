<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티테스트페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root}/jquery/locdata.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>

$(document).ready(function() {
	function searchFunction() {
		var searchText = $(".list-group-item.selected").text().toLowerCase();
		//console.log(searchText);
		$('.card').each(function() {
			var cardText = $(this).text().toLowerCase();
			if (cardText.includes(searchText)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});

	}

	$('.btn-primary').click(function() {
		console.log("선택되었음");
		searchFunction();
	});

});

	$(function() {
		// Add a click event handler for the selectCategoryBtn button
		$("#selectCategoryBtn").click(function() {
			// Get the text content of the selected list item
			var selectedCategory = $(".list-group-item.selected").text();

			// Check if a category is selected
			if (selectedCategory) {
				console.log('Selected category:', selectedCategory);
				// Close the modal
				$("#exampleModal").modal('hide');
				$(".categoryBtn").text(selectedCategory);
			} else {
				console.log('Please select a category.');
			}
		});

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

<style>
.btncommon {
	border-radius: 20px;
}

.commloc {
	margin-left: 5%;
	margin-top: 2%;
}

.feedlist {
	list-style: none;
}

.f-color {
	color: #E2E2E2;
}
</style>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />

	<div class="community-layout mx-auto" style="width: 70%; height: 100%;">
		<div class="ms-5 mt-5">
			<h2>
				<b>커뮤니티</b>
			</h2>
		</div>
		<div class="btn-catelocat">
			<button type="button"
				class="btn btn-outline-dark ms-5 mt-4 btncommon categoryBtn"
				data-bs-toggle="modal" data-bs-target="#exampleModal">카테고리
				<i class="bi bi-caret-down"></i></button>
			<button type="button"
				class="btn btn-outline-dark ms-2 mt-4 btncommon locationBtn"
				data-bs-toggle="modal" data-bs-target="#locationModal">지역 <i class="bi bi-caret-down"></i></button>
			<button type="button" class="btn button-custom mt-4 me-5"
				onclick="location.href='${root}/board/post'" style="float: right; color: white;">
				글쓰기 <img src="../image/pen2.png" style="width: 18px;">
			</button>
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
						<button type="button" class="btn btn-primary" id="selectCategoryBtn">선택</button>
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

	</div>

	<article class="community-feed-list mx-auto" style="width: 70%; height: 100%;">
		<ul class="list-group list-group-flush commloc">
			<li class="list-group-item feedlist"><a href="#" style="text-decoration: none; color: black;"> </a>
				<div id="feed">
					<a href="detail-commnuity.jsp" style="text-decoration: none; color: black;"> </a>
						<div class="feed-container">
							
							<c:forEach var="obj" items="${postList }">
							
								<button style="background-color: #fff; border: none; width: 100%;" onclick="location.href='${root}/board/detailCommunity?board_id=${obj.board_id }'">
									<div class="card" style="border:none;">
										<div class="cardInfo" style="display: flex; justify-content: left;">
											<div class="f-color">${obj.category } &nbsp;•&nbsp; ${obj.location }</div><br/>
										</div>
										<div class="cardContent" style="display: flex; flex-direction: row; justify-content: space-between;">
											<div>
												<div class="title">${obj.title }</div>
												<div class="content">${obj.content }</div>
											</div>
											<div>
												<c:if test="${obj.photos != null}">
													<c:forEach var="photo" items="${fn:split(obj.photos, ',')}" varStatus="loop">
														<c:if test="${loop.index == 0}">
        													<img src="${root}/upload/${photo}" class="feed-img" style="width: 100px; height: 100px; border-radius: 8px;" alt="이미지">
    													</c:if>
													</c:forEach>
												</c:if>
												
												
												<!-- 후에 DB에 이미지 저장 후 변경 -->
											</div>
										</div>
										<div class="cardBasicInfo" style="display: flex; flex-direction: row; justify-content: space-between;">
											<div class="viewInfo" style="display: flex; flex-direction: row">
												<div class="f-color" style="display:flex; flex-direction: row; align-items: center;"><i class="bi bi-chat-left-text-fill" style="margin-right: 5px; margin-top: 1px;"></i><div>댓글 수 ${obj.commentCnt }</div></div>
												<div class="f-color" style="margin-left: 20px;"><i class="bi bi-eye-fill" style="margin-right: 5px;"></i>조회수 ${obj.viewCnt }</div>
											</div>
											<div class="timeInfo">
												<div class="f-color time" >${obj.board_date }</div>
											</div>
										</div>
										<hr>
									</div>
									
								</button>
							
							</c:forEach>
						
						</div>
				</div>
			</li>
		</ul>
	</article>


	<c:import url="/WEB-INF/views/include/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var timeElements = document.querySelectorAll('.time');

        timeElements.forEach(function (timeElement) {
            var boardDate = moment(timeElement.textContent);
            var now = moment(); // 현재 시간
            var diffInMinutes = now.diff(boardDate, 'minutes');
            var diffInHours = now.diff(boardDate, 'hours');
			var diffInDays = now.diff(boardDate, 'days');
			
            var relativeTime;
            if (diffInMinutes < 1) {
                relativeTime = '방금 전';
            } else if (diffInHours < 1) {
                relativeTime = diffInMinutes + '분 전';
            } else if (diffInHours < 24) {
                relativeTime = diffInHours + '시간 전';
            } else if (diffInDays < 7) {
                relativeTime = diffInDays + '일 전';
            } else {
                relativeTime = boardDate.format('YYYY-MM-DD');
            }

            timeElement.textContent = relativeTime;
        });
    });
</script>

</body>

</html>