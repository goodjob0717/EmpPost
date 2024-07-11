<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 content</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/content.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css' />">

<script>
    $(document).ready(function(){
        $('header, nav').hover(function(){
            $('.submenu').stop(true, true).slideDown();
        }, function(){
            $('.submenu').stop(true, true).slideUp();
        });
    });
    </script>
</head>
<body>
	<div class="wrap">
	 <div class="main-content">
	        <h2>채용공고</h2>
	        <div class="table-container">
	        <table class="custom-table">
	            <tr style="border: 1px solid gray;">
	                <td>
	        <div class="company-posting" data-company-id="1">
	            <strong>ABC 주식회사</strong>
	            <button class="btn scrap-btn">
	                <i class="fas fa-heart"></i> 관심기업
	            </button>
	        

	        <script>
	            document.addEventListener('DOMContentLoaded', function() {
	            const scrapButtons = document.querySelectorAll('.scrap-btn');
	    
	            scrapButtons.forEach(button => {
	                const companyId = button.parentElement.getAttribute('data-company-id');
	                const isScrapped = localStorage.getItem(`scrapped_company_${companyId}`) === 'true';
	    
	                // 초기 스크랩 상태 설정
	                if (isScrapped) {
	                    button.querySelector('i').classList.add('scrapped');
	                }
	    
	                // 클릭 이벤트 리스너 추가
	                button.addEventListener('click', function() {
	                    const isCurrentlyScrapped = button.querySelector('i').classList.contains('scrapped');
	    
	                    // 스크랩 상태 토글
	                    if (isCurrentlyScrapped) {
	                        button.querySelector('i').classList.remove('scrapped');
	                        localStorage.setItem(`scrapped_company_${companyId}`, 'false');
	                        alert('관심 기업이 해제되었습니다.');
	                    } else {
	                        button.querySelector('i').classList.add('scrapped');
	                        localStorage.setItem(`scrapped_company_${companyId}`, 'true');
	                        alert('관심 기업으로 등록되었습니다.');
	                    }
	                });
	            });
	        });
	        </script>

	    
	        <h3 class="company-title">ABC 주식회사 프론트엔드 개발자 신입/경력 채용</h3>
	    </td>
	        <td rowspan="2">
	        <div class="company-info">
	            <div class="item">
	                <b style="font-size: 20px;">기업이미지</b><br>
	                <b>기업정보</b><br>
	                <table>
	                    <tr>
	                        <td><b>산업(업종)</b></td>
	                        <td>응용 소프트웨어 개발</td>
	                    </tr>
	                    <tr>
	                        <td><b>사원수</b></td>
	                        <td>15,681명</td>
	                    </tr>
	                    <tr>
	                        <td><b>설립년도</b></td>
	                        <td>2000년</td>
	                    </tr>
	                    <tr>
	                        <td><b>기업형태</b></td>
	                        <td>중견기업</td>
	                    </tr>
	                    <tr>
	                        <td><b>주소</b></td>
	                        <td>서울시 강남구</td>
	                    </tr>
	                    <tr>
	                        <td><b>이메일</b></td>
	                        <td>abc@abcd.com</td>
	                    </tr>
	                    <tr>
	                        <td> <button class="btnc" onclick="addMarker()">기업정보></button></td>
	                        <td> <button class="btnc" onclick="addMarker()">진행중인 채용공고보기></button></td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	    </td>
	    </tr>
	    <tr>
	        <td>
	            <div class="company-container">
	                <div class="item">
	                    <b>지원자격</b><br>
	                    <table>
	                        <tr>
	                            <td><b>경력</b></td>
	                            <td>신입/경력</td>
	                        </tr>
	                        <tr>
	                            <td><b>학력</b></td>
	                            <td>무관</td>
	                        </tr>
	                        <tr>
	                            <td><b>스킬</b></td>
	                            <td>ASP, API, CSS, HTML, JAVA, Javascript, JSP, MySQL, Oracle, Spring Boot</td>
	                        </tr>
	                    </table>
	                </div>
	             <!-- <script>
	                document.addEventListener('DOMContentLoaded', function() {
	                    // 예시 데이터 (실제로는 서버에서 데이터를 가져와야 함)
	                    const companyData = {
	                        name: 'ABC 주식회사',
	                        employeeCount: 100,
	                        address: '서울시 강남구'
	                    };
	                
	                    // 기업 정보 채우기
	                    document.getElementById('company-name').innerText = `기업명: ${companyData.name}`;
	                    document.getElementById('company-employee').innerText = `직원수: ${companyData.employeeCount}명`;
	                    document.getElementById('company-address').innerText = `주소: ${companyData.address}`;
	                });
	                </script> -->

	                <div class="item">
	                    <b>근무조건</b><br>
	                    <table>
	                        <tr>
	                            <td><b>고용형태</b></td>
	                            <td>정규직/계약직</td>
	                        </tr>
	                        <tr>
	                            <td><b>급여</b></td>
	                            <td>회사내규에 따름 - 면접 후 결정</td>
	                        </tr>
	                        <tr>
	                            <td><b>지역</b></td>
	                            <td>서울시
	                                <button class="btnc" onclick="addMarker()">지도 보기></button>
	                            </td>
	                        </tr>
	                    </table>
	                </div>
	                </div>
	            </div>
	        </td>
	    </tr>
	</div>
	</table>
	</div>

	<div class="job-actions">
	    <div class="job-action">
	    <a class="resume" href="/job/view/1">지원하기</a>
	    <button class="scrap-button" data-job-id="1">
	        <i class="fas fa-star"></i>스크랩
	    </button>
	</div>
	    <br>

	    <script>
	        document.addEventListener('DOMContentLoaded', function() {
	            const scrapButtons = document.querySelectorAll('.scrap-button');

	            scrapButtons.forEach(button => {
	                const jobId = button.getAttribute('data-job-id');
	                const isScrapped = localStorage.getItem(`scrapped_job_${jobId}`) === 'true';

	                // 초기 스크랩 상태 설정
	                if (isScrapped) {
	                    button.classList.add('scrapped');
	                }

	                // 클릭 이벤트 리스너 추가
	                button.addEventListener('click', function() {
	                    const isCurrentlyScrapped = button.classList.contains('scrapped');

	                    // 스크랩 상태 토글
	                    if (isCurrentlyScrapped) {
	                        button.classList.remove('scrapped');
	                        localStorage.setItem(`scrapped_job_${jobId}`, 'false');
	                        alert('스크랩이 해제되었습니다.');
	                    } else {
	                        button.classList.add('scrapped');
	                        localStorage.setItem(`scrapped_job_${jobId}`, 'true');
	                        alert('스크랩되었습니다.');
	                    }
	                });
	            });
	        });
	    </script>

	<script>
	    let map;

	    function initMap() {
	        // 초기 위치 설정 (서울을 기준으로 예시)
	        const seoul = { lat: 37.5665, lng: 126.9780 };
	        map = new google.maps.Map(document.getElementById("map"), {
	            center: seoul,
	            zoom: 8,
	        });

	        // 아이콘 추가
	        const icon = {
	            url: 'path_to_your_icon.png', // 아이콘 이미지 경로
	            size: new google.maps.Size(32, 32), // 아이콘 크기
	            origin: new google.maps.Point(0, 0), // 이미지의 왼쪽 상단 위치
	            anchor: new google.maps.Point(16, 16) // 이미지를 마커 위치에 정렬할 때 사용할 앵커 지점
	        };

	        const marker = new google.maps.Marker({
	            position: seoul,
	            map: map,
	            title: "서울",
	            icon: icon,
	        });
	    }
	</script>


	        <!-- 여기서 YOUR_API_KEY는 본인이 발급받은 Google Maps API 키입니다. -->
	        <!-- <script async defer
	        src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap">
	            let map;
	            let marker;

	            function initMap() {
	                // 초기 위치 설정 (서울을 기준으로 예시)
	                const seoul = { lat: 37.5665, lng: 126.9780 };
	                map = new google.maps.Map(document.getElementById("map"), {
	                    center: seoul,
	                    zoom: 8,
	                });

	                // 마커 추가
	                marker = new google.maps.Marker({
	                    position: seoul,
	                    map: map,
	                    title: "서울",
	                    icon: {
	                        url: "https://maps.google.com/mapfiles/ms/icons/blue-dot.png", // 아이콘 URL
	                    },
	                });
	            }
	        </script> -->

	         <!-- 탭 버튼 -->
	    <button id="tab1" class="tab-button active" data-sort="all">상세정보</button>
	    <button id="tab2" class="tab-button" data-sort="application">접수기간/방법</button>
	    <button id="tab3" class="tab-button" data-sort="recommendation">추천공고</button>


	        <script>

	            // JavaScript로 초기 상세정보 버튼 bold 처리
	            document.addEventListener('DOMContentLoaded', function() {
	                document.getElementById('tab1').classList.add('active');
	            });

	            // JavaScript로 클릭 이벤트 처리
	            const tabButtons = document.querySelectorAll('.tab-button');

	            tabButtons.forEach(button => {
	            button.addEventListener('click', () => {
	                // 모든 탭 버튼에서 active 클래스 제거
	                tabButtons.forEach(btn => btn.classList.remove('active'));
	                
	                // 클릭한 탭 버튼에 active 클래스 추가
	                button.classList.add('active');
	                });
	            });
	        </script>

	<div class="job-content">
	        <div class="job-description">
	            <h2>직무 내용</h2>
	            <p>ABC 기술 주식회사에서는 프론트 엔드 개발자를 모집합니다. 이 직무는...</p>
	        </div>
	        <div class="requirements">
	            <h2>자격 요건</h2>
	            <ul>
	                <li>신입 지원은 포트폴리오 필수</li>
	                <li>웹 개발 경력 5년 이상(경력자 일시)</li>
	                <li>JavaScript, HTML, CSS 능숙</li>
	                <li>React 또는 Angular 프레임워크 경험 우대</li>
	            </ul>
	        </div>
	        <div class="how-to-apply">
	            <h2>지원 방법</h2>
	            <p>지원자는 이력서를 양식에 맞춰 제출해주시기 바랍니다.</p>
	        </div>

	        <!-- 접수기간/방법 탭 -->
	        <div id="tab2-content" class="tab-content">
	           <div class="item">
	               <b>접수기간</b><br>
	               <p>2024년 7월 1일부터 2024년 7월 15일까지</p>
	           </div>
	           <div class="item">
	               <b>접수방법</b><br>
	               <p>온라인 지원서 작성 후 제출</p>
	           </div>
	        <!-- 추천공고 탭 -->
	        <div id="tab3-content" class="tab-content">
	            <div class="recommended-job">
	                <h5>추천 공고</h5>
	                <p>XYZ 기술 주식회사에서는 백엔드 개발자를 모집합니다. 자세한 정보는 <a href="#">링크</a>에서 확인하세요.</p>
	            </div>
	            <div class="recommended-job">
	                <h5>추천 공고</h5>
	                <p>DEF 소프트웨어에서는 데이터 분석가를 모집합니다. 자세한 정보는 <a href="#">링크</a>에서 확인하세요.</p>
	            </div>
	       </div>
	    </div>
	</div>
	</div>
  </div>
<!--    <%@ include file="footer.jsp" %>-->
</body>
</html>