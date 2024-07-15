<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 post</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/contentpost.css' />">
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
		<!-- // -->
		<form id="frm" method="post" action="content">

	    <div class="main-content">
	    <div class="container d-flex">
	        <br>

	        <div class="justify-content-center mx-2 pb-4 w-100">
	            <div class="border border-tertiary p-5 rounded shadow">
	                <h1 class="d-inline-flex">채용공고등록</h1>
	                <hr>
	                <form action="/company/savePost" method="post" onsubmit="return Check()">
	                    <div>
	                            <h3>직무*</h3>
	                            <select name="condition" class="jm_select selectpicker"
	                                data-style="btn-info" style=" height: 35px; width: 180px;">
	                                <option value="개발" selected>개발</option>
	                                <option value="데이터" >데이터</option>
	                                <option value="설계">설계</option>
	                            </select>
	                    </div>

	                    <br>

	                        <div class="pt-2 mt-4">
	                            <div class="border border-tertiary pt-3 d-inline-flex me-3 mb-3 w-100">
	                                <table class="table table-borderless pt-5 ms-3">
	                                    <tr class="pb-5">
	                                        <th>경력</th>
	                                        <td>
	                                            <select name="career" class="jm_select selectpicker"
	                                                data-style="btn-info" style=" height: 35px;">
	                                                <option value="-1"selected>경력무관</option>
	                                                <option value="0" >신입</option>
	                                                <option value="1">1년차 이상</option>
	                                                <option value="3">3년차 이상</option>
	                                                <option value="5">5년차 이상</option>
	                                            </select>
	                                        </td>
	                                        
	                                        <th>연봉</th>
	                                        <td>
	                                            <select name="pay" class="jm_select selectpicker" data-style="btn-info"
	                                                style=" height: 35px;">
	                                                <option value="면접 후 결정" selected>면접 후 결정</option>
	                                                <option value="2000만원">2000만원</option>
	                                                <option value="3000만원">3000만원</option>
	                                                <option value="4000만원">4000만원</option>
	                                                <option value="5000만원 이상">5000만원 이상</option>
	                                            </select>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <th>고용형태</th>
	                                        <td>
	                                            <select name="condition" class="jm_select selectpicker"
	                                                data-style="btn-info" style=" height: 35px;">
	                                                <option value="선택안함" selected>선택안함</option>
	                                                <option value="계약직">계약직</option>
	                                                <option value="정규직">정규직</option>
	                                                <option value="인턴">인턴</option>
	                                            </select>
	                                        </td>
	                                        <th>근무 시간*</th>
	                                        <td class="d-flex"><input class="form-control" type="time"
	                                                style="width: 110px;" name="startHour" id="startHour" value="09:00"
	                                                required>~
	                                            <input class="form-control" type="time" style="width: 110px;"
	                                                name="endHour" id="endHour" value="18:00" required>
	                                        </td>

	                                    </tr>
	                                </table>
	                            </div>
	                            </div>
	                            <br>
	                            <div class="mt-4">
	                                <h4><b>마감 일자*</b></h4>
	                                <div class="border border-tertiary p-3 d-inline-flex me-3 mb-3 w-100">
	                                    <input class="form-control" type="date" id="deadline" name="deadline" required>
	                                </div>
	                            </div>

	                            <script>
	                                // 오늘 날짜를 구합니다
	                                var today = new Date();
	                                
	                                // 한 달 후의 날짜를 계산합니다
	                                var nextMonth = new Date();
	                                nextMonth.setMonth(nextMonth.getMonth() + 1);
	                                
	                                // 입력 가능한 날짜의 범위를 설정합니다
	                                var maxDate = nextMonth.toISOString().slice(0, 10); // yyyy-mm-dd 형식의 문자열로 변환
	                                
	                                // HTML 요소에 최소 날짜와 최대 날짜를 설정합니다
	                                var deadlineInput = document.getElementById('deadline');
	                                deadlineInput.setAttribute('min', today.toISOString().slice(0, 10)); // 오늘 이후부터 선택 가능
	                                deadlineInput.setAttribute('max', maxDate); // 한 달 후까지 선택 가능
	                            </script>
	    <br>

	    <div class="mt-4">
	        <h4><b>스킬</b></h4>
	        <div id="skillContainer" class="p-3 d-inline-flex mb-3 w-100">
	            <select id="skillOptions" class="form-select me-3">
	                <option value="Spring Boot" selected>Spring Boot</option>
	                <option value="JavaScript">JavaScript</option>
	                <option value="Java">Java</option>
	                <option value="Python">Python</option>
	                <option value="HTML/CSS">HTML/CSS</option>
	                <option value="ASP">ASP</option>
	                <option value="API">API</option>
	                <option value="JSP">JSP</option>
	                <option value="Oracle">Oracle</option>
	                <option value="MySQL">MySQL</option>
	            </select>
	            <button class="btn btn-outline-primary" onclick="addSkill()">추가</button>
	        </div>
	    </div>
	    </div>

	    <script>
	      // 선택된 스킬 조건들을 관리할 배열
	        let selectedSkills = [];

	        // 새로운 기술/자격 조건 추가
	        function addSkill() {
	            var skillSelect = document.getElementById("skillOptions");
	            var skillName = skillSelect.options[skillSelect.selectedIndex].value;

	            // 중복 추가 방지
	            if (!selectedSkills.includes(skillName)) {
	                selectedSkills.push(skillName);

	        var skillContainer = document.getElementById("skillContainer");
	        var newSkillId = "skill" + (selectedSkills.length);
	        var newSkillItem = document.createElement("div");
	        newSkillItem.classList.add("skill-item");
	        newSkillItem.id = newSkillId;
	        newSkillItem.innerHTML = `
	            <span>${skillName}</span>
	            <button class="btn-x" onclick="removeSkill('${newSkillId}')">x</button>
	        `;
	        skillContainer.appendChild(newSkillItem);
	    } else {
	        alert("이미 선택된 스킬입니다.");
	    }
	}

	// 선택된 기술/자격 조건 제거
	function removeSkill(skillId) {
	    var skillIndex = parseInt(skillId.replace("skill", "")) - 1;
	    selectedSkills.splice(skillIndex, 1);

	    var skillElement = document.getElementById(skillId);
	    if (skillElement) {
	        skillElement.remove();
	    }
	}

	    </script>
	<br>
	                        <div>
	                            <h3><b>근무지*</b></h3>
	                            <span style="color: gray;"> 근무지 주소 입력시 공고에 지도로 표시됩니다.</span><br>
	                                    <input class="form-control" style="width: 250px; height: 25px;"  type="text" name="title" placeholder="근무지를 입력해주세요." required>
	                        </div>
	                    <br>

	                    <div>
	                        <h3><b>지원서류*</b></h3>
	                        지원자에게 어떤 서류를 받을지 선택해주세요.<br>
	                        <span style="color: red;">이력서 필수*</span>
	                        <div class="mt-3">
	                            <input type="checkbox" name="documentType" class="btn-check" id="documentType1" value="자사양식" autocomplete="off">
	                            <label class="btn btn-outline-primary me-3" for="documentType1">자사양식</label>
	                            <input type="checkbox" name="documentType" class="btn-check" id="documentType2" value="사이트양식" autocomplete="off">
	                            <label class="btn btn-outline-primary me-3" for="documentType2">사이트양식</label>
	                        </div>
	                    
	                        <div class="mt-3">
	                            <input type="file" id="fileInput" name="fileInput" style="display: none;">
	                            <label for="fileInput" class="btn btn-primary">파일 업로드</label>
	                            <span id="fileName" style="margin-left: 10px;"></span>
	                        </div>
	                    </div>
	                    <script>
	                        function validateCheckbox() {
	                            var checkbox1 = document.getElementById("documentType1");
	                            var checkbox2 = document.getElementById("documentType2");
	                    
	                            // 자사양식 체크박스가 체크되었을 때
	                            if (checkbox1.checked) {
	                                var fileInput = document.getElementById('fileInput');
	                                var fileName = fileInput.value;
	                                var ext = fileName.split('.').pop().toLowerCase();
	                    
	                                // 파일을 선택하지 않았을 때
	                                if (!fileName) {
	                                    alert('파일을 선택하세요.');
	                                    return false; // 폼 제출을 막기 위해 false 반환
	                                }
	                    
	                                // 워드 파일이 아닌 경우
	                                if (ext !== 'doc' && ext !== 'docx') {
	                                    alert('워드 파일만 업로드 가능합니다.');
	                                    return false; // 폼 제출을 막기 위해 false 반환
	                                }
	                            }
	                    
	                            // 자사양식 체크박스가 선택되지 않았을 때는 true 반환
	                            return true;
	                        }
	                    
	                        // 파일 선택 시 자사양식 체크박스 자동 선택
	    var fileInput = document.getElementById('fileInput');
	    fileInput.addEventListener('change', function() {
	        var fileName = this.value;
	        var checkbox1 = document.getElementById("documentType1");

	        if (fileName) {
	            checkbox1.checked = true; // 파일이 선택되면 자사양식 체크
	        } else {
	            checkbox1.checked = false; // 파일이 선택되지 않았으면 체크 해제
	        }

	        // 파일명 표시
	        document.getElementById('fileName').textContent = fileName ? fileName.split('\\').pop() : '';
	    });

	    // 폼 제출 시 유효성 검사
	    var form = document.querySelector("form");
	    form.addEventListener("submit", function(event) {
	        var fileName = fileInput.value;
	        var checkbox1 = document.getElementById("documentType1");

	        // 파일이 선택되지 않았으면
	        if (!fileName) {
	            alert('파일을 선택하세요.');
	            event.preventDefault(); // 폼 제출 막기
	            return;
	        }

	        // 자사양식 체크되지 않았으면
	        if (!checkbox1.checked) {
	            alert('자사양식을 선택하세요.');
	            event.preventDefault(); // 폼 제출 막기
	            return;
	        }
	    });
	                    </script>
	                        <br>

	                            <div class="mt-4 mb-4">

	                                <h4><b>기업 정보</b></h4>
	                                <div class="border border-tertiary ps-5 pe-2 pt-3 d-inline-flex mb-3 w-100">
	                                    <table class="table table-borderless pt-5 ms-5">
	                                        <tr class="pb-5">
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
	                                    </table>
	                                <!-- <h4><b>기업 정보</b></h4>
	                                <div class="border border-tertiary ps-5 pe-2 pt-3 d-inline-flex mb-3 w-100">
	                                    <table class="table table-borderless pt-5 ms-5">
	                                        <tr class="pb-5">
	                                            <th>사원수</th>
	                                            <td>${company.size}</td>
	                                            <th>대표자</th>
	                                            <td>${company.bossName}</td>
	                                        </tr>
	                                        <tr>
	                                            <th>설립년도</th>
	                                            <td>${company.cyear}</td>
	                                            <th>전화번호</th>
	                                            <td>${company.managerPhone}</td>
	                                        </tr>
	                                        <tr>
	                                            <th>주소</th>
	                                            <td>${company.address}</td>
	                                            <th>이메일</th>
	                                            <td>${principal.email}</td>
	                                        </tr>
	                                    </table> -->
	                                </div>
	                                <br>
	                                        <div class="px-5 mt-5">
	                                            <h3><b>공고명*</b></h3>
	                                            <input class="form-control" type="text" name="title" placeholder="공고명" required>
	                                            <div class="pt-4">
	                                                <div class="mt-4">
	                                                    <h4><b>상세정보*</b></h4>
	                                                    <div class="border border-tertiary p-3 d-inline-flex me-3 mb-3 w-40">
	                                                        <form>
	                                                            <textarea class="form-control custom-textarea" name="jobInfo" rows="10" maxlength="1000" placeholder="예) [안드로이드 개발자](신입/경력)
	우리 회사 서비스 안드로이드 개발 업무를 맡을 개발자를 모집합니다.
	                                                            
	[담당업무]
	- 안드로이드 플랫폼에서의 애플리케이션 개발 및 유지보수
	- Java 언어를 사용한 개발 업무 수행
	                                                            
	[우대사항]
	- 문제해결 능력이 뛰어나고 팀플레이를 좋아하는 분
	- React Native 경험이 있는 분" required></textarea>
	                                                        </form>
	                                                    </div>
	                                                </div>
	                                                <hr class="d-inline-flexw-100">
	                                            </div>
	                                            <br>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <form id="jobForm" action="submit.php" method="post">
	                                <div class="text-center mb-5">
	                                    <button type="submit" class="btn btn-custom" onclick="savePost()">등록</button>
	                                    <button type="submit" class="btn btn-custom" onclick="registerPost()">삭제</button>
	                                </div>
	                            </form>
	            </div>
	        </div>
	    </div>
	    </div>
		</div>
		</div>
	</form>
<!--    <%@ include file="footer.jsp" %>-->
</body>
</html>