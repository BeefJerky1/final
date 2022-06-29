<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div class="container-fluid" id="app">
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
				<h6> {{board.clubBoardTime}}</h6>
				<a href="#" title="댓글"> <svg xmlns="http://www.w3.org/2000/svg"
						class="icon icon-tabler icon-tabler-message-circle-2" width="44"
						height="44" viewBox="0 0 24 24" stroke-width="1.5"
						stroke="#2c3e50" fill="none" stroke-linecap="round"
						stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z"
							fill="none" />
                                <path
							d="M3 20l1.3 -3.9a9 8 0 1 1 3.4 2.9l-4.7 1" />
                                <line x1="12" y1="12" x2="12" y2="12.01" />
                                <line x1="8" y1="12" x2="8" y2="12.01" />
                                <line x1="16" y1="12" x2="16" y2="12.01" />
                              </svg>
				</a>
			</div>
			<button class="btn btn-danger" v-on:click="deleteBoard()">삭제</button>
			<button class="btn btn-warning" v-on:click="changeEditMode()">수정</button>
			</div>
			<div v-else class="align-end">
			<textarea class="form-control" v-model="board.clubBoardContent"></textarea>
			<button class="btn btn-secondary"  v-on:click="changeDisplayMode()">취소</button>
			<button class="btn btn-primary"  v-on:click="editBoard()">수정</button>
			</div>
		</div>
	</div>
</div>
     <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script> -->
    <script>
        const app = Vue.createApp({

            data(){
                return {
		           board:{},
		           clubNo:"1",
                };
            },
            computed:{
            },
            methods:{
            	 loadContent(){
                 	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    console.log(params.get("clubBoardNo"));
                    const clubBoardNo = params.get("clubBoardNo");
 		        	axios({
 		        		url:"${pageContext.request.contextPath}/rest/clubboard/detail/"+clubBoardNo,
 		        		method:"get",
 		        		
 		        	})
 		        	.then(resp=>{
 		        		this.board = resp.data;
 		        	});
 		        
 		    	},
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
            },
            created(){
            	this.loadContent();
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>