<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>detailCategory</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
</head> 
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
		    right: 5px;
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
        
          /* 추가한 스타일 */
        .question {
            margin-top: 40px;
        }

        .question-form {
            width: 400px;
            background-color: white;
            padding: 2em;
            border-top-left-radius: 5px;
            border-top-right-radius: 15px;
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
            position: relative;
            left: -250px;
        }

        .question-title {
            margin-bottom: 1em;
            font-size: 20px;
        }

        .radio-label {
            display: block;
            position: relative;
            padding-left: 35px;
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
            width: 200px;
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
</head>

<body style="background-color: #EEEEEE;">
<c:import url="/WEB-INF/views/include/header.jsp" />
    <div class="header"></div>
		    <!-- 진행률 바 컨테이너 -->
		<div class="progress-container" style="margin: 20px auto; width: 60%;"><!-- 마진과 폭을 여기서 설정 -->
		    <!-- 빈 바 -->
		    <div class="progress-bar-empty"></div>
		    <!-- 색칠된 바 -->
		    <div class="progress-bar-fill" id="myProgressBar">
		        <span id="progress-text">0%</span>
		    </div>
		</div> 
	    <div class="question-container questionname" style="left: -350px;">
	       		${param.detail_category_name}
	    </div>	 
	    
		    <div class="firstformset" style="display: none;">	
		        <c:forEach var="question" items="${requestScope[serviceCategoryname]}">
				    <div class="question-form">
				        <div class="question-title">${question.key}</div>
				            <c:forEach var="value" items="${question.value}">
				                <label class="radio-label">
				                    <input type="radio" name="${value}" value="${value}" class="radio-input" style="margin-top: 6px;">
				                    ${value}
				                </label> 
				            </c:forEach>
				            <input type="submit" value="확인" class="submit-button">
				    	</div>
				</c:forEach>
		    </div>
		    <div class="firstanswer" style="display: none;">
			    <div class="question" style="margin-top: 40px;">
			        <div class="answer-form">
			            <div id="selectedAnswer"></div>
			        </div>
			    </div>
			</div>
    
  
    
    <div style="margin-top: 300px;"></div>
     <script>
	       $(document).ready(function () {
    setTimeout(function() {
        $(".questionname").fadeIn(400); 
    }, 1000);

    setTimeout(function() {
        $(".firstformset").fadeIn(400); 
    }, 1500);

    // 진행률 바를 업데이트하는 함수
    function updateProgressBar(addValue) {
        var progressBar = document.getElementById("myProgressBar");
        // 현재 진행률을 가져오거나 기본값을 0으로 설정
        var currentProgress = progressBar.style.width ? parseFloat(progressBar.style.width) : 0;
        var newProgress = currentProgress + addValue;

        // 진행률이 100퍼센트가 넘지않도록 설정하는 곳입니다
        newProgress = newProgress > 100 ? 100 : newProgress;

        progressBar.style.width = newProgress + '%';
        document.getElementById("progress-text").innerText = newProgress + '%'; // 텍스트 업데이트 업데이트하는곳
    }
    
    //게이지바 초기값을 0으로 설정합니다!
    updateProgressBar(0);

   /* 
    $(".firstformset form").submit(function(event) {
        event.preventDefault();
        var answer = $("input[name='${value}']:checked").val();
        $(".firstanswer >> div").append("<div class='user-message message'>" + answer + "</div>");
        $(this).hide(); 
        $(".firstanswer").fadeIn(400);
        setTimeout(function() {
            $("...그 다음 질문..").fadeIn(400); 
        }, 1000);
        updateProgressBar(50);//진행률을 0퍼에서 50퍼로 간다는 의미입니다!
    }); */

   
    
});



    </script>
<c:import url="/WEB-INF/views/include/footer.jsp" />
</body>

</html>