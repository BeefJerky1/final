<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<style>
	.click{
	 display: block; 
  	width: 200px;        
  	white-space: nowrap; 
	overflow: hidden;
	text-overflow: ellipsis;
	}
	.click:hover{
	cursor:pointer;
	}
	.red{color:red;}
	.time{opacity:0.5; font-size:0.8em}
   .hover:hover{background-color: #F7F7F7;cursor: pointer;}
    .text-over-cut pre {
		  display: block;
		  /* width: 350px; */
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  margin: 0;
		}
    .main {
        padding-left: 0 !important; 
        padding-right: 0 !important;
    }
	div{
	border-radius:"20% !important";
	}
    .position {
        width: 41.4% !important;
        position: fixed;
        background-color: rgba(255, 255, 255, 0.9);
    }
    .body {
        padding-top: 85px;
    }
    .profile{
		border-radius:50%;    
    }

	</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
  <!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
  <!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
    <div id="app" class="container-fluid">
        <div class="row all">
            <div class="col-lg-3 col-md-3 col-sm-3 position-sticky left-side rounded mt-5">
                <div class="border border-o text-dark p-4 col-lg-9 offset-lg-3 col-md-9 offset-md-3 col-sm-9 offset-sm-3 left-side rounded shadow">
                    <h4><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-home" width="44"
                            height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
                            stroke-linecap="round" stroke-linejoin="round">
                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                            <polyline points="5 12 3 12 12 3 21 12 19 12" />
                            <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" />
                            <path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" />
                        </svg>소모임 홈</h4>
                    <hr>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    운동 소모임
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <a class="dropdown-item" href="#">게시판</a>
                                    <a class="dropdown-item" href="#">실시간채팅</a>
                                    <a class="dropdown-item" href="#">사진첩</a>
                                    <a class="dropdown-item" href="#">소모임 설정</a>
                                    <a class="dropdown-item" href="#">일정</a>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    게임 소모임
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <a class="dropdown-item" href="#">게시판</a>
                                    <a class="dropdown-item" href="#">실시간채팅</a>
                                    <a class="dropdown-item" href="#">사진첩</a>
                                    <a class="dropdown-item" href="#">소모임 설정</a>
                                    <a class="dropdown-item" href="#">일정</a>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    개발자 소모임
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <a class="dropdown-item" href="#">게시판</a>
                                    <a class="dropdown-item" href="#">실시간채팅</a>
                                    <a class="dropdown-item" href="#">사진첩</a>
                                    <a class="dropdown-item" href="#">소모임 설정</a>
                                    <a class="dropdown-item" href="#">일정</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-pinned"
                                        width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50"
                                        fill="none" stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <path d="M9 4v6l-2 4v2h10v-2l-2 -4v-6" />
                                        <line x1="12" y1="16" x2="12" y2="21" />
                                        <line x1="8" y1="4" x2="16" y2="4" />
                                    </svg>찜한 소모임
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <a class="dropdown-item" href="#">소모임1</a>
                                    <a class="dropdown-item" href="#">소모임2</a>
                                    <a class="dropdown-item" href="#">소모임3</a>
                                    <a class="dropdown-item" href="#">소모임4</a>
                                    <a class="dropdown-item" href="#">소모임5</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
                                    <svg xmlns="http://www.w3.org/2000/svg"
                                        class="icon icon-tabler icon-tabler-adjustments-horizontal" width="44"
                                        height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round">
                                        <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                        <circle cx="14" cy="6" r="2" />
                                        <line x1="4" y1="6" x2="12" y2="6" />
                                        <line x1="16" y1="6" x2="20" y2="6" />
                                        <circle cx="8" cy="12" r="2" />
                                        <line x1="4" y1="12" x2="6" y2="12" />
                                        <line x1="10" y1="12" x2="20" y2="12" />
                                        <circle cx="17" cy="18" r="2" />
                                        <line x1="4" y1="18" x2="15" y2="18" />
                                        <line x1="19" y1="18" x2="20" y2="18" />
                                    </svg>더보기
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                                data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <a class="dropdown-item" href="#">토픽</a>
                                    <a class="dropdown-item" href="#">설정</a>
                                    <a class="dropdown-item" href="#">고객센터</a>
                                    <hr>
                                    <a class="dropdown-item" href="#">광고1</a>
                                    <a class="dropdown-item" href="#">광고2</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-md-5 col-sm-5 main">
                <div class="border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 text-end">
<!--                     <a href="http://localhost:8080/e3i1/club/board/1"> -->
<!--                         <h4><b>홈</b></h4> -->
<!--                     </a> -->
                </div>
                <div v-if="show">

                    <div class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 text-end rounded mt-2  shadow"  >
                        <textarea class="form-control " v-model="boardContent" placeholder="무슨 일이 일어나고 있나요?"></textarea>
                        <button class="btn btn-primary mt-3 shadow" v-on:click="addBoard" :disabled="clubBoardContentIsEmpty()== true">등록하기</button>
                    </div>
 
                </div>
                <!-- 게시글 목록 출력 -->
                <div  class="text-dark col-lg-12 col-md-12 col-sm-12">
                <div v-for="(clubboard, index ) in board" v-bind:key="index" >
                    <div class="border border-opacity-10 p-4 col-lg-12 col-md-12 col-sm-12 hover rounded mt-2 shadow ">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-2 align-end top">
                                <a><img src="https://placeimg.com/70/70/animals" class="profile mx-auto d-block"></a>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 align-start top">
                                <span data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    {{clubboard.memberDto.memberNick}}
                                </span><br>
                                <span>{{clubboard.memberDto.memberInterest1}}</span>,
                                <span>{{clubboard.memberDto.memberInterest2}}</span>,
                                <span>{{clubboard.memberDto.memberInterest3}}</span>
                            </div>

                            <div class="col-lg-2 col-md-2 col-sm-2 text-end top time">
                                {{elapsedText(clubboard.clubBoardDto.clubBoardTime)}}
                            </div>
                        </div>
                        <div class="row text-over-cut" v-on:click="select(index)" >
                        	<div class="row">
                       		<div class="row px-5 p-4">
                            <pre class="text-start">{{clubboard.clubBoardDto.clubBoardContent}}</pre>
                        	</div>
                            </div>
                        </div>
                        <div class="container row mt-5">
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                                <i class="fa-regular fa-comment"></i>{{clubboard.clubBoardDto.clubBoardCount}}
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                            	<div v-if="clubboard.clubBoardLikeDto.likeMemberNo != this.memberNo">
                            		<span><i class="fa-regular fa-heart red" ></i>{{clubboard.clubBoardDto.clubBoardLike}}</span>
                                </div>
                                <div v-else-if="clubboard.clubBoardLikeDto.likeCheck==0">
                                    <span><i class="fa-regular fa-heart red" ></i>{{clubboard.clubBoardDto.clubBoardLike}}</span>
                                </div>
                                <div v-else>
                                	<span><i class="fa-solid fa-heart red" ></i>{{clubboard.clubBoardDto.clubBoardLike}}</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                             <i class="fa-regular fa-eye"></i>{{clubboard.clubBoardDto.clubBoardReadcount}}
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                            </div>
                        </div>

                    </div>
                     <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <a><img src="https://placeimg.com/120/120/animals" class="circle profile"></a>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
		            <h4><b>{{clubboard.memberDto.memberNick}}</b></h4>
		            <span>{{clubboard.memberDto.memberGender}}/</span><span>{{elapsedText(clubboard.memberDto.memberBirth)}}/</span> <span>{{clubboard.memberDto.memberPlace1}}</span>           
                </div>
                <div class="row mt-5">
                <div class="col-lg-6col-md-6 col-sm-6">
                	<button class="btn btn-outline-danger form-control">신고하기</button>
                </div>
                <div class="col-lg-6col-md-6 col-sm-6">
                	<button class="btn btn-outline-warning form-control">차단하기</button>
                </div>
                </div>
                <div class="row mt-5">
                	<h5><b>SNS계정</b><img style="width:25px "src="https://cdn-icons-png.flaticon.com/512/1384/1384063.png"></h5>
                	<h5>{{clubboard.memberDto.memberSnsId}}</h5>
                </div>
                <div class="row mt-5">
                	<h5><b>나의 관심분야</b></h5>
                	<div class="col-lg-12 col-md-12 col-sm-12">
		            <button class="btn btn-outline-secondary btn-sm">{{clubboard.memberDto.memberInterest1}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{clubboard.memberDto.memberInterest2}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{clubboard.memberDto.memberInterest3}}</button>
		            </div>
                </div>
				<div class="row mt-5">
					<h5><b>마지막 로그인</b></h5>
					<h5>{{convertTime(clubboard.memberDto.memberLogindate)}}({{elapsedText(clubboard.memberDto.memberLogindate)}})</h5>
            	</div>


            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>
    </div>
            </div>
            <div class=" mt-3">
                 <button type="button" v-on:click="appendBoard()" :disabled="this.dataFull == true" class="form-control btn-outline-primary shadow">
        더보기 ({{showBoard}}/{{totalBoard}})
    </button>
            </div>
            
        </div>
        </div>
       <div class="col-lg-3 col-md-3 col-sm-3 position-sticky right-side mt-5 ">
       			<div v-if="isMember">
        			<button class="btn btn-secondary form-control shadow" v-on:click="notAllowed()" v-if="show ">cancel</button>
                   	<button class="btn btn-primary form-control shadow" v-on:click="allowed()" v-if="asdf">write</button>
       			</div>
                <div class="border border-opacity-10 text-dark mt-2 p-4 col-lg-12 col-md-12 col-sm-12 right-side rounded shadow">
                    <div class="row">   
                    	<div class="col-lg-12 col-md-12 col-sm-12">
                    	
                        <select class="form-select" v-model="orderType"  v-on:change="changeList($event)">
                        	<option value="clubBoardNoDesc">최신순 </option>
                        	<option value="clubBoardLikeDesc">좋아요순</option>
                        	<option value="clubBoardReadcountDesc">조회순</option>
                        	<option value="clubBoardCountDesc">댓글순</option>
                        </select>
                        <div class=" border-buttom border-opacity-10 col-lg-12 col-md-12 col-sm-12 mt-5">
                        <div v-for="(side, index ) in side" v-bind:key="index" class=" border-buttom border-opacity-10 col-lg-12 col-md-12 col-sm-12">
                        	<div v-if="this.orderType=='clubBoardNoDesc'" class="row">
                        		<div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
                        			<span v-on:click="TopTen(index)" class="click">{{1+index}}. {{side.clubBoardContent}}</span> 
                        		</div>
                        		<div  class="col-lg-5 col-md-5 col-sm-5 text-end">
                    				<span class="time">{{elapsedText(side.clubBoardTime)}}</span>
	                        	</div>
							</div>     
								<div v-if="this.orderType=='clubBoardLikeDesc'" class="row">
							      <div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
	                    				<span v-on:click="TopTen(index)" class="click">{{1+index}}. {{side.clubBoardContent}}</span>
							      </div>
							      <div  class="col-lg-5 col-md-5 col-sm-5 text-end">
                    					<i class="fa-solid fa-heart red" ></i><span >{{side.clubBoardLike}}</span>
							      </div>
								</div>         
							<div v-if="this.orderType=='clubBoardReadcountDesc'" class="row">
							      <div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
                    				<span v-on:click="TopTen(index)" class="click">{{1+index}}. {{side.clubBoardContent}}</span>
							      </div>
							      <div  class="col-lg-5 col-md-5 col-sm-5 text-end">
                    				<i class="fa-regular fa-eye"></i><span>{{side.clubBoardReadcount}}</span>
							      </div>
							</div>         
							<div v-if="this.orderType=='clubBoardCountDesc'" class="row">
							      <div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
                    				<span v-on:click="TopTen(index)" class="click">{{1+index}}. {{side.clubBoardContent}}</span>
							      </div>
							      <div  class="col-lg-5 col-md-5 col-sm-5 text-end">
                    				<i class="fa-regular fa-comment"></i><span>{{side.clubBoardCount}}</span>
							      </div>
							</div>                  	
                    	</div>
                    	</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    </div>

     <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="${path}/js/time.js"></script>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script> -->
    <script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
		            //세션
		            memberNo:"${login}",
		            memberAdmin:"${auth}",
		            //댓글 입력 정보
		            boardContent:"",
		            boardContent2:"",
					//게시글 등록/취소 버튼
					show:false,
					asdf:true,
                    clubNo:"1",
                    //더보기
                    boardAll:[], //전체 게시글
                    board:[], //보여지는 게시글
                    totalBoard:0, //전체 게시글
                    showBoard:5, //보여주는 게시글 수
                    boardLeft:0,//남은 게시글 수
                    dataFull:false,
                    //사이드 인기 게시판
                    side:{},
                    orderType:"clubBoardNoDesc",
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
            	isNotMember(){
 		        	return this.memberNo == "" && this.memberAdmin == "";
 		        },
 		        isMember(){
 		        	return this.memberNo != "";
 		        },
 		        isAdmin(){
 		        	return this.isMember && this.memberAdmin == "관리자";
 		        },
            },
            methods:{
            	//게시글을 입력하지 않으면 게시글 등록버튼 비활성화
            	clubBoardContentIsEmpty(){
            		return this.boardContent.length==0;
            	},
            	//게시글 목록 출력
                loadClubBoardList(){
                    axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/"+this.clubNo,
		        		method:"get",
		        	})
		        	.then(resp=>{
		        	
						let data = []
						for(var i = 0; i<this.showBoard;i++){
// 							console.log(i)
							data.push(resp.data[i])
						}
						this.boardAll = resp.data,
						this.board = data,
						this.totalBoard = this.boardAll.length
						
						if(this.totalBoard < this.showBoard){
							this.showBoard = this.totalBoard;
							this.board = this.boardAll;
	                		this.dataFull=true;
						}else if(this.totalBoard==this.showBoard){
	                		this.dataFull=true;
						}
		        	});
                },
                //더보기 버튼으로 게시글 추가
                appendBoard(){
                	//남은 게시글 수 확인
                	this.boardLeft = this.totalBoard- this.showBoard;
                	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
                	if(this.boardLeft < 5){
						this.showBoard = this.totalBoard;
						this.board = this.boardAll;
						this.boardLeft = this.totalBoard- this.showBoard;
	                	this.loadClubBoardList();
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
                		this.dataFull=true;
                		
                	}
                	
                },
                allowed(){
                	this.show = true;
                	this.asdf = false;
                },
                notAllowed(){
                   	this.show= false;
					this.asdf = true;
					this.boardContent = "";
                },
                //게시글 등록
                addBoard(){
                	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/",
		        		method:"post",
		        		data:{
		        			clubNo:this.clubNo,
		        			clubBoardContent:this.boardContent
		        		},
		        	})
		        	.then(resp=>{
		        		//완성 시 코드
		        		//window.alert("댓글 등록 완료!");
		        		this.boardContent = "";
		        		this.loadClubBoardList();
		        	});
                },
                //상세 페이지로 이동
                select: function(index) {
                	const clubBoard = this.board[index];
                	window.location.href='http://localhost:8080/e3i1/club/board_detail?clubBoardNo='+clubBoard.clubBoardDto.clubBoardNo;
                },
                //인기 게시글로 이동
                TopTen: function(index) {
                	const list = this.side[index];
                	window.location.href='http://localhost:8080/e3i1/club/board_detail?clubBoardNo='+list.clubBoardNo;
                },
                //시간 바꾸기
                elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },
                //moment js
		        convertTime(time){
		        	return moment(time).format('llll'); // 2022년 7월 4일 월요일 오후 9:46
 
		        },
                //인기게시글
                TopTenList(){
                	axios({
                		url:"${pageContext.request.contextPath}/rest/clubboard/side/"+this.clubNo+"/order/"+this.orderType,
		        		method:"get",
                	}).then(resp=>{
                		this.side = resp.data
                	})
                },
                //select로 인기게시글 변경
                changeList(event) {
                	axios({
                		url:"${pageContext.request.contextPath}/rest/clubboard/side/"+this.clubNo+"/order/"+event.target.value,
		        		method:"get",
                	}).then(resp=>{
                		this.side = resp.data
                	})
                    console.log(event.target.value)
                },

            },
            created(){
            	this.loadClubBoardList();
            	this.TopTenList();
            },
            mounted(){
            	this.loadClubBoardList();
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>