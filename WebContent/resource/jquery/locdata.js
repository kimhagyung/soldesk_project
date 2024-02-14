var cityDatas = {
   서울: ['강남구', '강동구', '강북구', '강서구', '관악구', '광진구', '구로구', '금천구', '노원구', '도봉구', '동대문구', '동작구', '마포구', '서대문구', '서초구', '성동구', '성북구', '송파구', '양천구', '영등포구', '용산구', '은평구', '종로구', '중구', '중랑구'],
   부산: ['강서구', '금정구', '남구', '동구', '동래구', '부산진구', '북구', '사상구', '사하구', '서구', '수영구', '연제구', '영도구', '중구', '해운대구'],
   인천: ['계양구', '남동구', '동구', '미추홀구', '부평구', '서구', '연수구', '중구'],
   대전: ['대덕구', '동구', '서구', '유성구', '중구'],
   대구: ['남구', '달서구', '달서군', '동구', '북구', '서구', '수성구', '중구'],
   울산: ['남구', '동구', '북구', '중구', '울주군'],
   광주: ['광산구', '남구', '동구', '북구', '서구'],
   제주도: ['서귀포시', '제주시'],
   세종: ['세종특별자치시'],
   경기도: ['고양시', '과천시', '광명시', '광주시', '구리시', '군포시', '김포시', '남양주시', '동두천시', '부천시', '성남시', '수원시', '시흥시', '안산시', '안성시', '안양시', '양주시', '여주시', '오산시', '용인시', '의왕시', '의정부시', '이천시', '파주시', '평택시', '포천시', '하남시', '화성시', '가평군', '양평군', '연천군'],
   강원도: ['강릉시', '동해시', '삼척시', '속초시', '원주시', '춘천시', '태백시', '고성군', '양구군', '양양군', '영월군', '인제군', '정선군', '철원군', '평창군', '홍천군', '화천군', '횡성군'],
   충청북도: ['제천시', '청주시', '충주시', '괴산군', '단양군', '보은군', '영동군', '옥천군', '음성군', '증평군', '진천군'],
   충청남도: ['계룡시', '공주시', '논산시', '당진시', '보령시', '서산시', '아산시', '천안시', '금산군', '부여군', '서천군', '예산군', '청양군', '태안군', '홍성군'],
   경상북도: ['경산시', '경주시', '구미시', '김천시', '문경시', '상주시', '안동시', '영주시', '영천시', '포항시', '고령군', '군위군', '봉화군', '성주군', '영덕군', '영양군', '예천군', '울릉군', '울진군', '의성군', '청도군', '청송군', '칠곡군'],
   경상남도: ['거제시', '김해시', '밀양시', '사천시', '양산시', '진주시', '창원시', '통영시', '거창군', '고성군', '남해군', '산청군', '의령군', '창녕군', '하동군', '함안군', '함양군', '합천군'],
   전라북도: ['군산시', '김제시', '남원시', '익산시', '전주시', '정읍시', '고창군', '무주군', '부안군', '순창군', '완주군', '임실군', '장수군', '진안군'],
   전라남도: ['광양시', '나주시', '목포시', '순천시', '여수시', '강진군', '고흥군', '곡성군', '구례군', '담양군', '무안군', '보성군', '신안군', '영광군', '영암군', '완도군', '장성군', '장흥군', '진도군', '함평군', '해남군', '화순군']
};

var categoryData = {
   자격증시험: ['스포츠지도사 준비', '한국어능력시험 준비', '한국사능력시험 준비', '정보처리기사 준비', '컴퓨터활용능력 준비'],
   인테리어: ['가구리폼', '욕실/화장실 리모델링', '도배시공', '주방 리모델링', '조명 인테리어'],
   가전제품: ['전자제품 수리', '컴퓨터 수리', '비데 렌탈/구입/청소', '에어컨 설치 및 수리', '냉장고 설치 및 수리'],
   청소: ['에어컨 청소', '바퀴벌레 퇴치', '가구 청소', '계단/화장실 청소', '화재 복구/청소'],
   번역: ['한문 번역', '영어 번역', '독일어 번역', '일본어/일어 번역', '베트남어 번역'],
   문서: ['문서/글 작성', 'PPT 제작', '자막 제작', '사업계획서 제작', '교정/교열'],
   개발외주: ['웹 개발', '게임 개발', 'iOS 개발', 'QA 테스트', 'ERP 개발'],
   반려동물: ['반려견 산책', '반려동물 미용', '반려동물 수제간식 만들기', '반려동물 훈련', '반려동물 장례'],
};
