<!-- 서류 섹션 스크립트 -->

    document.getElementById('document-fileInput').addEventListener('change', function () {
        var currentImageCount = document.querySelectorAll('.uploaded-document-image').length;
        if (currentImageCount >= 5) {
            alert('최대 5장까지만 첨부할 수 있습니다.');
            return;
        }

        var reader = new FileReader();
        reader.onload = function (e) {
            var newImage = document.createElement('img');
            newImage.src = e.target.result;
            newImage.alt = 'Uploaded Document';
            newImage.className = 'uploaded-document-image';
            newImage.style.width = '100px';
            newImage.style.height = '100px';
            newImage.style.border = '1px dashed #d2d2d2';
            newImage.style.borderRadius = '10px';
            newImage.style.marginRight = '5px';

            var documentContainer = document.getElementById('document-btn-container');
            documentContainer.appendChild(newImage);

            // 이미지 삭제 기능 추가
            newImage.addEventListener('click', function () {
                documentContainer.removeChild(newImage);
            });
        };

        reader.readAsDataURL(this.files[0]);
    });

    document.getElementById('document-btn').addEventListener('click', function () {
        document.getElementById('document-fileInput').click();
    });


 // 2. 아숨 활동명
        // input 글자수 세기
        function countChars(textAreaId, charCountId) {
            var textarea = document.getElementById(textAreaId);
            var charCountSpan = document.getElementById(charCountId);
            var charCount = textarea.value.length;
            charCountSpan.textContent = charCount;
        }

        // 이벤트 리스너 등록
        document.getElementById('editBtn1').addEventListener('click', function () {
            // "수정" 버튼 클릭 시 처리
            document.getElementById('descriptionContainer1').classList.add('d-none');
            document.getElementById('editContainer1').classList.remove('d-none');
            document.getElementById('editTextArea1').value = document.getElementById('descriptionContainer1').innerText.trim();
            document.getElementById('editTextArea1').focus();
            document.getElementById('editBtn1').classList.add('d-none');
            document.getElementById('saveBtn1').classList.remove('d-none');
            countChars('editTextArea1', 'charCount1');
        });

        document.getElementById('saveBtn1').addEventListener('click', function () {
            // "저장" 버튼 클릭 시 처리
            var editedText = document.getElementById('editTextArea1').value;
            document.getElementById('descriptionContainer1').classList.remove('d-none');
            document.getElementById('editContainer1').classList.add('d-none');
            document.getElementById('descriptionContainer1').getElementsByTagName('p')[0].innerText = editedText;
            document.getElementById('editBtn1').classList.remove('d-none');
            document.getElementById('saveBtn1').classList.add('d-none');

            // 최대 글자 수 초과 시 입력 막기
            var maxLength = parseInt(document.getElementById('editTextArea1').getAttribute('maxlength'));
            if (editedText.length > maxLength) {
                document.getElementById('editTextArea1').value = editedText.substring(0, maxLength);
            }

            countChars('editTextArea1', 'charCount1');
        });

        document.addEventListener('DOMContentLoaded', function () {
            // 초기에 텍스트 길이를 가져와서 표시
            var initialText = document.getElementById('descriptionContainer1').innerText.trim();
            var maxLength = parseInt(document.getElementById('editTextArea1').getAttribute('maxlength'));
            var initialCharCount = initialText.length;
            document.getElementById('charCount1').innerText = initialCharCount + '/' + maxLength + ' 자';

            document.getElementById('editTextArea1').addEventListener('input', function () {
                countChars('editTextArea1', 'charCount1');
            });
        });
        
// 4. 제공 서비스
$(function () {
    // selectCategoryBtn 버튼에 대한 클릭 이벤트 핸들러 추가
    $("#selectCategoryBtn").click(function () {
        // 선택된 리스트 항목의 텍스트 내용 가져오기
        var selectedCategory = $(".list-group-item.selected").text();

        // 카테고리가 선택되었는지 확인
        if (selectedCategory) {
            console.log('선택된 카테고리:', selectedCategory);
            // 모달 닫기
            $("#exampleModal").modal('hide');

         // 동적으로 리스트 아이템 생성 및 추가 (제공 서비스 섹션에만 추가)
            var newItem = $("<li class='list-group-item d-flex justify-content-between align-items-center' id='providedServiceItem'>" + selectedCategory + "<button class='btn btn-sm btn-secondary ml-auto' onclick='removeService(this)' style='display: inline-block;'>삭제</button></li>");

            // 클릭된 항목에 "selected" 클래스 추가
            newItem.find("button").click(function () {
                newItem.remove();
            });

            // 리스트에 추가 (제공 서비스 섹션에만 추가)
            $(".list-group-provided-services").append(newItem);
        } else {
            console.log('카테고리를 선택하세요.');
        }
    });

    // list-group 아이템에 대한 클릭 이벤트 핸들러 추가하여 "selected" 클래스를 토글함
    $(".list-group-item").click(function () {
        // 모든 항목에서 "selected" 클래스 제거
        $(".list-group-item").removeClass("selected");

        // 클릭된 항목에 "selected" 클래스 추가
        $(this).addClass("selected");
    });
    
    $(function () {
        // 수정 버튼 클릭 시 처리
        $("#editBtn4").click(function () {
            // 수정 버튼 클릭 시 처리
            $(this).addClass("d-none");
            $("#saveBtn4").removeClass("d-none");
            $(".deleteBtn").addClass("d-none");
            // 수정 모드일 때 입력창 나타남
            $(".list-group-provided-services .btn-secondary").attr("disabled", false).show();
            // 서비스 추가 버튼 나타남
            $(".list-group-item .categoryBtn").show();
        });

        // 저장 버튼 클릭 시 처리
        $("#saveBtn4").click(function () {
            // 저장 버튼 클릭 시 처리
            $("#editBtn4").removeClass("d-none");
            $(this).addClass("d-none");
            $(".deleteBtn").removeClass("d-none");
            // 저장 모드일 때 입력창 사라짐
            $(".list-group-provided-services .btn-secondary").attr("disabled", true).hide();
            // 서비스 추가 버튼 사라짐
            $(".list-group-item .categoryBtn").hide();
        });

        // 서비스 삭제 버튼 클릭 시 처리
        $(".deleteBtn").click(function () {
            $(this).closest("li").remove();
        });
    });

});

