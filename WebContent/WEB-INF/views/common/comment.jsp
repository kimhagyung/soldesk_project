<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>comment</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script>
		$(function () {
			
		})
		
		$(document).ready(function () {
			// 각 후기 내용을 제한할 길이
			var maxCharacters = 70;

			// 각 후기 내용에 대해 실행
			$('.communitycomment').each(function () {
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
</style>
</head>

<body>
	<!-- 네비부분 -->
<c:import url="/WEB-INF/views/include/header.jsp" />
	<!--여기까지 네비부분-->


	<div class="my_comment  mx-auto" style="width: 50%;">
		<div class="container mt-5">
			<h2>
				<strong>작성글/댓글</strong>
			</h2>

			<ul class="nav nav-tabs mt-5" style="text-decoration: none;">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="myPosts.html" style="color: black;">작성글</a></li>
				<li class="nav-item" style="text-decoration: none;"><a
					class="nav-link active" href="comment.html">내가 작성한 댓글</a></li>
			</ul>

			<!--본문-->
			<div class="my_comment_list">
				<ul class="list-group mt-3">
					<li class="list-group-item">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.이게 내가 단 댓글입니다.이게 내가 단 댓글입니다.이게 내가 단 댓글입니다.이게 내가 단
									댓글입니다.이게 내가 단 댓글입니다.이게 내가 단 댓글입니다.이게 내가 단 댓글입니다.이게 내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>

					<li class="list-group-item mt-4">
						<div class="communitytitle">
							<a id="comment-board-title" href="comment2.html"
								style="color: black; text-decoration: none;"> <span
								class="fw-bold">펭귄이랑 놀아주실 분 계신가요? 이건 글의 제목입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>이게
									내가 단 댓글입니다.</span>
							</a>
						</div>

						<div class="communitycomment mt-1">
							<a href="comment2.html"
								style="color: gray; text-decoration: none;"> <span>2023.12.28</span>
							</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
<c:import url="/WEB-INF/views/include/footer.jsp" />
	<script>
	const triggerTabList = document.querySelectorAll('#myTab button')
triggerTabList.forEach(triggerEl => {
  const tabTrigger = new bootstrap.Tab(triggerEl)

  triggerEl.addEventListener('click', event => {
    event.preventDefault()
    tabTrigger.show()
  })
})
</script>
</body>

</html>