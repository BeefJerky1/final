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
            <li><a href="#" class="link-light rounded">MBTI 동물</a></li>
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
  	<div class="col-lg-9 col-md-9 col-sm-9">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 mt-5 p-4">
						<h1>소모임 목록 (전체 회원 수)</h1>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4  p-4">
						<select class="form-select" v-model="orderType"
							v-on:change="changeList($event)"
							style="border-radius: 1em !important">
							<option value="clubNoAsc">번호(오름차순)</option>
							<option value="clubNoDesc">번호(내림차순)</option>
							<option value="clubNameAsc">이름(오름차순)</option>
							<option value="clubNameDesc">이름(내림차순)</option>
							<option value="clubMainCategoryAsc">대분류(오름차순)</option>
							<option value="clubMainCategoryDesc">대분류(내림차순)</option>
							<option value="clubSubCategoryAsc">소분류(오름차순)</option>
							<option value="clubSubCategoryDesc">소분류(내림차순)</option>
							<option value="clubMemberLimitAsc">인원제한(오름차순)</option>
							<option value="clubMemberLimitDesc">인원제한(내림차순)</option>
						</select>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<table class="table text-center">
							<thead class="table-dark">
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>리더</th>
									<th>대분류</th>
									<th>소분류</th>
									<th>지역</th>
									<th>인원제한</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(club1 , index) in club">
									<td>{{club1.clubNo}}</td>
									<td>{{club1.clubName}}</td>
									<td>{{club1.clubLeader}}</td>
									<td>{{club1.clubMainCategory}}</td>
									<td>{{club1.clubSubCategory}}</td>
									<td>{{club1.clubPlace}}</td>
									<td>{{club1.clubMemberLimit}}</td>
									<td>
										<button type="button" class="btn btn-warning"
											v-on:click=" select(index)">수정</button>
									</td>
									<td><button class="btn btn-danger"
											v-on:click="deleteClub(index)">삭제</button></td>
								</tr>
							</tbody>
						</table>

					</div>
					<button type="button" v-on:click="append()" :disabled="this.dataFull == true" class="form-control btn-outline-primary " style="border-radius:1em !important">
        더보기 ({{showClub}}/{{totalClub}})
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
    				orderType:"clubNoAsc",//정렬 방식
    				deleteResult:"",
    				
    				//더보기
    				allClub:{},//전체 리스트
    				club:{}, //보여지는 리스트
    	            totalClub:0, //전체 멤버
                    showClub:5, //보여주는 멤버 수
                    ClubLeft:0,//남은 멤버 수
                    dataFull:false,
    				
    				
    				
                };
            },
            computed:{
                
            },
            methods:{
               	//소모임 전체 조회
				clubList(){
					axios({
						url:"${pageContext.request.contextPath}/rest/admin/club/"+this.orderType,
						method:"get",
					}).then(resp=>{
						let data = []
						for(var i = 0; i<this.showClub;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allClub = resp.data,
						this.club = data,
						this.totalClub = this.allClub.length
						if(this.totalClub < this.showClub){
							this.showClub = this.totalClub;
							this.club = this.allClub;
	                		this.dataFull=true;
						}else if(this.totalClub==this.showClub){
	                		this.dataFull=true;
						}
					})
				},
				//소모임 정렬
                changeList(event) {
                	axios({
                		url:"${pageContext.request.contextPath}/rest/admin/club/"+event.target.value,
		        		method:"get",
                	}).then(resp=>{
            			let data = []
						for(var i = 0; i<this.showClub;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allClub = resp.data,
						this.club = data,
						this.totalClub = this.allClub.length
						if(this.totalClub < this.showClub){
							this.showClub = this.totalClub;
							this.club = this.allClub;
	                		this.dataFull=true;
						}else if(this.totalClub==this.showClub){
	                		this.dataFull=true;
						}
                	})
                    console.log(event.target.value)
                },
                //더보기
                append(){
                	this.clubLeft = this.totalClub- this.showClub;
                	if(this.clubLeft < 5){
						this.showClub = this.totalClub;
						this.club = this.allClub;
						this.clubLeft = this.totalClub- this.showClub;
	                	this.clubList();
                	}else 
                	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
                	if(this.clubLeft >= 5){
                		this.showClub +=5
                		this.clubLeft = this.totalClub- this.showClub;
                	let data =[]
                	for(var i=0; i<this.showClub; i++){
                		data.push(this.allClub[i])
                	}
                	this.club = data
                	this.clubList();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.clubLeft==0){
                		this.dataFull=true;
                		
                	}
                	
                },
				//소모임 상세 조회
	            select: function(index) {
	                	const club = this.allClub[index];
	                	window.location.href='http://localhost:8080/e3i1/admin/club_detail?clubNo='+club.clubNo;
	              },
				//소모임 삭제
	             deleteClub(index){
                	const club = this.allClub[index];
                	if (window.confirm('정말 삭제하시겠습니까?')){
                    	axios({
                    		url:"${pageContext.request.contextPath}/rest/admin/club/"+club.clubNo,
                    		method:"delete",
                    	}).then(resp=>{
                    		this.deleteResult = resp.data;
                    		if(this.deleteResult==1){
                    			window.alert("모임이 삭제되었습니다.")
                    			this.clubList();
                    		}
                    	})
                	}else{
                	  return;
                	}
                },
            },
            created(){
            	this.clubList();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>