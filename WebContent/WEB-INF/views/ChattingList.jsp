<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chatting List</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>
<script src="${root}/jquery/alarm.js"></script>
<style>
.account {
	display: flex;
	justify-content: space-between;
}

.chats {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: row;
}

.chat {
	border: none;
	background-color: #fff;
}

.provider_profile {
	display: flex;
	flex-direction: row;
}

.chat_content {
	display: flex;
	flex-direction: row;
}

.chatInfo {
	display: flex;
	flex-direction: row;
}

.provider_profileInfo {
	display: flex;
	flex-direction: row;
}

.provider_profile {
	display: flex;
	justify-content: space-between;
}

.chat_content {
	display: flex;
	justify-content: space-between;
}

.krw {
	display: flex;
	flex-direction: row;
}

.krwIcon {
	display: flex;
	justify-content: center;
	align-items: center;
}

.chatInfo {
	display: flex;
	justify-content: space-between;
}

.form-check-input:checked {
	background-color: #6387A6 !important;
	border-color: #6387A6 !important;
	color: white !important;
	outline: none;
}

.notification-badge {
	position: relative;
	top: 10px;
	background-color: red;
	color: white;
	border-radius: 50%;
	width: 24px; /* 너비를 조금 더 늘림 */
	height: 24px; /* 높이를 조금 더 늘림 */
	text-align: center;
	line-height: 24px; /* 높이에 맞춰 line-height 조정 */
	padding: 0; /* 패딩을 0으로 설정 */
	font-size: 12px;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden; /* 내용이 원을 넘어갈 경우 숨김 처리 */
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="col-md-10">
				<div class="account">
					<strong style="font-size: 25px;">채팅</strong>
					<div
						style="display: flex; justify-content: center; align-items: center">
						<button
							style="font-size: 14px; border: 1px solid #6387A6; color: #6387A6; background-color: #fff; border-radius: 10px; height: max-content"
							onclick="moveToEditChattingList()">채팅방 편집</button>
					</div>
				</div>
				<c:forEach items="${chatrooms}" var="chatroom">
					<c:choose>
						<c:when
							test="${loginProuserBean.prouserLogin ==false && loginUserBean.userLogin ==true }">
							<div class="chats"
								style="border: 1px solid rgb(242, 242, 242); border-radius: 10px; margin-top: 2%;">
								<button class="chat" style="width: 95%;"
									onclick="location.href='${root}/chatting?pro_id=${chatroom.pro_id}&pro_name=${chatroom.pro_name}'">

									<div class="provider_profile"
										style="width: 100%; padding-top: 20px; margin-bottom: 16px;">
										<div class="provider_profileInfo">
											<img
												src="${chatroom.pro_profile_image}"
												style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 6%">
											<div class="profileInfo" style="margin-top: 2.5%;">
												<div class="provider_name"
													style="font-size: 16px; width: max-content;">
													<strong>${chatroom.pro_name} 일류님</strong>
												</div>
												<div class="service_name"
													style="font-size: 14px; width: max-content; color: #737373;">스포츠지도사준비</div>
											</div>
										</div>
									</div>

									<div class="chat_content">
										<div id="latestMessage"
											style="margin-top: 10px; margin-left: 60px;"></div>
										<span id="notificationBadge" class="notification-badge"
											style="display: none;">0</span>
									</div>
									<br />

									<hr
										style="margin-top: -1%; margin-bottom: 1%; border: 1px solid #B5B5B5;">

									<div class="chatInfo" style="padding-bottom: 20px;">

										<div class="date"
											style="font-size: 14px; color: #B5B5B5; float: right; text-align: right;">
											2023. 11. 23</div>
									</div>
								</button>
							</div>


						</c:when>
						<c:when
							test="${loginProuserBean.prouserLogin ==true && loginUserBean.userLogin ==false }">
							<div class="chats"
								style="border: 1px solid rgb(242, 242, 242); border-radius: 10px; margin-top: 2%;">
								<button class="chat" style="width: 95%;"
									onclick="location.href='${root}/chatting?pro_id=${loginProuserBean.getPro_id()}&user_name=${chatroom.user_name}'">

									<div class="provider_profile"
										style="width: 100%; padding-top: 20px; margin-bottom: 16px;">
										<div class="provider_profileInfo">
											<img
												src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzAxMTNfMTYg%2FMDAxNDg0MzAzOTA1MTg1.TRlCX9BAB8SOS_N6h6Yae7HebZk3TqumpSiioMVXrZYg.B4qvWlNfqzKpwnBNtFigy5dsXnIHjzOIhCTDkXNiN0Ag.JPEG.koomarin%2F2017-01-13_19%253B24%253B37.jpg&type=sc960_832"
												style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 6%">
											<div class="profileInfo" style="margin-top: 2.5%;">
												<div class="provider_name"
													style="font-size: 16px; width: max-content;">
													<strong>${chatroom.user_name} 회원님</strong>
												</div>
												<div class="service_name"
													style="font-size: 14px; width: max-content; color: #737373;">스포츠지도사준비</div>
											</div>
										</div>
									</div>

									<div class="chat_content">
										<div id="latestMessage"
											style="margin-top: 10px; margin-left: 60px;"></div>
										<span id="notificationBadge" class="notification-badge"
											style="display: none;">0</span>
									</div>
									<br />

									<hr
										style="margin-top: -1%; margin-bottom: 1%; border: 1px solid #B5B5B5;">

									<div class="chatInfo" style="padding-bottom: 20px;">

										<div class="date"
											style="font-size: 14px; color: #B5B5B5; float: right; text-align: right;">
											2023. 11. 23</div>
									</div>
								</button>
							</div>
						</c:when>

					</c:choose>
				</c:forEach>



			</div>
		</div>
	</div>

	<script type="text/javascript">
		function moveToEditChattingList() {
			window.location.href = '${root}/EditChattingList.html';
		}

		function moveToChatting() {
			window.location.href = '${root}/Chatting';
		}
	</script>

	<script>
		var stompClient = null;

		function connect() {
			var socket = new SockJS('/ws');
			stompClient = Stomp.over(socket);

			stompClient.connect({}, function(frame) {
				console.log('Connected: ' + frame);

				// /topic/notifications 주제 구독
				stompClient.subscribe('/topic/notifications', function(
						notification) {
					// 알림 뱃지 표시
					showNotificationBadge();
					//alert("새로운 알림 : " + notification.body);
					showLatestMessage(notification.body);
				});
			});
		}

		function showNotificationBadge() {
			var notificationBadge = document
					.getElementById('notificationBadge');
			if (notificationBadge) {
				var currentCount = parseInt(notificationBadge.innerText) || 0;
				notificationBadge.innerText = currentCount + 1; // 새 메시지 수 증가
				notificationBadge.style.display = 'inline'; // 뱃지 표시
			}
		}

		function showLatestMessage(message) {
			var latestMessageElement = document.getElementById('latestMessage');
			if (latestMessageElement) {
				// 메시지 길이가 20글자 이상이면 앞의 20글자만 표시하고 "..." 추가
				var displayText = message.length > 20 ? message
						.substring(0, 20)
						+ "..." : message;
				latestMessageElement.innerText = displayText; // displayText 변수를 사용하여 화면에 표시
			}
		}

		// 페이지 로드 시 연결
		window.onload = function() {
			connect();
		};
	</script>

	<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
