<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<style>
.position-sticky{
	position:sticky;
}
.blind{
	color:red;
	text-decoration: none !important;
	cursor: pointer !important;
}
.red{
	color:red;
}
.red:hover{
cursor: pointer !important;

}
.black{
	color:black;
}
.black:hover{
cursor:pointer !important;
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
    .profile {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
}
.hash-tag {
	font-size: 12px;
	color: #686666;
	background-color: #E9E9E9;
	padding: 0px 0px;
	text-align: center;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    <div id="app" class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 position-sticky mt-5">
                <div class="border text-dark p-4 col-lg-9 offset-lg-3 col-md-9 offset-md-3 col-sm-9 offset-sm-3 left-side rounded" style="border-radius:1em !important">
						<div class="row">
							<div class="col-md-2 align-self-center">
								<i class="fa-solid fa-house-chimney fa-2x"
									style="color: lightgray;"></i>
							</div>
							<div class="col-md-8 align-self-center"
								v-if="clubList.clubDto != null">
								<h5 style="margin: 0px;">{{clubList.clubDto.clubName}}</h5>
							</div>
							<div class="col-md-2 align-self-center">
								<div class="row" @click="likeClub">
									<i class="fa-solid fa-heart" style="color: red;" v-if="isLike"></i>
									<i class="fa-regular fa-heart" style="color: red;"
										v-if="!isLike"></i>
								</div>
								<div class="row mt-2">
									<i class="fa-solid fa-bullhorn"></i>
								</div>
							</div>
						</div>
				
					<hr>

					
						<div class="row">
							<div class="col-md-2" width="10px" height="10px">
								<img src="https://via.placeholder.com/250/69f/fff.png"
									class="profile">
							</div>
							<div class="col-md-8 offset-md-2 row align-self-center">
								<div class="col-md-3">
									<i class="fa-solid fa-crown fa-2x" style="color: #f6e58d"></i>
								</div>
								<div class="col-md-9 align-self-center"
									v-if="clubList.memberDto != null">
									<h6 style="margin: 0px;">{{clubList.memberDto.memberNick}}</h6>
								</div>
							</div>
						</div>

						<div class="row mt-4" v-if="clubList.clubDto != null">
							<div class="col-md-4">
								<div class="hash-tag">
									<span>\#{{clubList.clubDto.clubMainCategory}}</span>
								</div>
							</div>
							<div class="col-md-4">
								<div class="hash-tag">
									<span>\#{{clubList.clubDto.clubSubCategory}}</span>
								</div>
							</div>
						</div>
						<div class="row mt-4" v-if="clubList.clubMbtiPercent != null">
							<div class="col-md-2">
								<i class="fa-solid fa-user-group"></i>
							</div>
							<div class="col-md-10">{{clubList.clubMbtiPercent.total}} /
								{{clubList.clubDto.clubMemberLimit}}</div>
						</div>


						<div class="col">
							<h5 style="font-weight: bold">우리 소모임 MBTI 순위</h5>
						</div>

						<!-- v-for index를 []안에 사용할 방법을 찾으면 v-for로 반복할 예정 너무 복잡해지면 그냥 이대로 사용 -->
						<div class="row mt-4" v-if="mbtiList[0] != null">
							<div class="col-md-4">
								<img src="https://via.placeholder.com/250/69f/fff.png"
									class="profile">
							</div>
							<div class="col-md-8 align-self-center">
								<div>
									<h4 style="margin: 0px 0px; font-weight: bold;">{{mbtiList[0].memberMbti}}</h4>
								</div>
								<div>
									<p style="margin: 0px 0px;">{{mbtiList[0].mbtiPercent}}%</p>
								</div>
							</div>
						</div>

						<div class="row mt-4" v-if="mbtiList[1] != null">
							<div class="col-md-4">
								<img src="https://via.placeholder.com/250/69f/fff.png"
									class="profile">
							</div>
							<div class="col-md-8 align-self-center">
								<div>
									<h4 style="margin: 0px 0px; font-weight: bold;">{{mbtiList[1].memberMbti}}</h4>
								</div>
								<div>
									<p style="margin: 0px 0px;">{{mbtiList[1].mbtiPercent}}%</p>
								</div>
							</div>
						</div>

						<div class="row mt-4" v-if="mbtiList[2] != null">
							<div class="col-md-4">
								<img src="https://via.placeholder.com/250/69f/fff.png"
									class="profile">
							</div>
							<div class="col-md-8 align-self-center">
								<div>
									<h4 style="margin: 0px 0px; font-weight: bold;">{{mbtiList[2].memberMbti}}</h4>
								</div>
								<div>
									<p style="margin: 0px 0px;">{{mbtiList[2].mbtiPercent}}%</p>
								</div>
							</div>
						</div>


			
	
						
                    
               </div>
                 
            </div>
            <div class="col-lg-5 col-md-5 col-sm-5 main">
                  <div class="border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded" style="border-radius:1em !important">
                    </div>
                <div class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded" style="border-radius:1em !important"  >
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
                    <div v-if="board.clubBoardDto.clubBoardReportcount > 2">
                    	<pre class="text-start blind" v-on:click="this.blind=true">
신고로 인하여 블라인드 처리되었습니다. 
내용을 보기를 원하신다면 여기를 클릭하세요.
                    	</pre>
                    	<p v-if="this.blind">{{board.clubBoardDto.clubBoardContent}}</p>                    	
                    </div>
                    <div v-else>
                        <pre> {{board.clubBoardDto.clubBoardContent}}</pre>	                    
                    </div>
                    </div>		
                    <div class="container row mt-5 rounded" style="border-radius:1em !important">
                                <div class="col-lg-2 col-md-2 col-sm-2 text-center">
                                       <i class="fa-regular fa-comment"></i> {{board.clubBoardDto.clubBoardCount}}
                                   </div>
                                <div class="col-lg-2 col-md-2 col-sm-2 text-center">	
                   				 <div v-if="this.boardLike==1">
	                                	<i class="fa-solid fa-heart red" v-on:click="notLikey()"></i>
                                     	{{board.clubBoardDto.clubBoardLike}}
                                     </div>
                                     <div v-else>
                                    <i class="fa-regular fa-heart red" v-on:click="likey()"></i>
	                                	{{board.clubBoardDto.clubBoardLike}}
                                     </div>

                            	</div>	
                                
                                <div v-if="isBoardEditAndDeleteAvailable(board)" class="col-lg-2 col-md-2 col-sm-2 text-center">
                                    <i class="fa-solid fa-trash" v-on:click="deleteBoard()"></i>
                                </div>
                                <div v-if="isBoardEditAndDeleteAvailable(board)" class="col-lg-2 col-md-2 col-sm-2 text-center">
                                    <i class="fa-solid fa-pen-to-square" v-on:click="changeEditMode()"></i>
                                </div>
                                 <div class="col-lg-2 col-md-2 col-sm-2 text-center">
                                 	<div v-if="!AllowedToReport()">
                                 	<i class="fa-solid fa-flag red" v-on:click="AlreadyReported()"></i>{{board.clubBoardDto.clubBoardReportcount}}
                                 	</div>
                                 	<div v-else>
                                 	<i class="fa-solid fa-flag black"  data-bs-toggle="modal" data-bs-target="#reportBoard" ></i>{{board.clubBoardDto.clubBoardReportcount}}                                 	                                 	
                                 	</div>
                                 </div>
                            </div>
                    </div>
                    <div v-else class="align-end">
                    <textarea class="form-control update" v-model="board.clubBoardDto.clubBoardContent"></textarea>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-secondary"  v-on:click="changeDisplayMode()" style="border-radius:1em !important">취소</button>
                    <button class="btn btn-edit"  v-on:click="editBoard()" style="border-radius:1em !important">수정</button>
                    </div>
                    </div>
                    </div>
                </div>
                    		
</div>
            <!-- 댓글 등록 -->
                <div class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded mt-2" style="border-radius:1em !important">
                       <div class="text-end">
                           <textarea class="form-control reply" v-model="replyContent" placeholder="내 댓글을 등록합니다" style="border-radius:1em !important"></textarea>
                        <button class="btn btn-primary" v-on:click="addReply" style="border-radius:1em !important">댓글 등록</button>
                       </div>
                </div>
            <!-- 댓글 목록 -->
            <div class="text-dark col-lg-12 col-md-12 col-sm-12 ">
            <div class="border border-opacity-10 col-lg-12 col-md-12 col-sm-12 p-2 rounded mt-2" v-for="(reply, index) in reply" v-bind:key="index" style="border-radius:1em !important">
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
                                <div class="col-lg-3 col-md-3 col-sm-3 text-center" >
     								<div v-if="reply.clubReportDto.clubReportReporter == this.memberNo">
                                 	<i class="fa-solid fa-flag red" v-on:click="AlreadyReported()"></i>{{reply.clubBoardReplyDto.clubReplyReportcount}}
                                 	</div>
                                 	<div v-else>
                                 	<i class="fa-solid fa-flag black"  data-bs-toggle="modal" data-bs-target="#reportReply" v-on:click="replyInfo(index)"></i>{{reply.clubBoardReplyDto.clubReplyReportcount}}                                 	                                 	
                                 	</div>
                                </div>
                                <div v-if="isReplyEditAndDeleteAvailable(index)" class="col-lg-3 col-md-3 col-sm-3 text-center">
                                    <a><i class="fa-solid fa-pen-to-square" v-on:click="replyEditMode(index);"></i></a>		
                                </div>
                                <div v-if="isReplyEditAndDeleteAvailable(index)" class="col-lg-3 col-md-3 col-sm-3 text-center">
                                    <a><i class="fa-solid fa-trash" v-on:click="deleteReply(index);"></i></a>	
                                </div>
                    </div>
                </div>
                <div v-else class="p-4">
                    <textarea class="form-control update-reply" v-model="reply.clubBoardReplyDto.clubReplyContent"style="border-radius:1em !important"></textarea>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-secondary "  v-on:click="replyDisplayMode(index);">취소</button>
                    <button class="btn btn-primary "  v-on:click="editReply(index)">수정</button>
                    </div>
                </div>
                               <!-- 댓글 신고 모달 -->
<div v-if="reply!=null">
<div class="modal fade" id="reportReply" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 신고</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="">
      		<label class="label-control"><b>게시물 작성자:</b></label>
      	</div>
		<div class="mt-3">
			<label class="label-control"><b>신고 분류</b></label>
			<select class="form-select" v-model="clubReportCategory">
				    <option value="한국">한국</option>
    				<option value="미국">미국</option>
    				<option value="북한">북한</option>
    				<option value="중국">중국</option>
    				<option value="일본">일본</option>
    				<option value="기타">기타</option>
			</select>
		</div>
		<div class="mt-3">
  		<label ><b>신고 상세내역</b></label>
  		<textarea class="form-control" v-model="clubReportContent"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" v-on:click="cancelReport()">취소</button>
        <button type="button" class="btn btn-danger" v-on:click="replyReport()">접수</button>
      </div>
    </div>
  </div>
</div>
</div>	
                </div>
                <div class="mt-2 rounded" style="border-radius:1em !important">
                                <button type="button" v-on:click="appendReply()" :disabled="this.dataFull == true" class="btn btn-outline-primary form-control" style="border-radius:1em !important">
        더보기 ({{showReply}}/{{totalReply}})</button>
                </div>
            </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 position-sticky mt-5">
                <div class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 right-side  rounded" style="border-radius:1em !important">
                    <div class="row">   
                        <select class="form-control" v-model="orderType"  v-on:change="changeList($event)" style="border-radius:1em !important">
                        	<option value="clubBoardNoDesc">최신</option>
                        	<option value="clubBoardLikeDesc">좋아요</option>
                        	<option value="clubBoardReadcountDesc">조회</option>
                        	<option value="clubBoardCountDesc">댓글</option>
                        </select>
                        <div class="border-bottm border-opacity-10 col-lg-12 col-md-12 col-sm-12 mt-5">
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
<!-- 게시글 신고 모달 -->
<div v-if="board!=null">
<div class="modal fade" id="reportBoard" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">게시물 신고</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="">
      		<label class="label-control"><b>게시물 작성자:</b></label>
      		{{board.memberDto.memberNick}}
      	</div>
		<div class="mt-3">
			<label class="label-control"><b>신고 분류</b></label>
			<select class="form-select" v-model="clubReportCategory">
				    <option value="한국">한국</option>
    				<option value="미국">미국</option>
    				<option value="북한">북한</option>
    				<option value="중국">중국</option>
    				<option value="일본">일본</option>
    				<option value="기타">기타</option>
			</select>
		</div>
		<div class="mt-3">
  		<label ><b>신고 상세내역</b></label>
  		<textarea class="form-control" v-model="clubReportContent"></textarea>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" v-on:click="cancelBoardReport()">취소</button>
        <button type="button" class="btn btn-danger" v-on:click="boardReport()">접수</button>
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
                	//소모임 번호
                	clubNo:"19",
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
                   orderType:"clubBoardNoDesc", //사이드 기본값
                   
                   //상세 좋아요
                   boardLike:"",
                   //게시글 신고
                   clubReportCategory:"",//신고분류
                   clubReportContent:"",//신고내역
                   boardResult:"", //신고결과
                   //게시글 신고 조회
                   searchBoardReport:"",
                   blind:false,
                   //댓글 신고
                   replyResult:"",
                   replyinformation:"",           
                   
                   //소모임정보
                   	clubList:[],
					mbtiList:[],
                   isLike:false,
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
            	//leftside
            	//소모임 정보 로드
            	loadClubInfo(){
            		axios({
            			url: "${pageContext.request.contextPath}/rest/club/"+this.clubNo,
            			method: "get",
            		}).then((resp) => {
            			this.clubList = resp.data;
            		})
            	},
            	//소모임 좋아요
            	likeClub(){      
            		if(this.memberNo == null || this.memberNo == ""){
            			window.alert("로그인을 해주세요");
            			return;
            		}
            		
            		
            		axios({
            			url:"${pageContext.request.contextPath}/rest/club/like",
            			method:"post",
            			data: {
            				clubNo:this.clubNo,
            				memberNo:this.memberNo,
            			},
            		}).then((resp) => {
            			if(resp.data == 0){
            				window.alert("좋아요 취소");
            				return;
            			}
            			window.alert("좋아요 완료!");
            		});
            	},
            	//main
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
 	            		console.log(this.memberNo);
 	            		console.log(this.board.clubBoardDto.clubBoardWriter)
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
                    	window.location.href='http://localhost:8080/e3i1/club/board/'+this.board.clubBoardDto.clubNo;
                	});
                },
 		    	//수정 가능자 
		    	isBoardEditAndDeleteAvailable(board){
		    		//1.관리자라면 통과
		    		const boardWriter = board.clubBoardDto.clubBoardWriter
		    		if(this.isAdmin) return true;
		    		//2.현재 사용자가 작성자라면 통과
		    		if(this.memberNo==boardWriter)return true;
		    		
		    		//나머지 차단
		    		return false;
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
                    const likeMemberNo = this.memberNo
               		axios({
               			url:"${pageContext.request.contextPath}/rest/clubboard/likecheck/"+clubBoardNo+"/"+likeMemberNo,
               			method:"get",
               		}).then(resp=>{
               			this.boardLike=resp.data
               			this.boardReportCheck();

               		})
            	},
            	//게시글 신고
                boardReport(){
                	const clubReportType = 1; //게시글은 1번
                	axios({
                		url:"${pageContext.request.contextPath}/rest/clubboard/report",
                		method:"post",
               			data:{
               				clubNo:this.board.clubBoardDto.clubNo,
               				clubReportTarget:this.board.clubBoardDto.clubBoardNo,
               				clubReportType:clubReportType,
               				clubReportWriter:this.board.clubBoardDto.clubBoardWriter,
               				clubReportReporter:this.memberNo,
               				clubReportCategory:this.clubReportCategory,
               				clubReportContent:this.clubReportContent,
               			},
                	}).then(resp=>{
                		this.boardResult = resp.data
                		if(this.boardResult==1){
                			window.alert("신고가 완료되었습니다")
                			this.cancelBoardReport();
                			this.boardReportCheck();
                        	this.loadContent();
                		}else{
                			window.alert("오류가 발생했습니다. 나중에 다시 시도해주십시오.")
                			this.cancelBoardReport();
                        	this.loadContent();
                		}
                	})
                },
                cancelBoardReport(){
                	this.clubReportCategory="",
                	this.clubReportContent=""
                },
                //게시글 신고 가능
                AllowedToReport(){                	
                	//1. 게시글 작성자 == 세션 멤버 동일인은 신고 불가능
                	if(this.memberNo!=this.board.clubBoardDto.clubBoardWriter && this.searchBoardReport==1)return;
                	//2. 소모임 가입자아니면 신고 불가능        	
                },
            	//게시글 신고 체크
             	boardReportCheck(){
	               	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubReportTarget = params.get("clubBoardNo");
                    const clubReportReporter = this.memberNo
               		axios({
               			url:"${pageContext.request.contextPath}/rest/clubboard/reportcheck/"+clubReportTarget+"/"+clubReportReporter,
               			method:"get",
               		}).then(resp=>{
               			this.searchBoardReport=resp.data
               		})
            	},
                //게시글 좋아요           
                likey(){
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboard/like/",
                			method:"post",
                			data:{  
    		        			clubBoardNo:clubBoardNo,
    		        			memberNo:this.memberNo,
                			}
                		}).then(resp=>{
                			
							this.loadContent(); //게시글 다시 불러오기
                			this.boardLike=true; //좋아요가 트루
                			this.boardNotLike=false; 
                		})
                		
                	
                },
                //게시글 좋아요 취소
                notLikey(){
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
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
 		    		let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");

		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/",
		        		method:"post",
		        		data:{
		        			clubNo:this.board.clubBoardDto.clubNo,
		        			clubBoardNo:this.board.clubBoardDto.clubBoardNo,
		        			clubReplyContent:this.replyContent,
		        			clubReplyWriter:this.memberNo
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
                    const likeMemberNo = this.memberNo;
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboardreply/"+clubBoardNo+"/"+likeMemberNo,
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
                //게시글 수정 가능자
		    	isReplyEditAndDeleteAvailable(index){
                	const reply = this.reply[index];
		    		//1.관리자라면 통과
		    		const replyWriter = reply.clubBoardReplyDto.clubReplyWriter
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
                				likeMemberNo:this.memberNo,
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
                				likeMemberNo:this.memberNo,
                			}
                		}).then(resp=>{
                			this.loadReply();
                		})
                	}
                },
                //댓글 신고를 위한 상세 조회
                replyInfo(index){
                	const reply = this.reply[index];
                	axios({
            			url:"${pageContext.request.contextPath}/rest/clubboardreply/report/"+reply.clubBoardReplyDto.replyNo,
            			method:"get",
                	}).then(resp=>{
                		this.replyinformation = resp.data
                	})
                },
                //댓글 신고
                replyReport(){
                	const clubReportType = 2;
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboardreply/report/",
                			method:"post",
                			data:{  
                				clubNo:this.replyinformation.clubNo,
                   				clubReportTarget:this.replyinformation.replyNo,
                   				clubReportType:clubReportType,
                   				clubReportWriter:this.replyinformation.clubReplyWriter,
                   				clubReportReporter:this.memberNo,
                   				clubReportCategory:this.clubReportCategory,
                   				clubReportContent:this.clubReportContent,
                			}
                		}).then(resp=>{
                    		this.replyResult = resp.data
                    		if(this.replyResult==1){
                    			window.alert("신고가 완료되었습니다")
                            	this.loadReply()
                    		}else{
                    		}
                    	})
                 },
                	//이미 신고한 회원 
                	AlreadyReported(){
                 	window.alert("이미 신고한 게시글입니다.")
                 },

                 
                //right-side
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
                
                
                //전부 사용
		        //시간 바꾸는 메소드
	            elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },
            },
            created(){
            	this.loadContent(); //게시글 상세
            	this.loadReply(); //댓글 목록
            	this.TopTenList(); //오른쪽 사이드바 
            	this.boardLikeCheck(); //게시글 좋아요 확인
            	this.boardReportCheck(); //게시글 신고 확인
            	this.loadClubInfo(); //클럽 정보
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>