<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en" style="height: 100%;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chatting</title>
<script src="${root}/script/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.6.1/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs/lib/stomp.min.js"></script>

<!-- Bootstrap JavaScript 파일 로드 -->
</head>
<style>
body {
   height: 100%;
}
 
.chatTitle {
   display: flex;
   justify-content: space-between;
}

.dropdown-toggle[data-bs-toggle="dropdown"]::after {
   display: none;
   content: none !important;
}

/* .dropdown-item.active, .dropdown-item:active에 배경색을 적용하는 경우 */
.dropdown-item.active, .dropdown-item:active {
   background-color: #6387A6 !important;
}

.dropdown-toggle:focus {
   box-shadow: none !important;
   outline: none !important;
}

.krw {
   display: flex;
   flex-direction: row;
   align-items: center;
}

.krwIcon {
   display: flex;
   justify-content: center;
   align-items: center;
}

.proChat {
   display: flex;
}

.userChat {
   display: flex;
}

.Content {
   display: flex;
}

.serviceInfo {
   display: flex;
   justify-content: space-between;
}

.serviceCost {
   display: flex;
   justify-content: space-between;
}

.dropdown-btn {
   border: none;
   background-color: #fff;;
}

.dropdown-btn {
   border: none;
   background: none;
   padding: 5px;
   cursor: pointer;
}

.dropdown-btn:hover {
   background-color: #6387A6;
   color: white;
}

.textBar {
   display: flex;
   justify-content: space-around;
   align-items: center;
   position: sticky;
   bottom: 0;
   background-color: #fff;
   padding: 10px;
}

.chatting {
   background-color: #F2F2F2;
   border-radius: 10px;
   height: calc(100% - 50px); /* Adjust the height as needed */
   overflow-y: auto; /* Add scroll if needed */
   margin-top: 2%;
}

textarea {
   border: 1px solid #B5B5B5;
   border-radius: 40px;
   width: calc(100% - 140px); /* Adjust the width as needed */
   height: 32px;
   resize: vertical;
   padding-left: 30px;
   padding-right: 30px;
}

.requestItem {
   margin-bottom: 30px;
}

.question {
   font-size: 14px;
   color: #737373;
}

.answer {
   font-size: 16px;
   color: #323232;
}

.modal-content {
   padding: 15px;
}

.modal-header {
   padding-bottom: 0;
}

.info2 {
   border-radius: 10px;
   background-color: #F2F2F2;
   display: flex;
   justify-content: center;
   align-items: center;;
}

.info4 {
   border-radius: 10px;
   background-color: #F2F2F2;
   display: flex;
   justify-content: center;
   align-items: center;;
}

.form-check-input:checked {
   background-color: #6387A6 !important; /* !important를 추가하여 우선순위를 높임 */
   border-color: #6387A6 !important;
   color: white !important;
   outline: none;
}
.messageContainer {
    display: flex;
    flex-direction: column;
    align-items: flex-end; /* 이 부분을 수정하여 메시지를 오른쪽에 정렬합니다. */
    margin-bottom: 10px;
}
#chat {
    display: flex;
    flex-direction: column;
    width: 100%;
}

.myMessage, .otherMessage {
    display: flex;
    flex-direction: column;
    margin-bottom: 10px;
}

.myMessage span, .otherMessage span {
    padding: 10px 15px;
    border-radius: 20px;
    max-width: 60%;
    word-wrap: break-word;
}

.myMessage span {
    background-color: #D9E8F5;
    color: black;
    align-self: flex-end; /* 사용자 메시지를 오른쪽에 정렬 */
    margin-right : 15px;
    margin-top : 10px;
}

.otherMessage span {
    background-color: #e9ecef;
    color: black;
    align-self: flex-start; /* 상대방 메시지를 왼쪽에 정렬 */
    margin-left : 15px;
    margin-top : 10px;
}
/* 내가 보낸 메시지의 시간을 오른쪽으로 정렬 */
.myMessage div {
    align-self: flex-end;
    margin-right: 10px; /* 메시지와 시간 사이의 간격 조정 */
    color: #666; /* 시간 표시 색상 조정 */
    font-size: 0.75em; /* 시간 표시 크기 조정 */
}

