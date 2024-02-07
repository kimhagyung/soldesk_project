<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->

<script src="${root}/script/jquery-3.4.1.min.js"></script>
<!-- jQuery UI 라이브러리 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />

<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!--메모  -->


<script>
	$(function() {
		
	})

	var jq = $.noConflict();
</script>
<style>
/* body 스타일 */
html, body {
	font-size: 14px;
	overflow-y: auto;
}

/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

/* 모달 스타일 */
#customModal {
	display: none;
	max-width: 500px; /* 모달 최대 너비 설정 */
	background-color: white;
}

.fc-col-header-cell-cushion {
	color: black;
	text-decoration: none;
}

.fc-daygrid-day-number {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>


	<!-- calendar 태그 -->

	<c:import url="/WEB-INF/views/include/header.jsp" />
	<div class="container mt-5">
		<div id='calendar'></div>
	</div>
	<c:import url="/WEB-INF/views/include/footer.jsp" />




	<!--모달-->
	<div id="customModal" title="일정추가"
		style="display: none; width: auto; max-width: 100%;">
		<label for="eventTitle"
			style="display: block; margin-bottom: 5px; font-size: 18px;">일정을
			추가하세요</label>
		<textarea type="text" id="eventTitle"
			style="width: 100%; height: 300px; padding: 5px; margin-bottom: 10px; box-sizing: border-box; font-size: 18px;"></textarea>
	</div>


	<script>
		jq(function() {
			// calendar element 취득
			var calendarEl = jq('#calendar')[0];
			// full-calendar 생성하기
			var calendar = new FullCalendar.Calendar(calendarEl, {
				height : '700px', // calendar 높이 설정
				expandRows : true, // 화면에 맞게 높이 재설정
				slotMinTime : '00:00', // Day 캘린더에서 시작 시간
				slotMaxTime : '24:00', // Day 캘린더에서 종료 시간
				// 해더에 표시할 툴바
				headerToolbar : {
					left : 'prev,next today',
					center : 'title',
					right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
				},
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				// 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
				editable : true, // 수정 가능?
				selectable : true, // 달력 일자 드래그 설정가능
				nowIndicator : true, // 현재 시간 마크
				dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
				locale : 'ko', // 한국어 설정

				select : function(arg) {
					// 드래그로 이벤트를 생성할 때 모달 창 열기
					openCustomModal(arg.start, arg.end, arg.allDay);
				},
				eventClick : function(info) {
					openCustomModal(info.event.start, info.event.end,
							info.event.allDay, info.event.title, info.event);
				},

				eventAdd : function(obj) { // 이벤트가 추가되면 발생하는 이벤트
					console.log(obj);
				},

				eventChange : function(obj) { // 이벤트가 수정되면 발생하는 이벤트
					console.log(obj);
				},

				eventRemove : function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
					console.log(obj);
				},

				// 이벤트 
				events : []
			});

			// 사용자에게 입력을 받을 모달 창을 열기 위한 함수
			function openCustomModal(start, end, allDay, title, event) {
				jq("#eventTitle").val(title || "");
				jq("#customModal").dialog(
						{
							modal : true,
							buttons : {
								"저장" : function() {
									if (event) {
										saveEvent(start, end, allDay, jq(
												"#eventTitle").val(), event);
									} else {
										saveEvent(start, end, allDay, jq(
												"#eventTitle").val());
									}
									jq(this).dialog("close");
								},

								"삭제" : function() {
									removeEvent(event);
									jq(this).dialog("close");
								},
								"취소" : function() {
									jq(this).dialog("close");
								}
							},
							close : function() {
								jq("#eventTitle").val("");
							}
						});
			}

			function saveEvent(start, end, allDay, title, event) {
				if (event) {
					event.setProp('title', title);
					event.setStart(start);
					event.setEnd(end);
					event.setAllDay(allDay);
				} else {
					calendar.addEvent({
						title : title,
						start : start,
						end : end,
						allDay : allDay
					});
				}
				calendar.unselect();
			}

			function removeEvent(event) {
				if (event) {
					event.remove();
				}
				calendar.unselect();
			}

			calendar.render();
		});
	</script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</body>
</html>