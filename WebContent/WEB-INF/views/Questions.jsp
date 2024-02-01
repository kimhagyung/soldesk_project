<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="${root}/jquery/Questions.js"></script>

</head>
<script>
   $(function() {
      
   })

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

.profileimage {
   width: 70px;
   height: 90px;
}

.progress-container {
   background-color: #ddd;
   border-radius: 4px;
   position: relative; /* 색칠된 바를 올바르게 위치시키기 위해 상대적 위치 설정 */
}

.progress-bar-empty {
   width: 100%;
   height: 15px;
   background-color: lightgray; /*게이지바 테두리 바 여기서 설정해주세요*/
   border-radius: 4px; /* 둥근 모서리 설정 */
}

.progress-bar-fill {
   width: 0%; /*초기값은 0으로 설정하기 */
   height: 15px;
   background-color: #D9E8F5; /*게이지 색깔은 여기서 정해주세요*/
   text-align: center;
   line-height: 30px;
   color: white;
   position: absolute;
   top: 0;
   left: 0;
   border-radius: 4px;
   transition: width 2s ease;
}

 #progress-text {
         position: absolute;
         right: 5px; /* 기존 위치 유지 */
         top: 55%; /* 상단에서 55%의 위치에 배치 */
         transform: translateY(-50%); /* Y축으로 -50% 만큼 이동시켜 정중앙에 위치 */ 
         font-size: 12px; /* 글씨 크기를 12px로 조정 */
         color: black;
     }

.question-container {
   width: 200px;
   background-color: white;
   padding: 2em;
   border-top-left-radius: 5px;
   border-top-right-radius: 15px;
   border-bottom-left-radius: 15px;
   border-bottom-right-radius: 15px;
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
   margin: auto;
   position: relative;
   margin-top: 30px;
   display: none;
   font-size: 20px;
}

label {
   padding-left: 10px;
}

/* 추가한 스타일 */
.question {
   margin-top: 40px;
}

.question-form {
   width: 450px;
   background-color: white;
   padding: 2em;
   border-top-left-radius: 5px;
   border-top-right-radius: 15px;
   border-bottom-left-radius: 15px;
   border-bottom-right-radius: 15px;
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
   margin: auto;
   position: relative;
   left: -330px;
}

.question-title {
   margin-bottom: 1em;
   font-size: 20px;
}

.radio-label {
   display: block;
   position: relative;
   margin-bottom: 12px;
   font-size: 20px;
}

.radio-input {
   position: absolute;
   cursor: pointer;
   margin-left: -27px;
   margin-top: 4px;
}

