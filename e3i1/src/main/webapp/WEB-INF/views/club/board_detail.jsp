<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<style>
.red{
	color:red;
}
.red:hover{
cursor: pointer !important;

}
.redBig{
	color:red;
}
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
.redBig:hover{
cursor: pointer !important;
}
i{font-family:fontAwesome;}
img{border-radius:100% !important}
.time{opacity:0.5; font-size:0.8em}
    .main {
        padding-left: 0 !important; 
        padding-right: 0 !important;
    }
    

    textarea{
    	resize:none;
    }
    img{
		border-radius:50%;    
    }
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <div id="app" class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 position-sticky mt-5">
                <div class="border text-dark p-4 col-lg-9 offset-lg-3 col-md-9 offset-md-3 col-sm-9 offset-sm-3 left-side rounded shadow">
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
                  <div class="border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded">
                    </div>
                <div class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded shadow"  >
                    <div class="row">
                       <div>
                       <div class="row" v-if="board!=null">
                            <div class="col-lg-2 col-md-2 col-sm-2 align-end top">
                                <a><img src="https://placeimg.com/50/50/animals" class="profile mx-auto d-block"></a>
                            </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 align-start ">
                             		  {{board.memberDto.memberNick}}<br>
                                <span>{{board.memberDto.memberInterest1}}</span>,
                                <span>{{board.memberDto.memberInterest2}}</span>,
                                <span>{{board.memberDto.memberInterest3}}</span>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 p-3">
                             <div v-if="this.boardLike==1">
                                	<i class="fa-solid fa-heart redBig fa-3x" v-on:click="notLikey()"></i>
                                </div>
                            <div v-else>
                                    <i class="fa-regular fa-heart redBig fa-3x" v-on:click="likey()"></i>
                            </div>
                        </div>
                        </div>
                    </div>
                   
                     <div v-if="board != null">
                    <div v-if="!board.edit">
                    <div class="row px-5">
                        <pre> {{board.clubBoardDto.clubBoardContent}}</pre>	
                    </div>		
                    <div class="container row mt-5 rounded">
                                <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                                       <i class="fa-regular fa-comment"></i> {{board.clubBoardDto.clubBoardCount}}
                                   </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 text-center">	
                   				 <div v-if="this.boardLike==1">
	                                	<i class="fa-solid fa-heart red" v-on:click="notLikey()"></i>
                                     	{{board.clubBoardDto.clubBoardLike}}
                                     </div>
                                     <div v-else>
                                    <i class="fa-regular fa-heart red" v-on:click="likey()"></i>
	                                	{{board.clubBoardDto.clubBoardLike}}
                                     </div>

                            	</div>	
                                
                                <div v-if="isBoardEditAndDeleteAvailable(board)" class="col-lg-3 col-md-3 col-sm-3 text-center">
                                    <i class="fa-solid fa-trash" v-on:click="deleteBoard()"></i>
                                </div>
                                <div v-if="isBoardEditAndDeleteAvailable(board)" class="col-lg-3 col-md-3 col-sm-3 text-center">
                                    <i class="fa-solid fa-pen-to-square" v-on:click="changeEditMode()"></i>
                                </div>
                            </div>
                    </div>
                    <div v-else class="align-end">
                    <textarea class="form-control update" v-model="board.clubBoardDto.clubBoardContent"></textarea>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-secondary"  v-on:click="changeDisplayMode()">취소</button>
                    <button class="btn btn-edit"  v-on:click="editBoard()">수정</button>
                    </div>
                    </div>
                    </div>
                </div>
                    		
