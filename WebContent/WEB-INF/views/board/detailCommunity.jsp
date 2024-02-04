<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 글 페이지</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>
	$(function() {
		
		$(".co-comment").click(function() {
			// 현재 클릭된 대댓글 부모 요소에 대해서만 가시성 토글
			$(this).closest('.parent-comment').find('.sho-comm').toggle();
		});

	});
</script>

<style>
.t-color {
	color: #B8B2B2;
}

.bi-three-dots-vertical {
	font-size: 30px;
	float: right;
}

.pageBtn {
	background-color: #fff; 
	border: 1px solid #B8B2B2; 
	border-radius: 8px; 
	color: #B8B2B2; 
	font-size: 14px;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5" style="width: 60%;">
		<div class="post-header mt-5">
			<div class="category t-color">${readPostBean.category }</div>
			<div class="post-title">
				<h2>${readPostBean.title }</h2>
				<!-- 제목 -->
			</div>
			<div class="post-location t-color">${readPostBean.location }</div>
			
			<div class="writeTop">
				<div class="writeTopfirst">
					<div class="writer" style="display: flex; justify-content: space-between;">
						<div style="display:flex; flex-direction: row;">
							<img src="../image/profile.png" style="width: 45px; margin-right: 10px;">
							<div class="writerInfo" style="display: flex; flex-direction: column">
								<span>${readPostBean.writer_name }</span>
								<div class="time">${readPostBean.board_date }</div>  <!-- 조회수도 같이 하기 --설에 -->
							</div>
						</div>
						<div>
							<i class="bi bi-three-dots-vertical" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown"></i>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								<li>
									<a class="dropdown-item" type="button" class="btn btn-primary" data-bs-toggle="modal"
										data-bs-target="#exampleModal">게시글 신고</a>
							 	</li>
							</ul>
						</div>
						
					</div>
				</div> 
				<div class="writeTopSecond" style="width: 100%; display:flex; justify-content: flex-end;">
					
					<c:if test="${loginUserBean.user_id == readPostBean.user_id }"> <!-- Prouser도 해야 함 -->
						<button class="pageBtn" onclick="location.href='${root}/board/modifyPost?board_id=${board_id}'" style="margin-right: 8px";>수정</button>
						<button class="pageBtn" onclick="location.href='${root}/board/delete?board_id=${board_id}'" style="margin-right: 8px;">삭제</button>
					</c:if>
					
					<button class="pageBtn" onclick="location.href='${root}/board/community'">목록</button>
				</div>
			</div>
			<hr/>
		</div>
		<div class="post-body-container">
			<span>${readPostBean.content }</span>
				<c:if test="${readPostBean.photos != null }">
					<div id="categoryphoto" class="carousel slide mt-4"style="width: 100%; margin: auto;">
					<!-- 캐러셀 부분-->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img src="https://static.cdn.soomgo.com/upload/media/82bd5b5f-e1bb-4fae-9f81-fb0c9c30c551.jpg?webp=1" class="d-block w-100"
									style="height: 500px;" alt="pic">
							</div>
							<div class="carousel-item">
								<img src="../image/2.png" class="d-block w-100"
									style="height: 500px;" alt="pic1">
							</div>
							<div class="carousel-item">
								<img src="../image/hobby.png" class="d-block w-100"
									style="height: 500px;" alt="p">
							</div>
						</div>
						
						<button class="carousel-control-prev" type="button" data-bs-target="#categoryphoto" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#categoryphoto" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
		
				</c:if>
				
			</div>
			<hr/>
				
		<div class="post-comment-count mt-4">
			<i class="bi bi-chat-right-text"> 댓글 3</i>
		</div>
		<!-- 댓글작성 -->
		<div class="post-comments-container">
			<div class="comment-input-box input-group mb-3 mt-4">
				<input type="text" class="form-control" placeholder="댓글을 남겨주세요"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button"
					id="button-addon2">등록</button>
			</div>

			<!-- 등록된 댓글1 -->
			<ul class="post-comments list-group">
				<li class="list-group-item">
					<div class="row justify-content-between">
						<div class="col-5">
							<div class="row">
								<div class="col-2">
									<img src="../image/profile.png" style="width: 45px;">
								</div>
								<div class="col-10">
									<span>으녕</span>
									<p>
										<span class="t-color">인테리어 외 5개 서비스 고수</span>
								</div>
							</div>
						</div>
						<div class="col-5 ms-5">
							<i class="bi bi-three-dots-vertical" id="navbarDropdownMenuLink"
								role="button" data-bs-toggle="dropdown"></i>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" type="button"
									class="btn btn-primary" data-bs-toggle="modal"
									data-bs-target="#exampleModal">댓글신고</a></li>
							</ul>

							<!-- 신고모달 -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="exampleModalLabel">신고하기</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<div class="singo form-floating">
												<textarea class="form-control" placeholder="상세사유를 입력해 주세요"
													id="floatingTextarea2" style="height: 300px"></textarea>

											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">취소</button>
											<button type="button" class="btn btn-primary">신고하기</button>
										</div>
									</div>
								</div>
							</div>
							<button class="btn button-custom ms-2 mt-1"
								style="color: white; float: right;">견적요청</button>
						</div>
					</div>
					<div class="comments ">
						<div class="detail-comments mx-auto" style="width: 85%;">
							<p>일단 대충 000만원 나오지 않을까 생각 듭니다 !해당 전문일류님과 연결되길바랍니다. 도배분야로 견적요청
								넣어보세요!</p>
						</div>
						<div class="comment-action-group t-color">

							<span>6시간전</span> &nbsp; 
							<!-- <span class="parent-comment"> 
								<span class="co-comment" style="cursor: pointer;">대댓글</span> 대댓글 클릭시 보이는 부분
								
									<input type="text" class="form-control" placeholder="댓글을 남겨주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
									<button class="btn btn-outline-secondary" type="button" id="button-addon2">등록</button>
								
							</span> -->
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
<c:import url="/WEB-INF/views/include/footer.jsp" />

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var timeElements = document.querySelectorAll('.time');

        timeElements.forEach(function (timeElement) {
            var boardDate = moment(timeElement.textContent);
            var now = moment(); // 현재 시간
            var diffInMinutes = now.diff(boardDate, 'minutes');
            var diffInHours = now.diff(boardDate, 'hours');

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