<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chatting</title>
<script ="${root}/script/jquery-3.4.1.min.js"></script>
<!-- Bootstrap JavaScript 파일 로드 -->
</head>
<style>
body {
	height: 100%;
}

.chatTitle {
	display: flex;
	justify-content: space-between;
}

.dropdown-toggle[data-bs-toggle="dropdown"]::after {
	display: none;
	content: none !important;
}

/* .dropdown-item.active, .dropdown-item:active에 배경색을 적용하는 경우 */
.dropdown-item.active, .dropdown-item:active {
	background-color: #6387A6 !important;
}

.dropdown-toggle:focus {
	box-shadow: none !important;
	outline: none !important;
}

.krw {
	display: flex;
	flex-direction: row;
	align-items: center;
}

.krwIcon {
	display: flex;
	justify-content: center;
	align-items: center;
}

.proChat {
	display: flex;
}

.userChat {
	display: flex;
}

.Content {
	display: flex;
}

.serviceInfo {
	display: flex;
	justify-content: space-between;
}

.serviceCost {
	display: flex;
	justify-content: space-between;
}

.dropdown-btn {
	border: none;
	background-color: #fff;;
}

.dropdown-btn {
	border: none;
	background: none;
	padding: 5px;
	cursor: pointer;
}

.dropdown-btn:hover {
	background-color: #6387A6;
	color: white;
}

.textBar {
	display: flex;
	justify-content: space-around;
	align-items: center;
	position: sticky;
	bottom: 0;
	background-color: #fff;
	padding: 10px;
}

.chatting {
	background-color: #F2F2F2;
	border-radius: 10px;
	height: calc(100% - 50px); /* Adjust the height as needed */
	overflow-y: auto; /* Add scroll if needed */
	margin-top: 2%;
}

textarea {
	border: 1px solid #B5B5B5;
	border-radius: 40px;
	width: calc(100% - 140px); /* Adjust the width as needed */
	height: 32px;
	resize: vertical;
	padding-left: 30px;
	padding-right: 30px;
}

.requestItem {
	margin-bottom: 30px;
}

.question {
	font-size: 14px;
	color: #737373;
}

.answer {
	font-size: 16px;
	color: #323232;
}

.modal-content {
	padding: 15px;
}

.modal-header {
	padding-bottom: 0;
}

.info2 {
	border-radius: 10px;
	background-color: #F2F2F2;
	display: flex;
	justify-content: center;
	align-items: center;;
}

.info4 {
	border-radius: 10px;
	background-color: #F2F2F2;
	display: flex;
	justify-content: center;
	align-items: center;;
}

.form-check-input:checked {
	background-color: #6387A6 !important; /* !important를 추가하여 우선순위를 높임 */
	border-color: #6387A6 !important;
	color: white !important;
	outline: none;
}
</style>

<script>
	var $j = jQuery.noConflict();
	$j(document).ready(function() {
		$j(".header").load("header.html");
	});
</script>

