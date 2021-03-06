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
table {
	font-weight: 600 !Important;
}
.dd{
background-color:transparent !important;
color:transparent !important;
}
.modal-body{
overflow: overlay;
word-break:break-all;
}
.btn-primary{
background-color:#3E4684 !important;
border-color:#3E4684 !important;
}
.btn-primary:hover{
background-color:#2f3564 !important;
border-color:#2f3564 !important;
}
.point2 {
	font-size: 3em;
	font-weight: 900;
	color: #3E4684;
}
.tagtitle {
	font-weight: 900;
	font-size: 1.0em;
}

.tagtext {
	font-weight: 900;
	font-size: 0.85em;
}

.card {
	border-width: 0.3em;
}


.maincolor {
	color: #3E4684;
	font-weight: 900;
	font-size: 1.0em;
}
.title-text-cut {
  white-space:nowrap !important;  
  overflow:hidden !important; 
  text-overflow:ellipsis !important;
  display:block;
  width:250px;
}
.content-text-cut {
  white-space:nowrap !important;  
  overflow:hidden !important; 
  text-overflow:ellipsis !important;
  display:block;
  width:300px;
}

.profile {
	border: 2.5px solid #3E4684;
	/* 	border: 4px solid #E9E9E9; */
	border-radius: 30px;
	padding: 2%;
	width: 100%;
	height: 450px;
	box-shadow: rgb(0 0 0/ 1%) 0px 19px 38px, rgb(0 0 0/ 22%) 0px 15px 12px;
}

.profileNick {
	font-size: 1.0em;
	font-weight: 900;
}

.profileMbti {
	background-color: #3E4684;
	color: white;
	border-radius: 5px;
	font-size: 0.7em;
	font-weight: 300;
}

.profileInterest {
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 15px;
	font-size: 0.8em;
	font-weight: 600;
}

.tableInterest {
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 5px;
	padding: 0.1em;
	font-size: 0.8em;
	font-weight: 600;
	width: 30px;
}

.tableInterest2 {
	background-color: #E9E9E9;
	color: #3E4684;
	font-size: 0.85em;
	font-weight: 600;
	width: 30px;
}

.tabletitle{
	font-size: 0.9em;
}

.nav-link {
	color: #3E4684;
	font-weight: 900;
}

i {
	color: #3E4684;
}

.boldfont2{
	font-size: 0.8em;
	font-weight: 900;
}

.titlefont {
	font-size: 1.2em;
}

.boldfont {
	font-weight: 900;
}

