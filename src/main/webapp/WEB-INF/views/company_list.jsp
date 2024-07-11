<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>기업 리스트</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main2.css' />">
</head>
<body>
    <header>
        <a href="${pageContext.request.contextPath}/main">
            <img src="<c:url value='/img/logo.png' />" alt="Logo">
        </a>
        <div class="header-content">Good job</div>
        <div class="search-container">
            <form action="${pageContext.request.contextPath}/search" method="get">
                <input type="text" name="query" placeholder="굿 잡">
                <input type="submit" value=" ">
            </form>
        </div>
    </header>
    <nav>
        <ul>
            <li>
                <a href="#">채용 공고</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">채용 공고</a></li>
                        <li><a href="#">지역별</a></li>
                        <li><a href="#">직무별</a></li>
                        <li><a href="#">역세권별</a></li>
                        <li><a href="#">TOP 100</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">기업 정보</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">기업 정보</a></li>
                        <li><a href="${pageContext.request.contextPath}/company_list">기업 리스트</a></li>
                        <li><a href="#">연봉</a></li>
                        <li><a href="#">기업 리뷰</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">커뮤니티</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">현직자 인터뷰</a></li>
                        <li><a href="#">QnA</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="#">고객지원</a>
                <div class="submenu">
                    <ul>
                        <li><a href="#">고객지원</a></li>
                        <li><a href="#">FQA (자주하는 질문)</a></li>
                        <li><a href="#">1:1 문의 </a></li>
                        <li><a href="#">공지사항</a></li>
                    </ul>
                </div>
            </li>
            <li class="nav-right">
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
            </li>
        </ul>
    </nav>
    <div id="wrap">
        <h1>기업 리스트</h1>
        <!-- 기업 리스트 콘텐츠를 추가하세요 -->
        <p>여기에 기업 리스트가 표시됩니다.</p>
    </div>
    <footer>
        <div class="footer-content">
            Member
            <p>
                <a href="https://www.notion.so/640668240d804de19cda6b6ad9e82f1a" target="_blank">차혜영</a> gpdud4094@gmail.com
            </p>
            <p>
                <a href="https://www.notion.so/Springboot-SW-8525fd2c3cd545939f645a7b6c03cca6" target="_blank">최민중</a> choimin0915@naver.com
            </p>
            <p>
                <a href="https://www.notion.so/naseongyeop" target="_blank">나성엽</a> fgghk132@naver.com
            </p>
            <p>
                <a href="https://www.notion.so/seoyoungsoo" target="_blank">서영수</a> tjdudtn7879@naver.com
            </p>
            <p>
                <a href="https://www.notion.so/seominjeong" target="_blank">서민정</a> minjung2209@naver.com
            </p>
        </div>
    </footer>
</body>
</html>