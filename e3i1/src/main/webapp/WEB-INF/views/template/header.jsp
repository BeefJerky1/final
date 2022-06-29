<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 절대경로 변수 생성 -->
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html lang="kor">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SISO</title>
    
    
<!-- moment library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js" ></script>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- style 관련 cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${root}/css/commons.css">
   
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Sans+KR:wght@100;300&display=swap');
     </style>
</head>
<body>
     <!--  Vue, axios, bootstrap script, lodash -->
     <script src="https://unpkg.com/vue@next"></script>
    <script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21/lodash.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
  <!-- nav bar -->
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a href="${root}" class="logo-item"><img src="${root }/image/LOGO.png" width="100px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                    <li class="nav-item">
                        <a class="nav-link" href="${root}/club/">소모임</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">MBTI</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#">NOTICE</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <i class="fa-solid fa-magnifying-glass search-icon"></i>
                    <input type="text" name="keyword" class="form-control me-2 input-box" type="search"
                        placeholder="소모임 검색하기" aria-label="Search">
                </form>
                <button class="btn btn-outline-success" type="submit">로그인</button>
            </div>
        </div>
    </nav>
    </header>
    
    <section>
         <article>