/* 상대방 메시지의 시간을 왼쪽으로 정렬 (필요한 경우) */
.otherMessage div {
    align-self: flex-start;
    margin-left: 10px; /* 메시지와 시간 사이의 간격 조정 */
    color: #666; /* 시간 표시 색상 조정 */
    font-size: 0.75em; /* 시간 표시 크기 조정 */
}

</style>


<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
   <div class="container mt-5" style="height: 76vh;">
      <div class="row justify-content-center" style="height: 76vh;">
         <div class="col-md-10">
            <div class="chatTitle">
               <div class="chat_pro">
                  <button style="border: none; background-color: #fff;"
                     onclick="moveToChattingList()">
                     <i class="bi bi-arrow-left-short" style="font-size: 30px;"></i>
                  </button>
                  <strong style="font-size: 25px;">한유정 일류님</strong>
               </div>
               <div
                  style="display: flex; justify-content: center; align-items: center;">
                  <div
                     style="display: flex; justify-content: center; align-items: center">
                     <button
                        style="font-size: 14px; border: 1px solid #6387A6; color: #6387A6; background-color: #fff; border-radius: 10px; height: max-content"
                        onclick="moveToReviewWrite()">리뷰 작성</button>
                  </div>

                  <button class="btn btn-secondary dropdown-toggle" type="button"
                     data-bs-toggle="dropdown" aria-expanded="false"
                     style="background-color: #fff; border: none;">
                     <i class="bi bi-three-dots-vertical" style="color: black;"></i>
                  </button>
                  <ul class="dropdown-menu" style="padding: 5px 0px;">
                     <li><button class="dropdown-btn" id="requestBtn">내가
                           보낸 요청서 보기</button></li>
                     <li><button class="dropdown-btn" id="declareBtn"
                           style="width: 100%;">신고하기</button></li>
                     <li><button class="dropdown-btn" id="blockBtn"
                           style="width: 100%;">차단하기</button></li>
                     <li><button class="dropdown-btn" id="roomoutBtn"
                           style="width: 100%;">채팅방 나가기</button></li>
                  </ul>

               </div>
            </div>

            <div id = "chat" class="chatting"
               style="background-color: #F2F2F2; border-radius: 10px; height: 69vh; margin-top: 2%;">


            </div>
            <div class="textBar">
                <!-- 이미지 업로드 버튼 -->
                <button style="border: none; background-color: #fff;" onclick="openImageUploader()">
                    <i class="bi bi-image" style="font-size: 25px;"></i>
                </button>
                <!-- 메시지 입력 -->
                <div class="bar" style="padding-left: 10px; padding-right: 10px;">
                    <textarea id="messageInput" placeholder="내용을 입력하세요" style="width: 100%;"></textarea>
                </div>
                <!-- 메시지 전송 버튼 -->
                <button style="border: none; background-color: #fff;" id="sendButton">
                    <i class="bi bi-arrow-up-circle" style="font-size: 25px;"></i>
                </button>
            </div>

         </div>
      </div>
   </div>

   <!-- Modal: 내가 보낸 요청서 -->
   <div class="modal fade" id="exampleModal1" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header" style="border: none;">
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>

            <div class="modal-body" style="padding-top: 0;">
               <div class="modal-Title">
                  <h5 class="modal-title" id="exampleModalLabel"
                     style="margin-bottom: 25px;">
                     <strong>내 요청서</strong>
                  </h5>
               </div>
               <div class="requestItem">
                  <div class="question">질문1</div>
                  <div class="answer">답1</div>
               </div>
               <div class="requestItem">
                  <div class="question">질문2</div>
                  <div class="answer">답2</div>
               </div>
               <div class="requestItem">
                  <div class="question">질문3</div>
                  <div class="answer">답3</div>
               </div>
               <div class="requestItem">
                  <div class="question">질문4</div>
                  <div class="answer">답4</div>
               </div>
            </div>

         </div>
      </div>
   </div>


   <!-- Modal: 신고하기 -->
   <div class="modal fade" id="exampleModal2" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content">
            <div class="modal-header" style="border: none;">
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>

            <div class="modal-body" style="padding-top: 0;">
               <div class="modal-Title">
                  <h5 class="modal-title" id="exampleModalLabel"
                     style="margin-bottom: 25px;">
                     <strong>신고하기</strong>
                  </h5>
               </div>
               <div class="info2" style="padding: 15px">
                  <i class="bi bi-info-circle-fill" style="padding-right: 20px;"></i>
                  <span>신고하기 사유 확인이 불가할 경우 해당 신고건은<br>미조치됩니다.
                  </span>
               </div>
               <div>
                  <div class="form-check" style="margin-top: 16px;">
                     <input class="form-check-input" type="radio"
                        name="flexRadioDefault" id="flexRadioDefault1"> <label
                        class="form-check-label" for="flexRadioDefault1"> 서비스와
                        관련없는 광고 / 홍보 </label>
                  </div>
                  <hr>
                  <div class="form-check"
                     style="margin-top: 16px; margin-bottom: 16px;">
                     <input class="form-check-input" type="radio"
                        name="flexRadioDefault" id="flexRadioDefault2"> <label
                        class="form-check-label" for="flexRadioDefault2"> 부적절한
                        언어(욕설 / 성희롱 등) 사용 </label>
                  </div>
                  <div style="font-size: 14px; color: #737373; margin-bottom: 16px;">
                     서비스 진행중 문제가 생겼다면 증빙자료(대화내역, 문자메세지, 녹취, 사진 등)와 함께 아숨 이메일
                     @example.com으로 접수해 주세요. <br>신고 결과는 별도 안내되지 않습니다.
                  </div>
               </div>
               <div class="d-grid gap-2 col-12 mx-auto">
                  <button class="btn btn-primary" id="reportButton" type="button"
                     style="background-color: #B5B5B5; border: 1px solid #B5B5B5;">신고하기</button>
               </div>

            </div>
         </div>
      </div>
   </div>

   <!-- Modal: 차단하기 -->
   <div class="modal fade" id="exampleModal3" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content" style="width: 85%;">
            <div class="modal-header" style="border: none;">
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>

            <div class="modal-body" style="padding-top: 0;">
               <div class="modal-Title">
                  <h5 class="modal-title" id="exampleModalLabel"
                     style="margin-bottom: 25px;">
                     <strong>차단하기</strong>
                  </h5>
               </div>
               <div class="info4" style="padding: 15px; margin-bottom: 16px;">
                  <i class="bi bi-info-circle-fill" style="padding-right: 20px;"></i>
                  <span>차단하면 일류님이 보내는 메세지를<br> 받을 수 없습니다.<br>(차단
                     여부는 상대방이 알 수 없습니다.)
                  </span>
               </div>

               <div class="d-grid gap-2 col-12 mx-auto">
                  <button class="btn btn-primary" id="reportButton" type="button"
                     style="background-color: #6387A6; border: 1px solid #6387A6;">차단하기</button>
               </div>

            </div>

         </div>
      </div>
   </div>

   <!-- Modal: 채팅방 나가기 -->
   <div class="modal fade" id="exampleModal4" tabindex="-1"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
         <div class="modal-content" style="width: 70%;">
            <div class="modal-header" style="border: none;">
               <button type="button" class="btn-close" data-bs-dismiss="modal"
                  aria-label="Close"></button>
            </div>

            <div class="modal-body" style="padding-top: 0;">
               <div class="modal-Title">
                  <h5 class="modal-title" id="exampleModalLabel"
                     style="margin-bottom: 25px; display: flex; justify-content: center;">
                     <strong>채팅방을 나가시겠어요?</strong>
                  </h5>
               </div>
               <div class="info"
                  style="font-size: 14px; display: flex; justify-content: center; padding-bottom: 16px;">
                  <span>채팅방을 나가면 더 이상 리뷰를 작성할 수 없으며, 대화 내용이 삭제되고 채팅 목록에서도
                     사라집니다.</span>
               </div>

               <div class="d-grid gap-2 col-12 mx-auto">
                  <button class="btn btn-primary" id="reportButtonOut" type="button"
                     style="background-color: #6387A6; border: 1px solid #6387A6;">채팅방
                     나가기</button>
                  <button class="btn btn-primary" id="reportButtonCancel"
                     type="button"
                     style="background-color: #fff; border: 1px solid #6387A6; color: black;">취소</button>
               </div>

            </div>

         </div>
      </div>
   </div>



   <script type="text/javascript">
      function moveToReviewWrite() {
         window.location.href = './ReviewWrite.html';
      }

      // 드롭다운 메뉴 아이템을 클릭했을 때 스크롤 이동 방지
      jq('.dropdown-menu a').on('click', function(e) {

         e.preventDefault(); //기본 이벤트 막기
         var selectedText = $(this).text();
         $('.btn-secondary').text(selectedText);

         changeColor(this);
      });

      jq(document).ready(function() {
         jq('#requestBtn').click(function(e) {
            e.preventDefault();
            jq('#exampleModal1').modal("show");
         });

         jq('#declareBtn').click(function(e) {
            e.preventDefault();
            $j('#exampleModal2').modal("show");
         });

         jq('#blockBtn').click(function(e) {
            e.preventDefault();
            $j('#exampleModal3').modal("show");
         });

         jq('#roomoutBtn').click(function(e) {
            e.preventDefault();
            $j('#exampleModal4').modal("show");
         });

         jq('#reportButtonCancel').click(function() {
            $j('#exampleModal4').modal('hide');
         });
      });

      document.addEventListener('DOMContentLoaded', function() {
         var radioButtons = document.querySelectorAll('.form-check-input');
         var reportButton = document.getElementById('reportButton');

         radioButtons.forEach(function(radioButton) {
            radioButton.addEventListener('change', function() {
               if (this.checked) {
                  // 라디오 버튼이 선택되면 버튼의 스타일 변경
                  reportButton.style.backgroundColor = '#6387A6';
                  reportButton.style.borderColor = '#6387A6';
               } else {
                  // 라디오 버튼이 선택되지 않았을 때 버튼의 스타일 초기화
                  reportButton.style.backgroundColor = '#B5B5B5';
                  reportButton.style.borderColor = '#B5B5B5';
               }
            });
         });
      });

      function openImageUploader() {
         // 파일 업로드 창
         var fileInput = document.createElement('input');
         fileInput.type = 'file';
         fileInput.accept = 'image/*';
         fileInput.click();

         // 파일이 선택되면 해당 파일을 처리하는 함수를 호출
         fileInput.addEventListener('change', function() {
            handleFileUpload(fileInput.files[0]);
         });
      }

      function handleFileUpload(file) {
         // 파일 업로드를 처리 부분
         console.log('Selected file:', file);
      }

      function moveToChatting(proId, serviceCategoryId) {
          if (!proId) {
              alert("pro_id가 제공되지 않았습니다.");
              return; // pro_id가 없으면 함수 실행을 중지
          }
          var url = `${root}/chatting?pro_id=${proId}`;
          if (serviceCategoryId !== undefined && serviceCategoryId !== null) {
              url += `&s=${serviceCategoryId}`;
          }
          window.location.href = url;
      }
     
      
   </script>
   
   <script>
       var stompClient = null;
       var CURRENT_USER_ID = '${currentUserId}'; 
       var USER_TYPE = '${userType}'; // 사용자 유형 받기
       var roomId = '${roomId}';
       console.log("현재 채팅방 ID: ", roomId);
       
       function connect() {
          var socket = new SockJS('/ws');
           stompClient = Stomp.over(socket);
   
           stompClient.connect({}, function(frame) {
               console.log('WebSocket 연결됨: ' + frame);
               
               
               
               // 메시지 주제 구독
               
               console.log("현재 로그인 된 ID : " + CURRENT_USER_ID);
             
               
               stompClient.subscribe('/topic/messages', function(messageOutput) {
            	    try {
            	        var message = JSON.parse(messageOutput.body);
            	        console.log('수신 메시지: ', message);

            	        // 현재 로그인한 사용자가 보낸 메시지는 화면에 표시하지 않습니다.
            	        if(message.senderId !== CURRENT_USER_ID) {
            	            displayMessage(message);
            	        }
            	    } catch (error) {
            	        console.error('메시지 처리 중 에러 발생', error);
            	    }
            	});
   
           }, function(error) {
               // 연결 에러 핸들링
               console.error('STOMP 연결 실패', error);
           });
       } 
       
       
       function displayMessage(message) {
    	    var chatElement = document.getElementById('chat');
    	    var messageContainer = document.createElement('div');
    	    messageContainer.className = message.senderId === CURRENT_USER_ID ? 'myMessage' : 'otherMessage';

    	    var textElement = document.createElement('span');
    	    textElement.textContent = message.text;

    	    var timeElement = document.createElement('div');
    	    var currentTime = new Date();
    	    var hours = currentTime.getHours().toString().padStart(2, '0');
    	    var minutes = currentTime.getMinutes().toString().padStart(2, '0');
    	    var timeString = hours + ':' + minutes;
    	    timeElement.textContent = timeString;

    	    messageContainer.appendChild(textElement);
    	    messageContainer.appendChild(timeElement);
    	    chatElement.appendChild(messageContainer);
    	    chatElement.scrollTop = chatElement.scrollHeight; // 스크롤을 최신 메시지 위치로 이동
    	}



   
       
       function sendMessage() {
    	    var messageInput = document.getElementById('messageInput');
    	    var messageContent = messageInput.value.trim();
    	    
    	    if(messageContent && stompClient) {
    	        var chatMessage = {
    	            senderId: CURRENT_USER_ID,
    	            text: messageContent
    	        };
    	        
    	        // 송신한 메시지를 화면에 표시
    	        displayMessage(chatMessage);
    	        
    	        // WebSocket을 통해 메시지 송신
    	        stompClient.send('/app/sendMessage', {}, JSON.stringify(chatMessage));
    	        
    	        // 메시지 입력창 비우기
    	        messageInput.value = '';
    	    }
    	}

   
       function updateConversation(messages) {
           var chatElement = document.getElementById('chat');
           messages.forEach(function (message) {
               var messageElement = document.createElement('div');
               messageElement.textContent = message;
               chatElement.appendChild(messageElement);
               //console.log("화면에 메시지 표시됨: ", message); // 화면에 메시지 표시 로그
           });
           chatElement.scrollTop = chatElement.scrollHeight;
       }
   
       function displayNotification(notification) {
           var notificationElement = document.getElementById('notification');
           notificationElement.textContent = notification;
           notificationElement.className = 'notification'; // 알림 스타일 추가
       }
      /*  //여기서부터 이미지
       function openImageUploader() {
    	    // 파일 업로드 창
    	    var fileInput = document.createElement('input');
    	    fileInput.type = 'file';
    	    fileInput.accept = 'image/*';
    	    fileInput.click();

    	    // 파일이 선택되면 해당 파일을 처리하는 함수를 호출
    	    fileInput.addEventListener('change', function() {
    	        handleFileUpload(fileInput.files[0]);
    	    });
    	}

    	function handleFileUpload(file) {
    	    // 파일 업로드를 처리 부분
    	    console.log('Selected file:', file);

    	    // 이미지 파일을 화면에 표시하는 기능 추가
    	    displayImage(file);
    	}

    	function displayImage(file) {
    	    var chatElement = document.getElementById('chat');
    	    var imageContainer = document.createElement('div');
    	    imageContainer.className = 'messageContainer';

    	    var imageElement = document.createElement('img');
    	    imageElement.src = URL.createObjectURL(file);
    	    imageElement.style.maxWidth = '200px'; // 이미지의 최대 너비 설정

    	    var currentTime = new Date();
    	    var hours = currentTime.getHours().toString().padStart(2, '0');
    	    var minutes = currentTime.getMinutes().toString().padStart(2, '0');
    	    var timeString = hours + ':' + minutes;

    	    var timeElement = document.createElement('div');
    	    timeElement.textContent = timeString;

    	    imageContainer.appendChild(imageElement);
    	    imageContainer.appendChild(timeElement);

    	    chatElement.appendChild(imageContainer);
    	    chatElement.scrollTop = chatElement.scrollHeight;
    	} */

   
       // 페이지 로드 시 웹소켓 연결을 시작하고, 이벤트 리스너를 추가
       window.onload = function() {
           connect();
           document.getElementById('sendButton').addEventListener('click', sendMessage);
           document.getElementById('messageInput').addEventListener('keydown', function(event) {
               if (event.key === 'Enter') {
                   sendMessage();
                   event.preventDefault(); // 폼 제출을 막아 엔터키로 인한 새로고침 방지
               }
           });
       };
       </script>
    <script>
   var jq = $.noConflict();
</script>
</body>
</html>