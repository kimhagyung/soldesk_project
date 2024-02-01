<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="root" value="${pageContext.request.contextPath }"/>   
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
	

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
</head>

<style>
	@font-face {
		font-family: 'GmarketSansMedium';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	body,
	div,
	span,
	h5,
	button,
	h2,
	ul,
	li,
	a {
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
</style>

<body>
	<div class="navbar-custom" style="padding-top: 30px;" id="fondDive">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-custom navbar-light" style="height: 90px;">
				<div class="container-fluid">
					<!-- 로고 -->
					<div class="navbar-brand">
						<div class="logo">
							<img src="${root }/image/logo4.png" alt="로고" style="width: 100%; height: 100%;"
								onclick="location.href='${root}/index'">
						</div>
					</div>

					<!-- 메뉴 항목 -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent"
						style="padding-bottom: 25px; font-size: 20px; ">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item">
								<a class="nav-link" href='${root}/board/community'>커뮤니티</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${root}/search/findPro">일류찾기</a>
							</li>
						</ul>
						<!-- 검색 폼 -->
						<form class="d-flex me-5 ms-auto" role="search">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn ms-2 button-custom" type="submit" style="color: white;">Search</button>
						</form>
 
					<c:choose> 
						<c:when test="${loginProuserBean.prouserLogin ==false && loginUserBean.userLogin ==false }">
							<!-- 로그인 및 회원가입 버튼 -->
								<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/pro_login'">일류로그인</button>
								<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/login'">회원로그인</button>
								<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/join'">회원가입</button>
								<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/pro_join'">일류가입</button>
							</c:when>
						<c:when test="${loginProuserBean.prouserLogin ==true && loginUserBean.userLogin ==false }">
							<button class="btn ms-2 button-custom" type="button" style="color: white;"
								onclick="location.href='${root}/user/login'">회원로그인</button>
								<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/pro_logout'">로그아웃</button> 
							<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/common/myPage'">마이프로필</button>
							<i class="bi bi-bell-fill ms-3 text-center mx-auto position-relative" style="font-size: 30px;">
								<span
									class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
									<span class="visually-hidden">New alerts</span>
								</span>
							</i>
						</c:when>
						<c:when test="${loginProuserBean.prouserLogin ==false && loginUserBean.userLogin ==true }">
							<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/pro_login'">일류로그인</button>
								<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/user/logout'">로그아웃</button> 
							<button class="btn ms-2 button-custom" type="button" style="color: white;"
									onclick="location.href='${root}/common/myPage'">마이프로필</button>
							<i class="bi bi-bell-fill ms-3 text-center mx-auto position-relative" style="font-size: 30px;">
								<span
									class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
									<span class="visually-hidden">New alerts</span>
								</span>
							</i>
						</c:when> 
					</c:choose>
					</div>
				</div>
			</nav>
		</div>
	</div>
</body>

</html>