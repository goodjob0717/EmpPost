<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 리스트</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/list.css' />">
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
	 <div class="sidebar">
	        <div class="sidebar-header">
	            <a href="#"><b>지역별</b></a>
	            <a href="#"><b>직무별</b></a>
	            <a href="#"><b>역세권별</b></a>
	            <a href="#"><b>TOP100</b></a>
	        </div>
	    </div>

	    <div class="main-content">
	        <div class="choose-content">
	            <select id="optionSelect1" onchange="addOption('optionSelect1')">
	                <option value="경력선택">경력선택</option>
	                <option value="신입">신입</option>
	                <option value="1~3년">1~3년</option>
	                <option value="4~6년">4~6년</option>
	                <option value="경력무관">경력무관</option>
	            </select>
	        </div>

	        <div class="choose-content">
	            <select id="optionSelect2" onchange="addOption('optionSelect2')">
	                <option value="학력선택">학력선택</option>
	                <option value="고등학교졸업">고등학교졸업</option>
	                <option value="대학졸업(2,3년제)">대학졸업(2,3년제)</option>
	                <option value="대학교졸업(4년제)">대학교졸업(4년제)</option>
	                <option value="학력무관">학력무관</option>
	            </select>
	        </div>

	        <div class="choose-group">
	            <label for="optionSelectRegion"><b>지역 선택</b></label>
	            <select id="optionSelectRegion" onchange="addOption('optionSelectRegion')">
	                <option value="선택안함">선택안함</option>
	                <option value="서울">서울</option>
	                <option value="경기">경기</option>
	                <option value="부산">부산</option>
	                <option value="대구">대구</option>
	            </select>
	        </div>

	        <div class="choose-group">
	            <label for="optionSelectJob"><b>직무 선택</b></label>
	            <select id="optionSelectJob" onchange="addOption('optionSelectJob')">
	                <option value="선택안함">선택안함</option>
	                <option value="기획.전략">기획·전략</option>
	                <option value="개발.데이터">개발·데이터</option>
	                <option value="인사.HR">인사·HR</option>
	                <option value="마케팅.광고.MD">마케팅·광고·MD</option>
	                <option value="디자인">디자인</option>
	                <option value="운전.운송.배송">운전·운송·배송</option>
	                <option value="고객상담.TM">고객상담·TM</option>
	                <option value="법무.사무.총무">법무·사무·총무</option>
	                <option value="회계.세무">회계·세무</option>
	                <option value="물류.무역">물류·무역</option>
	                <option value="영업">영업</option>
	                <option value="금융.보험">금융·보험</option>
	            </select>
	        </div>
	       

	        <div class="choose-group">
	            <label for="optionSelectIndustry"><b>산업별 선택</b></label>
	            <select id="optionSelectIndustry" onchange="addOption('optionSelectIndustry')">
	                <option value="선택안함">선택안함</option>
	                <option value="IT">IT</option>
	                <option value="금융">금융</option>
	                <option value="의료">의료</option>
	                <option value="제조">제조</option>
	            </select>
	        </div>

	        <div class="choose-group">
	            <label for="optionSelectLocation"><b>역세권 선택</b></label>
	            <select id="optionSelectLocation" onchange="addOption('optionSelectLocation')">
	                <option value="선택안함">선택안함</option>
	                <option value="강남">강남</option>
	                <option value="홍대">홍대</option>
	                <option value="건대">건대</option>
	                <option value="잠실">잠실</option>
	            </select>
	        </div>

	        <div class="choose-group">
	            <label for="optionSelectSalary"><b>연봉별 선택</b></label>
	            <select id="optionSelectSalary" onchange="addOption('optionSelectSalary')">
	                <option value="선택안함">선택안함</option>
	                <option value="1000만원 이하">1000만원 이하</option>
	                <option value="2000만원 이하">2000만원 이하</option>
	                <option value="3000만원 이하">3000만원 이하</option>
	                <option value="4000만원 이상">4000만원 이상</option>
	            </select>
	        </div>

	        <div class="choose-group">
	            <label for="optionSelectPreference"><b>취업 우대사항 선택</b></label>
	            <select id="optionSelectPreference" onchange="addOption('optionSelectPreference')">
	                <option value="선택안함">선택안함</option>
	                <option value="어학자격증">어학자격증</option>
	                <option value="자격증 소지자">자격증 소지자</option>
	                <option value="경력우대">경력우대</option>
	                <option value="무경력 가능">무경력 가능</option>
	            </select>
	        </div>

	        <div class="search-bar">
	            <input type="text" id="search-keyword" placeholder="키워드를 입력하세요">
	            <button onclick="addKeyword()">키워드 추가</button>
	        </div>

	        <div class="option-container">
	            <!-- 선택된 옵션들이 여기에 동적으로 추가됩니다 -->
	        </div>

	        <div class="tab-container">
	            <div class="tabs">
	                <button class="tab-button active" data-sort="all">전체(54387):선택공고</button>
	                <div class="dropdown">
	                    <button class="dropbtn">▼ 최신순</button>
	                    <div class="dropdown-content">
	                        <a href="#" data-sort="latest">최신순</a>
	                        <a href="#" data-sort="closing">마감일순</a>
	                        <a href="#" data-sort="recommended">추천순</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    
	        <script>
	            document.addEventListener('DOMContentLoaded', function() {
	            const tabButtons = document.querySelectorAll('.tab-button');
	            const dropdownLinks = document.querySelectorAll('.dropdown-content a');

	            tabButtons.forEach(button => {
	                button.addEventListener('click', function() {
	                    tabButtons.forEach(btn => btn.classList.remove('active'));
	                    button.classList.add('active');
	                    // 여기에 선택된 탭에 따른 기능 추가
	                });
	            });

	            dropdownLinks.forEach(link => {
	                link.addEventListener('click', function(event) {
	                    event.preventDefault();
	                    const sortType = link.getAttribute('data-sort');
	                    // 여기에 선택된 정렬 타입에 따른 기능 추가
	                    console.log(`Sorting by: ${sortType}`);
	                });
	            });
	        });

	        </script>

	        <div class="job-lists">
	            <div class="job-list" data-list-id="1">
	                <div class="job-item">
	                    <div class="job-title">프론트엔드 개발자</div>
	                    <div class="company">ABC 주식회사</div>
	                    <div class="location">서울</div>
	                    <div class="job-actions">
	                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
	                        <button class="scrap-button" data-job-id="1">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	                <div class="job-item">
	                    <div class="job-title">백엔드 개발자</div>
	                    <div class="company">XYZ 기업</div>
	                    <div class="location">경기</div>
	                    <div class="job-actions">
	                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
	                        <button class="scrap-button" data-job-id="2">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="job-list" data-list-id="2">
	                <div class="job-item">
	                    <div class="job-title">데이터 분석가</div>
	                    <div class="company">123 데이터 연구소</div>
	                    <div class="location">부산</div>
	                    <div class="job-actions">
	                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
	                        <button class="scrap-button" data-job-id="3">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	                <div class="job-item">
	                    <div class="job-title">소프트웨어 엔지니어</div>
	                    <div class="company">456 소프트</div>
	                    <div class="location">대구</div>
	                    <div class="job-actions">
	                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
	                        <button class="scrap-button" data-job-id="4">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	            </div>
	            
	            <div class="job-list" data-list-id="3">
	                <div class="job-item">
	                    <div class="job-title">UI/UX 디자이너</div>
	                    <div class="company">789 디자인</div>
	                    <div class="location">인천</div>
	                    <div class="job-actions">
	                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
	                        <button class="scrap-button" data-job-id="5">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	                <div class="job-item">
	                    <div class="job-title">프로젝트 매니저</div>
	                    <div class="company">PM 솔루션</div>
	                    <div class="location">광주</div>
	                    <div class="job-actions">
	                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
	                        <button class="scrap-button" data-job-id="6">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
