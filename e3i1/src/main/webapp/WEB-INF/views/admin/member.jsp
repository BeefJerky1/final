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
<title>회원관리</title>
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
						<h1>회원 목록 (전체 회원 수)</h1>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4  p-4">
						<select class="form-select" v-model="orderType"
							v-on:change="changeList($event)"
							style="border-radius: 1em !important">
							<option value="memberNoAsc">회원번호(오름차순)</option>
							<option value="memberNoDesc">회원번호(내림차순)</option>
							<option value="memberReportCountAsc">회원신고(오름차순)</option>
							<option value="memberReportCountDesc">회원신고(내림차순)</option>
							<option value="memberNickAsc">회원닉네임(오름차순)</option>
							<option value="memberNickDesc">회원닉네임(내림차순)</option>
							<option value="memberBirthAsc">회원생일(오름차순)</option>
							<option value="memberBirthDesc">회원생일(내림차순)</option>
							<option value="memberLogindateAsc">마지막 로그인(오름차순)</option>
							<option value="memberLogindateDesc">마지막 로그인(내림차순)</option>
						</select>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<table class="table text-center">
							<thead class="table-dark">
								<tr>
									<!--   						<th></th> -->
									<th>번호</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>성별</th>
									<th>생일</th>
									<!--   						<th>관심분야</th> -->
									<th>소모임</th>
									<th>신고</th>
									<th>마지막 로그인</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(member1 , index) in member">
									<td>{{member1.memberNo}}</td>
									<td>{{member1.memberEmail}}</td>
									<td>{{member1.memberNick}}</td>
									<td>{{member1.memberGender}}</td>
									<td>{{convertTime(member1.memberBirth)}}</td>
									<!--   					<td>{{member.memberInterest1}}</td> -->
									<td>{{member1.memberClubCount}}</td>
									<td>{{member1.memberReportCount}}</td>
									<td>{{elapsedText(member1.memberLogindate)}}</td>
									<td>
										<button type="button" class="btn btn-warning"
											v-on:click=" select(index)">수정</button>
									</td>
									<td><button class="btn btn-danger"
											v-on:click="deleteMember(index)">삭제</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
<button type="button" v-on:click="append()" :disabled="this.dataFull == true" class="form-control btn-outline-primary " style="border-radius:1em !important">
        더보기 ({{showMember}}/{{totalMember}})
    </button>
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
	<script src="${root}/js/time.js"></script>
	    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <!-- char.js cdn-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
	<script>
        const app = Vue.createApp({
            data(){
                return {
                	deleteResult:"",//삭제 결과
    				orderType:"memberNoAsc",//정렬 방식
    				editMode:false,
    				
    				//더보기
    				allMember:{},//전체 리스트
    				member:{}, //보여지는 리스트
    	            totalMember:0, //전체 멤버
                    showMember:5, //보여주는 멤버 수
                    MemberLeft:0,//남은 멤버 수
                    dataFull:false,
                };
            },
            computed:{
            	
            },
            methods:{
            	//멤버 전체 조회
				memberList(){
					axios({
						url:"${pageContext.request.contextPath}/rest/admin/member/"+this.orderType,
						method:"get",
					}).then(resp=>{
						let data = []
						for(var i = 0; i<this.showMember;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allMember = resp.data,
						this.member = data,
						this.totalMember = this.allMember.length
						if(this.totalMember < this.showMember){
							this.showMember = this.totalMember;
							this.member = this.allMember;
	                		this.dataFull=true;
						}else if(this.totalMember==this.showMember){
	                		this.dataFull=true;
						}
					});
				},
				append(){
                	this.memberLeft = this.totalMember- this.showMember;
                	if(this.memberLeft < 5){
						this.showMember = this.totalMember;
						this.member = this.allMember;
						this.memberLeft = this.totalMember- this.showMember;
	                	this.memberList();
                	}else 
                	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
                	if(this.memberLeft >= 5){
                		this.showMember +=5
                		this.memberLeft = this.totalMember- this.showMember;
                	let data =[]
                	for(var i=0; i<this.showMember; i++){
                		data.push(this.allMember[i])
                	}
                	this.member = data
                	this.memberList();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.memberLeft==0){
                		this.dataFull=true;
                		
                	}
                	
                },
				//멤버 상세 조회
	            select: function(index) {
	                	const member = this.allMember[index];
	                	window.location.href='http://localhost:8080/e3i1/admin/member_detail?memberNo='+member.memberNo;
	              },
				//멤버 삭제
	             deleteMember(index){
                	const member = this.allMember[index];
                	if (window.confirm('정말 삭제하시겠습니까?')){
                    	axios({
                    		url:"${pageContext.request.contextPath}/rest/admin/member/"+member.memberNo,
                    		method:"delete",
                    	}).then(resp=>{
                    		this.deleteResult = resp.data;
                    		if(this.deleteResult==1){
                    			window.alert("회원이 삭제되었습니다.")
                    			this.memberList();
                    		}
                    	})
                	}else{
                	  return;
                	}
                },
                changeList(event) {
                	axios({
                		url:"${pageContext.request.contextPath}/rest/admin/member/"+event.target.value,
		        		method:"get",
                	}).then(resp=>{
            			let data = []
						for(var i = 0; i<this.showMember;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allMember = resp.data,
						this.member = data,
						this.totalMember = this.allMember.length
						if(this.totalMember < this.showMember){
							this.showMember = this.totalMember;
							this.member = this.allMember;
	                		this.dataFull=true;
						}else if(this.totalMember==this.showMember){
	                		this.dataFull=true;
						}
                	})
                    console.log(event.target.value)
                },
                //시간 바꾸기
                elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },
                //moment js
		        convertTime(time){
                	return moment(time).format("MM/DD");   //월 일
		        },
		       
            },
            created(){
            	this.memberList();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>