<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
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
<link rel="stylesheet" type="text/css" href="${root}/css/sidebars.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/club.css">
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
					<span class="fs-5 fw-semibold"><a href="${root}/admin/">관리자 페이지</a></span>
					</div>
					 <ul class="list-unstyled ps-0 p-4">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#user-collapse" aria-expanded="flase">
          회원
        </button>
        <div class="collapse" id="user-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/member" class="link-light rounded">회원 목록</a></li>
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
    </div><!-- side 끝 -->
    	<!-- 중앙 -->
		<div class="col-md-6 mb-5">
			<div class="card">
				<div class="card-body">
					<div class="card-title text-center mt-2">
						<span class="boldfontL"  style="color:#3E4684;">결제 관리</span>
					</div>
				</div>
				<div class="card-body">
				
				 	 <table class="table table-hover text-center mb-4">
						<thead class="boldfontS">
							<th>결제번호</th>
							<th>TID</th>
							<th>상품이름</th>
							<th>금액</th>
							<th>결제시간</th>
							<th>상태</th>
						</thead>
						<tbody class="fontSS">
							<template v-for="(payment1 , index) in payment" :key="index">
								<tr class="show-detail">
									<td>{{payment1.paymentNo}}</td>
									<td>{{payment1.paymentTid}}</td>
									<td>{{payment1.paymentName}}</td>
									<td>{{payment1.paymentTotal}}</td>
									<td>{{convertTime(payment1.paymentTime)}}</td>
									<td>{{payment1.paymentStatus}}</td>
								</tr>
							</template>
						</tbody>
					</table>
									<button type="button" v-on:click="append()" :disabled="this.dataFull == true" class="form-control btn-outline-primary " style="border-radius:1em !important">
        더보기 ({{showPayment}}/{{totalPayment}})
        </button>
				</div>
			</div>
		</div>
		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
			<div class="col-lg-12 col-md-12 col-sm-12 mt-5 p-4 text-start">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
							<h5>검색</h5>
							<form class="form-floating">
							        <input type="text" class="form-control"  v-model="paymentNo" id="paymentNo" placeholder="결제번호" >	
									<label for="paymentNo">결제번호</label>
							</form>
							<form class="form-floating">
							        <input type="text" class="form-control"  v-model="paymentTid" id="paymentTid" placeholder="TID" >	
									<label for="paymentTid">TID</label>
							</form>
							<form class="form-floating">
							        <input type="text" class="form-control"  v-model="paymentName" id="paymentName"  placeholder="상품이름">	
									<label for="paymentName">상품이름</label>
							</form>
							<form class="form-floating">
							        <input type="text" class="form-control"  v-model="paymentTotal" id="paymentTotal"  placeholder="금액">	
									<label for="paymentTotal">금액</label>
							</form>
							<form class="form-floating">
							        <input type="text" class="form-control"  v-model="paymentStatus" id="paymentStatus"  placeholder="상태">	
									<label for="paymentStatus">상태</label>
							</form>          
							  </div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<h5>정렬</h5>
							<select class="form-control" v-model="column" v-on:change="list()">
								<option value="payment_no">결제 번호</option>
								<option value="payment_name">상품이름</option>
								<option value="payment_total">금액</option>
								<option value="payment_time">날짜</option>							
								<option value="payment_status">상태</option>
							</select>
							<select class="form-control mb-5" v-model="order" v-on:change="list()">
								<option value="asc">오름차순</option>
								<option value="desc">내림차순</option>				
							</select>
							<button type="button" class="btn btn-outline-primary form-control" v-on:click="search()">조회</button>
							<button type="button" class="btn btn-outline-success form-control" v-on:click="reset()">초기화</button>
						</div>
						 </div>
						</div>

		</div>
		
    
    </div><!-- row -->
                         <!--  상세보기 모달 -->
      <div v-if="this.paymentDetail!=null">
      <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
						<span class="clubMemberNick">{{paymentDetail.paymentNo}}</span>
				</div>
				  <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
						<span class="clubMemberList">{{paymentDetail.paymentDetailNo}}/ </span>
					</div>
					  <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
						<span class="clubMemberList">{{paymentDetail.paymentDetailQuantity}}</span>
					</div>
					  <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
						<span class="clubMemberList">{{paymentDetail.paymentDetailPrice}}</span><br>
						</div>
					  <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
						<span class="btn btn-outline-success mt-2">{{paymentDetail.paymentDetailStatus}}</span>
					</div>
	            </div>
            	<div class="modal-footer">
            	</div>
          </div>
        </div>
      </div>
    </div>
    </div>
    </div><!-- container -->

    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="${root}/js/sidebars.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
    
    <script>
        const app = Vue.createApp({
            data(){
                return {
    				//더보기
    				allPayment:{},//전체 리스트
    				payment:{}, //보여지는 리스트
    	            totalPayment:0, //전체 멤버
                    showPayment:5, //보여주는 멤버 수
                    paymentLeft:0,//남은 멤버 수
                    dataFull:false,
    				
                    //검색
                    paymentNo:"",
					paymentTid:"",
					paymentName:"",
					paymentTotal:"",
					paymentTime:"",
					paymentStatus:"",
                    column:"payment_no",
                    order:"desc",
                    
                    paymentDetail:null,
                };
            },
            computed:{
            },
            methods:{
				//결제 목록
				list(){
					axios({
						url:"${pageContext.request.contextPath}/rest/admin/payment/"+this.column+"/"+this.order,
						method:"get",
					}).then(resp=>{
						let data = []
						for(var i = 0; i<this.showPayment;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allPayment = resp.data,
						this.payment = data,
						this.totalPayment = this.allPayment.length
						if(this.totalPayment < this.showPayment){
							this.payment = this.allPayment;	//게시글에 게시글 전체를 넣는다.
	                		this.dataFull=true;	//버튼은 disable
						}else if(this.totalPayment>this.showPayment){ 
	                		this.dataFull=false; //버튼은 disable
						}else if(this.totalPayment==this.showPayment){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.dataFull=true;	//버튼은 disable
						}
					})
				},
				//더보기
                append(){
                	this.paymentLeft = this.totalPayment- this.showPayment;
                	if(this.paymentLeft < 5){
						this.showPayment = this.totalPayment;
						this.payment = this.allPayment;
						this.paymentLeft = this.totalPayment- this.showPayment;
	                	this.list();
                	}else 
                	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
                	if(this.paymentLeft >= 5){
                		this.showClub +=5
                		this.paymentLeft = this.totalPayment- this.showPayment;
                	let data =[]
                	for(var i=0; i<this.showPayment; i++){
                		data.push(this.allPayment[i])
                	}
                	this.payment = data
                	this.list();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.paymentLeft==0){
                		this.dataFull=true;
                		
                	}
                	
                },
              //검색
                search(){
           			axios({
						url:"${pageContext.request.contextPath}/rest/admin/payment",
						method:"post",
						data:{
							paymentNo:this.paymentNo,
							paymentTid:this.paymentTid,
							paymentName:this.paymentName,
							paymentTotal:this.paymentTotal,
							paymentTime:this.paymentTime, 
							paymentStatus:this.paymentStatus,
							column:this.column,
							order:this.order,
						}
					}).then(resp=>{
						let data = []
						for(var i = 0; i<this.showPayment;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allPayment = resp.data,
						this.payment = data,
						this.totalPayment = this.allPayment.length
						if(this.totalPayment < this.showPayment){
							this.showPayment = this.totalPayment;
							this.payment = this.allPayment;
	                		this.dataFull=true;
						}else if(this.totalPayment==this.showPayment){
	                		this.dataFull=true;
						}
					})
                },
                reset(){                   
                	this.column="payment_no";
                	this.order="desc";
                	this.paymentNo ="";
	                this.paymentTid ="";
	               	this.paymentName ="";
	                this.paymentTotal ="";
	                this.paymentTime =""; 
                	this.paymentStatus="";
                	this.list();
                },
                //moment js
		        convertTime(time){
                	return moment(time).format("MM/DD");   //월 일
		        },
            },           
            created(){
            	this.list();
            },
        });
        app.mount("#app");
    </script>
</body>
