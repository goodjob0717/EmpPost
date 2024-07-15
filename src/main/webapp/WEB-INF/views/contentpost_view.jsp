<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>채용공고 등록 (post)</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/contentpost.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css' />">

<script>
    //     $('header, nav').hover(function(){
        //         $('.submenu').stop(true, true).slideDown();
        //     }, function(){
            //         $('.submenu').stop(true, true).slideUp();
            //     });
            
        $(document).ready(function(){
            var formObj = $("form[id='frm']");

        $("button[type='submit']").on("click", function(e) {
            e.preventDefault(); //기본 제출 동작 막음
            console.log("submit clicked");

            var str = "";
			$(".uploadResult ul li").each(function(i, obj){
				console.log("@# obj => "+$(obj));
				console.log("@# obj => "+$(obj).data());
				console.log("@# obj => "+$(obj).data("filename"));

				var jobj = $(obj);
				//JavaScript 개체의 속성에 대한 목록을 표시
				console.dir(jobj);
				console.log("============================");
				console.log(jobj.data("filename"));
				console.log(jobj.data("uuid"));
				console.log(jobj.data("path"));
				console.log(jobj.data("type"));

				str+="<input type='hidden' name='attachList["+i+"].filename' value='"+jobj.data("filename")+"'>";
				str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str+="<input type='hidden' name='attachList["+i+"].uploadpath' value='"+jobj.data("path")+"'>";
				str+="<input type='hidden' name='attachList["+i+"].image' value='"+jobj.data("type")+"'>";
			});//end of uploadResult ul li

			console.log(str);
			formObj.append(str).submit();
		// });
        //end of button submit
//
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/contentpost_view",
                data: formData,
                processData: false,
                contentType: false,
                success: function(result) {
                    alert("채용 공고가 등록되었습니다.");
                    window.location.href = "${pageContext.request.contextPath}/list";
                },
                error: function() {
                    alert("채용 공고 등록 중 오류가 발생했습니다.");
                }
            });
        });

        var regex = new RegExp("(.*?)\.(exe|sh|alz)$");
        var maxSize = 5242880;

        function checkExtension(filename, fileSize) {
            if (fileSize >= maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }
            if (regex.test(filename)) {
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;
        }

        $("input[type='file']").change(function(e) {
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;

            for (var i = 0; i < files.length; i++) {
                if (!checkExtension(files[i].name, files[i].size)) {
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }

            $.ajax({
                type: "post",
                data: formData,
                url: "${pageContext.request.contextPath}/uploadAjaxAction",
                processData: false,
                contentType: false,
                success: function(result) {
                    alert("파일이 업로드되었습니다.");
                    showUploadResult(result);
                }
            });
        });

        function showUploadResult(uploadResultArr) {
            if (!uploadResultArr || uploadResultArr.length == 0) {
                return;
            }

            var uploadUL = $(".uploadResult ul");
            var str = "";

            $(uploadResultArr).each(function(i, obj) {
                var fileCallPath = encodeURIComponent(obj.uploadpath + "/s_" + obj.uuid + "_" + obj.filename);
                if (obj.image) {
                    str += "<li data-path='" + obj.uploadpath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "' data-type='" + obj.image + "'>";
                    str += "<div><span>" + obj.filename + "</span>";
                    str += "<img src='/display?filename=" + fileCallPath + "'>";
                    str += "<span data-file='" + fileCallPath + "' data-type='image'> x </span></div></li>";
                } else {
                    str += "<li data-path='" + obj.uploadpath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.filename + "' data-type='" + obj.image + "'>";
                    str += "<div><span>" + obj.filename + "</span>";
                    str += "<img src='./resources/img/attach.png'>";
                    str += "<span data-file='" + fileCallPath + "' data-type='image'> x </span></div></li>";
                }
            });

            uploadUL.append(str);
        }

        $(".uploadResult").on("click", "span", function() {
            var targetFile = $(this).data("file");
            var type = $(this).data("type");
            var uploadResultItem = $(this).closest("li");

            $.ajax({
                type: "post",
                data: { filename: targetFile, type: type },
                url: "${pageContext.request.contextPath}/deleteFile",
                success: function(result) {
                    alert(result);
                    uploadResultItem.remove();
                }
            });
        });
    });
