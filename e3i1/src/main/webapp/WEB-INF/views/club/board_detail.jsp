<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth == '관리자'}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/club.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/sweetalert.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
  .modal { background: rgba(0, 0, 0, 0.5) !important; }   
  .modal-backdrop { display: none !important; }  
.deletePicture:hover{
  animation: left-right 0.2s infinite ease-in-out alternate;
}
@keyframes left-right{
  from{
    transform: translateX(+10px);
  }
  to{
    transform: translateX(-10px);
  }
}
	body{
	background-color:#F6F6F6 !important;
	}
	.shadow{
	background-color:white !important;
	}
.imgfile1 {
	width: 1000%;
}
.side-contents:hover{

}
ul {
	padding-left: 0 !important;
}

.imgfile2 {
	width: 500%
}
.editFile{
	width:500%;
}
.profile {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
}
ul {
	padding-left: 0px !important;
}

.blind {
	color: red;
	text-decoration: none !important;
	cursor: pointer !important;
}

.red {
	color: red;
}
.fa-trash:hover, .fa-pen-to-square:hover{
	cursor:pointer !important;
}
.red:hover {
	cursor: pointer !important;
}

.black {
	color: black;
}

.black:hover {
	cursor: pointer !important;
}

.redBig {
	color: red;
}

.click {
	display: block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
.btn-primary{
background-color:#3E4684 !important;
border-color:#3E4684 !important;
}
.btn-primary:hover{
background-color:#2f3564 !important;
border-color:#2f3564 !important;
}
.click:hover {
	cursor: pointer;
		border-color:#3E4684 !important;
}

.redBig:hover {
	cursor: pointer !important;
}

i {
	font-family: fontAwesome;
}

img {
	border-radius: 100% !important
}

.time {
	opacity: 0.5;
	font-size: 0.8em
}

.main {
	padding-left: 0 !important;
	padding-right: 0 !important;
}

textarea {
	resize: none;
}

img {
	border-radius: 50%;
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
		<div class="col-lg-3 col-md-3 col-sm-3 mt-5 left-side "	>
             <div class="border text-dark mt-3 p-4 col-lg-9 offset-lg-3 col-md-9 offset-md-3 col-sm-9 offset-sm-3 rounded shadow white" style="border-radius:1em !important">
                  <div class="row">
							<div class="col-md-2 align-self-center"></div>
							<div class="text-center" v-if="clubList.clubDto != null">
								<a
									:href="'${pageContext.request.contextPath}/club/detail?clubNo='+clubList.clubDto.clubNo">
									<i class="fa-solid fa-house"></i>
								</a> <span class="boldfont">&nbsp;&nbsp;{{clubList.clubDto.clubName}}&nbsp;&nbsp;</span>
								<span @click="likeClub"> <i class="fa-solid fa-heart"
									style="color: red;" v-if="isLike"></i> <i
									class="fa-regular fa-heart" style="color: red;" v-if="!isLike"></i>&nbsp;
								</span> <i class="fa-solid fa-circle-exclamation"></i>
							</div>
						</div>
				
					<hr>

					
						<div class="card-title">
						<div class="row text-center my-2"
							v-if="clubList.memberDto != null">
							<span><i class="fa-solid fa-crown" style="color: #f6e58d;"></i></span>
							<span class="boldfontS">{{clubList.memberDto.memberNick}}</span>
						</div>
						<div class="row">
							<div class="col-md-4" width="16px" height="16px"
								style="margin-left: 0.8em; margin-top: 0.45em;">
								<img src="${pageContext.request.contextPath}/image/mbti/거북이(ISTP).png" class="profile"
									v-if="clubList.memberProfileDto == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+clubList.memberProfileDto.attachNo"
									class="profile" v-if="clubList.memberProfileDto != null">
							</div>
							<div class="col-md-7 text-right" v-if="clubList.clubDto != null"
								width="10px" height="10px">
								<div class="hash-tag text-center">\#{{clubList.clubDto.clubMainCategory}}</div>
								<div class="hash-tag text-center">\#{{clubList.clubDto.clubSubCategory}}</div>
								<div class="hash-tag text-center">\#{{clubList.clubDto.clubPlace}}</div>
							</div>
						</div>

						<div class="text-right mt-2 boldfontSright"
							v-if="clubList.clubMbtiPercent != null">
							<span class="col-md-10"><i class="fa-solid fa-user-group"
								style="margin-right: 0.5em;"></i>{{clubList.clubMbtiPercent.total}}
								/ {{clubList.clubDto.clubMemberLimit}}</span>
						</div>
					</div>



						<div class="text-center mb-3">
							<span class="boldfontS">소모임 멤버 MBTI TOP 3 <i
								class="fa-solid fa-ranking-star"></i></span>
						</div>

						<!-- v-for index를 []안에 사용할 방법을 찾으면 v-for로 반복할 예정 너무 복잡해지면 그냥 이대로 사용 -->
						<div class="row">
							<div class="col-md-4 text-center" v-if="mbtiList[0] != null">
								<img src="${root }/image/mbti/강아지(ENFP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684; width:50px; height:50px;"
									v-if="mbtiList[0].attachNo == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[0].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684; width:50px; height:50px;"
									v-if="mbtiList[0].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[0].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[0].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[1] != null">
								<img src="${root }/image/mbti/물개(ESFP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684; width:50px; height:50px;"
									v-if="mbtiList[1].attachNo == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[1].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684; width:50px; height:50px;"
									v-if="mbtiList[1].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[1].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[1].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[2] != null">
								<img src="${root }/image/mbti/원숭이(ESTP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684; width:50px; height:50px;"
									v-if="mbtiList[2].attachNo == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[2].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684; width:50px; height:50px;"
									v-if="mbtiList[2].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[2].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[2].mbtiPercent}}%</p>
							</div>
						</div>
            </div>
            </div>
		<div class="col-lg-5 col-md-5 col-sm-5 main">
			<div
				class="border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded"
				style="border-radius: 1em !important"></div>
			<div
				class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded shadow"
				style="border-radius: 1em !important">
				<div class="row">
					<div>
						<div class="row" v-if="board!=null">
							<div class="col-lg-2 col-md-2 col-sm-2 align-end top">
								<!-- 프로필 사진 출력 -->
								<div v-if="board.memberProfileDto.attachNo==0">
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+board.animalPhotoDto.attachNo"> 
	                            </div>
	                            <div v-else>
	                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+board.memberProfileDto.attachNo">                             
	                         	</div>
							</div>
							<div class="col-lg-8 col-md-8 col-sm-8 align-start ">
							<div class="dropdown">
							  <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							   {{board.memberDto.memberNick}}
							  </a>
							
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#profileModal">프로필</a></li>
							    <div v-if="board.memberDto.memberNo == this.memberNo"></div>
							    <div v-else>
							    <li><a class="dropdown-item" href="#" v-on:click="blocked()">차단하기</a></li>
							    </div>
							    <div v-if="board.memberDto.memberNo == this.memberNo"></div>
							    <div v-else>
							    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#postModal">메시지 보내기</a></li>
							 	 </div>
							  </ul>
							</div>
                                <span class="interest me-1 ">{{board.memberDto.memberInterest1}}</span>
                                <span class="interest me-1 ">{{board.memberDto.memberInterest2}}</span>
                                <span class="interest me-1 ">{{board.memberDto.memberInterest3}}</span>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-2 p-3">
<!-- 								<div v-if="isBoardWriter"> -->
<!-- 									<i class="fa-solid fa-heart redBig fa-3x" -->
<!-- 								></i> -->
<!-- 								</div> -->
								<div v-if=this.boardLike!=null>
								<div v-if="this.boardLike==1">
									<i class="fa-solid fa-heart redBig fa-3x"
										v-on:click="notLikey()"></i>
								</div>
								<div v-else>
									<i class="fa-regular fa-heart redBig fa-3x"
										v-on:click="likey()"></i>
								</div>
								</div>
							</div>
						</div>
					</div>

					<div v-if="board != null">
						<div v-if="!board.edit">
							<div class="row px-5">
								<div v-if="board.clubBoardDto.clubBoardReportcount > 2">
									<pre class="text-start blind" v-on:click="this.blind=false">
신고가 접수된 게시물입니다. (신고수 :{{board.clubBoardDto.clubBoardReportcount}}회)
여기를 클릭하시면 내용을 볼 수 있습니다.
                    	</pre>
								</div>
								<div v-else>
									<p>{{board.clubBoardDto.clubBoardContent}}</p>
									<div style="margin-top: 5px; width: 100%;">
										<ul
											style="display: grid; grid-template-columns: repeat(2, 1fr);">
											<li v-for="(attach , index) in board.attach"
												style="width: 20%; display: inline"><img
												v-if="board.attach.length ==1"
												class="imgfile1  rounded mx-auto d-block"
												:src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo"
												style="border-radius: 1em !important"> <img
												v-else-if="board.attach.length >=2"
												class="imgfile2  rounded mx-auto d-block"
												:src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo"
												style="border-radius: 1em !important"></li>
										</ul>
									</div>
								</div>
								<div v-if="this.blind==true"></div>
								<div v-else>
									<p>{{board.clubBoardDto.clubBoardContent}}</p>
									<div style="margin-top: 5px; width: 100%;">
										<ul
											style="display: grid; grid-template-columns: repeat(2, 1fr);">
											<li v-for="(attach , index) in board.attach"
												style="width: 20%; display: inline">
												<img
												v-if="board.attach.length ==1"
												class="imgfile1  rounded mx-auto d-block"
												:src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo"
												style="border-radius: 1em !important"
												>
												
												<img
												v-else-if="board.attach.length >=2"
												class="imgfile2  rounded mx-auto d-block"
												:src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo"
												style="border-radius: 1em !important"></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="container row mt-5 rounded "
								style="border-radius: 1em !important">
								<div class="col-lg-2 col-md-2 col-sm-2 text-center">
									<i class="fa-regular fa-comment"></i>
									{{board.clubBoardDto.clubBoardCount}}
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 text-center">
<!-- 									<div v-if="isBoardWriter"> -->
<!-- 										<i class="fa-solid fa-heart red"></i> -->
<!-- 										{{board.clubBoardDto.clubBoardLike}} -->
<!-- 									</div> -->
									<div v-if="this.boardLike==1">
										<i class="fa-solid fa-heart red" v-on:click="notLikey()"></i>
										{{board.clubBoardDto.clubBoardLike}}
									</div>
									<div v-else>
										<i class="fa-regular fa-heart red" v-on:click="likey()"></i>
										{{board.clubBoardDto.clubBoardLike}}
									</div>

								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 text-center">
									<div v-if="isBoardWriter">
										<!-- 게시글 작성자는 신고 버튼 안보임 -->
									</div>
									<div v-else-if="!isAlreadyReported">
										<!-- 신고 안한 사람 -->
										<i class="fa-solid fa-flag black" data-bs-toggle="modal"
											data-bs-target="#reportBoard"></i><span>신고</span>
									</div>
									<div v-else-if="isAlreadyReported">
										<!-- 이미 신고한 사람 -->
										<i class="fa-solid fa-flag red" v-on:click="AlreadyReported()"></i><span>신고</span>
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 text-center">
								</div>
								<!--  수정 가능한 자 (작성자)-->
								<div v-if="isBoardEditAvailable(board)"
									class="col-lg-2 col-md-2 col-sm-2 text-center">
									<i class="fa-solid fa-pen-to-square"
										v-on:click="changeEditMode()"></i>
								</div>
								<!--  삭제 가능한 자 ( 관리자, 소모임 관리자, 작성자) -->
								<div v-if="isBoardDeleteAvailable(board)"
									class="col-lg-2 col-md-2 col-sm-2 text-center">
									<i class="fa-solid fa-trash" v-on:click="deleteBoard()"></i>
								</div>
							</div>
						</div>
						
						<!-- 게시글 수정 -->
						<div v-else class="align-end">
							<textarea class="form-control update"
								v-model="board.clubBoardDto.clubBoardContent" ></textarea>
								<div class="row">
								<!--  사진 파일 출력/ 클릭하면 삭제 -->
								<ul style="display: grid; grid-template-columns: repeat(2, 1fr);">
											<li v-for="(attach , index) in attachNo"
												style="width: 20%; display: inline">
												<img
												v-if="board.attach.length ==1"
												class="editFile  rounded mx-auto d-block deletePicture"
												:src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo"
												style="border-radius: 1em !important"
												v-on:click="deletePicture(index)">
												
												<img
												v-else-if="board.attach.length >=2"
												class="editFile  rounded mx-auto d-block deletePicture"
												:src="'http://localhost:8080/e3i1/attachment/download?attachNo='+attach.attachNo"
												style="border-radius: 1em !important" v-on:click="deletePicture(index)"></li>
								</ul>
								</div>
							<input class="form-control" type="file" name="attach" accept="image/*" ref="clubBoardAttach" name="clubBoardAttach"  multiple/>
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button class="btn btn-secondary"
									v-on:click="changeDisplayMode()"
									style="border-radius: 1em !important">취소</button>
								<button class="btn btn-edit" v-on:click="editBoard()"
									style="border-radius: 1em !important">수정</button>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- 댓글 등록 -->
			<div
				class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 rounded mt-2 shadow"
				style="border-radius: 1em !important">
				<div v-if="this.clubMember==1 || this.memberAdmin =='관리자'">
					<div class="text-end">
						<textarea class="form-control reply " v-model="replyContent"
							placeholder="내 댓글을 등록합니다" style="border-radius: 1em !important"></textarea>
						<button class="btn btn-primary shadow" v-on:click="addReply" :disabled="replyContentIsEmpty()==true"
							style="border-radius: 1em !important">댓글 등록</button>
					</div>
				</div>
				<div v-else>
					<h1></h1>
				</div>
			</div>
			<!-- 댓글 목록 -->
			<div class="text-dark col-lg-12 col-md-12 col-sm-12 ">
				<div
					class="border border-opacity-10 col-lg-12 col-md-12 col-sm-12 p-2 rounded mt-2 shadow"
					v-for="(reply, index) in reply" v-bind:key="index"
					style="border-radius: 1em !important">
					<div class="row p-4">
						<div class="col-lg-2 col-md-2 col-sm-2 ">
							<div v-if="reply.memberProfileDto.attachNo==0">
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+reply.animalPhotoDto.attachNo"> 
                            </div>
                            <div v-else>
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+reply.memberProfileDto.attachNo">                             
                         	</div>
						</div>
						<div class="col-lg-8 col-md-8 col-sm-8 align-start">
							<div class="dropdown">
							  <a class="dropdown-toggle"  v-on:click="replyInfo(index)" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
							   {{reply.memberDto.memberNick}}
							  </a>
							
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#profileModal2">프로필</a></li>
							    <div v-if="reply.memberDto.memberNo == this.memberNo"></div>
							    <div v-else>
							    <li><a class="dropdown-item" href="#" v-on:click="replyBlocked()">차단하기</a></li>
							    </div>
							    <div v-if="reply.memberDto.memberNo == this.memberNo"></div>
							    <div v-else>
							    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#postModal2">메시지 보내기</a></li>
							 	 </div>
							  </ul>
							</div>
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
								<!-- 댓글 작성자라면 좋아요 안됨 -->
<!-- 								<div v-if="reply.clubBoardReplyDto.clubReplyWriter==this.memberNo"> -->
<!-- 								<i class="fa-solid fa-heart red"></i>{{reply.clubBoardReplyDto.clubReplyLike}}</span> -->
<!-- 								</div> -->
								<!-- 이미 좋아요 눌렀어도 안됨 -->
								<div v-if="reply.clubReplyLikeDto.likeCheck ==1">
									<span><i class="fa-solid fa-heart red"
										v-on:click="replyLikey(index)"></i>{{reply.clubBoardReplyDto.clubReplyLike}}</span>
								</div>
								<div v-else>
									<span><i class="fa-regular fa-heart red"
										v-on:click="replyLikey(index)"></i>{{reply.clubBoardReplyDto.clubReplyLike}}</span>
								</div>
							</div>
							<div class="col-lg-3 col-md-3 col-sm-3 text-center">
								<!-- 댓글 작성자라면 신고 안됨 -->
								<div v-if="reply.clubBoardReplyDto.clubReplyWriter ==this.memberNo">
								</div>
								<!-- 신고 이력 있어도 신고 안됨 -->
								<div v-else-if="reply.clubReplyReportDto.clubReportReporter == this.memberNo">
									<i class="fa-solid fa-flag red" v-on:click="AlreadyReported()"></i>{{reply.clubBoardReplyDto.clubReplyReportcount}}
								</div>
								<div v-else>
									<i class="fa-solid fa-flag black" data-bs-toggle="modal"
										data-bs-target="#reportReply" v-on:click="replyInfo(index)"></i>{{reply.clubBoardReplyDto.clubReplyReportcount}}
								</div>
							</div>
							<div v-if="isReplyEditAvailable(index)"
								class="col-lg-3 col-md-3 col-sm-3 text-center">
								<a><i class="fa-solid fa-pen-to-square"
									v-on:click="replyEditMode(index);"></i></a>
							</div>
							<div v-if="isReplyDeleteAvailable(index)"
								class="col-lg-3 col-md-3 col-sm-3 text-center">
								<a><i class="fa-solid fa-trash"
									v-on:click="deleteReply(index);"></i></a>
							</div>
						</div>
					</div>
					<!--  댓글 수정 -->
					<div v-else class="p-4">
						<textarea class="form-control update-reply"
							v-model="reply.clubBoardReplyDto.clubReplyContent"
							style="border-radius: 1em !important"></textarea>
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button class="btn btn-secondary "
								v-on:click="replyDisplayMode(index);">취소</button>
							<button class="btn btn-primary " v-on:click="editReply(index)">수정</button>
						</div>
					</div>
					<!-- 댓글 신고 모달 -->
					<div v-if="reply!=null">
						<div class="modal fade" id="reportReply" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">댓글 신고</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close" v-on:click="cancelReport()"></button>
									</div>
									<div class="modal-body">
										<div class="">
											<label class="label-control"><b>게시물 작성자:{{reply.memberDto.memberNick}}</b></label>
										</div>
										<div class="mt-3">
											<label class="label-control"><b>신고 분류</b></label> <select
												class="form-select" v-model="clubReportCategory">
												<option value="영리목적/홍보">영리목적/홍보</option>
												<option value="불법정보">불법정보</option>
												<option value="욕실/인신공격">욕실/인신공격</option>
												<option value="개인정보노출">개인정보노출</option>
												<option value="음란성/선정성">음란성/선정성</option>
												<option value="기타">기타</option>
											</select>
										</div>
										<div class="mt-3">
											<label><b>신고 상세내역</b></label>
											<textarea class="form-control" v-model="clubReportContent" :maxLength="contentMax"></textarea>
										</div>
										<div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >{{clubReportContent.length}}</span> 
                    	/
                    	<span class="text-muted total">{{contentMax}}</span> 
                     </span>
                  </div>
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal" v-on:click="cancelReport()">취소</button>
										<button type="button" class="btn btn-danger"
											v-on:click="replyReport() " data-bs-dismiss="modal" :disabled="ReplyReportReasonEmpty()==true">접수</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mt-2 rounded" style="border-radius: 1em !important">
					<button type="button" v-on:click="appendReply()"
						:disabled="this.dataFull == true"
						class="btn btn-primary form-control shadow"
						style="border-radius: 1em !important">더보기
						({{showReply}}/{{totalReply}})</button>
				</div>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 right-side mt-5">
			<div
				class="border border-opacity-10 text-dark p-4 col-lg-12 col-md-12 col-sm-12 right-side  rounded shadow"
				style="border-radius: 1em !important">
				<div class="row">
					<select class="form-control" v-model="orderType"
						v-on:change="changeList($event)"
						style="border-radius: 1em !important">
						<option value="clubBoardNoDesc">최신</option>
						<option value="clubBoardLikeDesc">좋아요</option>
						<option value="clubBoardReadcountDesc">조회</option>
						<option value="clubBoardCountDesc">댓글</option>
					</select>
					<div
						class="border-bottm border-opacity-10 col-lg-12 col-md-12 col-sm-12 mt-5">
						<div v-if="this.side!=null">
						<div v-for="(side, index ) in side" v-bind:key="index">
							<div v-if="this.orderType=='clubBoardNoDesc'" class="row">
								<div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7 side-contents">
									<span v-on:click="TopTen(index)" class="click">{{1+index}}.
										{{side.clubBoardContent}}</span>
								</div>
								<div class="col-lg-5 col-md-5 col-sm-5 text-end">
									<span class="time"> {{elapsedText(side.clubBoardTime)}}
									</span>
								</div>
							</div>
							<div v-if="this.orderType=='clubBoardLikeDesc'" class="row">
								<div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
									<span v-on:click="TopTen(index)" class="click">{{1+index}}.
										{{side.clubBoardContent}}</span>
								</div>
								<div class="col-lg-5 col-md-5 col-sm-5 text-end">
									<i class="fa-solid fa-heart red"></i><span>{{side.clubBoardLike}}</span>
								</div>
							</div>
							<div v-if="this.orderType=='clubBoardReadcountDesc'" class="row">
								<div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
									<span v-on:click="TopTen(index)" class="click">{{1+index}}.
										{{side.clubBoardContent}}</span>
								</div>
								<div class="col-lg-5 col-md-5 col-sm-5 text-end">
									<i class="fa-regular fa-eye"></i><span>{{side.clubBoardReadcount}}</span>
								</div>
							</div>
							<div v-if="this.orderType=='clubBoardCountDesc'" class="row">
								<div class="text-dark p-1 col-lg-7 col-md-7 col-sm-7">
									<span v-on:click="TopTen(index)" class="click">{{1+index}}.
										{{side.clubBoardContent}}</span>
								</div>
								<div class="col-lg-5 col-md-5 col-sm-5 text-end">
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
	
          <!--  게시글 메시지 모달  -->
     <div v-if="this.board!=null">
      <div class="modal fade" id="postModal"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 p-4 border-0 bg-light">
               <div class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
                  <a href="#" class="text-muted text-decoration-none material-icons" data-bs-dismiss="modal" v-on:click="cancelMessage()">arrow_back_ios_new</a>
                  <h5 class="modal-title text-muted ms-3 ln-0" id="staticBackdropLabel"><span class="material-icons md-32">account_circle</span></h5>
               </div>
               <!-- 닉네임 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <div class=" rounded-5 border-0 shadow-sm readonly" id="floatingTextarea1" style="height: 50px"><b>To:{{board.memberDto.memberNick}}</b></div>
                </div>
             </div>
               <!-- 제목 작성 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <input type="text" class="form-control rounded-5 border-0 shadow-sm" v-model="messageTitle"  id="floatingTextarea2" style="height: 50px" :maxLength="titleMax">
                   <label for="floatingTextarea2" class="h6 text-muted mb-0">제목을 작성하세요.</label>
                </div>
             </div>
             	<!-- 내용 작성 -->
               <div class="modal-body p-0 mb-3">
                  <div class="form-floating">
                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" v-model="messageContent"placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" :maxLength="contentMax"></textarea>
                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
                  </div>
               </div>

               <div class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
                  <div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >{{messageContent.length}}</span> 
                    	/
                    	<span class="text-muted total">{{contentMax}}</span> 
                     </span>
                  </div>
                  <div class="ms-auto m-0">
                  	<button type="button" v-on:click="sendMessage()"  :disabled="messageIsEmpty()==true" data-bs-dismiss="modal" data-bs-target="#postModal" class="writeButton btn btn-primary fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center" style="border-radius : 1em; background-color: #514e85; border:none; font-size: 14px !important;">보내기</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
     </div>
    <!-- 댓글 메세지 모달 -->
      <div v-if="this.replyinformation!=null">
      <div class="modal fade" id="postModal2"  data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 p-4 border-0 bg-light">
               <div class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
                  <a href="#" class="text-muted text-decoration-none material-icons" data-bs-dismiss="modal" v-on:click="cancelMessage()">arrow_back_ios_new</a>
                  <h5 class="modal-title text-muted ms-3 ln-0" id="staticBackdropLabel"><span class="material-icons md-32">account_circle</span></h5>
               </div>
               <!-- 닉네임 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <div class=" rounded-5 border-0 shadow-sm readonly" id="floatingTextarea1" style="height: 50px"><b>To:{{replyinformation.memberDto.memberNick}}</b></div>
                </div>
             </div>
               <!-- 제목 작성 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <input type="text" class="form-control rounded-5 border-0 shadow-sm" v-model="messageTitle"  id="floatingTextarea2" style="height: 50px" :maxLength="titleMax">
                   <label for="floatingTextarea2" class="h6 text-muted mb-0">제목을 작성하세요.</label>
                </div>
             </div>
             	<!-- 내용 작성 -->
               <div class="modal-body p-0 mb-3">
                  <div class="form-floating">
                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" v-model="messageContent"placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" :maxLength="contentMax"></textarea>
                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
                  </div>
               </div>

               <div class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
                  <div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >{{messageContent.length}}</span> 
                    	/
                    	<span class="text-muted total">{{contentMax}}</span> 
                     </span>
                  </div>
                  <div class="ms-auto m-0">
                  	<button type="button" v-on:click="replySendMessage()" :disabled="messageIsEmpty()==true"  data-bs-dismiss="modal" data-bs-target="#postModal2" class="writeButton btn btn-primary fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center" style="border-radius : 1em; background-color: #514e85; border:none; font-size: 14px !important;">보내기</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
     </div>
     <!--  게시글 프로필 모달 -->
      <div v-if="this.board!=null">
      <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                  <div v-if="board.memberProfileDto.attachNo==0">
                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+board.animalPhotoDto.attachNo"> 
	                            </div>
	                            <div v-else>
	                         		<img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+board.memberProfileDto.attachNo">                             
	                         	</div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
		            <h4><b>{{board.memberDto.memberNick}}</b></h4>
		            <span>{{board.memberDto.memberGender}}/</span><span>{{elapsedText(board.memberDto.memberBirth)}}/</span> <span>{{board.memberDto.memberPlace1}}</span>           
                </div>
                <div class="row mt-5">
                	<h5><b>SNS계정</b><img style="width:25px "src="https://cdn-icons-png.flaticon.com/512/1384/1384063.png"></h5>
                	<h5>{{board.memberDto.memberSnsId}}</h5>
                </div>
                <div class="row mt-5">
                	<h5><b>나의 관심분야</b></h5>
                	<div class="col-lg-12 col-md-12 col-sm-12">
		            <button class="btn btn-outline-secondary btn-sm">{{board.memberDto.memberInterest1}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{board.memberDto.memberInterest2}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{board.memberDto.memberInterest3}}</button>
		            </div>
                </div>
				<div class="row mt-5">
					<h5><b>마지막 로그인</b></h5>
					<h5><h5>{{convertTime(board.memberDto.memberLogindate)}}({{elapsedText(board.memberDto.memberLogindate)}})</h5></h5>
            	</div>


            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
     <!--  댓글 프로필 모달 -->
      <div v-if="this.replyinformation!=null">
      <div class="modal fade" id="profileModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                	<div v-if="replyinformation.memberProfileDto.attachNo==0">
                    <img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+replyinformation.animalPhotoDto.attachNo"> 
	                </div>
	                <div v-else>
	                <img class="profile  rounded mx-auto d-block" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+replyinformation.memberProfileDto.attachNo">                             
	                </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
		            <h4><b>{{replyinformation.memberDto.memberNick}}</b></h4>
		            <span>{{replyinformation.memberDto.memberGender}}/</span><span>{{elapsedText(replyinformation.memberDto.memberBirth)}}/</span> <span>{{replyinformation.memberDto.memberPlace1}}</span>           
                </div>
                <div class="row mt-5">
                	<h5><b>SNS계정</b><img style="width:25px "src="https://cdn-icons-png.flaticon.com/512/1384/1384063.png"></h5>
                	<h5>{{replyinformation.memberDto.memberSnsId}}</h5>
                </div>
                <div class="row mt-5">
                	<h5><b>나의 관심분야</b></h5>
                	<div class="col-lg-12 col-md-12 col-sm-12">
		            <button class="btn btn-outline-secondary btn-sm">{{replyinformation.memberDto.memberInterest1}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{replyinformation.memberDto.memberInterest2}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{replyinformation.memberDto.memberInterest3}}</button>
		            </div>
                </div>
				<div class="row mt-5">
					<h5><b>마지막 로그인</b></h5>
					<h5><h5>{{convertTime(replyinformation.memberDto.memberLogindate)}}({{elapsedText(replyinformation.memberDto.memberLogindate)}})</h5></h5>
            	</div>


            </div>
            <div class="modal-footer">
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
	<!-- 게시글 신고 모달 -->
	<div v-if="board!=null">
		<div class="modal fade" id="reportBoard" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">게시물 신고</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close" v-on:click="cancelReport()"></button>
					</div>
					<div class="modal-body">
						<div class="">
							<label class="label-control"><b>게시물 작성자:</b></label>
							{{board.memberDto.memberNick}}
						</div>
						<div class="mt-3">
							<label class="label-control"><b>신고 분류</b></label> <select
								class="form-select" v-model="clubReportCategory">
								<option value="영리목적/홍보">영리목적/홍보</option>
								<option value="불법정보">불법정보</option>
								<option value="욕실/인신공격">욕실/인신공격</option>
								<option value="개인정보노출">개인정보노출</option>
								<option value="음란성/선정성">음란성/선정성</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div class="mt-3">
							<label><b>신고 상세내역</b></label>
							<textarea class="form-control" v-model="clubReportContent" :maxlength="contentMax"></textarea>
						</div>
						<div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >{{clubReportContent.length}}</span> 
                    	/
                    	<span class="text-muted total">{{contentMax}}</span> 
                     </span>
                  </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" v-on:click="cancelReport()">취소</button>
						<button type="button" class="btn btn-danger"
							v-on:click="boardReport()" :disabled="BoardReportReasonEmpty()==true"data-bs-dismiss="modal">접수</button>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script> -->
<script>

        const app = Vue.createApp({
            data(){
                return {
                	//소모임 번호
//                 	clubNo:"21",
				   //세션
				   memberNo:"${login}",
		           memberAdmin:"${auth}",
                   //게시글
		           board:null,//상세
		           like:"",//게시글 좋아요
		           //게시글 수정
		           boardContent:"",
		           attachNo:null,
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
                   blind:true,
                   //댓글 신고
                   replyResult:"",
                   replyinformation:null,           
                   
                   //소모임정보
                   	clubList:[],
					mbtiList:[],
                   isLike:false,
                   clubMember:"", //소모임 멤버 확인
                   
                   //메세지 보내기
                   messageTitle:"",
                   messageContent:"",
                   sendMessageResult:"",
                   
                   //글자제한
                   contentMax:300,
                   titleMax:30,
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
 		        //게시글 작성자 == 세션 멤버 일때 신고 불가
 		        isBoardWriter(){
 		        	return this.memberNo== this.board.clubBoardDto.clubBoardWriter;
 		        },
 		        //게시글 이미 신고한 자라면 신고불가
 		        isAlreadyReported(){
 		        	return this.memberNo== this.board.clubBoardReportDto.clubReportReporter;
 		        },
 		        clubBoardNo(){
 					const href = window.location.href;
 					const url = new URL(href);
 					return url.searchParams.get("clubBoardNo");
 		        },
//  		        clubNo(){
//  		        	return this.board.clubBoardDto.clubNo;
//  		        }
            },
            methods:{
            	//leftside
            	//소모임 정보 로드
            	loadClubInfo(){
            		axios({
            			url: "${pageContext.request.contextPath}/rest/clubboard/clubDetail/"+this.clubBoardNo,
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
            				Swal.fire({
	        			         title: '좋아요 취소!',
	        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
	    		    			  imageWidth : 100
		        		  	        			 })
            				return;
            			}
            			Swal.fire({
       			         title: '좋아요!',
       			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
   		    			  imageWidth : 100
	        		  	        			 })
            		});
            	},
            	//main
            	//게시글 로드
            	 loadContent(){
                 	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");
 		        	axios({
 		        		url:"${pageContext.request.contextPath}/rest/clubboard/detail/"+this.clubBoardNo+"/memberNo/"+this.memberNo,
 		        		method:"get",
 		        		
 		        	})
 		        	.then(resp=>{
 		        		this.board= resp.data;
 	            		console.log(this.memberNo);
 	            		console.log(this.board.clubBoardDto.clubBoardWriter)
 	            		console.log(this.board.clubBoardReportDto.clubReportReporter)
 	            		this.AllowedToReport();
	 	               	this.boardLikeCheck(); //좋아요 가능확인
	 	            	this.boardReportCheck();//신고 가능확인
	 	            	this.clubMemberCheck(); //소모임 가입자 확인
	 	            	this.TopTenList();//인기 게시글 불러오기
	 	            	this.mbti();

 		        	});
 		        
 		    	},
 		    	//게시글 삭제
 		    	deleteBoard(){
 		    		Swal.fire({
		    			  title: '정말 삭제하시겠습니까???',
		    			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		    			  imageUrl : '${pageContext.request.contextPath}/image/alert.png',
		    			  imageWidth : 100,
		    			  showCancelButton: true,
		    			  confirmButtonColor: '#3085d6',
		    			  cancelButtonColor: '#d33',
		    			  confirmButtonText: '삭제',	
		    			  cancelButtonText: '취소'
		    			}).then((result) => {
		    			  if (result.value) {
		 		    		let uri = window.location.search.substring(1); 
		                    let params = new URLSearchParams(uri);
		                    console.log(params.get("clubBoardNo"));
		                    const clubBoardNo = params.get("clubBoardNo");
		                	axios({
		                		url:"${pageContext.request.contextPath}/rest/clubboard/"+clubBoardNo,
		                		method:"delete",
		                	})
		                	.then(resp=>{
		                    	window.location.href='http://localhost:8080/e3i1/club/board?clubNo='+this.board.clubBoardDto.clubNo;
		                	});
		    			  }
		    			});
				
                },
 		    	//삭제 가능자 
		    	isBoardDeleteAvailable(board){
		    		//1.관리자라면 통과
		    		const boardWriter = board.clubBoardDto.clubBoardWriter
		    		if(this.isAdmin) return true;
		    		//2.현재 사용자가 작성자라면 통과
		    		if(this.memberNo==boardWriter)return true;
		    		//3.현재 사용자가 소모임 리더일때
// 		    		if(this.memberNo==this.clubList.clubDto.clubLeader)return true;
		    		//나머지 차단
		    		return false;
		    	},
		    	//수정 가능자
		    	isBoardEditAvailable(board){
		    		//현재 사용자가 작성자라면 통과
		    		const boardWriter = board.clubBoardDto.clubBoardWriter
		    		if(this.memberNo==boardWriter)return true;
		    		//나머지 차단
		    		return false;
		    	},
              	//게시글 수정
                editBoard(){
		    		let formData = new FormData();
            		const files = this.$refs.clubBoardAttach.files;
            	    for (let i = 0; i < files.length; i++) { 
            	        formData.append("files", files[i]); // 반복문을 활용하여 파일들을 formData 객체에 추가한다
            	     }
            	    formData.append('clubBoardNo', this.clubBoardNo);
            		formData.append('clubNo', this.clubList.clubDto.clubNo);
            		formData.append('clubBoardContent', this.board.clubBoardDto.clubBoardContent);
            		formData.append('clubBoardWriter', this.memberNo);
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/clubboard/editBoard",
		        		method:"post",
		        		headers:{
		    				"Content-Type" : "multipart/form-data",
		    			},
		    			data:formData,
		        	}).then(resp=>{
		        		this.loadContent();
		        	});
		        },
		        //사진 삭제
		        deletePicture(index){
		        	Swal.fire({
		    			  title: '정말 삭제하시겠습니까???',
		    			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		    			  imageUrl : '${pageContext.request.contextPath}/image/alert.png',
		    			  imageWidth : 100,
		    			  showCancelButton: true,
		    			  confirmButtonColor: '#3085d6',
		    			  cancelButtonColor: '#d33',
		    			  confirmButtonText: '삭제',	
		    			  cancelButtonText: '취소'
		    			}).then((result) => {
		    			  if (result.value) {
				        	const attach = this.attachNo[index];
				        	axios({
				        		url:"${pageContext.request.contextPath}/rest/clubboard/attach/"+attach.attachNo,
				        		method:"delete",
				        	}).then(resp=>{
				        		if(resp.data==1){
					        		Swal.fire(
				        			          '삭제가 완료되었습니다.',
				        			          '',
				        			          'success'
				        			        )
					        		this.changeEditMode();
				        		}
				        	
				        	})
		    				  
		    			  }
		    			})
		    			
	
		        },
		        //수정모드
		        changeEditMode(){
		        	this.board.edit=true;
		        	//게시글 사진번호 가져오기
		        	let uri = window.location.search.substring(1); 
                    let params = new URLSearchParams(uri);
                    const clubBoardNo = params.get("clubBoardNo");
	          		axios({
            			url:"${pageContext.request.contextPath}/rest/clubboard/attach/"+clubBoardNo,
            			method:"get",
            		}).then(resp=>{
            			this.attachNo=resp.data
            		})
		        },
		        //수정모드 해제
		        changeDisplayMode(){
		        	this.board.edit=false;
		        },
		      	//게시글 좋아요 가능자 확인
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
            	//게시글 신고 사유 미작성시 접수 버튼 비활성화
            	BoardReportReasonEmpty(){
            		return this.clubReportCategory.length==0 || this.clubReportContent.length==0;		
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
                			Swal.fire({
	        			         title: '신고가 완료되었습니다.!',
	        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
	    		    			  imageWidth : 100
		        		  	        			 })
                			this.cancelReport();
                			this.boardReportCheck();
                        	this.loadContent();
                		}else{
                			 Swal.fire(
		        			          '오류가 발생했습니다. 다시 시도해 주세요.',
		        			          '',
		        			          'error'
		        			        )
                			this.cancelReport();
                        	this.loadContent();
                		}
                	})
                },
                //게시글 신고 가능한 사람
                AllowedToReport(){                	
                	if(this.isBoardWriter) return false
                	if(this.isAlreadyReported) return false
                	return true
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
                			Swal.fire({
             			         title: '좋아요.!',
             			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
         		    			  imageWidth : 100
      	        		  	        			 })
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
                			Swal.fire({
             			         title: '좋아요 취소!',
             			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
         		    			  imageWidth : 100
      	        		  	        			 })
                		
                			this.loadContent();
                			this.boardNotLike=true;
                			this.boardLike=false;
                		})
                	
                },
                //게시글 프로필에서 차단
 				blocked(){
                	Swal.fire({
		    			  title: '정말 차단하시겠습니까???',
		    			  text: "차단한 상대의 게시물은 보이지 않습니다.",
		    			  imageUrl : '${pageContext.request.contextPath}/image/sad.png',
		    			  imageWidth : 100,
		    			  showCancelButton: true,
		    			  confirmButtonColor: '#3085d6',
		    			  cancelButtonColor: '#d33',
		    			  confirmButtonText: '차단',	
		    			  cancelButtonText: '취소'
		    			}).then((result) => {
		    			  if (result.value) {
		                	const blockedTarget = this.board.memberDto.memberNo;
		 					axios({
		 						url:"${pageContext.request.contextPath}/rest/mypage/block",
		 						method:"post",
		 						data:{
		 							blockedTarget:blockedTarget,
		 							blockedUser:this.memberNo,
		 						}
		 					}).then(resp=>{
		 						this.blockedResult=resp.data
		 						if(this.blockedResult ==1){
		 							Swal.fire({
			        			         title: '차단되었습니다. 차단해제는 마이페이지에서 가능합니다!',
			        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
			    		    			  imageWidth : 100
				        		  	        			 })
		 							window.location.href='http://localhost:8080/e3i1/club/board?clubNo='+this.board.clubBoardDto.clubNo;
		 						}
		 					})
                		
		    			  }
		    			})
                	
 				},
            	replyContentIsEmpty(){
            		return this.replyContent.length==0;     		
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
// 		        		location.reload();
		        		this.replyContent = "";
		        		this.loadReply();
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
// 							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.reply = this.replyAll;	//게시글에 게시글 전체를 넣는다.
	                		this.dataFull=true;	//버튼은 disable
						}else if(this.totalReply>this.showReply){ 
	                		this.dataFull=false; //버튼은 disable
						}else if(this.totalReply==this.showReply){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.dataFull=true;	//버튼은 disable
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
		    	isReplyEditAvailable(index){
                	const reply = this.reply[index];
		    		//작성자라면 수정가능 
		    		const replyWriter = reply.clubBoardReplyDto.clubReplyWriter
		    		if(this.memberNo==replyWriter)return true;
		    		
		    		//나머지 차단
		    		return false;
		    	},
		          //게시글 삭제 가능자
		    	isReplyDeleteAvailable(index){
                	const reply = this.reply[index];
		    		//1.관리자라면 통과
		    		const replyWriter = reply.clubBoardReplyDto.clubReplyWriter
		    		if(this.isAdmin) return true;
		    		//2.현재 사용자가 작성자라면 통과
		    		if(this.memberNo==replyWriter)return true;
		    		//3.현재 사용자가 소모임 리더일때
		    		if(this.memberNo==this.clubList.clubDto.clubLeader)return true;
		    		//나머지 차단
		    		return false;
		    	},
		    	//댓글 삭제
		        deleteReply(index){
						Swal.fire({
		    			  title: '정말 삭제하시겠습니까???',
		    			  text: "삭제하시면 다시 복구시킬 수 없습니다.",
		    			  imageUrl : '${pageContext.request.contextPath}/image/alert.png',
		    			  imageWidth : 100,
		    			  showCancelButton: true,
		    			  confirmButtonColor: '#3085d6',
		    			  cancelButtonColor: '#d33',
		    			  confirmButtonText: '삭제',	
		    			  cancelButtonText: '취소'
		    			}).then((result) => {
		    			  if (result.value) {
				        	const reply = this.reply[index];
				        	axios({
				        		url:"${pageContext.request.contextPath}/rest/clubboardreply/"+reply.clubBoardReplyDto.replyNo,
				        		method:"delete",
				        	})
				        	.then(resp=>{
				        		if(resp.data==1){
				        			 Swal.fire(
		        			          '삭제가 완료되었습니다.',
		        			          '',
		        			          'success'
		        			        )
				        		}
				        		this.loadReply();
				        	});
		    	              
		    			  }
		    			})
		    		
		    	
// 					const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
// 					if(choice==false)return
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
                			Swal.fire({
             			         title: '좋아요.!',
             			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
         		    			  imageWidth : 100
      	        		  	        			 })
                		
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
                			Swal.fire({
	        			         title: '좋아요 취소!',
	        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
	    		    			  imageWidth : 100
		        		  	        			 })
                		
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
            	//신고 취소하면 리프레쉬
            	cancelReport(){
            		this.clubReportCategory='';
            		this.clubReportContent='';
            	},
                //댓글 신고 사유 미작성시 접수 버튼 비활성화
               	ReplyReportReasonEmpty(){
            		return this.clubReportCategory.length==0 || this.clubReportContent.length==0;		
            	},
                //댓글 신고
                replyReport(){
                	const clubReportType = 2;
                		axios({
                			url:"${pageContext.request.contextPath}/rest/clubboardreply/report/",
                			method:"post",
                			data:{  
                				clubNo:this.replyinformation.clubBoardReplyDto.clubNo,
                   				clubReportTarget:this.replyinformation.clubBoardReplyDto.replyNo,
                   				clubReportType:clubReportType,
                   				clubReportWriter:this.replyinformation.clubBoardReplyDto.clubReplyWriter,
                   				clubReportReporter:this.memberNo,
                   				clubReportCategory:this.clubReportCategory,
                   				clubReportContent:this.clubReportContent,
                			}
                		}).then(resp=>{
                    		this.replyResult = resp.data
                    		if(this.replyResult==1){
     	        		  	   Swal.fire({
  	        			         title: '신고가 완료되었습니다.',
  	        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
  	    		    			  imageWidth : 100
  		        		  	        			 })
                            	this.loadReply()
                    		}else{
                    		}
                    	})
                 },
                	//이미 신고한 회원 
                	AlreadyReported(){
      		  	   Swal.fire({
  			         title: '이미 신고한 게시글이에요.',
  			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
		    			  imageWidth : 100
      		  	        			 })
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
                		url:"${pageContext.request.contextPath}/rest/clubboard/side/"+this.board.clubBoardDto.clubNo+"/order/"+this.orderType+"/"+this.memberNo,
		        		method:"get",
                	}).then(resp=>{
                		this.side = resp.data
                	})
                },
                //select로 인기게시글 변경
                changeList(event) {
                	axios({
                		url:"${pageContext.request.contextPath}/rest/clubboard/side/"+this.board.clubBoardDto.clubNo+"/order/"+event.target.value+"/"+this.memberNo,
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
    	        convertTime(time){
		        	return moment(time).format('llll'); // 2022년 7월 4일 월요일 오후 9:46
 
		        },
                //소모임 멤버 확인
            	clubMemberCheck(){
            		axios({
            			url:"${pageContext.request.contextPath}/rest/clubboard/member/"+this.board.clubBoardDto.clubNo+"/"+this.memberNo,
            			method:"get",
            		}).then(resp=>{
            			this.clubMember=resp.data
            		})
            	},
            	//댓글 리프레쉬
            	refresh(){
                	if(this.totalReply<6){
                		this.appendReply();
                	}else if(this.totalReply>=6){
                		this.showReply=5;
                	}
            	},
            	//메세지가 비어있으면 전송버튼 비활성화
            	messageIsEmpty(){
            		return this.messageContent.length==0 || this.messageTitle.length==0;
            	},
            	//메세지 취소하면 리프레쉬
            	cancelMessage(){
            		this.messageContent='';
            		this.messageTitle='';
            	},
            	//메세지 보내기
            	sendMessage(){
 					const messageReceiver = this.board.memberDto.memberNo
 					if(this.messageContent=='' ||this.messageContent==null)return
 					axios({
 						url:"${pageContext.request.contextPath}/rest/message/send",
 						method:"post",
 						data:{
 							messageWriter:this.memberNo,
 							messageContent:this.messageContent,
 							messageTitle:this.messageTitle,
 							messageReceiver:messageReceiver
 						},
 					}).then(resp=>{
 						this.sendMessageResult=resp.data;
 						if(this.sendMessageResult==1){
 							this.messageContent=""
 							this.messageTitle=""
 		        		  	   Swal.fire({
 		        			         title: '메시지 전송을 완료했어요!',
 		        			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
 		    		    			  imageWidth : 100
 			        		  	        			 })
 						}else{
 		        			 Swal.fire(
 		        			          '오류가 발생했습니다. 다시 시도해 주세요.',
 		        			          '',
 		        			          'error'
 		        			        )
 						}
 					})
 					
 				},
                //댓글 프로필에서 차단
 				replyBlocked(){
 					Swal.fire({
		    			  title: '정말 차단하시겠습니까???',
		    			  text: "차단한 상대의 게시물은 보이지 않습니다.",
		    			  imageUrl : '${pageContext.request.contextPath}/image/sad.png',
		    			  imageWidth : 100,
		    			  showCancelButton: true,
		    			  confirmButtonColor: '#3085d6',
		    			  cancelButtonColor: '#d33',
		    			  confirmButtonText: '차단',	
		    			  cancelButtonText: '취소'
		    			}).then((result) => {
		    			  if (result.value) {
		 					const blockedTarget = this.replyinformation.clubBoardReplyDto.clubReplyWriter;
							console.log(blockedTarget)
		 					axios({
		 						url:"${pageContext.request.contextPath}/rest/mypage/block",
		 						method:"post",
		 						data:{
		 							blockedTarget:blockedTarget,
		 							blockedUser:this.memberNo,
		 						}
		 					}).then(resp=>{
		 						this.blockedResult=resp.data
		 						if(this.blockedResult ==1){
		 							Swal.fire({
			        			         title: '차단되었습니다. 차단해제는 마이페이지에서 가능합니다!',
			        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
			    		    			  imageWidth : 100
				        		  	        			 })
		 						}
		 			            	this.loadReply(); //댓글 목록
		 					})
 					
		    			  }
		    		})
 				
 				},
 				//댓글 프로필에서 메세지 보내기
            	replySendMessage(){
 					const messageReceiver = this.replyinformation.clubBoardReplyDto.clubReplyWriter;
 					if(this.messageContent=='' ||this.messageContent==null)return
 					axios({
 						url:"${pageContext.request.contextPath}/rest/message/send",
 						method:"post",
 						data:{
 							messageWriter:this.memberNo,
 							messageContent:this.messageContent,
 							messageTitle:this.messageTitle,
 							messageReceiver:messageReceiver
 						},
 					}).then(resp=>{
 						this.sendMessageResult=resp.data;
 						if(this.sendMessageResult==1){
 							this.messageContent=""
 							this.messageTitle=""
 								Swal.fire({
		        			         title: '메시지 전송을 완료했어요!',
		        			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
		    		    			  imageWidth : 100
			        		  	        			 })
 						}else{
 							Swal.fire(
		        			          '오류가 발생했습니다. 다시 시도해 주세요.',
		        			          '',
		        			          'error'
		        			        )
 						}
 					})
 					
 				},
 				//mbti 리스트
 				mbti(){
 					// mbti
 					axios({
 						url: "${pageContext.request.contextPath}/rest/category_n_address/mbti/"+this.board.clubBoardDto.clubNo,
 						method: "get",
 					}).then((resp) => {
 						this.mbtiList = resp.data;
 					})
 				},
 				
            },
            created(){
            	this.loadContent(); //게시글 상세
            	this.loadReply(); //댓글 목록
            	this.loadClubInfo(); //클럽정보 불러오기
            },
            updated(){
            },
            mounted(){
            },
        });
        app.mount("#app");
    </script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>