// 제공 서비스 섹션에서 삭제 버튼 클릭 시 해당 li 제거
function removeService(button) {
    $(button).closest("li").remove();
}


    
// 5. 고수 서비스 상세설명
    // textarea 글자수 세기
    function countChars(textAreaId, charCountId) {
        var textarea = document.getElementById(textAreaId);
        var charCountSpan = document.getElementById(charCountId);
        var charCount = textarea.value.length;
        charCountSpan.textContent = charCount;
    }

    // 이벤트 리스너 등록
    document.getElementById('editBtn2').addEventListener('click', function () {
        // "수정" 버튼 클릭 시 처리
        document.getElementById('descriptionContainer2').classList.add('d-none');
        document.getElementById('editContainer2').classList.remove('d-none');
        document.getElementById('editTextArea2').value = document.getElementById('descriptionContainer2').innerText.trim();
        document.getElementById('editTextArea2').focus();
        document.getElementById('editBtn2').classList.add('d-none');
        document.getElementById('saveBtn2').classList.remove('d-none');
        countChars('editTextArea2', 'charCount2');
    });

    document.getElementById('saveBtn2').addEventListener('click', function () {
        // "저장" 버튼 클릭 시 처리
        var editedText = document.getElementById('editTextArea2').value;
        document.getElementById('descriptionContainer2').classList.remove('d-none');
        document.getElementById('editContainer2').classList.add('d-none');
        document.getElementById('descriptionContainer2').getElementsByTagName('p')[0].innerText = editedText;
        document.getElementById('editBtn2').classList.remove('d-none');
        document.getElementById('saveBtn2').classList.add('d-none');

        // 최대 글자 수 초과 시 입력 막기
        var maxLength = parseInt(document.getElementById('editTextArea2').getAttribute('maxlength'));
        if (editedText.length > maxLength) {
            document.getElementById('editTextArea2').value = editedText.substring(0, maxLength);
        }

        countChars('editTextArea2', 'charCount2');
    });

    document.addEventListener('DOMContentLoaded', function () {
        // 초기에 텍스트 길이를 가져와서 표시
        var initialText = document.getElementById('descriptionContainer2').innerText.trim();
        var maxLength = parseInt(document.getElementById('editTextArea2').getAttribute('maxlength'));
        var initialCharCount = initialText.length;
        document.getElementById('charCount2').innerText = initialCharCount + '/' + maxLength + ' 자';

        document.getElementById('editTextArea2').addEventListener('input', function () {
            countChars('editTextArea2', 'charCount2');
        });
    });


// 8. 가격
    // textarea 글자수 세기
    function countChars(textAreaId, charCountId) {
        var textarea = document.getElementById(textAreaId);
        var charCountSpan = document.getElementById(charCountId);
        var charCount = textarea.value.length;
        charCountSpan.textContent = charCount;
    }

    // 이벤트 리스너 등록
    document.getElementById('editBtn3').addEventListener('click', function () {
        // "수정" 버튼 클릭 시 처리
        document.getElementById('descriptionContainer3').classList.add('d-none');
        document.getElementById('editContainer3').classList.remove('d-none');
        document.getElementById('editTextArea3').value = document.getElementById('descriptionContainer3').innerText.trim();
        document.getElementById('editTextArea3').focus();
        document.getElementById('editBtn3').classList.add('d-none');
        document.getElementById('saveBtn3').classList.remove('d-none');
        countChars('editTextArea3', 'charCount3');
    });

    document.getElementById('saveBtn3').addEventListener('click', function () {
        // "저장" 버튼 클릭 시 처리
        var editedText = document.getElementById('editTextArea3').value;
        document.getElementById('descriptionContainer3').classList.remove('d-none');
        document.getElementById('editContainer3').classList.add('d-none');
        document.getElementById('descriptionContainer3').getElementsByTagName('p')[0].innerText = editedText;
        document.getElementById('editBtn3').classList.remove('d-none');
        document.getElementById('saveBtn3').classList.add('d-none');

        // 최대 글자 수 초과 시 입력 막기
        var maxLength = parseInt(document.getElementById('editTextArea3').getAttribute('maxlength'));
        if (editedText.length > maxLength) {
            document.getElementById('editTextArea3').value = editedText.substring(0, maxLength);
        }

        countChars('editTextArea3', 'charCount3');
    });

    document.addEventListener('DOMContentLoaded', function () {
        // 초기에 텍스트 길이를 가져와서 표시
        var initialText = document.getElementById('descriptionContainer3').innerText.trim();
        var maxLength = parseInt(document.getElementById('editTextArea3').getAttribute('maxlength'));
        var initialCharCount = initialText.length;
        document.getElementById('charCount3').innerText = initialCharCount + '/' + maxLength + ' 자';

        document.getElementById('editTextArea3').addEventListener('input', function () {
            countChars('editTextArea3', 'charCount3');
        });
    });
