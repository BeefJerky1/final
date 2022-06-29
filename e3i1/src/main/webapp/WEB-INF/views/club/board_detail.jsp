<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="container-fluid" id="app">
	<!-- 게시글 내용 -->
	<div class="row">
		<div class="border border-secondary text-dark p-2 mt-2 col-lg-6 offset-lg-3 col-md-6  offset-md-3 col-sm-6 offset-sm-3 rounded">
			<div class="row">
				<div class="col-lg-2 col-md-2 col-sm-2">
					<a><img src="https://placeimg.com/50/50/animals"
						style="width: 50px; height: 50px" class="img-thumbnail"></a>
				</div>
				<div class="col-lg-8 col-md-8 col-sm-8 align-start">
					 {{board.clubBoardWriter}}
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2">
					<svg xmlns="http://www.w3.org/2000/svg"
						class="icon icon-tabler icon-tabler-heart" width="44" height="44"
						viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50"
						fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z"
							fill="none" />
                                <path
							d="M19.5 13.572l-7.5 7.428l-7.5 -7.428m0 0a5 5 0 1 1 7.5 -6.566a5 5 0 1 1 7.5 6.572" />
                              </svg>
				</div>
			</div>
			<div class="row p-3" v-if="!board.edit">
				<p> {{board.clubBoardContent}}</p>			
			<div class="mt-5">
				<h6>{{elapsedText(board.clubBoardTime)}}</h6>
                <a><i class="fa-solid fa-comment-dots"></i> {{board.clubBoardCount}}</a>&nbsp;&nbsp;
				<a><i class="fa-solid fa-heart"></i>좋아요</a>
			</div>
			<button class="btn btn-danger" v-on:click="deleteBoard(index)">삭제</button>
			<button class="btn btn-warning" v-on:click="changeEditMode(index)">수정</button>
			</div>
			<div v-else class="align-end">
			<textarea class="form-control" v-model="board.clubBoardContent"></textarea>
			<button class="btn btn-secondary"  v-on:click="changeDisplayMode(index)">취소</button>
			<button class="btn btn-edit"  v-on:click="editReply(index)">수정</button>
			</div>
		</div>
	</div>
	<!-- 댓글 등록 -->
	<div class="row">
    	<div class="border border-secondary text-dark p-4 col-lg-6 offset-lg-3 col-md-6  offset-md-3 col-sm-6 offset-sm-3 rounded">
   			<div class="text-end">
 		  		<textarea class="form-control" v-model="replyContent" placeholder="내 댓글을 등록합니다"></textarea>
				<button class="btn btn-primary" v-on:click="addReply">댓글 등록</button>
   			</div>
		</div>
	</div>
	<!-- 댓글 목록 -->
	<div class="row" v-for="(reply, index) in BoardReplyList" v-bind:key="index">
	<div class="border border-secondary text-dark p-2 mt-2 col-lg-6 offset-lg-3 col-md-6  offset-md-3 col-sm-6 offset-sm-3 rounded">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2">
					<a><img src="https://placeimg.com/50/50/animals"
						style="width: 50px; height: 50px" class="img-thumbnail"></a>
			</div>
			<div class="col-lg-8 col-md-8 col-sm-8 align-start">
				{{reply.clubReplyWriter}}
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2">
				<h6>{{elapsedText(reply.clubReplyTime)}}</h6>
			</div>
		</div>
		<div class="row" v-if="!reply.edit">
			<div class="col-lg-10 col-md-10 col-sm-10 align-start">
				<p> {{reply.clubReplyContent}}</p>		
			</div>	
				<i class="fa-solid fa-trash" v-on:click="deleteReply(index);"></i>		
				<i class="fa-solid fa-pen-to-square" v-on:click="replyEditMode(index);"></i>
		</div>
		<div v-else class="align-end">
			<textarea class="form-control" v-model="reply.clubReplyContent"></textarea>
			<button class="btn btn-secondary"  v-on:click="replyDisplayMode(index);">취소</button>
			<button class="btn btn-edit"  v-on:click="editReply(index)">수정</button>
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
        const app = Vue.createApp({

            data(){
                return {
		           board:{},
		           clubNo:"1",
		           BoardReplyList:[],
		           replyContent:"",
                };
            },
            computed:{
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
 		        		this.board = resp.data;
 		        	});
 		        
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
		        	if(this.board.clubBoardContent.length==0)return;
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/",
		        		method:"put",
		        		data:{
		        			clubBoardNo: this.board.clubBoardNo,
		        			clubBoardContent: this.board.clubBoardContent,
		        		},
		        	}).then(resp=>{
		        		this.loadContent();
		        	});
		        },
		        changeEditMode(){
		        	this.board.edit=true;
		        },
		        changeDisplayMode(){
		        	this.board.edit=false;
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
		        			clubNo:this.board.clubNo,
		        			clubBoardNo:this.board.clubBoardNo,
		        			clubReplyContent:this.replyContent
		        		},
		        	})
		        	.then(resp=>{
		        		this.replyContent = "";
		        		this.loadReply();
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
		        		this.BoardReplyList = resp.data;
		        	});
		    	},
		    	//댓글 삭제
		        deleteReply(index){
		        	const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
		        	if(!choice) return;
		        	
		        	const reply = this.BoardReplyList[index];
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/"+reply.replyNo,
		        		method:"delete",
		        	})
		        	.then(resp=>{
		        		this.loadReply();
		        	});
		        },
		        replyEditMode(index){
		        	this.BoardReplyList[index].edit=true;
		        },
		       replyDisplayMode(index){
		        	this.BoardReplyList[index].edit=false;
		        },
		        editReply(index){
		        	const reply = this.BoardReplyList[index];
		        	if(reply.clubReplyContent.length==0)return;
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/",
		        		method:"put",
		        		data:{
		        			replyNo: reply.replyNo,
		        			clubReplyContent: reply.clubReplyContent,
		        		},
		        	}).then(resp=>{
		        		this.loadReply();
		        	});
		        },
		        //시간 바꾸는 메소드
	            elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },
            },
            created(){
            	this.loadContent();
            	this.loadReply();
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>