.submit-button {
   width: 100%;
   padding: 15px;
   background-color: #606060;
   color: white;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

.answer-form {
   width: 300px;
   background-color: white;
   padding: 2em;
   border-top-left-radius: 15px;
   border-top-right-radius: 5px;
   border-bottom-left-radius: 15px;
   border-bottom-right-radius: 15px;
   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
   margin: auto;
   position: relative;
   left: 350px;
   font-size: 20px;
}
</style>
<script>  
$(document).ready(function () {
<<<<<<< HEAD
    <%String serviceCategoryname = request.getParameter("serviceCategoryname"); %>

    var serviceCategoryname = "<%=serviceCategoryname%>";
    console.log("serviceCategoryname: " + serviceCategoryname);

    if (serviceCategoryname === "청소") {
        logCategoryValues(청소);
    } else if (serviceCategoryname === "번역") {
        logCategoryValues(번역);
    } else if (serviceCategoryname === "문서") {

    function logCategoryValues(categoryObject) {
        var outputElement = document.querySelector(".formset");
        var questions = Object.keys(categoryObject);
        var currentQuestionIndex = 0;

        showNextQuestion();

        function showNextQuestion() {
            if (currentQuestionIndex < questions.length) {
                var key = questions[currentQuestionIndex];
                var values = categoryObject[key];

                var formsetElement = document.createElement('div');
                formsetElement.classList.add('formset');

                var questionElement = document.createElement('div');
                questionElement.classList.add('question');

                var questionFormElement = document.createElement('div');
                questionFormElement.classList.add('question-form');

                var keyElement = document.createElement('div');
                keyElement.classList.add('question-title');
                keyElement.innerHTML = key;
                questionFormElement.appendChild(keyElement);

                var valuesContainer = document.createElement('div'); // Container for values
                valuesContainer.classList.add('values-container');

                for (var j = 0; j < values.length; j++) {
                    var value = values[j];
                    var radioInput = document.createElement('input');
                    radioInput.type = 'radio';
                    radioInput.name = 'answer'; // 모든 라디오 버튼에 공통 이름 설정
                    radioInput.value = value;
                    radioInput.id = 'option' + j; // 각 라디오 버튼에 대한 고유한 ID 설정

                    var label = document.createElement('label');
                    label.setAttribute('for', 'option' + j);
                    label.innerHTML = value;

                    var valueElement = document.createElement('div');
                    valueElement.classList.add('radio-label');
                    valueElement.appendChild(radioInput);
                    valueElement.appendChild(label);

                    valuesContainer.appendChild(valueElement);
                }

                var submitButton = document.createElement('input');
                submitButton.type = 'submit';
                submitButton.value = '확인';
                submitButton.classList.add('submit-button');

                submitButton.addEventListener('click', function () {
                    handleButtonClick(key);
                });

                valuesContainer.appendChild(submitButton);
                questionFormElement.appendChild(valuesContainer);

                questionElement.appendChild(questionFormElement);
                formsetElement.appendChild(questionElement);
                outputElement.appendChild(formsetElement);
            }
        }

        function handleButtonClick(questionKey) {
            var answer = $("input[name='answer']:checked").val();
            if (answer) {
                var answerElement = $("<div class='answer-form'>" + answer + "</div>");
                $(".question:contains('" + questionKey + "')").append(answerElement);
                answerElement.fadeIn(400);
               
                // 버튼과 옵션을 숨기기
                $(".question:contains('" + questionKey + "') .submit-button, .question:contains('" + questionKey + "') .radio-label").hide();

                currentQuestionIndex++;
                showNextQuestion();
                updateProgressBar(20); // 진행률 바 업데이트
            } else {
                alert("계속 진행하기 전에 옵션을 선택하세요.");
            }
        }
        
        // 진행률 바를 업데이트하는 함수
        function updateProgressBar(addValue) {
           var progressBar = document
                 .getElementById("myProgressBar");
           // 현재 진행률을 가져오거나 기본값을 0으로 설정
           var currentProgress = progressBar.style.width ? parseFloat(progressBar.style.width)
                 : 0;
           var newProgress = currentProgress + addValue;

           // 진행률이 100퍼센트가 넘지않도록 설정하는 곳입니다
           newProgress = newProgress > 100 ? 100
                 : newProgress;

           progressBar.style.width = newProgress + '%';
           document.getElementById("progress-text").innerText = newProgress
                 + '%'; // 텍스트 업데이트 업데이트하는곳
        }

        //게이지바 초기값을 0으로 설정합니다!
        updateProgressBar(0);
    }

    // ... 나머지 코드 ...





    
});



</script>

</head>

<body style="background-color: #EEEEEE;">
   <c:import url="/WEB-INF/views/include/header.jsp" />
   <!-- 진행률 바 컨테이너 -->
   <div class="progress-container" style="margin: 20px auto; width: 60%;">
      <!-- 마진과 폭을 여기서 설정 -->
      <!-- 빈 바 -->
      <div class="progress-bar-empty"></div>
      <!-- 색칠된 바 -->
      <div class="progress-bar-fill" id="myProgressBar">
         <span id="progress-text">0%</span>
      </div>
   </div>
   
     <div class="question-container questionname" style="left: -450px;"><%=serviceCategoryname%></div>

   
  <div class="formset" style="display: none;">
    <div class="question"> 
        
    </div>
</div>


    <div class="answer" style="display: none;">
      <div class="question" style="margin-top: 40px;">
         <div class="answer-form"></div>
      </div>
   </div> 
   
   <div style="margin-top: 150px;"></div>
   
 

   <script>
      $(document)
            .ready(
                  function() {
                     setTimeout(function() {
                        $(".questionname").fadeIn(400);
                     }, 1000);

                     setTimeout(function() {
                        $(".formset").fadeIn(400);
                     }, 1500);

                    
                     
                    /*  $(form).submit(function(event) {
                           event.preventDefault();
                           var answer = $("input[name='answer']:checked").val();
                           if (answer) {
                               $(".answer >> div").append("<div class='user-message message'>" + answer + "</div>");
                               $(form).hide();
                               $(".answer").fadeIn(400);
                               setTimeout(function() {
                                   $(".formset").fadeIn(400);
                               }, 1000);
                               updateProgressBar(30); // 진행률 바 업데이트
                           } else {
                               // 라디오 버튼이 선택되지 않은 경우를 처리합니다.
                               alert("계속 진행하기 전에 옵션을 선택하세요.");
                           }
                       }); */

                   
                  });
   </script>
</body>

</html>