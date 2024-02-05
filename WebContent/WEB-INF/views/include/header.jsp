<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>

<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body, div, span, h5, button, h2, ul, li, a {
	font-family: 'GmarketSansMedium' !important;
}

.button-custom {
	background-color: #6387A6;
	/* 사용자 정의 배경색을 지정 */
	color: white;
}

.button-custom:hover {
	background-color: #88a2bf;
	/* 마우스를 올렸을 때 좀 더 밝은 색상으로 변경 */
	color: white;
}

.list-group-item {
	border: none;
	/* 모든 테두리를 제거 */
	border-bottom: 1px solid #dee2e6;
	/* 아래 선만 지정 */
}

.logo {
	width: 80px;
	height: 110px;
}

.navbar-custom {
	background-color: #D9E8F5;
}

.dropdown-toggle-noarrow::after {
	display: none !important;
}
</style>

<script>

// 페이지 로딩 시 알람 목록 가져오기
$(document).ready(function() {
    loadAlarmsForAddedEvents();
    
	  // 알람 클릭 이벤트 핸들러
	 //$("#calendarDropdown .dropdown-menu").on("click", ".dropdown-item", function() {
	  //   console.log("알람이 클릭됐다!"); // 추가된 로그
	
	     // rounded-pill 클래스 제거
	  //   $(".rounded-circle").removeClass("text-danger").hide();
	
	     // 글씨 색상을 노란색으로 변경
	  //   $(this).css({
	  //       "color": "yellow",
	  //       "text-decoration": "line-through"
	  //   });
	
	     // 캘린더로 이동
	  //   window.location.href = "${root}/common/calendar";
	// });
});

function loadAlarmsForAddedEvents() {
    $.ajax({
        type: "GET",
        url: "/Soldesk_Project2_Unicode/common/calendar_alarm",
        //data: {
         //   userId: ${loginUserBean.user_id}
        //},
        success: function(alarms) {
            displayAlarms(alarms);
        },
        error: function(error) {
            console.error("Error loading alarms for added events:", error);
        }
    });
}

function displayAlarms(alarms) {
    // 알람 목록을 드롭다운에 표시
    var dropdown = $("#calendarDropdown .dropdown-menu");
    dropdown.empty();
 	// 콘솔에 현재 로그인한 사용자의 ID 찍어보기
    console.log("Current login user ID:", ${loginUserBean.isUserLogin()});
    console.log("Current login user ProID:", ${loginProuserBean.isProuserLogin()});

    if (alarms.length === 0) {
        dropdown.append('<li><a class="dropdown-item">새로운 알림이 없습니다.</a></li>');
        $(".rounded-circle").hide();
    } else {
        alarms.forEach(function(alarm) {
            // 적절한 알람 메시지를 가져오는 로직으로 변경
            var alarmText = "일정 : " + alarm.calendar_memo;
            dropdown.append('<li><a class="dropdown-item" href="${root}/common/calendar">' + alarmText + '</a></li>');
        });
        // 알림이 있을 경우 알림 아이콘에 빨간 동그라미 표시
        $(".rounded-circle").show();
    }
 	// 평소에는 알림 아이콘 숨기기
   // if (alarms.length === 0) {
       
    //}
 	
 	// 기존의 click 이벤트 핸들러를 off() 메서드를 사용하여 제거
    dropdown.off('click', '.alarm-link');
    // on 메서드를 사용하여 이벤트 핸들러 등록
    dropdown.on('click', '.alarm-link', function () {
        handleAlarmClick(this);
    });

    /* function handleAlarmClick(clickedElement) {
        console.log("알람이 클릭됐다!"); // 추가된 로그
        
        // rounded-pill 클래스 제거
        $(".rounded-circle").removeClass("text-danger").hide();
        
        // 글씨 색상을 노란색으로 변경
        $(clickedElement).find("a").css({
            "color": "yellow",
            "text-decoration": "line-through"
        });
        
        // 캘린더로 이동
        window.location.href = $(clickedElement).attr("href");
    } */
}

</script>

