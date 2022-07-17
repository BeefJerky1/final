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
<title>소모임</title>
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
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#user-collapse"
								aria-expanded="flase">회원</button>
							<div class="collapse" id="user-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/member"
										class="link-light rounded">회원 목록</a></li>
									<li><a href="#" class="link-light rounded">회원 차트</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#club-collapse"
								aria-expanded="false">소모임</button>
							<div class="collapse" id="club-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/club"
										class="link-light rounded">소모임 목록</a></li>
									<li><a href="#" class="link-light rounded">소모임 차트</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#board-collapse"
								aria-expanded="false">MBTI 게시판</button>
							<div class="collapse" id="board-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/mbtiboard"
										class="link-light rounded">게시글 목록</a></li>
									<li><a href="#" class="link-light rounded">게시글 차트</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#mbti-collapse"
								aria-expanded="false">MBTI 설문</button>
							<div class="collapse" id="mbti-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/mbtisurvey"
										class="link-light rounded">MBTI 설문</a></li>
            <li><a href="${root}/admin/mbtianimal" class="link-light rounded">MBTI 동물</a></li>
								</ul>
							</div>
						</li>
						<li class="border-top my-3"></li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#account-collapse"
								aria-expanded="false">설정</button>
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
			<div class="col-lg-9 col-md-9 col-sm-9">
				<div class="col-md-8 mb-5 p-4 text-dark  rounded">
					<form action="clubInformation" method="post">
						<div class="col-md-6 offset-md-3">
							<div class="row text-center mt-3 mb-5">
								<div class="row text-center mb-3 mt-5">
									<h1>소모임 수정</h1>
								</div>
								<div class="form-floating mb-3">
								<input type="hidden" name="clubNo"value="${clubDto.clubNo}">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="clubName"
                                    autocomplete="off"
                                    value="${clubDto.clubName}"
                                    > 
                                    <label for="floatingInput">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="clubLeader"
                                    autocomplete="off"
                                    value="${clubDto.clubLeader}"
                                    > 
                                    <label for="floatingInput">leader</label>
                                </div>
                            <div class="mt-2 text-start">
							<label>관심사</label>
							<div class="row">
								<div class="col">
									<select name="clubMainCategory" class="form-control rounded" @change="addSubCategoryList" >
										<option value="${clubDto.clubMainCategory}">${clubDto.clubMainCategory}</option>
										<option v-for="(category1,index) in mainCategoryList" v-bind:key="index" :value="category1.categoryContent">{{category1.categoryContent}}</option>
									</select>
								</div>
								<div class="col">
									<select name="clubSubCategory" class="form-control rounded" >
										<option value="${clubDto.clubSubCategory}">${clubDto.clubSubCategory}</option>
										<option v-for="(category2,index) in subCategoryList" v-bind:key="index" :value="category2.categoryContent">{{category2.categoryContent}}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-2 text-start">
							<label>지역</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList" v-model="address1No">
										<option value="">시/도를 선택해주세요</option>
										<option v-for="(address1, index) in address1List" v-bind:key="index" :value="address1.address1No" >{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="clubPlace" class="form-control rounded" >
										<option value="${clubDto.clubPlace}">${clubDto.clubPlace}</option>
										<option v-for="(address2, index) in address2List" v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="text-start mt-2">
							<label>소모임 소개</label>
							<textarea name="clubSummary" class="form-control rounded">${clubDto.clubSummary}</textarea>
						</div>
						<div class="text-start mt-2">
							<label>인원</label>
							<input type="number" name="clubMemberLimit" class="form-control rounded" value="${clubDto.clubMemberLimit}">
						</div>
							</div>
					<button type="submit" class="btn btn-outline-success mt-4 form-control">수정하기</button>
						</div>
					</form>
				</div>

			</div>

		</div>
	</div>

	<!-- vue js도 lazy loading을 사용한다 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/vue@next"></script>
	<script src="${root}/js/sidebars.js"></script>
	<script>
        const app = Vue.createApp({
            data(){
                return {
                	mainCategoryList:{},
                	subCategoryList:{},
            		address1List: [],
            		address2List: [],
            		// 시/도 번호
            		address1No : "",
            		// 시/군/구 값
            		city: "",	
            		
                };
            },
            computed:{
                
            },
            methods:{
            	callList(){
            		// 카테고리 - 대분류
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/category1",
            			method:"get",
            		}).then((resp) => {
            			this.mainCategoryList =resp.data;
            		})	
            		
            		// 시/도 
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/address1",
            			method:"get",
            		}).then((resp) => {
            			this.address1List = resp.data;
            		})	
            	},
            	// 시/군/구 추가
            	addCityList(){
            		if(this.address1No == ""){
            			this.address2List = [];
            			return;
            		}
            		// 시/군/구
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address1No,
            			method:"get",
            		}).then((resp) => {
            			this.address2List = [];
            			this.address2List = resp.data;
            		})		
            	},
            	// 카테고리 소분류 추가
            	addSubCategoryList(){
            		// 카테고리 - 분류
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/category2/"+this.clubMainCategory,
            			method:"get",
            		}).then((resp) => {
            			this.subCategoryList =resp.data;
            		})	
            	},
            },
            created(){
            	this.callList();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>