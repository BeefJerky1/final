<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="${root}/css/sidebars.css">
<style>
.cont {
	background-color: white;
	color: black;
}

.info {
	height: 59px;
}

li button {
	color: black !important;
}

li button:hover {
	color: white !important;
	background-color: #3E4684 !important
}

.container-fluid {
	padding-left: 0px !important;
}

li a {
	background-color: white !important;
	color: black !important;
}

li a:hover {
	background-color: #3E4684 !important;
	color: white !important;
}

.logo-item {
	width: 100% !important;
}
.tableInterest2 {
	background-color: #E9E9E9;
	color: #3E4684;
	font-size: 0.85em;
	font-weight: 600;
	width: 30px;
}
</style>
</head>

<body>

	<div id="app" class="container-fluid">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2 border">
				<div class=" p-4">
					<a href="${root}"><img class="logo-item"
						src="${root }/image/LOGO.png"></a>
					<div class="row p-4 border-bottom">
						<span class="fs-5 fw-semibold">관리자 페이지</span>
					</div>
					 <ul class="list-unstyled ps-0 p-4">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#user-collapse" aria-expanded="flase">
          회원
        </button>
        <div class="collapse" id="user-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/member" class="link-light rounded">회원 목록</a></li>
            <li><a href="${root}/admin/member_chart" class="link-light rounded">회원 차트</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#club-collapse" aria-expanded="false">
          소모임
        </button>
        <div class="collapse" id="club-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/club" class="link-light rounded">소모임 목록</a></li>
            <li><a href="#" class="link-light rounded">소모임 차트</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#board-collapse" aria-expanded="false">
         MBTI 게시판
        </button>
        <div class="collapse" id="board-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/mbtiboard" class="link-light rounded">게시글 목록</a></li>
            <li><a href="#" class="link-light rounded">게시글 차트</a></li>
          </ul>
        </div>
      </li>
           <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#mbti-collapse" aria-expanded="false">
        MBTI 설문
        </button>
        <div class="collapse" id="mbti-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/mbtisurvey" class="link-light rounded">MBTI 설문</a></li>
            <li><a href="${root}/admin/mbtianimal" class="link-light rounded">MBTI 동물</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          설정
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-light rounded">설정</a></li>
            <li><a href="#" class="link-light rounded">로그아웃</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
    </div>
    </div>
    </div>

    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="${root}/js/sidebars.js"></script>
    <script>
        const app = Vue.createApp({
            data(){
                return {
    
                };
            },
            computed:{
                
            },
            methods:{

            },
        });
        app.mount("#app");
    </script>
</body>
</html>