<body>
	<div class="navbar-custom" style="padding-top: 30px;" id="fondDive">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-custom navbar-light"
				style="height: 90px;">
				<div class="container-fluid">
					<!-- 로고 -->
					<div class="navbar-brand">
						<div class="logo">
							<img src="${root }/image/logo4.png" alt="로고"
								style="width: 100%; height: 100%;"
								onclick="location.href='${root}/index'">
						</div>
					</div>

					<!-- 메뉴 항목 -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent"
						style="padding-bottom: 25px; font-size: 20px;">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link"
								href='${root}/board/community'>커뮤니티</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${root}/search/findPro">일류찾기</a></li>
						</ul>


						<!-- 검색 폼 -->
						<form class="d-flex me-5 ms-auto" role="search">
							<input class="form-control me-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn ms-2 button-custom" type="submit"
								style="color: white;">Search</button>
						</form>

						<c:choose>
							<c:when
								test="${loginProuserBean.prouserLogin ==false && loginUserBean.userLogin ==false }">
								<!-- 로그인 및 회원가입 버튼 -->
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/pro_login'">일류로그인</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/login'">회원로그인</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/join'">회원가입</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/pro_join'">일류가입</button>
							</c:when>
							<c:when
								test="${loginProuserBean.prouserLogin ==true && loginUserBean.userLogin ==false }">
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/login'">회원로그인</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/pro_logout'">로그아웃</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/common/myPage'">마이프로필</button>
									
								<!-- 종 -->	
								<div class="dropdown" id="notificationDropdown"> 
									<i class="bi bi-bell-fill ms-3 text-center mx-auto position-relative dropdown-toggle dropdown-toggle-noarrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 30px;"> 
										<span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" data-bs-toggle="dropdown" aria-expanded="false">
										</span>
									</i>
									
									<ul class="dropdown-menu">
										<!-- <li><a class="dropdown-item" href="#">알림 1</a></li>
							        <li><a class="dropdown-item" href="#">알림 2</a></li> -->
										<!-- 필요한 만큼 메뉴 항목을 추가하세요 -->
									</ul>
								</div>
								
								<!-- 캘린더 -->
								<div class="dropdown" id="calendarDropdown"> 
									<i class="bi bi-calendar-check ms-3 text-center mx-auto position-relative dropdown-toggle dropdown-toggle-noarrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 30px;">
										<span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" data-bs-toggle="dropdown" aria-expanded="false">
										</span>
									</i>
									
									<ul class="dropdown-menu">
										<!-- <li><a class="dropdown-item" href="#">알림 1</a></li>
							        <li><a class="dropdown-item" href="#">알림 2</a></li> -->
										<!-- 필요한 만큼 메뉴 항목을 추가하세요 -->
									</ul>
								</div>
								
							</c:when>

							<c:when
								test="${loginProuserBean.prouserLogin ==false && loginUserBean.userLogin ==true }">
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/pro_login'">일류로그인</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/user/logout'">로그아웃</button>
								<button class="btn ms-2 button-custom" type="button"
									style="color: white;"
									onclick="location.href='${root}/common/myPage'">마이프로필</button>
									
								<!-- 종 -->
								<div class="dropdown" id="notificationDropdown"> 
									<i class="bi bi-bell-fill ms-3 text-center mx-auto position-relative dropdown-toggle dropdown-toggle-noarrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 30px;">
										<span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" data-bs-toggle="dropdown" aria-expanded="false" style="display:none;"> 
										</span>
									</i>
									
									<ul class="dropdown-menu">
										<!-- <li><a class="dropdown-item" href="#">알림 1</a></li>
							        <li><a class="dropdown-item" href="#">알림 2</a></li> -->
										<!-- 필요한 만큼 메뉴 항목을 추가하세요 -->
									</ul>
								</div>
								
								<!-- 캘린더 -->
								<div class="dropdown" id="calendarDropdown"> 
									<i class="bi bi-calendar-check ms-3 text-center mx-auto position-relative dropdown-toggle dropdown-toggle-noarrow" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 30px;">
										<span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle" data-bs-toggle="dropdown" aria-expanded="false">
										</span>
									</i>
									
									<ul class="dropdown-menu">
										<!-- <li><a class="dropdown-item" href="#">알림 1</a></li>
							        <li><a class="dropdown-item" href="#">알림 2</a></li> -->
										<!-- 필요한 만큼 메뉴 항목을 추가하세요 -->
									</ul>
								</div>

							</c:when>
						</c:choose>

					</div>
				</div>
			</nav>
		</div>
	</div>

</body>

</html>