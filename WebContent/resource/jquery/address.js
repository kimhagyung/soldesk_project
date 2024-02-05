
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
    var mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 초기 중심좌표
        level: 6 // 지도의 확대 레벨
    };

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var marker; // 마커 변수 선언
    var circle; // 원 변수 선언
    
    var circle = new kakao.maps.Circle({
        center: new kakao.maps.LatLng(33.450701, 126.570667),  // 원의 중심좌표입니다 
        radius: 1000, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 1, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed', // 선의 스타일입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.7  // 채우기 불투명도입니다   
    });
    
 	// 마커를 생성하고 지도에 표시합니다
    marker = new kakao.maps.Marker({
        map: map,
        position: circle.getPosition()
    });

    // 지도에 원을 표시합니다 
    circle.setMap(map);

    // 실행 가능 여부를 나타내는 변수
    var execDaumPostcodeEnabled = false;

    // 우편번호 검색 함수
    function sample6_execDaumPostcode() {
        if (execDaumPostcodeEnabled) {
            new daum.Postcode({
                oncomplete: function (data) {
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    if (data.userSelectedType === 'R') {
                        addr = data.roadAddress;
                    } else {
                        addr = data.jibunAddress;
                    }

                    if (data.userSelectedType === 'R') {
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                        // 기존 마커와 원을 지우기
                        if (marker) {
                            marker.setMap(null);
                        }

                        if (circle) {
                            circle.setMap(null);
                        }

                        // 주소를 입력받아 지도를 업데이트하는 함수 호출
                        updateMapWithAddress(addr);
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 주소 값을 설정하고 입력 필드에 포커스
                    document.getElementById('sample6_address').value = addr;
                    document.getElementById('sample6_address').focus();
                }
            }).open();
        }
    }

    // 입력된 주소로 지도를 업데이트하는 함수
    function updateMapWithAddress(address) {
        // 주소를 좌표로 변환
        var geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(address, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 지도의 중심과 마커 위치를 업데이트
                map.setCenter(coords);

                // 새로운 마커 생성 및 지도에 추가
                marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 새로운 원 생성 및 지도에 추가
                circle = new kakao.maps.Circle({
                    center: coords,
                    radius: 1000,
                    strokeWeight: 1,
                    strokeColor: '#75B8FA',
                    strokeOpacity: 1,
                    strokeStyle: 'dashed',
                    fillColor: '#CFE7FF',
                    fillOpacity: 0.5
                });

                circle.setMap(map);
            }
        });
    }

    // 수정 버튼을 누를 때 실행 가능 여부를 설정하는 함수
    function enableExecDaumPostcode() {
        execDaumPostcodeEnabled = true;
        sample6_execDaumPostcode();
    }

    // 초기화 함수 호출
    sample6_execDaumPostcode();
    