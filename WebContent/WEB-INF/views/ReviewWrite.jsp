<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Write</title>
    <script src="${root}/script/jquery-3.4.1.min.js"></script>
    <style>
        .account {
            font-size: 25px;
        }

		.reviewCard{
			 display: flex;
    		 align-items: center;
    		 justify-content: flex-start; 
			 flex-direction: column;
		}
		
        .provider_profile {
            display: flex;
            flex-direction: row;
        }

        ::placeholder {
            font-size: 14px;
            color: #B5B5B5;
        }

        .star {
            border: none;
            background: none;
            cursor: pointer;
        }
        
        #fileInput {
            display: none;
        }

        #btn-container {
            display: flex;
            align-items: center;
        }

        #btn {
            border: 1px solid #F3F3F3;
            width: 90px;
            height: 90px;
            border-radius: 10px;
            position: relative;
            overflow: hidden;
            margin-right: 10px; 
        }

        #uploaded-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .upload-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #6387A6;
            font-size: 24px;
        }
        
        .form-check-input:checked {
    		background-color: #6387A6 !important; 
    		border-color: #6387A6 !important;
    		color: white !important;
    		outline: none;
		}
		
		.charCount {
			 display: flex;
             justify-content: flex-end;
		}
    </style>
    <script>
    $(function(){
      $(".header").load("header.html");
       $(".footer").load("footer.html");
    });
  </script>
