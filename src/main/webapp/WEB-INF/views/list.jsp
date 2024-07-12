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
				</script>

<!--			지원하기 파일업로드-->
<!-- 파일 업로드 모달 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeFileUploader()">&times;</span>
        <h3>이력서 선택</h3>
        <form id="resumeForm" enctype="multipart/form-data">
            <input type="file" id="resumeFile" name="resumeFile" class="file-input">
            <br>
            <input type="checkbox" id="resumeCheckbox1" name="resumeCheckbox1">
            <label for="resumeCheckbox1">이력서 파일 1: resume1.pdf</label><br>
            <input type="checkbox" id="resumeCheckbox2" name="resumeCheckbox2">
            <label for="resumeCheckbox2">이력서 파일 2: resume2.docx</label>
            <br>
            <button type="button" onclick="uploadResume()" style="background-color: rgb(240,248,255);">지원하기</button>
        </form>
    </div>
</div>

<!-- JavaScript 코드 -->
<script>
	function openFileUploader() {
		var modal = document.getElementById('myModal');
		modal.style.display = "block";
	}
	
	function closeFileUploader() {
		var modal = document.getElementById('myModal');
		modal.style.display = "none";
	}
	
	function uploadResume() {
		var fileInput = document.getElementById('resumeFile');
		var checkbox1 = document.getElementById('resumeCheckbox1');
		var checkbox2 = document.getElementById('resumeCheckbox2');
		
		var selectedFiles = [];
		
		if (checkbox1.checked) {
			selectedFiles.push("resume1.pdf");
		}
		if (checkbox2.checked) {
			selectedFiles.push("resume2.docx");
		}
		
		if (selectedFiles.length === 0) {
			alert('이력서를 선택하여 지원을 확인해 주세요.');
			return;
		}
		
		// 여기서 실제로는 서버로 선택한 파일들을 업로드하는 로직을 추가할 수 있습니다.
		
		var message = "지원이 완료되었습니다.  선택한 이력서 파일: " + selectedFiles.join(", ");
		alert(message);
		
		closeFileUploader(); // 업로드 완료 후 모달 창 닫기
	}
	</script> 
	<!-- 지원하기파일업로드끝-->

 <div class="job-lists">
    <c:forEach items="${list}" var="dto">
        <div class="job-item">
            <h2><b>${dto.emp_postNo}</b></h2>
			<div class="job-title">${dto.emp_title}</div>
            <div class="company">${dto.emp_duty}</div>
            <div class="location">${dto.emp_workPlace}</div>
            <div class="job-actions">
                ${dto.emp_endDate}&nbsp;
                <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
                <button class="scrap-button" data-job-id="${dto.emp_postNo}">
                    <i class="fas fa-star"></i> 
                </button>
            </div>
        </div>
    </c:forEach>
</div>

