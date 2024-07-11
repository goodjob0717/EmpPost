<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/main.css' />">
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
    <header>
        <a href="${pageContext.request.contextPath}/main">
        <!-- <a href="main.jsp"> -->
            <img src="<c:url value='/img/logo.png' />" alt="Logo">
        </a>
        <div class="header-content">
            Good job
        </div>
        <div class="search-container">
            <!-- <form action="${pageContext.request.contextPath}/search.jsp" method="get"> -->
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
                        <li><a href="#">기업 리스트</a></li>
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

              <!-- 로그인 및 회원가입 링크 추가 -->
              <li class="nav-right">
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
            </li>
        </ul>
        
    </nav>


    <div id="wrap">
               <h1 >검색 결과 </h1>        
                 <!-- 검색어를 가져와 출력합니다 -->
        <c:if test="${not empty param.query}">
                  <p>검색어: ${param.query}</p>
        </c:if>

          <!-- 여기에 실제 검색 결과를 추가 -->
          <p>검색 결과가 여기에 표시됩니다.</p>
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