<!--			지원하기 파일업로드-->
<!-- 파일 업로드 모달 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <span class="close" onclick="closeFileUploader()">&times;</span>
            <h3>이력서 가져오기</h3>
        </div>
        <div class="modal-body">
            <form id="resumeForm" action="/upload" method="post" enctype="multipart/form-data">
                <input type="file" id="resumeFile" name="resumeFile" class="file-input">
            </form>
        </div>
        <div class="modal-footer">
            <button class="upload-button" onclick="uploadResume()">가져오기</button>
        </div>
    </div>
</div>

<!-- JavaScript 코드 -->
<script>
    // 파일 업로드 모달 열기
    function openFileUploader() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'block';
    }

    // 파일 업로드 모달 닫기
    function closeFileUploader() {
        var modal = document.getElementById('myModal');
        modal.style.display = 'none';
    }

    // 파일 업로드 함수
    function uploadResume() {
        var fileInput = document.getElementById('resumeFile');
        var formData = new FormData();
        formData.append('resumeFile', fileInput.files[0]);

        // 실제 파일 업로드 처리를 위해 AJAX 또는 fetch 등을 사용할 수 있습니다.
        // 여기서는 예시로 console에 파일 이름을 출력하고 모달을 닫습니다.
        console.log('선택된 파일:', fileInput.files[0].name);
        closeFileUploader();
    }