</div>
            <!-- 댓글 등록 -->
                <div class="border border-opacity-10 text-dark p-2 col-lg-12 col-md-12 col-sm-12 rounded mt-2 shadow">
                       <div class="text-end">
                           <textarea class="form-control reply" v-model="replyContent" placeholder="내 댓글을 등록합니다"></textarea>
                        <button class="btn btn-primary" v-on:click="addReply">댓글 등록</button>
                       </div>
                </div>
            <!-- 댓글 목록 -->
            <div class="text-dark col-lg-12 col-md-12 col-sm-12 ">
            <div class="border border-opacity-10 col-lg-12 col-md-12 col-sm-12 p-2 rounded mt-2 shadow" v-for="(reply, index) in reply" v-bind:key="index">
                <div class="row p-4">
                    <div class="col-lg-2 col-md-2 col-sm-2 ">
                            <a><img src="https://placeimg.com/50/50/animals" class=" mx-auto d-block"></a>
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-8 align-start">
                        {{reply.memberDto.memberNick}}
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2">
                        <h6 class="time">{{elapsedText(reply.clubBoardReplyDto.clubReplyTime)}}</h6>
                    </div>
                </div>
                <div class="row" v-if="!reply.edit">
                    <div class="col-lg-12 col-md-12 col-sm-12 px-5 align-start">
                        <pre> {{reply.clubBoardReplyDto.clubReplyContent}}</pre>		
                    </div>	
                    <div class="container row ">
                                <div class="col-lg-3 col-md-3 col-sm-3 text-center">
        							<div v-if="reply.clubReplyLikeDto.likeCheck ==1">
                                	<span><i class="fa-solid fa-heart red" v-on:click="replyLikey(index)"></i>{{reply.clubBoardReplyDto.clubReplyLike}}</span>
                                </div>
                                	<div v-else>
                                    <span><i class="fa-regular fa-heart red"  v-on:click="replyLikey(index)"></i>{{reply.clubBoardReplyDto.clubReplyLike}}</span>
                                </div>
                                   </div>
                                <div v-if="isReplyEditAndDeleteAvailable(index)" class="col-lg-3 col-md-3 col-sm-3 text-center">
                                    <a><i class="fa-solid fa-trash" v-on:click="deleteReply(index);"></i></a>	
                                </div>
                                <div v-if="isReplyEditAndDeleteAvailable(index)" class="col-lg-3 col-md-3 col-sm-3 text-center">
                                    <a><i class="fa-solid fa-pen-to-square" v-on:click="replyEditMode(index);"></i></a>		
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-3 text-center">
     								<i class="fa-regular fa-flag"></i>
                                </div>
                    </div>
                </div>
                <div v-else>
                    <textarea class="form-control update-reply" v-model="reply.clubBoardReplyDto.clubReplyContent"></textarea>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-secondary "  v-on:click="replyDisplayMode(index);">취소</button>
                    <button class="btn btn-primary "  v-on:click="editReply(index)">수정</button>
                    </div>
                </div>	
                </div>
                <div class="mt-2 rounded shadow">
                                <button type="button" v-on:click="appendReply()" :disabled="this.dataFull == true" class="btn btn-outline-primary form-control">
        더보기 ({{showReply}}/{{totalReply}})</button>
                </div>
            </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 position-sticky mt-5">
                <div class="border-start border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 right-side shadow rounded">
                    <div class="row">   
                        <select class="form-control" v-model="orderType"  v-on:change="changeList($event)">
                        	<option value="clubBoardNoDesc">최신</option>
                        	<option value="clubBoardLikeDesc">좋아요</option>
                        	<option value="clubBoardReadcountDesc">조회</option>
                        	<option value="clubBoardCountDesc">댓글</option>
                        </select>
                        <div class=" border-buttom border-opacity-10 col-lg-12 col-md-12 col-sm-12 mt-5">
                        <div v-for="(side, index ) in side" v-bind:key="index" >
                        	<div v-if="this.orderType=='clubBoardNoDesc'" class="row">
                        		<div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
                        			<span v-on:click="TopTen(index)" class="click">{{1+index}}. {{side.clubBoardContent}}</span> 
                        		</div>
                        		<div  class="col-lg-5 col-md-5 col-sm-5 text-end">
                    				<span class="time">
                    				{{elapsedText(side.clubBoardTime)}}
                    				</span>
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
     <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.11.3/dayjs.min.js" integrity="sha512-Ot7ArUEhJDU0cwoBNNnWe487kjL5wAOsIYig8llY/l0P2TUFwgsAHVmrZMHsT8NGo+HwkjTJsNErS6QqIkBxDw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${path}/js/time.js"></script>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script> -->
    <script>
        const app = Vue.createApp({
			
            data(){
                return {
                   //소모임
		           clubNo:"1",//소모임 번호                	
				   //세션
				   memberNo:"${login}",
		           memberAdmin:"${auth}",
                   //게시글
		           board:null,//상세
		           like:"",//게시글 좋아요
				   //댓글		           
		           BoardReplyList:[],//댓글 목록
		           replyContent:"",//댓글 내용
		           replylike:"",//댓글 좋아요
		           replyNo:"", //댓글 번호
		           
		           //더보기
		           replyAll:[], //전체 댓글
                   reply:[], //보여지는 댓글
                   totalReply:0, //전체 댓글
                   showReply:5, //보여주는 댓글 수
                   replyLeft:0,//남은 댓글 수
                   dataFull:false,
                   //사이드 인기게시글
                   side:{},
                   orderType:"clubBoardNoDesc",
                   
                   //상세 좋아요
                   boardLike:"",
//                    boardLike:false,
//                    boardNotLike:true,
                 
                };
            },
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
            	//게시글 로드
            	 loadContent(){
                 	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");
 		        	axios({
 		        		url:"${pageContext.request.contextPath}/rest/clubboard/detail/"+clubBoardNo,
 		        		method:"get",
 		        		
 		        	})
 		        	.then(resp=>{
 		        		this.board= resp.data;
 		        	});
 		        
 		    	},
//  		    	red(index){
// 		    		const board = this.board[index];
// 		    		const likeMemberNo = board.clubBoardLikeDto.likeMemberNo
// 		    		console.log("red.memberNo=",this.memberNo)
// 		    		console.log("red.likeMemberNo=",likeMemberNo)
// 					if(this.memberNo==likeMemberNo)return true;
//  		    	},
// 				white(index){
// 					//1. 좋아요를 누른적이 없는 경우\
// 					console.log()
// 					const board = this.board[index];
// 		    		const likeMemberNo = board.clubBoardLikeDto.likeMemberNo
// 		    		console.log("white.memberNo=",this.memberNo)
// 		    		console.log("white.likeMemberNo=",likeMemberNo)
// 					if(this.memberNo!=likeMemberNo)return true;
//  		    	},
 		    	//작성자 == 현재사용자라면 삭제 가능
		    	isBoardEditAndDeleteAvailable(board){
		    		//1.관리자라면 통과
// 		    		console.log(board)
		    		const boardWriter = board.clubBoardDto.clubBoardWriter
		    		console.log("게시글:boardWriter=",boardWriter)
		    		console.log("게시글:memberNo=",this.memberNo)
		    		if(this.isAdmin) return true;
		    		//2.현재 사용자가 작성자라면 통과
		    		if(this.memberNo==boardWriter)return true;
		    		
		    		//나머지 차단
		    		return false;
		    	},
 		    	//게시글 삭제
 		    	deleteBoard(){
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    console.log(params.get("clubBoardNo"));
                    const clubBoardNo = params.get("clubBoardNo");
                	axios({
                		url:"${pageContext.request.contextPath}/rest/clubboard/"+clubBoardNo,
                		method:"delete",
                	})
                	.then(resp=>{
                    	window.location.href='http://localhost:8080/e3i1/club/board/'+this.clubNo;
                	});
                },
              	//게시글 수정
                editBoard(){
		        	if(this.board.clubBoardDto.clubBoardContent.length==0)return;
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/",
		        		method:"put",
		        		data:{
		        			clubBoardNo: this.board.clubBoardDto.clubBoardNo,
		        			clubBoardContent: this.board.clubBoardDto.clubBoardContent,
		        		},
		        	}).then(resp=>{
		        		this.loadContent();
		        	});
		        },
		        //수정모드
		        changeEditMode(){
		        	this.board.edit=true;
		        },
		        //수정모드 해제
		        changeDisplayMode(){
		        	this.board.edit=false;
		        },
		      	//게시글 좋아요 체크
             	boardLikeCheck(){
	               	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");
                    const memberNo = this.memberNo
               		axios({
               			url:"${pageContext.request.contextPath}/rest/clubboard/like/"+clubBoardNo+"/"+memberNo,
               			method:"get",
               		}).then(resp=>{
               			this.boardLike=resp.data
               		})
            	},
                //게시글 좋아요/취소
               
                likey(){
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    console.log(params.get("clubBoardNo"));
                    const clubBoardNo = params.get("clubBoardNo");
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboard/like/",
                			method:"post",
                			data:{  
    		        			clubBoardNo:clubBoardNo,
    		        			memberNo:this.memberNo,
                			}
                		}).then(resp=>{
                			
							this.loadContent();
                			this.boardLike=true;
                			this.boardNotLike=false;
                		})
                		
                	
                },
                notLikey(){
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    console.log(params.get("clubBoardNo"));
                    const clubBoardNo = params.get("clubBoardNo");
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboard/like/",
                			method:"delete",
                			data:{
    		        			clubBoardNo:clubBoardNo,
    		        			memberNo:this.memberNo,
                			}
                		}).then(resp=>{
                			this.loadContent();
                			this.boardNotLike=true;
                			this.boardLike=false;
                		})
                	
                },
		        //댓글 등록
		        addReply(){
// 		        	if(this.boardContentIsEmpty) return;
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");

		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/",
		        		method:"post",
		        		data:{
		        			clubNo:this.board.clubBoardDto.clubNo,
		        			clubBoardNo:this.board.clubBoardDto.clubBoardNo,
		        			clubReplyContent:this.replyContent
		        		},
		        	})
		        	.then(resp=>{
		        		this.loadReply();
		        		this.replyContent = "";
		        		this.loadContent();
		        	});
		        },
		        //댓글 목록
		        loadReply(){
                 	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/"+clubBoardNo,
		        		method:"get",
		        	})
		        	.then(resp=>{
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
							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.reply = this.replyAll;	//게시글에 게시글 전체를 넣는다.
	                		this.dataFull=true;	//버튼은 disable
						}else if(this.totalReply==this.showReply){ //전체 게시글 수와 보이는 게시글 수가 동일하면
	                		this.dataFull=true; //버튼은 disable
						}
		        	});
		    	},
		    	//댓글 더보기 버튼으로 게시글 추가
                appendReply(){
                	//남은 게시글 수 확인
                	this.replyLeft = this.totalReply- this.showReply;
                	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
                	if(this.replyLeft < 5){
						this.showReply = this.totalReply;
						this.reply = this.replyAll;
						this.replyLeft = this.totalReply- this.showReply;
	                	this.loadReply();
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
                	this.loadReply();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.replyLeft==0){
                		this.dataFull=true;
                		
                	} 	
                },
		    	isReplyEditAndDeleteAvailable(index){
                	const reply = this.reply[index];
		    		//1.관리자라면 통과
// 		    		console.log(board)
		    		const replyWriter = reply.clubBoardReplyDto.clubReplyWriter
		    		console.log("댓글:replyWriter=",replyWriter)
		    		console.log("댓글:memberNo=",this.memberNo)
		    		if(this.isAdmin) return true;
		    		//2.현재 사용자가 작성자라면 통과
		    		if(this.memberNo==replyWriter)return true;
		    		
		    		//나머지 차단
		    		return false;
		    	},
		    	//댓글 삭제
		        deleteReply(index){
		        	const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
		        	if(!choice) return;
		        	
		        	const reply = this.reply[index];
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/"+reply.clubBoardReplyDto.replyNo,
		        		method:"delete",
		        	})
		        	.then(resp=>{
		        		this.loadContent();
		        		this.loadReply();
		        	});
		        },
		        //댓글 수정모드
		        replyEditMode(index){
		        	this.reply[index].edit=true;
		        },
		        //댓글 수정모드 해제
		        replyDisplayMode(index){
		        	this.reply[index].edit=false;
		        },
		        //댓글 수정
		        editReply(index){
		        	const reply = this.reply[index];
		        	if(reply.clubBoardReplyDto.clubReplyContent.length==0)return;
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/",
		        		method:"put",
		        		data:{
		        			replyNo: reply.clubBoardReplyDto.replyNo,
		        			clubReplyContent: reply.clubBoardReplyDto.clubReplyContent,
		        		},
		        	}).then(resp=>{
		        		this.loadReply();
		        	});
		        },
		        //시간 바꾸는 메소드
	            elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },

                //댓글 좋아요 조건
               	likeCheck(index){
               		const reply = this.reply[index];
               		if(this.replylike.likeCheck==1 && this.replylike.replyNo==reply.clubBoardReplyDto.replyNo) return true;
            	},
                //댓글 좋아요/취소
                replyLikey(index){
                	const reply = this.reply[index];
                	if(reply.clubReplyLikeDto.likeCheck==0){
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboardreply/like/",
                			method:"post",
                			data:{  
                				replyNo:reply.clubBoardReplyDto.replyNo,
    		        			memberNo:this.memberNo,
                			}
                		}).then(resp=>{
                			this.replylike = resp.data;
                			this.loadReply();
                			
                		})
                	}else if(reply.clubReplyLikeDto.likeCheck==1){
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboardreply/like/",
                			method:"delete",
                			data:{
                				replyNo:reply.clubBoardReplyDto.replyNo,
    		        			memberNo:this.memberNo,
                			}
                		}).then(resp=>{
                			this.loadReply();
                		})
                	}
                },
                //인기 게시글로 이동
                TopTen: function(index) {
                	const list = this.side[index];
                	window.location.href='http://localhost:8080/e3i1/club/board_detail?clubBoardNo='+list.clubBoardNo;
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
            	this.loadContent();
            	this.loadReply();
            	this.TopTenList();
            	this.boardLikeCheck()
//             	this.isEditAndDeleteAvailable();
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>