<script>
	document.addEventListener('DOMContentLoaded', function() {
    const scrapButtons = document.querySelectorAll('.scrap-button');

    scrapButtons.forEach(button => {
        const jobId = button.getAttribute('data-job-id');
        const isScrapped = localStorage.getItem(`scrapped_${jobId}`) === 'true';

        // 초기 스크랩 상태 설정
        if (isScrapped) {
            button.classList.add('scrapped');
        } else {
            button.classList.remove('scrapped');
        }
    });

    // 부모 요소에 클릭 이벤트 리스너 추가 (이벤트 위임)
    document.addEventListener('click', function(event) {
        const clickedElement = event.target;

        if (clickedElement.classList.contains('scrap-button')) {
            const jobId = clickedElement.getAttribute('data-job-id');
            const isCurrentlyScrapped = clickedElement.classList.contains('scrapped');

            // 스크랩 상태 토글
            if (isCurrentlyScrapped) {
                clickedElement.classList.remove('scrapped');
                localStorage.setItem(`scrapped_${jobId}`, 'false');
                alert('스크랩이 취소되었습니다.');
            } else {
                clickedElement.classList.add('scrapped');
                localStorage.setItem(`scrapped_${jobId}`, 'true');
                alert('스크랩 되었습니다.');
            }
        }
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
		
		<!-- Criteria를 이용해서 키워드 값을 넘김 -->
		<!-- <input type="text" name="keyword" value="${pageMaker.cri.keyword}"> -->
		<!-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> -->
		 <!-- 전체 검색중 5페이지에서 22 키워드로 검색시 안나올때 처리 -->
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			
			<h3>${pageMaker}</h3>
			<div class="div_page">
				<ul>
					<c:if test="${pageMaker.prev}">
						<!-- <li>[Previous]</li> -->
						<li class="paginate_button">
							<a href="${pageMaker.startpage-1}">
								Previous
							</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
						<!-- <li>[${num}]</li> -->
						<!-- <li ${pageMaker.cri.pageNum== num?"style='color:red'":""}> -->
							<!-- 현재페이지는 배경색 노란색으로 표시 -->
						<li class="paginate_button" ${pageMaker.cri.pageNum== num ? "style='background-color:rgb(240,248,255);'":""}>
							<!-- [${num}] -->
							<a href="${num}">
								${num}
							</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<!-- <li>[Next]</li> -->
						<li class="paginate_button">
							<a href="${pageMaker.endpage+1}">
								Next
							</a>
						</li>
					</c:if>
				</ul>
			</div>
	
			<!-- <form id="actionForm" method="get" action="listWithPaging"> -->
			<!-- <form id="actionForm" method="get" action="list"> -->
			<form id="actionForm" method="get">
				<input type="hidden" name="pageNum" value=" ${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value=" ${pageMaker.cri.amount}">
				<!-- 페이징 검색시 페이지 번호 클릭할때 필요한 파라미터 -->
				<!-- <input type="hidden" name="type" value="${pageMaker.cri.type}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> -->
			</form>
	
	</body>
	</html>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script>
		var actionForm = $("#actionForm");
		//페이지번호 처리
		// $(".paginate_button").on("click",function(e){
		$(".paginate_button a").on("click",function(e){
			//기본동작막음 : 페이지 링크를 통해서 이동
			e.preventDefault();
			console.log("click~!!!");
			console.log("@# href => "+$(this).attr("href"));
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
			//게시글 클릭후 뒤로 가기 누른 후 다른 페이지 클릭할 때 &boardNo=번호 계속 누적되는거 방지
			var bno = actionForm.find("input[name='emp_postNo']").val(); //content_view로 가기전의 글번호
			if(bno != ""){
				actionForm.find("input[name='emp_postNo']").remove();
			}
			// actionForm.submit();
			actionForm.attr("action","list").submit();
		});//end of paginate_button click
	
		//게시글처리
		$(".move_link").on("click", function(e){
			e.preventDefault();
			// console.log("@# move_link click~!!!");
			console.log("@# href => "+$(this).attr("href"));
	
			//게시글 클릭후 뒤로 가기 누른 후 다른 게시글 클릭할 때 &boardNo=번호 계속 누적되는거 방지
			var bno = actionForm.find("input[name='emp_postNo']").val(); //content_view로 가기전의 글번호
			if(bno != ""){
				actionForm.find("input[name='emp_postNo']").remove();
			}
	
			var targetBno = $(this).attr("href");
			//"content_view?boardNo=${dto.boardNo}" 를 actionForm로 처리
			actionForm.append("<input type='hidden' name='emp_postNo' value='"+targetBno+"'>");
			// actionForm.submit();
			//컨트롤러에 content_view로 찾아감
			actionForm.attr("action","content_view").submit();
	
		}); //end of move_link click
	

		var searchForm = $("#searchForm");
		//Search 버튼 클릭
		// $("#searchForm").on("click",function(){
		$("#searchForm button").on("click",function(){
			// alert("검색");
	
			//아래는 검색종류할때 참고
			// if(!searchForm.find("option:selected").val()){
			// 	alert("검색종류를 선택하세요.");
			// 	return false;
			// }
			
			if(searchForm.find("option:selected").val() !="" && !searchForm.find("input[name='kword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			searchForm.attr("action","list").submit();
		}); //end of searchForm click
	
		//type 콤보박스 변경
		$("#searchForm select").on("change",function(){
			//전체일때
			if(searchForm.find("option:selected").val() == ""){
				//키워드를 null값으로 변경
				searchForm.find("input[name='kword']").val("");
			}
		});//end of  searchForm select change
		
	</script>
<!--    <%@ include file="footer.jsp" %>-->
</body>
</html>