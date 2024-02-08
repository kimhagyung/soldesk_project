<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
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
	 
	 .searchResults{
		position: absolute;
		top: 57%; 
		left: 45.3%; 
		width: 22.2%; 
	    background-color: white;
	     border: 1px solid #ccc; 
	     max-height: 200px; overflow-y: auto; 
	     display: none; 
	     z-index: 100;
	     
	 }  
	 <style>
#username, #email, #password, #confirmPassword {
   font-size: 18px;
}
/*
.card-body {
   background-color: #C6D7E0;
}
*/
.accordion-item:last-of-type .accordion-button.collapsed {
    border-bottom-right-radius: var(--bs-accordion-inner-border-radius);
    border-bottom-left-radius: var(--bs-accordion-inner-border-radius);
    background: yellow;
}



.accordion-button:focus {
    z-index: 3;
    border-color: var(--bs-accordion-btn-focus-border-color);
    outline: 0;
    box-shadow: white;
}

.accordion-item:last-of-type .accordion-button.collapsed {
    border-bottom-right-radius: var(--bs-accordion-inner-border-radius);
    border-bottom-left-radius: var(--bs-accordion-inner-border-radius);
    background: white;
}

.accordion-button:not(.collapsed) {
    color: var(--bs-accordion-active-color);
    background-color: white;
    box-shadow: inset 0 calc(-1 * var(--bs-accordion-border-width)) 0 var(--bs-accordion-border-color);
}

</style>
<script>
$(document).ready(function() {
    var selectedServiceCategoryId;
    var selectedDetailCategoryName;
    $("#searchKeyword").on("input", function() {
        var inputText = $(this).val();
        // 콘솔 창에 현재 입력 내용 출력
        console.log("사용자 입력: " + inputText);
        if (inputText.length >= 2) {
            $.ajax({
                url: "${root}/autocomplete",
                method: "GET",
                data: { searchKeyword: inputText },
                success: function(data) {
                    showSearchResults(data);
                    var resultsContainer = $(".searchResults");
                    resultsContainer.empty();

                    for (var i = 0; i < data.length; i++) {
                        var listItem = $("<a>")
                            .addClass("list-group-item list-group-item-action")
                            .css({
                                "font-size": "15px"
                            })
                            .text(data[i].detail_category_name); 
                        // 클릭 이벤트에 선택된 항목 정보 추가 (클로저 사용)
                        (function(index) {
                            listItem.click(function() {
                                selectedServiceCategoryId = data[index].service_category_id;
                                selectedDetailCategoryName = data[index].detail_category_name;
                            });
                        })(i); 
                        resultsContainer.append(listItem);
                    } 
                    if (data.length === 0) {
                        // 결과가 없을 경우 안내 메시지 추가
                        var noResultItem = $("<div>")
                            .addClass("list-group-item ")
                            .css({
                                "font-size": "15px"
                            })
                            .text("검색 결과가 없습니다.");
                        resultsContainer.append(noResultItem);
                    }

                    resultsContainer.show(); // 결과를 보여줌
                },
                error: function() {
                    console.error("Failed to retrieve autocomplete suggestions.");
                }
            });
            
        } else {
            $(".searchResults").hide();
        } 
    });

   
    // 검색 결과 항목을 클릭할 때
    $(".searchResults").on("click", ".list-group-item", function() {
        selectedDetailCategoryName = $(this).text(); // 클릭한 항목의 텍스트 가져오기
        $("#searchKeyword").val(selectedDetailCategoryName); // 검색 텍스트 상자에 설정
        $(".searchResults").hide(); // 결과 숨기기

        // 선택된 항목에 대한 정보를 사용하여 동작 수행
        if (selectedServiceCategoryId && selectedDetailCategoryName) {
            var queryParams = "?service_category_id=" + selectedServiceCategoryId + "&detail_category_name=" + selectedDetailCategoryName;
            var newLocation = "${root}/Questions" + queryParams;
            window.location.href = newLocation;
        }
    });

    // 검색창 밖을 클릭하면 결과를 숨김
    $(document).on("click", function(event) {
        if (!$(event.target).closest("#searchResults, #searchKeyword").length) {
            $(".searchResults").hide();
        }
    });
    
// 서버에서 받은 검색어를 리스트로 만들어 표시하는 함수
    function showSearchResults(data) {
        var resultsContainer = $(".searchResults");
        resultsContainer.empty(); // 이전 결과를 지우고 새로운 결과 표시
      
       if (data.length > 0) {
            // 결과가 있을 경우 리스트에 추가
            for (var i = 0; i < data.length; i++) {
                var listItem = $("<a>")
                    .addClass("list-group-item list-group-item-action")
                    .css({
                        "font-size": "15px"
                    })
                    .text(data[i].detail_category_name);
                resultsContainer.append(listItem);
                console.log("showSearchResults 함수 수행"+data[i].detail_category_name);
            }
        } else {
            // 결과가 없을 경우 안내 메시지 추가
            var noResultItem = $("<div>")
                .addClass("list-group-item ")
                .css({
                    "font-size": "15px"
                })
                .text("검색 결과가 없습니다.");
            resultsContainer.append(noResultItem);
            console.log("showSearchResults 함수 수행 결과가 없음");
        } 
       resultsContainer.show(); // 결과를 보여줌
    }

});
</script>
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
						<form action="${root}/Questions" id="formID" method="get">
						    <input class="form-control me-5 inputResult" id="searchKeyword" placeholder="Search" autocomplete='off' />
						</form>
						<!-- 결과 받을 폼 -->
						<div class="searchResults list-group" ></div>
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
									onclick="location.href='${root}/common/myPage?id=${loginProuserBean.getPro_id() }'">마이프로필</button>
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
									onclick="location.href='${root}/common/myPage?id=${loginUserBean.getUser_id() }'">마이프로필</button>
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