</script> <!-- 지원하기파일업로드끝-->
			
	        <!-- <div class="job-lists">
	    <c:forEach var="jobList" items="${jobLists}">
	        <div class="job-list" data-list-id="${jobList.id}">
	            <c:forEach var="job" items="${jobList.jobs}">
	                <div class="job-item">
	                    <div class="job-title">${job.title}</div>
	                    <div class="company">${job.company}</div>
	                    <div class="location">${job.location}</div>
	                    <div class="job-actions">
	                        <a class="resume" href="/job/view/${job.id}">지원하기</a>
	                        <button class="scrap-button" data-job-id="${job.id}">
	                            <i class="fas fa-star"></i>
	                        </button>
	                    </div>
	                </div>
	            </c:forEach>
	        </div>
	    </c:forEach>
	</div>
	-->

	        <!-- <div class="div_page"> 
	            <ul>
	                totalPage는 서버에서 계산된 전체 페이지 수를 나타내는 변수입니다.
	                c:forEach 태그는 JSTL(JavaServer Pages Standard Tag Library)에서 제공하는 반복문입니다.
	                <c:forEach begin="1" end="${totalPages}" var="page">
	                    <li>
	                        ?page=${page}은 페이지 링크를 동적으로 생성합니다.
	                        <a href="?page=${page}">${page}</a>
	                    </li>
	                </c:forEach>
	            </ul>
	        </div> 
	        -->
	        <div class="div_page">
	            <ul>
	                <li><a href="?page=1">1</a></li>
	                <li><a href="?page=2">2</a></li>
	                <li><a href="?page=3">3</a></li>
	                <li><a href="?page=4">4</a></li>
	                <li><a href="?page=5">5</a></li>
	                <li><a href="?page=5">Next></a></li>
	            </ul>
	        </div>
	        
	        
	    </div>   
	   </div>
	    <!-- 선택choose-group -->
		
	    <script>
	    function addOption(selectId) {
	        // 선택된 select 요소 가져오기
	        var selectElement = document.getElementById(selectId);

	        // 선택된 option의 값 가져오기
	        var selectedValue = selectElement.value;

	        // 선택된 option의 텍스트 가져오기
	        var selectedText = selectElement.options[selectElement.selectedIndex].text;

	        // 결과를 표시할 div 요소 가져오기
	        var resultDiv = document.getElementById('selectedOptions');

	        // 새로운 option 생성 및 추가
	        if (selectedValue !== "선택안함") {
	            var newOption = document.createElement('div');
	            newOption.textContent = selectedText;
	            resultDiv.appendChild(newOption);
	        }
	    }

	        //  function addOption(selectId) {
	        //     const subCategorySelect = document.getElementById('subCategorySelect');
	        //     subCategorySelect.innerHTML = ''; // Clear previous options

	        //     const categories = {
	        //         "기획.전략": ["경영.비즈니스기획", "웹기획", "마케팅기획", "PL.PM.PO", "컨설턴트", "CEO.COO.CTO"],
	        //         "개발.데이터": ["백엔드개발자", "프론트엔드개발자", "웹개발자", "앱개발자", "시스템엔지니어", "네트워크엔지니어"]
	        //     };

	        //     const selectedCategory = document.getElementById(selectId).value;

	        //     if (categories[selectedCategory]) {
	        //         categories[selectedCategory].forEach(subCat => {
	        //             const option = document.createElement('option');
	        //             option.value = subCat;
	        //             option.textContent = subCat;
	        //             subCategorySelect.appendChild(option);
	        //         });
	        //         subCategorySelect.disabled = false;
	        //     } else {
	        //         const option = document.createElement('option');
	        //         option.value = "선택안함";
	        //         option.textContent = "선택안함";
	        //         subCategorySelect.appendChild(option);
	        //         subCategorySelect.disabled = true;
	        //     }
	        // }
	    </script>

	<script>
	    document.addEventListener('DOMContentLoaded', function() {
	        const jobLists = document.querySelectorAll('.job-list');

	        jobLists.forEach(jobList => {
	            const scrapButtons = jobList.querySelectorAll('.scrap-button');

	            scrapButtons.forEach(button => {
	                const jobId = button.getAttribute('data-job-id');
	                const isScrapped = localStorage.getItem(`scrapped_${jobId}`) === 'true';

	                // 초기 스크랩 상태 설정
	                if (isScrapped) {
	                    button.classList.add('scrapped');
	                } else {
	                    button.classList.remove('scrapped');
	                }

	                // 클릭 이벤트 리스너 추가
	                button.addEventListener('click', function() {
	                    const isCurrentlyScrapped = button.classList.contains('scrapped');

	                    // 스크랩 상태 토글
	                    if (isCurrentlyScrapped) {
	                        button.classList.remove('scrapped');
	                        localStorage.setItem(`scrapped_${jobId}`, 'false');
	                        alert('스크랩이 취소되었습니다.');
	                    } else {
	                        button.classList.add('scrapped');
	                        localStorage.setItem(`scrapped_${jobId}`, 'true');
	                        alert('스크랩 되었습니다.');
	                    }
	                });
	            });
	        });
	    });
	</script>

	    
	    <script>    

	        // 선택된 옵션들을 관리하는 배열
	        let selectedOptions = [];

	        // 옵션을 추가하는 함수
	        function addOption(selectId) {
	            const optionSelect = document.getElementById(selectId);
	            const optionName = optionSelect.options[optionSelect.selectedIndex].value;

	            // 중복 추가 방지
	            if (!selectedOptions.includes(optionName) && optionName !== '경력선택' && optionName !== '학력선택' && optionName !== '') {
	                selectedOptions.push(optionName);

	                const optionContainer = document.querySelector('.option-container');
	                const newOptionId = "option" + selectedOptions.length;
	                const newOptionItem = document.createElement("div");
	                newOptionItem.classList.add("option-item");
	                newOptionItem.id = newOptionId;
	                newOptionItem.innerHTML = `
	                    <span>${optionName}</span>
	                    <button class="btn-x" onclick="removeOption('${newOptionId}')">x</button>
	                `;
	                optionContainer.appendChild(newOptionItem);
	            }
	        }

	        // 선택된 옵션을 삭제하는 함수
	        function removeOption(optionId) {
	            const optionElement = document.getElementById(optionId);
	            if (optionElement) {
	                const optionIndex = selectedOptions.indexOf(optionElement.textContent.trim());
	                selectedOptions.splice(optionIndex, 1);
	                optionElement.remove();
	            }
	        }

	        // 키워드를 선택된 옵션에 추가하는 함수
	        function addKeyword() {
	            const keyword = document.getElementById("search-keyword").value.trim();
	            if (keyword !== "" && !selectedOptions.includes(keyword)) {
	                selectedOptions.push(keyword);

	                const optionContainer = document.querySelector('.option-container');
	                const newOptionId = "option" + selectedOptions.length;
	                const newOptionItem = document.createElement("div");
	                newOptionItem.classList.add("option-item");
	                newOptionItem.id = newOptionId;
	                newOptionItem.innerHTML = `
	                    <span>${keyword}</span>
	                    <button class="btn-x" onclick="removeOption('${newOptionId}')">x</button>
	                `;
	                optionContainer.appendChild(newOptionItem);

	                // Clear search keyword input
	                document.getElementById("search-keyword").value = "";
	            } else {
	                alert("이미 선택된 옵션이거나 입력된 값이 비어 있습니다.");
	            }
	        }
	    </script>
<!--    <%@ include file="footer.jsp" %>-->
</body>
</html>