<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5" style="height: 76vh;">
		<div class="row justify-content-center" style="height: 76vh;">
			<div class="col-md-10">
				<div class="chatTitle">
					<div class="chat_pro">
						<button style="border: none; background-color: #fff;"
							onclick="moveToChattingList()">
							<i class="bi bi-arrow-left-short" style="font-size: 30px;"></i>
						</button>
						<strong style="font-size: 25px;">한유정 일류님</strong>
					</div>
					<div
						style="display: flex; justify-content: center; align-items: center;">
						<div
							style="display: flex; justify-content: center; align-items: center">
							<button
								style="font-size: 14px; border: 1px solid #6387A6; color: #6387A6; background-color: #fff; border-radius: 10px; height: max-content"
								onclick="moveToReviewWrite()">리뷰 작성</button>
						</div>

						<button class="btn btn-secondary dropdown-toggle" type="button"
							data-bs-toggle="dropdown" aria-expanded="false"
							style="background-color: #fff; border: none;">
							<i class="bi bi-three-dots-vertical" style="color: black;"></i>
						</button>
						<ul class="dropdown-menu" style="padding: 5px 0px;">
							<li><button class="dropdown-btn" id="requestBtn">내가
									보낸 요청서 보기</button></li>
							<li><button class="dropdown-btn" id="declareBtn"
									style="width: 100%;">신고하기</button></li>
							<li><button class="dropdown-btn" id="blockBtn"
									style="width: 100%;">차단하기</button></li>
							<li><button class="dropdown-btn" id="roomoutBtn"
									style="width: 100%;">채팅방 나가기</button></li>
						</ul>

					</div>
				</div>

				<div class="chatting"
					style="background-color: #F2F2F2; border-radius: 10px; height: 69vh; margin-top: 2%;">
					<div class="chatDate"
						style="color: #737373; font-size: 12px; display: flex; padding: 2%; justify-content: center;">2023년
						12월 25일 월요일</div>
					<div class="proChat"
						style="padding-left: 3%; padding-top: 2%; padding-bottom: 2%;">
						<img ="../image/1.png"
							style="width: 31px; height: 31px; border-radius: 50%; margin-right: 1.5%;">
						<div class="Content">
							<div style="display: flex; position: relative;">
								<div class="Text"
									style="border-radius: 10px; background-color: #fff; padding: 20px;">
									<div class="krw" style="width: 110%;">
										<div class="krwIcon"
											style="border: 1px solid gray; border-radius: 5px; height: 20px; width: 20px; margin-right: 7px; font-size: 14px;">₩</div>
										<div style="font-size: 16px;">
											<strong>견적서</strong>
										</div>
									</div>
									<div class="subTitle" style="font-size: 14px;">
										OOO 고객님 안녕하세요.<br>요청서에 따른 예상금액입니다.
									</div>
									<hr>
									<div class="serviceInfo">
										<label style="font-size: 14px;">서비스</label> <span
											style="font-size: 14px;">성인 상담</span>
									</div>
									<div class="serviceCost">
										<label style="font-size: 14px;">예상 금액</label> <span
											style="font-size: 14px;"><strong>총 50,000원</strong></span>
									</div>
									<hr>
									<div class="guide" style="display: flex;">
										<i class="bi bi-chat-left-dots" style="margin-right: 7px;"></i>
										<span style="font-size: 14px;">견적금액에 대해 궁금한 점을<br>채팅으로
											물어보세요.
										</span>
									</div>
									<div class="d-grid gap-2 col-10 mx-auto">
										<button class="btn btn-primary" type="button"
											style="font-size: 14px; background-color: #6387A6; border: 1px solid #6387A6; margin-top: 16px;">고수
											프로필 보기</button>
									</div>
								</div>
								<div class="chatTime"
									style="font-size: 10px; color: #B9B9B9; position: absolute; bottom: 0; right: -46px;">
									오전 8:02</div>
							</div>
						</div>
					</div>


					<div class="userChat"
						style="padding-right: 3%; padding-top: 2%; padding-bottom: 2%; display: flex; justify-content: flex-end;">
						<div class="Content">
							<div style="display: flex; position: relative;">
								<div style="position: absolute; bottom: 0; left: -46px;">
									<div class="readStatus"
										style="font-size: 10px; color: #B9B9B9;">안 읽음</div>
									<div class="chatTime" style="font-size: 10px; color: #B9B9B9;">
										오전 8:02</div>
								</div>
								<div class="Text"
									style="border-radius: 10px; background-color: #D9E8F5; padding: 10px;">
									안녕하세요.</div>
							</div>
						</div>
						<img ="../image/1.png"
							style="width: 31px; height: 31px; border-radius: 50%; margin-left: 1.5%;">
					</div>

					<div class="proChat"
						style="padding-left: 3%; padding-top: 2%; padding-bottom: 2%;">
						<img ="../image/1.png"
							style="width: 31px; height: 31px; border-radius: 50%; margin-right: 1.5%;">
						<div class="Content">
							<div style="display: flex; position: relative;">
								<div class="Text"
									style="border-radius: 10px; background-color: #fff; padding: 20px;">
									<div class="krw" style="width: 110%;">
										<div class="krwIcon"
											style="border: 1px solid gray; border-radius: 5px; height: 20px; width: 20px; margin-right: 7px; font-size: 14px;">₩</div>
										<div style="font-size: 16px;">
											<strong>견적서</strong>
										</div>
									</div>
									<div class="subTitle" style="font-size: 14px;">
										OOO 고객님 안녕하세요.<br>요청서에 따른 예상금액입니다.
									</div>
									<hr>
									<div class="serviceInfo">
										<label style="font-size: 14px;">서비스</label> <span
											style="font-size: 14px;">성인 상담</span>
									</div>
									<div class="serviceCost">
										<label style="font-size: 14px;">예상 금액</label> <span
											style="font-size: 14px;"><strong>총 50,000원</strong></span>
									</div>
									<hr>
									<div class="guide" style="display: flex;">
										<i class="bi bi-chat-left-dots" style="margin-right: 7px;"></i>
										<span style="font-size: 14px;">견적금액에 대해 궁금한 점을<br>채팅으로
											물어보세요.
										</span>
									</div>
									<div class="d-grid gap-2 col-10 mx-auto">
										<button class="btn btn-primary" type="button"
											style="font-size: 14px; background-color: #6387A6; border: 1px solid #6387A6; margin-top: 16px;">고수
											프로필 보기</button>
									</div>
								</div>
								<div class="chatTime"
									style="font-size: 10px; color: #B9B9B9; position: absolute; bottom: 0; right: -46px;">
									오전 8:02</div>
							</div>
						</div>
					</div>

					<div class="proChat"
						style="padding-left: 3%; padding-top: 2%; padding-bottom: 2%;">
						<img ="../image/1.png"
							style="width: 31px; height: 31px; border-radius: 50%; margin-right: 1.5%;">
						<div class="Content">
							<div style="display: flex; position: relative;">
								<div class="Text"
									style="border-radius: 10px; background-color: #fff; padding: 20px;">
									<div class="krw" style="width: 110%;">
										<div class="krwIcon"
											style="border: 1px solid gray; border-radius: 5px; height: 20px; width: 20px; margin-right: 7px; font-size: 14px;">₩</div>
										<div style="font-size: 16px;">
											<strong>견적서</strong>
										</div>
									</div>
									<div class="subTitle" style="font-size: 14px;">
										OOO 고객님 안녕하세요.<br>요청서에 따른 예상금액입니다.
									</div>
									<hr>
									<div class="serviceInfo">
										<label style="font-size: 14px;">서비스</label> <span
											style="font-size: 14px;">성인 상담</span>
									</div>
									<div class="serviceCost">
										<label style="font-size: 14px;">예상 금액</label> <span
											style="font-size: 14px;"><strong>총 50,000원</strong></span>
									</div>
									<hr>
									<div class="guide" style="display: flex;">
										<i class="bi bi-chat-left-dots" style="margin-right: 7px;"></i>
										<span style="font-size: 14px;">견적금액에 대해 궁금한 점을<br>채팅으로
											물어보세요.
										</span>
									</div>
									<div class="d-grid gap-2 col-10 mx-auto">
										<button class="btn btn-primary" type="button"
											style="font-size: 14px; background-color: #6387A6; border: 1px solid #6387A6; margin-top: 16px;">고수
											프로필 보기</button>
									</div>
								</div>
								<div class="chatTime"
									style="font-size: 10px; color: #B9B9B9; position: absolute; bottom: 0; right: -46px;">
									오전 8:02</div>
							</div>
						</div>
					</div>

				</div>
				<div class="textBar">
					<button style="border: none; background-color: #fff;"
						onclick="openImageUploader()">
						<i class="bi bi-image" style="font-size: 25px;"></i>
					</button>
					<div class="bar" style="padding-left: 10px; padding-right: 10px;">
						<textarea
							style="border: 1px solid #B5B5B5; border-radius: 40px; width: 48vw; height: 32px; resize: vertical; padding-left: 30px; padding-right: 30px;"></textarea>
					</div>
					<button style="border: none; background-color: #fff;">
						<i class="bi bi-arrow-up-circle" style="font-size: 25px;"></i>
					</button>
				</div>

			</div>
		</div>
	</div>

	<!-- Modal: 내가 보낸 요청서 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body" style="padding-top: 0;">
					<div class="modal-Title">
						<h5 class="modal-title" id="exampleModalLabel"
							style="margin-bottom: 25px;">
							<strong>내 요청서</strong>
						</h5>
					</div>
					<div class="requestItem">
						<div class="question">질문1</div>
						<div class="answer">답1</div>
					</div>
					<div class="requestItem">
						<div class="question">질문2</div>
						<div class="answer">답2</div>
					</div>
					<div class="requestItem">
						<div class="question">질문3</div>
						<div class="answer">답3</div>
					</div>
					<div class="requestItem">
						<div class="question">질문4</div>
						<div class="answer">답4</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- Modal: 신고하기 -->
	<div class="modal fade" id="exampleModal2" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header" style="border: none;">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body" style="padding-top: 0;">
					<div class="modal-Title">
						<h5 class="modal-title" id="exampleModalLabel"
							style="margin-bottom: 25px;">
							<strong>신고하기</strong>
						</h5>
					</div>
					<div class="info2" style="padding: 15px">
						<i class="bi bi-info-circle-fill" style="padding-right: 20px;"></i>
						<span>신고하기 사유 확인이 불가할 경우 해당 신고건은<br>미조치됩니다.
						</span>
					</div>
					<div>
						<div class="form-check" style="margin-top: 16px;">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault1"> <label
								class="form-check-label" for="flexRadioDefault1"> 서비스와
								관련없는 광고 / 홍보 </label>
						</div>
						<hr>
						<div class="form-check"
							style="margin-top: 16px; margin-bottom: 16px;">
							<input class="form-check-input" type="radio"
								name="flexRadioDefault" id="flexRadioDefault2"> <label
								class="form-check-label" for="flexRadioDefault2"> 부적절한
								언어(욕설 / 성희롱 등) 사용 </label>
						</div>
						<div style="font-size: 14px; color: #737373; margin-bottom: 16px;">
							서비스 진행중 문제가 생겼다면 증빙자료(대화내역, 문자메세지, 녹취, 사진 등)와 함께 아숨 이메일
							@example.com으로 접수해 주세요. <br>신고 결과는 별도 안내되지 않습니다.
						</div>
					</div>
					<div class="d-grid gap-2 col-12 mx-auto">
						<button class="btn btn-primary" id="reportButton" type="button"
							style="background-color: #B5B5B5; border: 1px solid #B5B5B5;">신고하기</button>
					</div>

				</div>

			</div>
		</div>
	</div>

	<!-- Modal: 차단하기 -->
	<div class="modal fade" id="exampleModal3" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 85%;">
				<div class="modal-header" style="border: none;">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body" style="padding-top: 0;">
					<div class="modal-Title">
						<h5 class="modal-title" id="exampleModalLabel"
							style="margin-bottom: 25px;">
							<strong>차단하기</strong>
						</h5>
					</div>
					<div class="info4" style="padding: 15px; margin-bottom: 16px;">
						<i class="bi bi-info-circle-fill" style="padding-right: 20px;"></i>
						<span>차단하면 일류님이 보내는 메세지를<br> 받을 수 없습니다.<br>(차단
							여부는 상대방이 알 수 없습니다.)
						</span>
					</div>

					<div class="d-grid gap-2 col-12 mx-auto">
						<button class="btn btn-primary" id="reportButton" type="button"
							style="background-color: #6387A6; border: 1px solid #6387A6;">차단하기</button>
					</div>

				</div>

			</div>
		</div>
	</div>

	<!-- Modal: 채팅방 나가기 -->
	<div class="modal fade" id="exampleModal4" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: 70%;">
				<div class="modal-header" style="border: none;">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body" style="padding-top: 0;">
					<div class="modal-Title">
						<h5 class="modal-title" id="exampleModalLabel"
							style="margin-bottom: 25px; display: flex; justify-content: center;">
							<strong>채팅방을 나가시겠어요?</strong>
						</h5>
					</div>
					<div class="info"
						style="font-size: 14px; display: flex; justify-content: center; padding-bottom: 16px;">
						<span>채팅방을 나가면 더 이상 리뷰를 작성할 수 없으며, 대화 내용이 삭제되고 채팅 목록에서도
							사라집니다.</span>
					</div>

					<div class="d-grid gap-2 col-12 mx-auto">
						<button class="btn btn-primary" id="reportButtonOut" type="button"
							style="background-color: #6387A6; border: 1px solid #6387A6;">채팅방
							나가기</button>
						<button class="btn btn-primary" id="reportButtonCancel"
							type="button"
							style="background-color: #fff; border: 1px solid #6387A6; color: black;">취소</button>
					</div>

				</div>

			</div>
		</div>
	</div>



	<script type="text/javascript">
		function moveToReviewWrite() {
			window.location.href = './ReviewWrite.html';
		}

		// 드롭다운 메뉴 아이템을 클릭했을 때 스크롤 이동 방지
		$j('.dropdown-menu a').on('click', function(e) {

			e.preventDefault(); //기본 이벤트 막기
			var selectedText = $(this).text();
			$('.btn-secondary').text(selectedText);

			changeColor(this);
		});

		$j(document).ready(function() {
			$j('#requestBtn').click(function(e) {
				e.preventDefault();
				$j('#exampleModal1').modal("show");
			});

			$j('#declareBtn').click(function(e) {
				e.preventDefault();
				$j('#exampleModal2').modal("show");
			});

			$j('#blockBtn').click(function(e) {
				e.preventDefault();
				$j('#exampleModal3').modal("show");
			});

			$j('#roomoutBtn').click(function(e) {
				e.preventDefault();
				$j('#exampleModal4').modal("show");
			});

			$j('#reportButtonCancel').click(function() {
				$j('#exampleModal4').modal('hide');
			});
		});

		document.addEventListener('DOMContentLoaded', function() {
			var radioButtons = document.querySelectorAll('.form-check-input');
			var reportButton = document.getElementById('reportButton');

			radioButtons.forEach(function(radioButton) {
				radioButton.addEventListener('change', function() {
					if (this.checked) {
						// 라디오 버튼이 선택되면 버튼의 스타일 변경
						reportButton.style.backgroundColor = '#6387A6';
						reportButton.style.borderColor = '#6387A6';
					} else {
						// 라디오 버튼이 선택되지 않았을 때 버튼의 스타일 초기화
						reportButton.style.backgroundColor = '#B5B5B5';
						reportButton.style.borderColor = '#B5B5B5';
					}
				});
			});
		});

		function openImageUploader() {
			// 파일 업로드 창
			var fileInput = document.createElement('input');
			fileInput.type = 'file';
			fileInput.accept = 'image/*';
			fileInput.click();

			// 파일이 선택되면 해당 파일을 처리하는 함수를 호출
			fileInput.addEventListener('change', function() {
				handleFileUpload(fileInput.files[0]);
			});
		}

		function handleFileUpload(file) {
			// 파일 업로드를 처리 부분
			console.log('Selected file:', file);
		}

		function moveToChattingList() {
			window.location.href = '${root}/ChattingList.html';
		}
	</script>
</body>
</html>