.pluscount {
	width: 40px;
	height: 40px;
	margin-bottom: 5px;
}
.smalllabel{
	font-size: 0.8em;
}
thead {
	padding : 1em 1em;
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
						<span class="fs-5 fw-semibold"><a href="${root}/admin/">?????????
								?????????</a></span>
					</div>
					<ul class="list-unstyled ps-0 p-4">
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#user-collapse"
								aria-expanded="flase">??????</button>
							<div class="collapse" id="user-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/member"
										class="link-light rounded">?????? ??????</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#payment-collapse"
								aria-expanded="false">??????</button>
							<div class="collapse" id="payment-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/payment"
										class="link-light rounded">?????? ??????</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#club-collapse"
								aria-expanded="false">?????????</button>
							<div class="collapse" id="club-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/club"
										class="link-light rounded">????????? ??????</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#board-collapse"
								aria-expanded="false">MBTI ?????????</button>
							<div class="collapse" id="board-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/mbtiboard"
										class="link-light rounded">????????? ??????</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#mbti-collapse"
								aria-expanded="false">MBTI ??????</button>
							<div class="collapse" id="mbti-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/mbtisurvey"
										class="link-light rounded">MBTI ??????</a></li>
									<li><a href="${root}/admin/mbtianimal"
										class="link-light rounded">MBTI ??????</a></li>
								</ul>
							</div>
						</li>
						<li class="border-top my-3"></li>
					</ul>
				</div>
			</div>
			<!-- side ??? -->
			<!-- ?????? -->
			<div class="col-md-6 mb-5 mt-5">
				<div class="card">
					<div class="card-body">
						<div class="card-title text-center mt-2">
							<span class="boldfontL" style="color: #3E4684;">??????</span>
						</div>
					</div>
					<div class="card-body">
						<table class="table table-hover text-center mb-4">
							<thead class="boldfontS">
								<th>??????</th>
								<th>?????????</th>
								<th>??????</th>
								<th>??????</th>
							</thead>
							<tbody class="fontSS">
								<template v-for="(notice1 , index) in notice" :key="index">
									<tr class="show-detail">
										<td>{{notice1.noticeNo}}</td>
										<td>{{notice1.memberNo}}</td>
										<td>[{{notice1.noticeHead}}]{{notice1.noticeTitle}}</td>
										<td>{{notice1.noticeContent}}</td>
									</tr>
								</template>
							</tbody>
						</table>
					</div>
				</div>
						<button type="button" v-on:click="append()"
							:disabled="this.dataFull == true"
							class="form-control btn-outline-primary "
							style="border-radius: 1em !important">?????????
							({{showNotice}}/{{totalNotice}})</button>
			</div>
			<!-- ????????? ???????????? -->
<!-- 			<div class="col-md-3 mt-5"> -->
<!-- 				<div class="col-md-3 profile mt-5" v-if="memberData!=null"> -->
<!-- 							<div class="profileimg text-center mt-5 mb-2"> -->
<%-- 								<img src="${root }/image/mbti/?????????(ISTP).png" --%>
<!-- 									style="border-radius: 50%; width: 140px; height: 140px;" /> -->
<!-- 							</div> -->
<!-- 							<div class="ml-5 text-center mb-3"> -->
<!-- 								<span class="profileNick"><i class="fa-solid fa-user"></i>&nbsp;{{memberData.memberNick}}</span>  -->
<!-- 								<span class="profileMbti" style="margin-left: 0.5em;">{{memberData.memberAnimal}}</span>  -->
<!-- 							</div> -->
<!-- 							<div class="text-center profileInterest my-1 mx-5">{{memberData.memberInterest1}}</div>  -->
<!-- 							<div class="text-center profileInterest my-1 mx-5">{{memberData.memberInterest2}}</div>  -->
<!-- 							<div class="text-center profileInterest my-1 mx-5">{{memberData.memberInterest3}}</div>  -->

<!-- 							<div class="row text-center"> -->
<!-- 							</div> -->
<!-- 							<div class="row text-center"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 			</div> -->


		</div>
		<!-- row -->
	</div>
	<!-- container -->

	<!-- vue js??? lazy loading??? ???????????? -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/vue@next"></script>
	<script src="${root}/js/sidebars.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>

	<script>
        const app = Vue.createApp({
            data(){
                return {
                	memberNo:"${login}",
    				//?????????
    				allNotice:{},//?????? ?????????
    				notice:{}, //???????????? ?????????
    	            totalNotice:0, //?????? ??????
                    showNotice:5, //???????????? ?????? ???
                    noticeLeft:0,//?????? ?????? ???
                    dataFull:false,
    				
                  	column:"notice_no",
                  	order:"desc",
                    memberData:null,
                };
            },
            computed:{
            },
            methods:{
            	member(){
            		axios({
            			url:"${pageContext.request.contextPath}/rest/message/member/"+this.memberNo,
            			method:"get",
            		}).then(resp=>{
            			this.memberData = resp.data
            		})
            	},
				//?????? ??????
				list(){
					axios({
						url:"${pageContext.request.contextPath}/rest/admin/notice/"+this.column+"/"+this.order,
						method:"get",
					}).then(resp=>{
						let data = []
						for(var i = 0; i<this.showNotice;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.allNotice = resp.data,
						this.notice = data,
						this.totalNotice = this.allNotice.length
						if(this.totalNotice < this.showNotice){
							this.notice = this.allNotice;	//???????????? ????????? ????????? ?????????.
	                		this.dataFull=true;	//????????? disable
						}else if(this.totalNotice>this.showNotice){ 
	                		this.dataFull=false; //????????? disable
						}else if(this.totalNotice==this.showNotice){//?????? ????????? ?????? ????????? ????????? ?????? ????????????
							this.dataFull=true;	//????????? disable
						}
					})
				},
				//?????????
                append(){
                	this.noticeLeft = this.totalNotice- this.showNotice;
                	if(this.noticeLeft < 5){
						this.showNotice = this.totalNotice;
						this.notice = this.allNotice;
						this.noticeLeft = this.totalNotice- this.showNotice;
	                	this.list();
                	}else 
                	//????????? ?????? 5??? ???????????? showBoard +5??? ????????? ??????
                	if(this.noticeLeft >= 5){
                		this.showNotice +=5
                		this.noticeLeft = this.totalNotice- this.showNotice;
                	let data =[]
                	for(var i=0; i<this.showNotice; i++){
                		data.push(this.allNotice[i])
                	}
                	this.notice = data
                	this.list();
                	//?????? ????????? ?????? 0????????? ?????? ?????? X
                	}else if(this.noticeLeft==0){
                		this.dataFull=true;
                		
                	}
                	
                },
                //moment js
		        convertTime(time){
                	return moment(time).format("MM/DD");   //??? ???
		        },
            },           
            created(){
            	this.list();
            	this.member();
            },
        });
        app.mount("#app");
    </script>
</body>
