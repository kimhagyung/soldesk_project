<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>saved</title>

<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
	$(function () {
		
	})

	$(document).ready(function () {
		// 각 후기 내용을 제한할 길이
		var maxCharacters = 100;

		// 각 후기 내용에 대해 실행
		$('.card-content').each(function () {
			var text = $(this).text();

			// 글자 수가 제한 길이를 초과하면 생략
			if (text.length > maxCharacters) {
				var truncatedText = text.substring(0, maxCharacters) + '...';
				$(this).text(truncatedText);
			}
		});
	}); 
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
		
		.profileimage{
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

	<div class="container mx-auto mt-5 mb-5" style="width:50%;">
		
			<h2>
				<strong>찜한 일류</strong>
			</h2>
		
		
		<div class="deletebutton text-end mb-3">
			<button class="btn button-custom" type="button" style="color: white;">선택 항목 삭제</button>
		</div>
		
		<!--여기 -->
		<div class="card mb-3">
			<div class="card-body row">
				<div class="col-10">
					<div class="form-check">
						<input class="form-check-input " type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label ms-1" for="flexCheckDefault">
							<b style="font-size: 18px;">일류 이름입니다. </b>
						</label>
					</div>
					<div class="card-content">
						상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 / 회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
						발음
						교정 전문’입니다.

						✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에 익숙해지는 훈련을 합니다.
						✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
						✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다.
						* 화상강의는 ZOOM으로 진행.
					</div>

					<div class="star-review mt-1">
						<i class="bi bi-star-fill star"></i>
						<span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>
					</div>

					<div class="career mt-2 lig">
						<span>경력 20년</span>
					</div>
				</div>
				<div class="col-2 text-center mt-4">
					<img class="profileimage" src="../image/logo4.png">
				</div>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-body row">
				<div class="col-10">
					<div class="form-check">
						<input class="form-check-input " type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label ms-1" for="flexCheckDefault">
							<b style="font-size: 18px;">일류 이름입니다. </b>
						</label>
					</div>
					<div class="card-content">
						상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 / 회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
						발음
						교정 전문’입니다.

						✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에 익숙해지는 훈련을 합니다.
						✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
						✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다.
						* 화상강의는 ZOOM으로 진행.
					</div>

					<div class="star-review mt-1">
						<i class="bi bi-star-fill star"></i>
						<span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>
					</div>

					<div class="career mt-2 lig">
						<span>경력 20년</span>
					</div>
				</div>
				<div class="col-2 text-center mt-4">
					<img class="profileimage" src="../image/logo4.png">
				</div>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-body row">
				<div class="col-10">
					<div class="form-check">
						<input class="form-check-input " type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label ms-1" for="flexCheckDefault">
							<b style="font-size: 18px;">일류 이름입니다. </b>
						</label>
					</div>
					<div class="card-content">
						상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 / 회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
						발음
						교정 전문’입니다.

						✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에 익숙해지는 훈련을 합니다.
						✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
						✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다.
						* 화상강의는 ZOOM으로 진행.
					</div>

					<div class="star-review mt-1">
						<i class="bi bi-star-fill star"></i>
						<span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>
					</div>

					<div class="career mt-2 lig">
						<span>경력 20년</span>
					</div>
				</div>
				<div class="col-2 text-center mt-4">
					<img class="profileimage" src="../image/logo4.png">
				</div>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-body row">
				<div class="col-10">
					<div class="form-check">
						<input class="form-check-input " type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label ms-1" for="flexCheckDefault">
							<b style="font-size: 18px;">일류 이름입니다. </b>
						</label>
					</div>
					<div class="card-content">
						상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 / 회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
						발음
						교정 전문’입니다.

						✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에 익숙해지는 훈련을 합니다.
						✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
						✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다.
						* 화상강의는 ZOOM으로 진행.
					</div>

					<div class="star-review mt-1">
						<i class="bi bi-star-fill star"></i>
						<span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>
					</div>

					<div class="career mt-2 lig">
						<span>경력 20년</span>
					</div>
				</div>
				<div class="col-2 text-center mt-4">
					<img class="profileimage" src="../image/logo4.png">
				</div>
			</div>
		</div>
		
		<div class="card mb-3">
			<div class="card-body row">
				<div class="col-10">
					<div class="form-check">
						<input class="form-check-input " type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label ms-1" for="flexCheckDefault">
							<b style="font-size: 18px;">일류 이름입니다. </b>
						</label>
					</div>
					<div class="card-content">
						상세소개입니다.【발음교정/ 오픽/ 토익스피킹/ 비즈니스 / 회화】Eugene English는 영어문장을 듣고 단어와 문장, 강세, 에티튜드 하나하나를 다 고쳐나가는 ‘영어
						발음
						교정 전문’입니다.

						✔ 발음 교정 후, Casual한 지문부터 Formal한 지문까지 읽어나가며 긴 문장에 익숙해지는 훈련을 합니다.
						✔ 수강생 개인에 최적화된 수업으로 진행됩니다. 수강생님들의 적극적인 참여 환영합니다.
						✔ 수업은 1:1 화상강의로 진행되기 때문에 시간을 절약할 수 있습니다.
						* 화상강의는 ZOOM으로 진행.
					</div>

					<div class="star-review mt-1">
						<i class="bi bi-star-fill star"></i>
						<span class="review-count" style="font-size: 13px;">5.0(리뷰 수)</span>
					</div>

					<div class="career mt-2 lig">
						<span>경력 20년</span>
					</div>
				</div>
				<div class="col-2 text-center mt-4">
					<img class="profileimage" src="../image/logo4.png">
				</div>
			</div>
		</div>

	</div>
	<!--여기까지 본문 -->
	<!--푸터-->
<c:import url="/WEB-INF/views/include/footer.jsp" />

</body>

</html>