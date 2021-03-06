<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mbti 게시판</title>
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
						<span class="fs-5 fw-semibold"><a href="${root}/admin/">관리자
								페이지</a></span>
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
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#payment-collapse"
								aria-expanded="false">결제</button>
							<div class="collapse" id="payment-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/payment"
										class="link-light rounded">결제 목록</a></li>
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
									<li><a href="${root}/admin/mbtianimal"
										class="link-light rounded">MBTI 동물</a></li>
								</ul>
							</div>
						</li>
						<li class="border-top my-3"></li>
					</ul>
				</div>
			</div>
			<!-- 중앙 -->
			<div class="col-lg-6 col-md-6 col-sm-6 mb-5">
				<div class="card">
					<div class="card-body">
						<div class="card-title text-center mt-2">
							<span class="boldfontL" style="color: #3E4684;">MBTI 게시판
								관리</span>
						</div>
					</div>
					<div class="card-body">

						<table class="table table-hover text-center mb-4">
							<thead class="boldfontS">
								<tr>
									<th>게시글 번호</th>
									<th>회원 번호</th>
									<th>제목</th>
									<th>내용</th>
									<th>날짜</th>
									<th>투표1</th>
									<th>투표2</th>
									<th>댓글 수</th>
									<th>수정</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(mbti , index) in board">
									<td>{{mbti.mbtiBoardNo}}</td>
									<td>{{mbti.memberNo}}</td>
									<td>{{mbti.mbtiBoardTitle}}</td>
									<td>{{mbti.mbtiBoardContent}}</td>
									<td>{{mbti.mbtiBoardTime}}</td>
									<td>{{mbti.mbtiBoardVote1}}</td>
									<td>{{mbti.mbtiBoardVote2}}</td>
									<td>{{mbti.mbtiBoardReplyCount}}</td>
									<td>
										<button type="button" class="btn btn-outline-secondary"
											v-on:click=" select(index)">수정</button>
									</td>
									<td><button class="btn btn-outline-danger"
											v-on:click="deleteClub(index)">삭제</button></td>
								</tr>
							</tbody>
						</table>

					</div>
					<button type="button" v-on:click="appendBoard()"
						:disabled="this.dataFull == true"
						class="form-control btn-outline-primary "
						style="border-radius: 1em !important">더보기
						({{showBoard}}/{{totalBoard}})
				</div>

			</div>
			<!-- 중앙 끝 -->
			<!-- 오른쪽 사이드 -->
			<div class="col-lg-3 col-mg-3 col-sm-3">
				<div class="col-lg-12 col-md-12 col-sm-12 mt-5 mb-5 p-4">
					<h5>mbti 게시판 목록 (총:{{count}}개 )</h5>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 p-4 text-start">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<h5>검색</h5>
							<form class="form-floating">
								<input type="text" class="form-control" v-model="memberNo"
									id="memberNo" placeholder="회원번호"> <label
									for="memberNo">회원번호</label>
							</form>
							<form class="form-floating">
								<input type="text" class="form-control" v-model="mbtiBoardNo"
									id="mbtiBoardNo" placeholder="게시글번호"> <label
									for="mbtiBoardNo">게시글번호</label>
							</form>
							<form class="form-floating">
								<input type="text" class="form-control" v-model="mbtiBoardTitle"
									id="mbtiBoardTitle" placeholder="제목"> <label
									for="mbtiBoardTitle">제목</label>
							</form>
							<form class="form-floating">
								<input type="text" class="form-control"
									v-model="mbtiBoardContent" id="mbtiBoardContent"
									placeholder="내용"> <label for="mbtiBoardContent">내용</label>
							</form>
							<form class="form-floating">
								<input type="text" class="form-control"
									v-model="mbtiBoardReplyCount" id="mbtiBoardReplyCount"
									placeholder="조회수"> <label for="mbtiBoardReplyCount">댓글수</label>
							</form>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<h5>정렬</h5>
							<select class="form-control" v-model="column"
								v-on:change="mbtiBoardList()">
								<option value="member_no">회원번호</option>
								<option value="mbti_board_no">게시글번호</option>
								<option value="mbti_board_title">제목</option>
								<option value="mbti_board_reply_count">댓글수</option>
							</select> <select class="form-control mb-5" v-model="order"
								v-on:change="mbtiBoardList()">
								<option value="asc">오름차순</option>
								<option value="desc">내림차순</option>
							</select>
							<button type="button"
								class="btn btn-outline-primary form-control"
								v-on:click="search()">조회</button>
							<button type="button"
								class="btn btn-outline-success form-control"
								v-on:click="reset()">초기화</button>
						</div>
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
//     				orderType:"clubNoAsc",//정렬 방식
    				deleteResult:"",
    				count:"",
    				//더보기
    				boardAll:{},//전체 리스트
    				board:{}, //보여지는 리스트
    	            totalBoard:0, //전체 멤버
                    showBoard:5, //보여주는 멤버 수
                    boardLeft:0,//남은 멤버 수
                    dataFull:false,
    				
                    //검색
                    column:"mbti_board_no",
                    order:"asc",
                    mbtiBoardNo:'',
                    mbtiBoardContent:"",
                    mbtiBoardReplyCount:"",
                    mbtiBoardTitle:"",
    				
                };
            },
            computed:{
                
            },
            methods:{
            	//게시글 목록 출력
                mbtiBoardList(){
                        axios({
    		        		url:"${pageContext.request.contextPath}/rest/admin/mbtiboard/"+this.column+"/"+this.order,
    		        		method:"get",
    		        	})
    		        	.then(resp=>{
    		        		
    						let data = []
    						for(var i = 0; i<this.showBoard;i++){
    							data.push(resp.data[i])
    						}


    						this.boardAll = resp.data,
    						this.board = data,
    						this.totalBoard = this.boardAll.length
    						
    						//총 게시글 수가 보이는 게시글 수(5)보다 작으면
    						if(this.totalBoard < this.showBoard){
//     							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
    							this.board = this.boardAll;	//게시글에 게시글 전체를 넣는다.
    	                		this.dataFull=true;	//버튼은 disable
    						}else if(this.totalBoard>this.showBoard){ 
    	                		this.dataFull=false; //버튼은 disable
    						}else if(this.totalBoard==this.showBoard){//전체 게시글 수와 보이는 게시글 수가 동일하면
    							this.dataFull=true;	//버튼은 disable
    						}
    		        	});
            		
                },
                appendBoard(){
                	this.boardLeft = this.totalBoard- this.showBoard;
                	if(this.boardLeft < 5){
						this.showBoard = this.totalBoard;
						this.board = this.boardAll;
						this.boardLeft = this.totalBoard- this.showBoard;
	                	this.mbtiBoardList();
                	}else 
                	if(this.boardLeft >= 5){
                		this.showBoard +=5
                		this.boardLeft = this.totalBoard- this.showBoard;
                	let data =[]
                	for(var i=0; i<this.showBoard; i++){
                		data.push(this.boardAll[i])
                	}
                	this.board = data
                	this.mbtiBoardList();
                	}else if(this.boardLeft==0){
                		this.dataFull=true;
                		
                	}
                	
                },
				//소모임 상세 조회
	            select: function(index) {
	                	const board = this.board[index];
	                	const mbtiBoardNo = board.mbtiBoardNo
	                	window.location.href='${pageContext.request.contextPath}/mbtiboard_detail?mbtiBoardNo='+mbtiBoardNo;
	             },
	                //moment js
			        convertTime(time){
	                	return moment(time).format("MM/DD");   //월 일
			        },
	             search(){
	           			axios({
							url:"${pageContext.request.contextPath}/rest/admin/mbtiboard/",
							method:"post",
							data:{
								order:this.order,
								column:this.column,
							    mbtiBoardNo:this.mbtiBoardNo,
				                mbtiBoardContent: this.mbtiBoardContent,
				                mbtiBoardReplyCount:this.mbtiBoardReplyCount,
				                mbtiBoardTitle:this.mbtiBoardTitle,
							}
						}).then(resp=>{
    						let data = []
    						for(var i = 0; i<this.showBoard;i++){
    							data.push(resp.data[i])
    						}


    						this.boardAll = resp.data,
    						this.board = data,
    						this.totalBoard = this.boardAll.length
    						
    						//총 게시글 수가 보이는 게시글 수(5)보다 작으면
    						if(this.totalBoard < this.showBoard){
//     							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
    							this.board = this.boardAll;	//게시글에 게시글 전체를 넣는다.
    	                		this.dataFull=true;	//버튼은 disable
    						}else if(this.totalBoard>this.showBoard){ 
    	                		this.dataFull=false; //버튼은 disable
    						}else if(this.totalBoard==this.showBoard){//전체 게시글 수와 보이는 게시글 수가 동일하면
    							this.dataFull=true;	//버튼은 disable
    						}
						});
	             },
	             reset(){
	                	this.order="asc";
	                	this.column="mbti_board_no";
	                	this.mbtiBoardNo = "";
		               	this.mbtiBoardContent= "";
		               	this.mbtiBoardReplyCount= "";
		                this.mbtiBoardTitle= "";
	                	this.mbtiBoardList();
	               },
	               mbtiBoardCount(){
	                	axios({
	                		url:"${pageContext.request.contextPath}/rest/admin/mbtiboardcount",
	                		method:"get",
	                	}).then(resp=>{
	                		this.count =resp.data
	                	})
	                },
	                move(){
	                	
	                }

            },
            created(){
            	this.mbtiBoardList();
            	this.mbtiBoardCount();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>