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
        $(document).ready(function() {
            $('header, nav').hover(function() {
                $('.submenu').stop(true, true).slideDown();
            }, function() {
                $('.submenu').stop(true, true).slideUp();
            });
        });
    </script>
</head>
<body>
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
			
		<div class="wrap">
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

			<form action="${pageContext.request.contextPath}/search" method="get">
				<div class="search-bar">
					<select name="type">
						<option value="T">제목</option>
						<option value="C">내용</option>
						<option value="W">근무지</option>
						<option value="TC">제목 + 내용</option>
						<option value="TW">제목 + 근무지</option>
						<option value="TCW">제목 + 내용 + 근무지</option>
					</select>
					<input type="text" name="keyword" id="search-keyword" placeholder="키워드를 입력하세요">
					<button type="submit">검색</button>
				</div>
			</form>		

            <input type="hidden" id="keyword-input" name="keyword">
            <div class="option-container" id="option-container">
                <!-- 선택된 옵션들이 여기에 동적으로 추가됩니다 -->
            </div>

			<script>
				// 선택된 옵션들을 관리하는 배열
				let selectedOptions = [];
		
				// 옵션을 추가하는 함수
				function addOption(selectId) {
					const selectElement = document.getElementById(selectId);
					const optionValue = selectElement.value;
					const optionText = selectElement.options[selectElement.selectedIndex].text;
		
					// 중복 추가 방지
					if (!selectedOptions.includes(optionText) && optionValue !== '선택안함') {
						selectedOptions.push(optionText);
		
						const optionContainer = document.getElementById('option-container');
						const newOptionId = "option" + selectedOptions.length;
						const newOptionItem = document.createElement("div");
						newOptionItem.classList.add("option-item");
						newOptionItem.id = newOptionId;
						newOptionItem.innerHTML = `
							<span>${optionText}</span>
							<button class="btn-x" onclick="removeOption('${newOptionId}', '${optionText}')">X</button>
						`;
						optionContainer.appendChild(newOptionItem);
		
						// 히든 인풋 업데이트
						updateHiddenInput();
					}
				}
		
				// 선택된 옵션을 삭제하는 함수
				function removeOption(optionId, optionText) {
					const optionElement = document.getElementById(optionId);
					if (optionElement) {
						const optionIndex = selectedOptions.indexOf(optionText);
						if (optionIndex > -1) {
							selectedOptions.splice(optionIndex, 1);
						}
						optionElement.remove();
		
						// 히든 인풋 업데이트
						updateHiddenInput();
					}
				}
		
				// 키워드를 선택된 옵션에 추가하는 함수
				function addKeyword() {
					const keyword = document.getElementById("search-keyword").value.trim();
					if (keyword !== "" && !selectedOptions.includes(keyword)) {
						selectedOptions.push(keyword);
		
						const optionContainer = document.getElementById('option-container');
						const newOptionId = "option" + selectedOptions.length;
						const newOptionItem = document.createElement("div");
						newOptionItem.classList.add("option-item");
						newOptionItem.id = newOptionId;
						newOptionItem.innerHTML = `
							<span>${keyword}</span>
							<button class="btn-x" onclick="removeOption('${newOptionId}', '${keyword}')">X</button>
						`;
						optionContainer.appendChild(newOptionItem);
		
						// Clear search keyword input
						document.getElementById("search-keyword").value = "";
		
						// 히든 인풋 업데이트
						updateHiddenInput();
					} else {
						alert("이미 선택된 옵션이거나 입력된 값이 비어 있습니다.");
					}
				}
		
				// 히든 인풋 업데이트 함수
				function updateHiddenInput() {
					const hiddenInput = document.getElementById('keyword-input');
					hiddenInput.value = selectedOptions.join(',');
				}
			</script>
			</div>

        <div class="job-lists">
            <!-- 서버에서 전달받은 데이터로 반복 처리 -->
            <c:forEach items="${list}" var="dto">
                <div class="job-item">
                    <h2><b>${dto.emp_postNo}</b></h2>
                    <div class="job-title">${dto.emp_title}</div>
                    <div class="company">${dto.emp_duty}</div>
                    <div class="location">${dto.emp_workPlace}</div>
                    <div class="job-actions">
                        ${dto.emp_endDate}&nbsp;
                        <a class="resume" href="#" onclick="openFileUploader()">지원하기</a>
                        <button data-emp-post-no="${dto.emp_postNo}" class="scrap-button">
                            <i class="fas fa-star"></i>
                        </button>
                    </div>
                </div>
            </c:forEach>
        </div>

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

        <!-- 스크랩 기능 관련 JavaScript -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const scrapButtons = document.querySelectorAll('.scrap-button');

                scrapButtons.forEach(button => {
                    const empPostNo = button.getAttribute('data-emp-post-no');
                    console.log(`empPostNo: ${empPostNo}`);

                    fetch(`http://localhost:8484/getScrapStatus?empPostNo=${empPostNo}`)
                        .then(response => response.json())
                        .then(data => {
                            if (data.isScrapped) {
                                button.classList.add('scrapped');
                            } else {
                                button.classList.remove('scrapped');
                            }
                        })
                        .catch(error => {
                            console.error(`스크랩 상태 불러오기 중 오류 발생 (empPostNo: ${empPostNo}):`, error);
                        });
                });

                document.addEventListener('click', function(event) {
                    const clickedElement = event.target;
                    let button;

                    if (clickedElement.classList.contains('scrap-button')) {
                        button = clickedElement;
                    } else if (clickedElement.parentElement && clickedElement.parentElement.classList.contains('scrap-button')) {
                        button = clickedElement.parentElement;
                    }

                    if (button) {
                        const empPostNo = button.getAttribute('data-emp-post-no');
                        const isCurrentlyScrapped = button.classList.contains('scrapped');

                        fetch('http://localhost:8484/toggleScrap', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({ jobId: empPostNo, isScrapped: isCurrentlyScrapped }),
                        })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    const message = isCurrentlyScrapped ? '스크랩이 취소되었습니다.' : '스크랩 되었습니다.';
                                    alert(message);

                                    if (isCurrentlyScrapped) {
                                        button.classList.remove('scrapped');
                                    } else {
                                        button.classList.add('scrapped');
                                    }
                                }
                            })
                            .catch(error => {
                                console.error(`스크랩 토글 중 오류 발생 (empPostNo: ${empPostNo}):`, error);
                            });
                    }
                });
            });

            function openFileUploader() {
                var modal = document.getElementById('myModal');
                var resumeCheckbox1 = document.getElementById('resumeCheckbox1');
                var resumeCheckbox2 = document.getElementById('resumeCheckbox2');
                var fileInput = document.getElementById('resumeFile');

                var appliedFiles = JSON.parse(localStorage.getItem('appliedFiles')) || [];

                fileInput.value = '';
                resumeCheckbox1.checked = false;
                resumeCheckbox2.checked = false;

                if (appliedFiles.includes('resume1.pdf')) {
                    resumeCheckbox1.parentElement.style.display = 'none';
                } else {
                    resumeCheckbox1.parentElement.style.display = 'block';
                }

                if (appliedFiles.includes('resume2.docx')) {
                    resumeCheckbox2.parentElement.style.display = 'none';
                } else {
                    resumeCheckbox2.parentElement.style.display = 'block';
                }

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

                if (fileInput.files.length > 0) {
                    selectedFiles.push(fileInput.files[0].name);
                }

                if (selectedFiles.length === 0) {
                    alert('이력서를 선택하여 지원을 확인해 주세요.');
                    return;
                }

                var appliedFiles = JSON.parse(localStorage.getItem('appliedFiles')) || [];
                appliedFiles = appliedFiles.concat(selectedFiles);
                localStorage.setItem('appliedFiles', JSON.stringify(appliedFiles));

                var message = "지원이 완료되었습니다. 선택한 이력서 파일: " + selectedFiles.join(", ");
                alert(message);

                closeFileUploader();
            }

            window.onload = function() {
                localStorage.removeItem('appliedFiles');
            };
        </script>

<div class="div_page">
    <ul>
        <c:if test="${pageMaker.prev}">
            <li class="paginate_button">
                <a href="?pageNum=${pageMaker.startpage - 1}&amount=${pageMaker.cri.amount}">Previous</a>
            </li>
        </c:if>
        <c:forEach var="num" begin="${pageMaker.startpage}" end="${pageMaker.endpage}">
            <li class="paginate_button ${pageMaker.cri.pageNum eq num ? 'active' : ''}">
                <a href="?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
            </li>
        </c:forEach>
        <c:if test="${pageMaker.next}">
            <li class="paginate_button">
                <a href="?pageNum=${pageMaker.endpage + 1}&amount=${pageMaker.cri.amount}">Next</a>
            </li>
        </c:if>
    </ul>
</div>

        <form id="actionForm" method="get">
            <input type="hidden" name="pageNum" value=" ${pageMaker.cri.pageNum}">
            <input type="hidden" name="amount" value=" ${pageMaker.cri.amount}">
        </form>
    </div>
</body>
</html>
