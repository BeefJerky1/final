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
.red{
	color:red;
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
									<li><a href="#" class="link-light rounded">MBTI 동물</a></li>
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
					<div class="row text-center mb-3 mt-5">
						<h1>소모임 상세정보</h1>
					</div>
					<div class="row">
						<h3>소모임 멤버</h3>
						<table class="table">
							<thead class="table-dark">
								<tr>
									<th>가입 신청일</th>
									<th>회원 번호</th>
									<th>성별</th>
									<th>MBTI</th>
									<th>관심1</th>
									<th>관심2</th>
									<th>관심3</th>
									<th>동물</th>
									<th>닉네임</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(member1 , index) in member">
									<td>{{member1.clubMemberDto.clubMemberDate}}</td>
									<td>{{member1.clubMemberDto.memberNo}}</td>
									<td>{{member1.memberDto.memberGender}}</td>
									<td>{{member1.memberDto.memberMbti}}</td>
									<td>{{member1.memberDto.memberInterest1}}</td>
									<td>{{member1.memberDto.memberInterest2}}</td>
									<td>{{member1.memberDto.memberInterest3}}</td>
									<td>{{member1.memberDto.memberAnimal}}</td>
									<td>{{member1.memberDto.memberNick}}</td>
								</tr>
							</tbody>
						</table>
							<button type="button" v-on:click="appendMember()" :disabled="this.memberdataFull == true" class="form-control btn-outline-primary " style="border-radius:1em !important">
        더보기 ({{showMember}}/{{totalMember}})
    </button>
					</div>
					<div class="row">
						<h3>소모임 게시글</h3>
						<table class="table">
							<thead class="table-dark">
								<tr>
									<th>게시글 번호</th>
									<th>댓글수</th>
									<th>좋아요수</th>
									<th>조회수</th>
									<th>신고수</th>
									<th>작성시간</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(clubboard , index) in board">
									<td>{{clubboard.clubBoardNo}}</td>
									<td>{{clubboard.clubBoardCount}}</td>
									<td>{{clubboard.clubBoardLike}}</td>
									<td>{{clubboard.clubBoardReadcount}}</td>
									<td>{{clubboard.clubBoardReportcount}}</td>
									<td>{{clubboard.clubBoardTime}}</td>
									<td>{{clubboard.clubBoardWriter}}</td>
								</tr>
							</tbody>
						</table>
	<button type="button" v-on:click="appendBoard()" :disabled="this.boarddataFull == true" class="form-control btn-outline-primary " style="border-radius:1em !important">
        더보기 ({{showBoard}}/{{totalBoard}})
    </button>
					</div>
					<div class="row mb-5">
						<h3>소모임 댓글</h3>
											<table class="table">
							<thead class="table-dark">
								<tr>
									<th>게시글 번호</th>
									<th>댓글 번호</th>
									<th>좋아요수</th>
									<th>신고수</th>
									<th>작성시간</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(boardreply , index) in reply">
									<td>{{boardreply.clubBoardNo}}</td>
									<td>{{boardreply.replyNo}}</td>
									<td>{{boardreply.clubReplyLike}}</td>
									<td>{{boardreply.clubReplyReportcount}}</td>
									<td>{{boardreply.clubReplyTime}}</td>
									<td>{{boardreply.clubReplyWriter}}</td>
								</tr>
							</tbody>
						</table>
						
						
									<div class="mt-2 rounded" style="border-radius: 1em !important">
					<button type="button" v-on:click="appendReply()"
						:disabled="this.replydataFull == true"
						class="btn btn-outline-primary form-control"
						style="border-radius: 1em !important">더보기
						({{showReply}}/{{totalReply}})</button>
				</div>
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
     				//소모임 멤버
                	memberAll:{}, //전체 멤버
                    member:[], //보여지는 멤버
                    totalMember:0, //전체 멤버
                    showMember:5, //보여주는 멤버 수
                    memberLeft:0,//남은 멤버 수
                    memberdataFull:false,
     				
     				//게시글
                    boardAll:[], //전체 게시글
                    board:[], //보여지는 게시글
                    totalBoard:0, //전체 게시글
                    showBoard:5, //보여주는 게시글 수
                    boardLeft:0,//남은 게시글 수
                    boarddataFull:false,
                    
                    //댓글
     	           replyAll:[], //전체 댓글
                   reply:[], //보여지는 댓글
                   totalReply:0, //전체 댓글
                   showReply:5, //보여주는 댓글 수
                   replyLeft:0,//남은 댓글 수
                   replydataFull:false,
                };
            },
            computed:{
            	clubNo(){
            		const href = window.location.href;
            		const url = new URL(href);
            		return url.searchParams.get("clubNo");
            	},
            },
            methods:{
            	clubMemberList(){
            		axios({
            			url:"${pageContext.request.contextPath}/rest/admin/clubmember/"+this.clubNo,
            			method:"get",
            		}).then(resp=>{

						let data = []
						for(var i = 0; i<this.showMember;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}

						this.memberAll = resp.data,
						this.member = data,
						this.totalMember = this.memberAll.length
						
						//총 게시글 수가 보이는 게시글 수(5)보다 작으면
						if(this.totalMember < this.showMember){
// 							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.member = this.memberAll;	//게시글에 게시글 전체를 넣는다.
	                		this.memberdataFull=true;	//버튼은 disable
						}else if(this.totalMember>this.showMember){ 
	                		this.memberdataFull=false; //버튼은 disable
						}else if(this.totalMember==this.showMember){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.memberdataFull=true;	//버튼은 disable
						}
            		})
            	},
            	appendMember(){
                	//남은 게시글 수 확인
                	this.memberLeft = this.totalBoard- this.showBoard;
                	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
                	if(this.memberLeft < 5){
						this.showMember = this.totalMember;
						this.member = this.memberAll;
						this.memberLeft = this.totalMember- this.showMember;
	                	this.clubMemberList();
                	}else 
                	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
                	if(this.memberLeft >= 5){
                		this.showMember +=5
                		this.memberLeft = this.totalMember- this.showMember;
                	let data =[]
                	for(var i=0; i<this.showMember; i++){
                		data.push(this.memberAll[i])
                	}
                	this.member = data
                	this.clubMemberList();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.memberLeft==0){
                		this.memberdataFull=true;
                		
                	}
                	
                },
            	clubBoardList(){
            		axios({
            			url:"${pageContext.request.contextPath}/rest/admin/clubboard/"+this.clubNo,
            			method:"get",
            		}).then(resp=>{

						let data = []
						for(var i = 0; i<this.showBoard;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}


						this.boardAll = resp.data,
						this.board = data,
						this.totalBoard = this.boardAll.length
						
						//총 게시글 수가 보이는 게시글 수(5)보다 작으면
						if(this.totalBoard < this.showBoard){
// 							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.board = this.boardAll;	//게시글에 게시글 전체를 넣는다.
	                		this.boarddataFull=true;	//버튼은 disable
						}else if(this.totalBoard>this.showBoard){ 
	                		this.boarddataFull=false; //버튼은 disable
						}else if(this.totalBoard==this.showBoard){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.boarddataFull=true;	//버튼은 disable
						}
            		})
            	},
            	appendBoard(){
                	//남은 게시글 수 확인
                	this.boardLeft = this.totalBoard- this.showBoard;
                	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
                	if(this.boardLeft < 5){
						this.showBoard = this.totalBoard;
						this.board = this.boardAll;
						this.boardLeft = this.totalBoard- this.showBoard;
	                	this.clubBoardList();
                	}else 
                	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
                	if(this.boardLeft >= 5){
                		this.showBoard +=5
                		this.boardLeft = this.totalBoard- this.showBoard;
                	let data =[]
                	for(var i=0; i<this.showBoard; i++){
                		data.push(this.boardAll[i])
                	}
                	this.board = data
                	this.loadClubBoardList();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.boardLeft==0){
                		this.boarddataFull=true;
                		
                	}
                	
                },
                clubReplyList(){
                	axios({
                		url:"${pageContext.request.contextPath}/rest/admin/clubreply/"+this.clubNo,
            			method:"get",
                	}).then(resp=>{
                		let data = []
						for(var i = 0; i<this.showReply;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.replyAll = resp.data, //데이터 전부를 전체 댓글에 넣는다.
						this.reply = data, //보여지는 댓글 수만큼만 reply에 넣는다.
						this.totalReply = this.replyAll.length
						
						//총 게시글 수가 보이는 게시글 수(5)보다 작으면
						if(this.totalReply < this.showReply){
// 							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.reply = this.replyAll;	//게시글에 게시글 전체를 넣는다.
	                		this.replydataFull=true;	//버튼은 disable
						}else if(this.totalReply>this.showReply){ 
	                		this.replydataFull=false; //버튼은 disable
						}else if(this.totalReply==this.showReply){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.replydataFull=true;	//버튼은 disable
						}
                	})
                },
                appendReply(){
                	//남은 게시글 수 확인
                	this.replyLeft = this.totalReply- this.showReply;
                	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
                	if(this.replyLeft < 5){
						this.showReply = this.totalReply;
						this.reply = this.replyAll;
						this.replyLeft = this.totalReply- this.showReply;
	                	this.clubReplyList();
                	}else 
                	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
                	if(this.replyLeft >= 5){
                		this.showReply +=5
                		this.replyLeft = this.totalReply- this.showReply;
                	let data =[]
                	for(var i=0; i<this.showReply; i++){
                		data.push(this.replyAll[i])
                	}
                	this.reply = data
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.replyLeft==0){
                		this.replydataFull=true;
                		
                	} 	
                },
            	
            },
            created(){
				this.clubMemberList();
				this.clubBoardList();
				this.clubReplyList();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>