</head>
<body style="background-color: #FAFAFA;">
<c:import url="/WEB-INF/views/include/header.jsp" />
   <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="account"><strong>리뷰 작성</strong></div>
                <div class="reviewCard" style="border: 1px solid #D9E8F5; border-radius: 10px; background-color: #fff; height: auto;; margin-top: 2%;">
                    <div class="provider_profile" style="width: 75%; padding-top: 40px;">
                        <img src="../image/1.png" style="width: 52px; height: 52px; border-radius: 25%; border: 1px solid #F3F3F3; margin-right: 1.5%"/>
                        <div class="profileInfo" style="margin-top: 0.6%;">
                            <div class="provider_name" style="font-size: 16px;"><strong>심리상담사 OOO</strong></div>
                            <div class="service_name" style="font-size: 14px; color: #737373;">성인 심리상담</div>
                        </div>
                    </div>
                    <div class="provider_star_rate" style="width: 75%; padding-top: 45px;">
                        <div class="star_rate_title" style="font-size: 16px;"><strong>일류님은 어떠셨나요?</strong></div>
                        <div class="starrateExplain" style="color: #B5B5B5; font-size: 14px;">별점을 선택해주세요</div>
                        <div class="stars">
                            <button class="star" style="padding: 0px 0px;"><img src="../image/star-solid-gray.svg" alt="Image 1"></button>
                            <button class="star" style="padding: 0px 0px;"><img src="../image/star-solid-gray.svg" alt="Image 1"></button>
                            <button class="star" style="padding: 0px 0px;"><img src="../image/star-solid-gray.svg" alt="Image 1"></button>
                            <button class="star" style="padding: 0px 0px;"><img src="../image/star-solid-gray.svg" alt="Image 1"></button>
                            <button class="star" style="padding: 0px 0px;"><img src="../image/star-solid-gray.svg" alt="Image 1"></button>
                        </div>
                        <div class="rateMessage" style="color: #B5B5B5;"></div>
                    </div>
                    <div class="review_survey" style="width: 75%; padding-top: 45px;">
                        <div class="review_surveyTitle" style="font-size: 16px;"><strong>어떤 점이 좋았나요? (최대 3개)</strong></div>
                        <div class="review_surveyExplain" style="color: #B5B5B5; font-size: 14px;">일류님을 가장 잘 설명하는 문장을 골라주세요</div>
                        <div class="form-check" style="margin-top: 0.8%;">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                친절해요
                            </label>
                        </div>
                        <div class="form-check" >
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                비용이 합리적이에요
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                편안한 분위기에서 진행해주세요
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                경험이 많아요
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked">
                            <label class="form-check-label" for="flexCheckChecked">
                                만족스러워요
                            </label>
                        </div>
                    </div>
                    <div class="review_text" style="width: 75%; padding-top: 45px;">
                        <div class="review_text_title" style="font-size: 16px;"><strong>솔직한 리뷰를 작성해주세요</strong></div>
                        <div class="review_textExplain" style="color: #B5B5B5; font-size: 14px;">리뷰는 최소 10자 이상입니다</div>
                        <textarea id="myTextarea" style="border-radius: 10px; border: 1px solid #e1e1e1; width: 100%; margin-top: 0.8%;" placeholder="서비스 시간, 달인 장점, 특징 등 구체적일수록 좋아요" oninput="countChars()" rows="5"></textarea>
                        <div class="charCount" style="color: #B5B5B5; font-size: 14px;"><span id="charCount" style="color: #6387A6;">0&nbsp;</span>/300자</div>
                    </div>
                    <div class="photo_review" style="width: 75%; padding-top: 45px;">
                        <div class="photo_reviewTitle" style="font-size: 16px;"><strong>서비스 사진을 올려주세요 (최대 5장)</strong></div>
                        <div class="photo_reviewExplain" style="color: #B5B5B5; font-size: 14px;">서비스 전 / 후 사진이면 더욱 좋아요</div>
                        <div id="btn-container" style="margin-top: 0.8%; margin-bottom: 40px;">
                            <label for="fileInput">
                                <button class="btn" id="btn">
                                    <i class="bi bi-plus-circle upload-icon" style="color: #6387A6"></i>
                                    <!-- <img id="uploaded-image" src="#"> -->
                                </button>
                            </label>
                            <input type="file" id="fileInput" style="display: none;" accept="image/*">
                        </div>
                    </div>
                    <div class="d-grid gap-2 col-4 mx-auto" style="padding-bottom: 40px;">
                        <button class="btn btn-primary" type="button" style="background-color: #B5B5B5; border: 1px solid #B5B5B5;">작성 완료</button>
                    </div>
                </div>
            </div>
        </div>
   </div>
   <c:import url="/WEB-INF/views/include/footer.jsp" />
  
   <script type="text/javascript">
   document.addEventListener('DOMContentLoaded', function () {
        const buttons = document.querySelectorAll('.star');
        const messageDiv = document.querySelector('.rateMessage');

        buttons.forEach(function (button, index) {
            button.addEventListener('click', function () {
                for (let i = 0; i < buttons.length; i++) {
                    const img = buttons[i].querySelector('img');
                    if (i <= index) {
                        img.src = '../image/star-solid.svg'; //선택한 별까지 노란색으로 표시
                    } else {
                        img.src = '../image/star-solid-gray.svg'; //아닌 곳은 회색 별로 표시
                    }
                }

                //별점에 따라 메시지 달라짐
                switch (index) {
                    case 0:
                        messageDiv.innerText = '아쉬워요'; //별 1개
                        break;
                    case 1:
                        messageDiv.innerText = '그저 그래요';
                        break;
                    case 2:
                        messageDiv.innerText = '괜찮았어요';
                        break;
                    case 3:
                        messageDiv.innerText = '좋았어요';
                        break;
                    case 4:
                        messageDiv.innerText = '최고예요'; //별 5개
                        break;
                    default:
                        messageDiv.innerText = '';
                        break;
                }
            });
        });
    });
   
   document.getElementById('fileInput').addEventListener('change', function () {
       // 이미지 개수를 확인
       var currentImageCount = document.querySelectorAll('.uploaded-image').length;

       // 이미지가 5장 이상이면 추가로 이미지를 삽입하지 않음
       if (currentImageCount >= 5) {
           alert('최대 5장까지만 첨부할 수 있습니다.');
           return;
       }

       var reader = new FileReader();
       reader.onload = function (e) {
           // 새로운 이미지를 표시할 img 요소 생성
           var newImage = document.createElement('img');
           newImage.src = e.target.result;
           newImage.alt = 'Uploaded Image';
           newImage.className = 'uploaded-image';  // 클래스 추가
           newImage.style.width = '90px';  
           newImage.style.height = '90px'; 
           newImage.style.borderRadius = '10px'; 
           newImage.style.border = '1px solid #e1e1e1'; 
           newImage.style.marginRight = '10px'; 

           // 이미지를 표시할 컨테이너를 찾음
           var imageContainer = document.getElementById('btn-container');

           // 새로운 이미지를 컨테이너에 추가
           imageContainer.appendChild(newImage);
       };

       reader.readAsDataURL(this.files[0]);
   });

   document.getElementById('btn').addEventListener('click', function () {
       document.getElementById('fileInput').click();
   });
   
   //textarea 글자수 세기
   function countChars() {
       var textarea = document.getElementById('myTextarea');
       var charCountSpan = document.getElementById('charCount');
       var charCount = textarea.value.length;
       charCountSpan.textContent = charCount;
   }
   </script>
</body>
</html>
