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
<title>회원 상세</title>
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
            <li><a href="#" class="link-light rounded">회원 차트</a></li>
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
		<div class="col-md-8 mb-5 p-4 text-dark  rounded">
					<form action="memberInformation" method="post" enctype="multipart/form-data">
				<div class="col-md-6 offset-md-3">
					<div class="row text-center mt-3 mb-5">
                                <div class="row text-center mb-3 mt-5">
                                  <h1>회원 수정</h1>
                                  </div>

                                           <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberName"
                                    autocomplete="off"
                                    value="${memberDto.memberName}"
                                    required> 
                                    <label for="floatingInput">Name</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberEmail"
                                    autocomplete="off"
                                    value="${memberDto.memberEmail}"
                                    > 
                                    <label for="floatingInput">Email</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberNick"
                                    autocomplete="off"
                                    value="${memberDto.memberNick}"
                                    > 
                                    <label for="floatingInput">Nickname</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <select name="memberGender" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberGender}">${memberDto.memberGender}</option>
                                        <option>남자</option>
                                        <option>여자</option>
                                    </select> <label for="floatingSelect">Gender</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberPhone"
                                    autocomplete="off"
                                    value="${memberDto.memberPhone}"
                                    > 
                                    <label for="floatingInput">Phone</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberSnsId"
                                    autocomplete="off"
                                    value="${memberDto.memberSnsId}"
                                    > 
                                    <label for="floatingInput">SNS Id</label>
                                </div>

                               


                                <div class="form-floating mb-3">
                                    <select name="memberInterest1" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberInterest1}">${memberDto.memberInterest1}</option>
                                        <option>#액티비티매니아</option>
                                        <option>#인스타그래머</option>
                                        <option>#금손모임</option>
                                        <option>#친구해요</option>
                                        <option>#뇌섹남녀</option>
                                        <option>#텅장되자</option>
                                        <option>#킹스맨</option>
                                        <option>#자연인</option>
                                        <option>#집사님</option>
                                        <option>#집돌이집순이</option>
                                    </select> <label for="floatingSelect">Interest1</label>
                                </div>
            					<input type="hidden"  name="memberNo" value="${memberDto.memberNo}">
                                <div class="form-floating mb-3">
                                    <select name="memberInterest2" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberInterest2}">${memberDto.memberInterest2}</option>
                                        <option>#액티비티매니아</option>
                                        <option>#인스타그래머</option>
                                        <option>#금손모임</option>
                                        <option>#친구해요</option>
                                        <option>#뇌섹남녀</option>
                                        <option>#텅장되자</option>
                                        <option>#킹스맨</option>
                                        <option>#자연인</option>
                                        <option>#집사님</option>
                                        <option>#집돌이집순이</option>
                                    </select> <label for="floatingSelect">Interest2</label>
                                </div>
            
                                <div class="form-floating mb-3">
                                    <select name="memberInterest3" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberInterest3}">${memberDto.memberInterest3}</option>
                                        <option>#액티비티매니아</option>
                                        <option>#인스타그래머</option>
                                        <option>#금손모임</option>
                                        <option>#친구해요</option>
                                        <option>#뇌섹남녀</option>
                                        <option>#텅장되자</option>
                                        <option>#킹스맨</option>
                                        <option>#자연인</option>
                                        <option>#집사님</option>
                                        <option>#집돌이집순이</option>
                                    </select> <label for="floatingSelect">Interest3</label>
                                </div>
            
                           <div class="mt-2 text-start">
							<label class="label1">관심 지역1</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList1" v-model="address1No"> 
										<option value="" selected>시/도</option>
										<option v-for="(address1, index) in address1List1"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace1" class="form-control rounded" v-model="city1">
										<option value="${memberDto.memberPlace1}">${memberDto.memberPlace1}</option>
										<option v-for="(address2, index) in address2List1"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-2 text-start">
							<label class="label1">관심 지역2</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList2" v-model="address2No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List2"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace2" class="form-control rounded" v-model="city2">
										<option value="${memberDto.memberPlace2 }">${memberDto.memberPlace2 }</option>
										<option v-for="(address2, index) in address2List2"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-2 text-start">
							<label class="label1">관심 지역3</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList3" v-model="address3No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List3"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace3" class="form-control rounded" v-model="city3">
										<option value="${memberDto.memberPlace3 }">${memberDto.memberPlace3}</option>
										<option v-for="(address2, index) in address2List3"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
                                    <button type="submit" class="btn btn-outline-success mt-4 form-control">수정하기</button>
						</div>
            
                           
                                           
                            </div>    
                                     
				</div>
			</form>
		</div>
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
                	// 지역 목록용
    				address1List1: [],
    				address2List1: [],
    				
    				address1List2: [],
    				address2List2: [],
    				
    				address1List3: [],
    				address2List3: [],
    						
    				// 시/도 번호
    				address1No : "",
    				address2No : "",
    				address3No : "",
    				
    				// 시/군/구 값
    				city1: "",		
    				city2: "",		
    				city3: "",		
                };
            },
            computed:{
                
            },
            methods: {
            	// 시/군/구 추가
            	addCityList1(){
            		if(this.address1No == ""){
            			this.address2List1 = [];
            			return;
            		}
            		// 시/군/구
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address1No,
            			method:"get",
            		}).then((resp) => {
            			this.city1 = "${memberDto.memberPlace1}";
            			this.address2List1 = [];
            			this.address2List1.push(...resp.data);
            		})		
            	},
            	
            	addCityList2(){
            		if(this.address2No == ""){
            			this.address2List2 = [];
            			return;
            		}
            		// 시/군/구
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address2No,
            			method:"get",
            		}).then((resp) => {
            			this.city2 = "${memberDto.memberPlace2}";
            			this.address2List2 = [];
            			this.address2List2.push(...resp.data);
            		})		
            	},
            	
            	addCityList3(){
            		if(this.address3No == ""){
            			this.address2List3 = [];
            			return;
            		}
            		// 시/군/구
            		axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address3No,
            			method:"get",
            		}).then((resp) => {
            			this.city3 = "${memberDto.memberPlace3}";
            			this.address2List3 = [];
            			this.address2List3.push(...resp.data);
            		})		
            	},
            },
            created() {
            	// 시/도 
            	axios({
            			url:"${pageContext.request.contextPath}/rest/category_n_address/address1",
            			method:"get",
            		}).then((resp) => {
            			this.address1List1.push(...resp.data);
            			this.address1List2.push(...resp.data);
            			this.address1List3.push(...resp.data);
            		})	
            	},
            
        });
        app.mount("#app");
    </script>
</body>
</html>