</script>
</head>
<body>
    <div class="wrap">
        <form id="frm" method="post" action="contentpost">
            <div class="main-content">
                <div class="container d-flex">
                    <div class="justify-content-center mx-2 pb-4 w-100">
                        <div class="border border-tertiary p-5 rounded shadow">
                            <h1 class="d-inline-flex">채용공고등록</h1>
                            <hr>
                            <div>
                                <h3>직무*</h3>
                                <select name="emp_duty" class="jm_select selectpicker" data-style="btn-info" style="height: 35px; width: 180px;">
                                    <option value="개발" selected>개발</option>
                                    <option value="데이터">데이터</option>
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
                                                <select name="emp_career" class="jm_select selectpicker" data-style="btn-info" style="height: 35px;">
                                                    <option value="경력무관" selected>경력무관</option>
                                                    <option value="신입">신입</option>
                                                    <option value="1년차 이상">1년차 이상</option>
                                                    <option value="3년차 이상">3년차 이상</option>
                                                    <option value="5년차 이상">5년차 이상</option>
                                                </select>
                                            </td>
                                            <th>연봉</th>
                                            <td>
                                                <select name="emp_money" class="jm_select selectpicker" data-style="btn-info" style="height: 35px;">
                                                    <option value="1000" selected>면접 후 결정</option>
                                                    <option value="2000">2000만원</option>
                                                    <option value="3000">3000만원</option>
                                                    <option value="4000">4000만원</option>
                                                    <option value="5000">5000만원 이상</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>고용형태</th>
                                            <td>
                                                <select name="emp_type" class="jm_select selectpicker" data-style="btn-info" style="height: 35px;">
                                                    <option value="선택안함" selected>선택안함</option>
                                                    <option value="계약직">계약직</option>
                                                    <option value="정규직">정규직</option>
                                                    <option value="인턴">인턴</option>
                                                </select>
                                            </td>
                                            <th>학력</th>
                                            <td>
                                                <select name="emp_status" class="jm_select selectpicker" data-style="btn-info" style="height: 35px;">
                                                    <option value="학력무관" selected>학력무관</option>
                                                    <option value="고등학교졸업">고등학교졸업</option>
                                                    <option value="대학졸업(2,3년제)">대학졸업(2,3년제)</option>
                                                    <option value="대학졸업(4년제)">대학졸업(4년제)</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <th>근무 시간*</th>
                                        <td class="d-flex"><input class="form-control" type="time"
                                                style="width: 110px;" name="startHour" id="startHour" value="09:00"
                                                required>~
                                            <input class="form-control" type="time" style="width: 110px;"
                                                name="endHour" id="endHour" value="18:00" required>
                                        </td>
                                    </table>
                                </div>
                            </div>
                            <br>
                            <div class="mt-4">
                                <h4><b>마감 일자*</b></h4>
                                <div class="border border-tertiary p-3 d-inline-flex me-3 mb-3 w-100">
                                    <input class="form-control" type="date" id="deadline" name="${emp_endDate}">
                                </div>
                            </div>
                            <script>
                                var today = new Date();
                                var nextMonth = new Date();
                                nextMonth.setMonth(nextMonth.getMonth() + 1);
                                var maxDate = nextMonth.toISOString().slice(0, 10);
                                var deadlineInput = document.getElementById('deadline');
                                deadlineInput.setAttribute('min', today.toISOString().slice(0, 10));
                                deadlineInput.setAttribute('max', maxDate);
                            </script>
                            <br>
                            <!-- 스킬시작  ?-->
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
                                    <button class="btn btn-outline-primary" type="button" onclick="addSkill()">추가</button>
                                </div>
                                <div id="selectedSkills" class="p-3">
                                    <!-- 추가된 스킬을 보여줄 공간 -->
                                </div>
                            </div>
                        
                            <script>
                                let selectedSkills = [];
                        
                                function addSkill() {
                                    var skillSelect = document.getElementById("skillOptions");
                                    var skillName = skillSelect.value;
                                    if (!selectedSkills.includes(skillName)) {
                                        selectedSkills.push(skillName);
                                        renderSkills();
                                    } else {
                                        alert("이미 선택된 스킬입니다.");
                                    }
                                }
                        
                                function removeSkill(skillName) {
                                    var index = selectedSkills.indexOf(skillName);
                                    if (index > -1) {
                                        selectedSkills.splice(index, 1);
                                        renderSkills();
                                    }
                                }
                        
                                function renderSkills() {
                                    var skillContainer = document.getElementById("selectedSkills");
                                    skillContainer.innerHTML = "";
                        
                                    selectedSkills.forEach(function(skillName) {
                                        var skillItem = document.createElement("div");
                                        skillItem.classList.add("skill-item", "mb-2", "me-2", "p-2");
                                        skillItem.innerHTML = `
                                            <span class="me-2">${skillName}</span>
                                            <button class="btn-x" type="button" onclick="removeSkill('${skillName}')">x</button>
                                        `;
                                        skillContainer.appendChild(skillItem);
                                    });
                                }
                            </script>
                            <!-- 스킬끝 -->
                            
                            <br>
                            <div>
                                <h3><b>근무지*</b></h3>
                                <span style="color: gray;"> 근무지 주소 입력시 공고에 지도로 표시됩니다.</span><br>
                                <input class="form-control" style="width: 250px; height: 25px;" type="text" name="emp_workPlace" placeholder="근무지를 입력해주세요.">
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
                                    <input type="file" id="fileInput" name="uploadFile" style="display: none;">
                                    <label for="fileInput" class="btn btn-primary">파일 업로드</label>
                                    <span id="fileName" style="margin-left: 10px;"></span>
                                </div>
                            </div>
                            <script>
                                function validateCheckbox() {
                                    var checkbox1 = document.getElementById("documentType1");
                                    var checkbox2 = document.getElementById("documentType2");
                                    if (checkbox1.checked) {
                                        var fileInput = document.getElementById('fileInput');
                                        var fileName = fileInput.value;
                                        var ext = fileName.split('.').pop().toLowerCase();
                                        if (!fileName) {
                                            alert('파일을 선택하세요.');
                                            return false;
                                        }
                                        if (ext !== 'doc' && ext !== 'docx') {
                                            alert('워드 파일만 업로드 가능합니다.');
                                            return false;
                                        }
                                    }
                                    return true;
                                }

                                var fileInput = document.getElementById('fileInput');
                                fileInput.addEventListener('change', function() {
                                    var fileName = this.value;
                                    var checkbox1 = document.getElementById("documentType1");
                                    if (fileName) {
                                        checkbox1.checked = true;
                                    } else {
                                        checkbox1.checked = false;
                                    }
                                    document.getElementById('fileName').textContent = fileName ? fileName.split('\\').pop() : '';
                                });

                                var form = document.querySelector("form");
                                form.addEventListener("submit", function(event) {
                                    var fileName = fileInput.value;
                                    var checkbox1 = document.getElementById("documentType1");
                                    if (!fileName) {
                                        alert('파일을 선택하세요.');
                                        event.preventDefault();
                                        return;
                                    }
                                    if (!checkbox1.checked) {
                                        alert('자사양식을 선택하세요.');
                                        event.preventDefault();
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
                                </div>
                                <br>
                                <div class="px-5 mt-5">
                                    <h3><b>공고명*</b></h3>
                                    <input class="form-control" type="text" name="emp_title" placeholder="공고명">
                                    <div class="pt-4">
                                        <div class="mt-4">
                                            <h4><b>상세정보*</b></h4>
                                            <div class="border border-tertiary p-3 d-inline-flex me-3 mb-3 w-40">
                                                <textarea class="form-control custom-textarea" name="emp_content" rows="10" maxlength="1000" placeholder="예) [안드로이드 개발자](신입/경력) 우리 회사 서비스 안드로이드 개발 업무를 맡을 개발자를 모집합니다.

[담당업무]
- 안드로이드 플랫폼에서의 애플리케이션 개발 및 유지보수
- Java 언어를 사용한 개발 업무 수행

[우대사항]
- 문제해결 능력이 뛰어나고 팀플레이를 좋아하는 분
- React Native 경험이 있는 분"></textarea>
                                            </div>
                                        </div>
                                        <hr class="d-inline-flexw-100">
                                    </div>
                                    <br>
                                </div>
                            </div>
                            <div class="text-center mb-5">
                                <button type="submit" class="btn btn-custom">등록</button>
                                <a href="list" style="font-size: 13px;">목록보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
<!--    <%@ include file="footer.jsp" %>-->
</body>
</html>
