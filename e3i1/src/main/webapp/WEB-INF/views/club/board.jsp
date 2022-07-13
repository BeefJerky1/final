<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
	<style>
	body{
	background-color:#F6F6F6 !important;
	}
	.imgfile1{
		width:1000%;
	}
	.white{
	background-color:white !important; 
	}
	ul{
	padding-left:0!important;
	}
	.imgfile2{
	width:500% }
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
.right-side{
	;
}
.btn-primary{
background-color:#3E4684 !important;
border-color:#3E4684 !important;
}
.btn-primary:hover{
background-color:#2f3564 !important;
border-color:#2f3564 !important;
}
.left-side{
height:100%;
position:sticky;
top:10%
}
.right-side{
height:100%;
position:sticky;
top:10%
}
@media screen and (max-width: 576px ) {
.left-side{
position:relative;
}
.right-side{
position:relative;
}
      }
	.blind{
	color:red;
	}
	.interest {
	background-color: #abb0d7 !important;
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
	.red{color:red;}
	.time{opacity:0.5; font-size:0.8em}
   .hover:hover{
   background-color: #F7F7F7;
   cursor: pointer;}
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
    .profile{
		border-radius:50%;    
    }
    .asdf{
    	border-radius: "2rem !important";
    }
    

	</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <div id="app" class="container-fluid">
        <div class="row all">
             <div class="col-lg-3 col-md-3 col-sm-3 mt-5 left-side "	>
             <div class="border text-dark mt-3 p-4 col-lg-9 offset-lg-3 col-md-9 offset-md-3 col-sm-9 offset-sm-3 rounded shadow white" style="border-radius:1em !important">
                 <div class="row ">
							<div class="col-md-2 align-self-center ">
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
<!-- 								<img src="https://via.placeholder.com/250/69f/fff.png" -->
<!-- 									class="profile"> -->
<!-- 							<div v-if="clubList.memberProfileDto==null"> -->
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+clubList.clubProfileDto.attachNo"> 
<!--                             </div> -->
<!--                             <div v-else> -->
<!--                          		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+clubList.memberProfileDto.attachNo">                              -->
<!--                          	</div> -->
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
                <div class="border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 text-end">
<!--                     <a href="http://localhost:8080/e3i1/club/board/1"> -->
<!--                         <h4><b>홈</b></h4> -->
<!--                     </a> -->
                </div>
                <div v-if="cancel">

                    <div class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 text-end rounded mt-3 shadow white"  style="border-radius:1em !important">
                        <textarea class="form-control " v-model="boardContent" placeholder="무슨 일이 일어나고 있나요?" style="border-radius:1em !important"></textarea>
                          <div class="mt-2 text-start">
							<label>이미지 넣기</label> 
							<input class="form-control" type="file" name="attach" accept="image/*" ref="clubBoardAttach" name="clubBoardAttach"  multiple/>
						</div>  
                        <button class="btn btn-primary mt-3 " v-on:click="addBoard" :disabled="clubBoardContentIsEmpty()== true" style="border-radius:1em !important" v-if="cancel ">등록하기</button>
                    </div>
 
                </div>
                <!-- 게시글 목록 출력 -->
                <div  class="text-dark col-lg-12 col-md-12 col-sm-12">

                <div v-for="(clubboard, index ) in board" v-bind:key="index" >
                    <div class="border border-opacity-10 p-4 col-lg-12 col-md-12 col-sm-12 hover rounded shadow white mt-3 "style="border-radius:1em !important">
                        <div class="row" >
                            <div class="col-lg-2 col-md-2 col-sm-2 align-end top">
                            <div v-if="clubboard.memberProfileDto.attachNo==0">
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+clubboard.animalPhotoDto.attachNo"> 
                            </div>
                            <div v-else>
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+clubboard.memberProfileDto.attachNo">                             
                         	</div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8 align-start top">
                                <span data-bs-toggle="modal" data-bs-target="#exampleModal" v-on:click="modal(index)">
                                   <b>{{clubboard.memberDto.memberNick}}</b> 
                                </span><br>
                                <span class="interest me-1 ">{{clubboard.memberDto.memberInterest1}}</span>
                                <span class="interest me-1 ">{{clubboard.memberDto.memberInterest2}}</span>
                                <span class="interest me-1 ">{{clubboard.memberDto.memberInterest3}}</span>
                            </div>

                            <div class="col-lg-2 col-md-2 col-sm-2 text-end top time">
                                {{elapsedText(clubboard.clubBoardDto.clubBoardTime)}}
                            </div>
                        </div>
                        <div class="row mx-auto" v-on:click="select(index)" >
                       		<div class="row px-5 " v-if="clubboard.clubBoardDto.clubBoardReportcount>2">
                       		<pre class="text-start blind">
신고가 접수된 게시물입니다.                     		
                       		</pre>
                        	</div>
                        	<div  class="row px-5 text-over-cut	 mx-auto" v-else>
                            <pre class="text-start">{{clubboard.clubBoardDto.clubBoardContent}}</pre>
                           		 <div style="margin-top: 5px; width: 100%;">
   								 	<ul  style="display: grid ;grid-template-columns:repeat(2,1fr);">
       								 	<li v-for="(attach , index) in clubboard.attach" style="width: 20%;display: inline" >
                        				<img v-if="clubboard.attach.length ==1" class="imgfile1  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo" style="border-radius:1em !important "> 
                        				<img v-else-if="clubboard.attach.length >=2" class="imgfile2  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo" style="border-radius:1em !important "> 
      								   </li>
    								</ul>                                          
								</div>
                        	</div>
                        </div>
                        <div class="container row mt-1">
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                                <i class="fa-regular fa-comment"></i>{{clubboard.clubBoardDto.clubBoardCount}}
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center p-1">
                            	<div v-if="this.memberNo==''">
  									<span><i class="fa-regular fa-heart red" ></i>{{clubboard.clubBoardDto.clubBoardLike}}</span>
                            	</div>
                            	<div v-else-if="clubboard.clubBoardLikeDto.likeMemberNo==this.memberNo">
                                	<span><i class="fa-solid fa-heart red" ></i>{{clubboard.clubBoardDto.clubBoardLike}}</span>
                                </div>
                                <div v-else>
                            		<span><i class="fa-regular fa-heart red" ></i>{{clubboard.clubBoardDto.clubBoardLike}}</span>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
                             <i class="fa-regular fa-eye"></i>{{clubboard.clubBoardDto.clubBoardReadcount}}
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 text-center">
<!--                             <i class="fa-regular fa-flag"></i>{{clubboard.clubBoardDto.clubBoardReportcount}} -->
                            </div>
                        </div>

                    </div>
            </div>
                     <!-- 모달 -->
      <div v-if="this.Mprofile!=null">
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
		            <h4><b>{{Mprofile.memberDto.memberNick}}</b></h4>
		            <span>{{Mprofile.memberDto.memberGender}}/</span><span>{{elapsedText(Mprofile.memberDto.memberBirth)}}/</span> <span>{{Mprofile.memberDto.memberPlace1}}</span>           
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
                	<h5>{{Mprofile.memberDto.memberSnsId}}</h5>
                </div>
                <div class="row mt-5">
                	<h5><b>나의 관심분야</b></h5>
                	<div class="col-lg-12 col-md-12 col-sm-12">
		            <button class="btn btn-outline-secondary btn-sm">{{Mprofile.memberDto.memberInterest1}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{Mprofile.memberDto.memberInterest2}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{Mprofile.memberDto.memberInterest3}}</button>
		            </div>
                </div>
				<div class="row mt-5">
					<h5><b>마지막 로그인</b></h5>
					<h5><h5>{{convertTime(Mprofile.memberDto.memberLogindate)}}({{elapsedText(Mprofile.memberDto.memberLogindate)}})</h5></h5>
            	</div>


            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
            </div>
            <div class=" mt-3">
                 <button type="button" v-on:click="appendBoard()" :disabled="this.dataFull==true" class="form-control btn-primary shadow " style="border-radius:1em !important">
        더보기 ({{showBoard}}/{{totalBoard}})
    </button>

            
        </div>
        </div>
       <div class="col-lg-3 col-md-3 col-sm-3  right-side mt-5 ">
       			<div v-if="this.clubMember==1 || this.memberAdmin =='관리자'" class="mt-3">
        			<button class="btn btn-secondary form-control shadow" v-on:click="notAllowed()" v-if="cancel " style="border-radius:1em !important">cancel</button>
                   	<button class="btn btn-primary form-control shadow" v-on:click="allowed()" v-if="write" style="border-radius:1em !important">write</button>
       			</div>
       			<div v-else>
       			</div>
                <div class="border border-opacity-10 text-dark mt-2 p-4 col-lg-12 col-md-12 col-sm-12 shadow white" style="border-radius:1em !important">
                    <div class="row">   
                    	<div class="col-lg-12 col-md-12 col-sm-12">
                    	
                        <select class="form-select" v-model="orderType"  v-on:change="changeList($event)" style="border-radius:1em !important">
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
                	//내 좋아요 확인
                	boardLike:"",
		            //세션
		            memberAdmin:"${auth}",	
// 		           Admin:"${auth}",
				   memberNo:"${login}",
		            //댓글 입력 정보
		            boardContent:"",
		            boardContent2:"",
					//게시글 등록/취소 버튼
					cancel:false,
					write:true,
//                     clubNo:"21",
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
                    //소모임 정보
                   	clubList:[],
					mbtiList:[],
					clubMember:"",
                   isLike:false,
                    //멤버 프로필: 모달
                    Mprofile:null,
                    True:1,
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
 		        	return this.memberAdmin == "관리자";
 		        },
 		   		clubNo(){
 					const href = window.location.href;
 					const url = new URL(href);
 					return url.searchParams.get("clubNo");
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
            	//게시글을 입력하지 않으면 게시글 등록버튼 비활성화
            	clubBoardContentIsEmpty(){
            		return this.boardContent.length==0;     		
            	},
            	//게시글 목록 출력
                loadClubBoardList(){
            		if(this.memberNo==""){
            			const memberNo=0
                    axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/"+this.clubNo+"/likeMemberNo/"+memberNo,
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
						
						//총 게시글 수가 보이는 게시글 수(5)보다 작으면
						if(this.totalBoard < this.showBoard){
// 							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.board = this.boardAll;	//게시글에 게시글 전체를 넣는다.
	                		this.dataFull=true;	//버튼은 disable
						}else if(this.totalBoard>this.showBoard){ 
	                		this.dataFull=false; //버튼은 disable
						}else if(this.totalBoard==this.showBoard){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.dataFull=true;	//버튼은 disable
						}
						
						
		        	});
            		}else{
                        axios({
    		        		url:"${pageContext.request.contextPath}/rest/clubboard/"+this.clubNo+"/likeMemberNo/"+this.memberNo,
    		        		method:"get",
    		        	})
    		        	.then(resp=>{
    		        		
    						let data = []
    						for(var i = 0; i<this.showBoard;i++){
//     							console.log(i)
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
            		}
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
                //글쓰기
                allowed(){
                	this.cancel = true;
                	this.write = false;
                },
                //취소
                notAllowed(){
                   	this.cancel= false;
					this.write = true;
					this.boardContent = "";
                },
                //게시글 등록
                addBoard(){
            		let formData = new FormData();
            		const files = this.$refs.clubBoardAttach.files;
            	    for (let i = 0; i < files.length; i++) { 
            	        formData.append("files", files[i]); // 반복문을 활용하여 파일들을 formData 객체에 추가한다
            	     }
            		formData.append('clubNo', this.clubNo);
            		formData.append('clubBoardContent', this.boardContent);
            		formData.append('clubBoardWriter', this.memberNo);
                	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/",
		        		method:"post",
		    			headers:{
		    				"Content-Type" : "multipart/form-data",
		    			},
		    			data:formData,
		        	})
		        	.then(resp=>{
		        		//완성 시 코드
		        		window.confirm("게시글 등록이 완료되었습니다!");
		        		this.boardContent = "";
		        		this.loadClubBoardList();
		        		this.notAllowed();
		        	});
                },
                //상세 페이지로 이동
                select: function(index) {
                	if(this.clubMember==1 || this.memberAdmin =='관리자'){
                		const clubBoard = this.board[index];
                    	window.location.href='http://localhost:8080/e3i1/club/board_detail?clubBoardNo='+clubBoard.clubBoardDto.clubBoardNo;
                	}else{
                		window.alert("소모임 회원만 사용할 수 있는 컨텐츠입니다.")
                		return;
                	}
                	},
                //인기 게시글로 이동
                TopTen: function(index) {
                	if(this.clubMember==1 || this.memberAdmin =='관리자'){
                		const list = this.side[index];
	                	window.location.href='http://localhost:8080/e3i1/club/board_detail?clubBoardNo='+list.clubBoardNo;            		
                	}else{
                		window.alert("소모임 회원만 사용할 수 있는 컨텐츠입니다.")
                		return;
                	}
                	
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
                 //모달로 프로필 불러오기
                 modal(index){
                 	const clubboard = this.board[index];
					const memberNo = clubboard.memberDto.memberNo
	                 	axios({
			        		url:"${pageContext.request.contextPath}/rest/clubboard/modal/"+memberNo,
			        		method:"get",
			        	})
			        	.then(resp=>{
			        		this.Mprofile = resp.data
			        	});				
				
                		 

            	},
            	//클럽 멤버 불러오기
            	clubMemberCheck(){
    				const href = window.location.href;
 					const url = new URL(href);
 					const clubNo= url.searchParams.get("clubNo");
            		axios({
            			url:"${pageContext.request.contextPath}/rest/clubboard/member/"+clubNo+"/"+this.memberNo,
            			method:"get",
            		}).then(resp=>{
            			this.clubMember=resp.data
            		})
            	},
            	
            },
            created(){
            	this.loadClubBoardList();
            	this.TopTenList();
            	this.loadClubInfo();
            	this.clubMemberCheck(); 
            	
            },
            mounted(){
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>