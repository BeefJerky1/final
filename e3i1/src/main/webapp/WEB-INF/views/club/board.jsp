<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<style>
		.border{
		color:E9E9E9 !important;
		}
        .asdf:hover{
            background-color: #F7F7F7;
            cursor: pointer;
        }
        .text-over-cut pre {
		  display: block;
		  width: 350px;
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  margin: 0;
		}
	</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
  <!-- 특정 영역을 생성하여 이 부분만 vue로 제어한다 -->
<div id="app" class="container-fluid">
    	<div class="row">
    		<div class="border border-secondary text-dark p-4 mt-2 col-lg-6 offset-lg-3 col-md-6  offset-md-3 col-sm-6 offset-sm-3 rounded">
   				<div class="text-end">
 		  			<textarea class="form-control" v-model="boardContent"></textarea>
					<button class="btn btn-primary" v-on:click="addBoard">등록</button>
   				</div>
			</div>
		</div>
             <!-- 게시글 목록 출력 -->      
            <div class="row" v-for="(clubboard, index ) in clubBoardList" v-bind:key="index">
                <div class="border border-secondary text-dark p-2 mt-2 col-lg-6 offset-lg-3 col-md-6  offset-md-3 col-sm-6 offset-sm-3 rounded asdf" id="foo" v-on:click="select(index)">
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-sm-2">
                            <a><img src="https://placeimg.com/50/50/animals" style="width:50px; height:50px" class="img-thumbnail"></a>
                        </div>
                        <div class="col-lg-8 col-md-8 col-sm-8 align-start">
                                    <a href="" class="	">
                                    {{clubboard.clubBoardWriter}}
                                    </a>
                        </div>
                    </div>
                    <div class="row p-3 text-over-cut">
                    <pre >{{clubboard.clubBoardContent}}</pre>
                    </div>
                    <div class="mt-5">
                        <h6>
                        {{elapsedText(clubboard.clubBoardTime)}}</h6>
                        <a><i class="fa-solid fa-comment-dots"></i> {{clubboard.clubBoardCount}}</a>&nbsp;&nbsp;
						<a><i class="fa-solid fa-heart"></i>좋아요</a>
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
		            
		            //댓글 입력 정보
		            boardContent:"",
		      
                    //목록
                    clubNo:"1",
                    clubBoardList:[],
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
            	clubBoardContentIsEmpty(){
            		return this.boardContent.length==0;
            	}
            },
            methods:{
            	//게시글 목록 출력
                loadClubBoardList(){
                    axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/"+this.clubNo,
		        		method:"get",
		        	})
		        	.then(resp=>{
		        		this.clubBoardList = resp.data;
		        	});
                },
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
                deleteBoard(index){
                	const clubBoard = this.clubBoardList[index];
                	axios({
                		url:"${pageContext.request.contextPath}/rest/clubboard/"+clubBoard.clubBoardNo,
                		method:"delete",
                	})
                	.then(resp=>{
                		this.loadClubBoardList();
                	});
                },
                select: function(index) {
                	const clubBoard = this.clubBoardList[index];
                	window.location.href='http://localhost:8080/e3i1/club/board_detail?clubBoardNo='+clubBoard.clubBoardNo;
                },
                elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },
             

            },
            created(){
            	this.loadClubBoardList();
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>