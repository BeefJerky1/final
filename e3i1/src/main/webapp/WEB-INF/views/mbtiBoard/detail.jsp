<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<head>
      <!-- Slich Slider -->
      
      <link rel="stylesheet" type="text/css" href="${root}/css/slick.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/slick-theme.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/slick-theme.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/icofont.min.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/materialdesignicons.min.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/mbtiboard.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/sweetalert.css">
      
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
.search-icon {
    position: relative;
    left: 2em;
    top: 1.2em !important;
    color: #9aa0a6;
}
.colorChange {
	color : red !important;
}
a {
	text-decoration: none;
	color: #686666;
	font-size: 12px;
}
.card  !important {
	border-radius: 2em;
}
.button-write {
	margin-right: 0.4rem;
}
.modal-form  {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    margin: 0.3rem 0.1rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 1rem !important;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.replyEdit {
    padding: 0.2em;
    border: none;
    background-color: transparent;
    width: 90%;
    font-size: 12px;
    font-weight: 700;
}
.reply-content {
	 font-size: 15px;
	 font-weight:bold;
}
.interest {
    background-color: #E9E9E9;
}
.like-btn {
	float : right !important;
	margin-right: 0.4rem;
}
.thumbs {
		float: auto;
        text-align: center;
        position: relative;
	    padding:1rem 1rem;
	    margin: 1rem 1rem;
	    margin-top :5rem;
}
 .graph {  
 	height: 30px; background-color: #ccc; border-radius: 40px; width: 400px;
 	
 	}
    .graph span {
      display : block; height: 30px; line-height: 30px; 
      padding: 0 10px;
      text-align: right; background-color: #a7a7c1; border-radius: 40px;
      box-sizing: border-box; color:#fff; animation:stack 3s 1;
      margin-top : 1rem;
    }
    @keyframes stack {
        0% { width: 0; color: rgba(255, 255, 255, 0);}
        40% { color: rgba(255, 255, 255, 1);}
        100% {width: 60%;}
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


   <body class="bg-light">
      <div class="web-none d-flex align-items-center px-3 pt-3">
      
      <!--  반응형 디자인 추가 -->
         <img src="${root}/image/LOGO.png" class="img-fluid logo-mobile">

         <button class="ms-auto btn  ln-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
         <span class="material-icons">menu</span>
         </button>
      </div>
      
      <div class="py-4">
         <div class="container">
            <div class="row position-relative">
            
               <!-- Main Content -->
               <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
                  <div class="main-content"  id="app">
                     <div class="mb-4 d-flex align-items-center">
                        <div class="d-flex align-items-center">
                           <p class="ms-2 mb-0 fw-bold text-body fs-6">MBTI Community  <i class="fa-solid fa-heart fx-2" style="color:#ffa8c9;"></i></p>
                        </div>
                     </div>
                     
                     <!--  글 작성 모달 -->
                       <div class="input-group shadow-sm mb-3 rounded-4 overflow-hidden py-2 bg-white" data-bs-toggle="modal" data-bs-target="#postModal">
                           <span class="input-group-text material-icons border-0 bg-white text-primary" style="color: #514e85 !important;">account_circle</span>
                           <input type="text" class="form-control border-0 fw-light ps-1"  :disabled="isAnonymous" :placeholder="textareaPlaceholder">
                           <a href="#" class="text-decoration-none input-group-text bg-white border-0 material-icons text-primary" style="color: #514e85 !important;">add_circle</a>
                        </div>
                     
                    <!--  정렬 버튼 구간 -->
             	 <ul class=" top-osahan-nav-tab nav nav-pills justify-content-center nav-justified mb-4 shadow-sm rounded-4 overflow-hidden bg-white mt-4" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                           <a href="list"><button class="p-3 nav-link  active nav-area" id="pills-feed-tab" data-bs-toggle="pill" data-bs-target="#pills-feed" type="button" role="tab" aria-controls="pills-feed" aria-selected="true">new!</button></a>
                        </li>
                        <li class="nav-item" role="presentation">
                           <a href="list3"><button class="p-3 nav-link nav-area" id="pills-people-tab" data-bs-toggle="pill" data-bs-target="#pills-people" type="button" role="tab" aria-controls="pills-people" aria-selected="false">좋아요순</button></a>
                        </li>
                        <li class="nav-item" role="presentation">
                          <a href="list2"> <button class="p-3 nav-link nav-area" id="pills-mentions-tab" data-bs-toggle="pill" data-bs-target="#pills-mentions" type="button" role="tab" aria-controls="pills-mentions" aria-selected="false">댓글순</button></a>
                        </li>
                     </ul>
                     
   					<!-- 게시글 영역 -->
   					<div class="bg-white rounded-4 shadow-sm profile mb-2"  id="mbti-board">
                        <div class="d-flex align-items-center px-3 pt-3" >
                       		<div class="bg-white p-3 feed-item rounded-4 mb-3 shadow-sm">
                                    <div class="d-flex">
	                                        <span v-if="${mbtiMemberListVO.memberProfileDto.attachNo==null}">
		                     				   <img src="${root}/image/mbti/강아지(ENFP).png" class="img-fluid rounded-circle" alt="profile-img" >
											</span>
											<span v-if="${mbtiMemberListVO.memberProfileDto.attachNo!=null}">
	                           					<img :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+${mbtiMemberListVO.memberProfileDto.attachNo }" class="img-fluid rounded-circle" alt="profile-img">
	                        			  </span> 
                                       <div class="d-flex ms-3 align-items-start w-100">
                                          <div class="w-100">
                                             <div class="d-flex align-items-center justify-content-between">
                                                <div class="text-decoration-none d-flex align-items-center">
                                                   <h5 class="fw-bold mb-0 text-body">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTitle }</h5>
                                                   <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span>
                                                </div>
                                             </div>
                                             <div class="my-2 mb-4">
                                                	<h6 class="fw-bold text-body mb-4">${mbtiMemberListVO.memberDto.memberAnimal }</h6>
                                             	<div v-if="${mbtiMemberListVO.mbtiBoardDto.mbtiReportCount} > 2">
                                                	<h6 class="fw-bold text-dark mb-4" style="color:  #d64444 !important; ">신고가 접수된 블라인드 게시글입니다.  <br>불편을 끼쳐드려 죄송합니다.</h6>
                                                </div>
                                                <div v-else>
                                                	<h6 class="fw-bold text-dark mb-4">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardContent }</h6>
                                                </div>
                                                	
						               <!-- 추천 / 반대  -->
												<div class="thumbs mt-5" >
													<i class="fa-solid fa-thumbs-up fa-3x" style="color:#a7a7c1;" @click="addVote1"></i>&ensp; &ensp; 
													<i class="fa-solid fa-thumbs-down fa-3x" style="color:#dbdbdb;" @click="addVote2"></i>
												    	<div class="graph mt-3 mb-2" >
													      <span style="width: {{isVotePercent}}%;">{{isVotePercent}}%</span>
													    </div>
												</div>
                                                	
                                                	
													<span class="fw-bold interest me-1 mb-4 mt-2">${mbtiMemberListVO.memberDto.memberInterest1 } </span> <span class="fw-bold interest me-1 mb-2 mt-2">${mbtiMemberListVO.memberDto.memberInterest2}</span>
													<span class="fw-bold interest me-1 mb-4 mt-2">${mbtiMemberListVO.memberDto.memberInterest3 }</span>
                                                
                                                <!--  좋아요 / 댓글 아이콘 -->
                                                
                                                <div class="d-flex align-items-center justify-content-between mb-2 mt-3">
                                                   <div>
                                                   <!-- 좋아요 -->
                                                     	<div @click="likeUpdate" >
															<i class="fa-regular fa-heart fa-2x" id="likeBtn" style="color:#f96666;" v-if="!itLike"></i>
															<i class="fa-solid fa-heart fa-2x" id="likeBtn"  style="color:#f96666; " v-if="itLike"></i>
															&nbsp;<span class="fw-bold"> {{likeCount}}</span>
														</div>
                                                   </div>
                                                   <!-- 댓글 -->
                                                   <div>
                                                      <i class="fa-solid fa-message fa-2x" style="color:#f3dba5;"></i>&nbsp;
                                                      <span class="fw-bold" style="font-size : 14px;">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardReplyCount}</span>
                                                   </div>
                                                   
                                                   <c:if test="${isOwner || isAdmin}">
                                                   <!-- 수정 -->
                                                   <div>
                                                      <i class="fa-solid fa-pen-to-square fa-2x" data-bs-toggle="modal" data-bs-target="#exampleModal" ></i>
						
                                                   </div>
                                                   <!-- 삭제 -->
                                                   <div>
                                                   <a href="delete?mbtiBoardNo=${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo}"><i class="fa-solid fa-trash-can fa-2x" ></i></a>
                                                   </div>
                                                   </c:if>
                                                   
                                                   <!--  신고 -->
                                                   
				                                    <div v-if="isBoardWriter">
														<!-- 게시글 작성자는 신고 버튼 안보임 -->
													</div>
                                                   <div v-else-if="!isAlreadyReported">
                                                   <!-- 신고 안 한 사람 -->
                                 						 <i class="fa-solid fa-lightbulb fa-2x" data-bs-toggle="modal" data-bs-target="#reportBoard" style="color : #d64444 !important"></i>
                                                   </div>
	                                                   
												<div v-else-if="isAlreadyReported">
													<!-- 이미 신고한 사람 -->
													<i class="fa-solid fa-lightbulb fa-2x"  :disabled="isAlreadyReported" style="color : #d64444 !important"></i>
												</div>
	                                                   
                                                   
			<div class="modal fade" id="reportBoard" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">게시물 신고</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close" v-on:click="cancelReport()"></button>
								</div>
								<div class="modal-body">
									<div class="mt-3">
										<label class="label-control"><b>신고 분류</b></label> <select
											class="form-select" v-model="mbtiReportCategory">
											<option value="영리목적/홍보">영리목적/홍보</option>
											<option value="불법정보">불법정보</option>
											<option value="욕실/인신공격">욕실/인신공격</option>
											<option value="개인정보노출">개인정보노출</option>
											<option value="음란성/선정성">음란성/선정성</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<div class="mt-3">
										<label><b>신고 상세 내역</b></label>
										<textarea class="form-control" v-model="mbtiReportContent"></textarea>
									</div>
									<div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
			                     <span class="leg">
			                    	<span class="text-muted count2" >{{mbtiReportContent.length}}</span> 
			                    	/
			                    	<span class="text-muted total">300</span> 
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
                                                <div class="d-flex align-items-center mb-3">
                                                   <input type="text"  v-model="mbtiReplyContent" class="form-control form-control-sm rounded-3 fw-light" 
                                                   style="width : 100% !important;" :disabled="isAnonymous" :placeholder="textareaPlaceholder" 
                                                  >&nbsp;
                                                	<i class="fa-solid fa-circle-chevron-right fa-2x" @click="addReply"></i>
                                                </div>
                                 
                                                <!-- 댓글 내용 출력 -->
                                                
                                                <span style="font-weight:bold; color:#3E4684;"><h6>${mbtiMemberListVO.mbtiBoardDto.mbtiBoardReplyCount}개의 댓글</h6></span>

					
                                                <div class="comments " v-for="(reply, index) in mbtiBoardReplyList" v-bind:key="index">
                                                   <div class="d-flex mb-2" v-if="!reply.edit">
                                                   
				                           <span v-if="reply.memberProfileDto.attachNo== null">
				                        <img src="${root}/image/mbti/강아지(ENFP).png" class="img-fluid rounded-circle" style="width: 60px;">
										</span>
										<span v-if="reply.memberProfileDto.attachNo != null">
				                          	<img :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+reply.memberProfileDto.attachNo"  style="width: 60px;"class="img-fluid rounded-circle" >
				                         </span> 
                                                   
                                                      <div class="ms-2 small">
                                                            <div class="bg-light px-3 py-2 rounded-4 mb-1 chat-text">
                                                               <span class="fw-bold mb-0">@{{reply.memberDto.memberAnimal}}</span><br>
                                                               <span class="text-muted">{{reply.mbtiBoardReplyDto.mbtiReplyContent}}</span><br>
                                                               <span class="text-muted">{{elapsedText(reply.mbtiBoardReplyDto.mbtiReplyTime)}}</span>
                                                         
                                                         <div v-if="isEditAndDeleteAvailable(reply.mbtiBoardReplyDto.memberNo)" class="d-flex align-items-right ms-2" style="float:right;">
                                                         	<span class="me-2"><i  v-if="!isAdmin" class="fa-solid fa-pen-to-square" @click="changeEditMode(index);"></i></span>
															<span class="me-2"><i class="fa-solid fa-trash-can" @click="deleteReply(index);"></i></span>
                                                         </div>
                                                         
                                                         </div>
                                                      </div>
                                                   </div>
                                                   
                                                   <!-- 댓글 수정 -->
                                                   <div class="d-flex mb-2" v-else>
	                                                   	<span v-if="reply.memberProfileDto.attachNo== null">
								                        <img src="${root}/image/mbti/강아지(ENFP).png" class="img-fluid rounded-circle" style="width: 60px;">
														</span>
														<span v-if="reply.memberProfileDto.attachNo != null">
								                          	<img :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+reply.memberProfileDto.attachNo"  style="width: 60px;"class="img-fluid rounded-circle" >
								                         </span>                                                   
                                                      <div class="ms-2 small">
                                                            <div class="bg-light px-3 py-2 rounded-4 mb-1 chat-text">
                                                               <input type="text" class="replyEdit text-muted"  v-model="mbtiBoardReplyList[index].mbtiBoardReplyDto.mbtiReplyContent">
																<i class="fa-solid fa-circle-check fa-2x" @click="editReply(index);"  :disabled="isAnonymous" style="color:#f3dba5;"></i>
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
                     <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-feed" role="tabpanel" aria-labelledby="pills-feed-tab">
                           <!-- Follow People -->
                           <div class="ms-1">
                              <!-- Feeds -->
                              <div class="feeds">

                
                              </div>
                           </div>
                        </div>
           
                     </div>
                  </div>
                  </div>
               </main>
               <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
                  <div class="p-2 bg-light offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample">
                     <div class="sidebar-nav mb-3">
                        <div class="pb-4">
                           <a href="${root}/" class="text-decoration-none">
                           <img src="${root}/image/LOGO.png" class="img-fluid logo" alt="brand-logo">
                           </a>
                        </div>
                        <ul class="navbar-nav justify-content-end flex-grow-1">
  
                           <li class="nav-item">
                              <a href="profile.html" class="nav-link active"><span class="material-icons me-3">house</span> <span>Feed</span></a>
                           </li>
                           
                        </ul>
                     </div>
                  </div>
                  <!-- Sidebar -->
                  <div class="ps-0 m-none fix-sidebar">
                     <div class="sidebar-nav mb-3">
                        <div class="pb-4 mb-4">
                           <a href="${root}/" class="text-decoration-none">
                           <img src="${root}/image/LOGO.png" class="img-fluid logo" alt="brand-logo">
                           </a>
                        </div>
                        <ul class="navbar-nav justify-content-end flex-grow-1">

                           <li class="nav-item">
                              <a href="${root}/mbtiBoard/list" class="nav-link active" style="color: #514e85 !important;"><span class="material-icons me-3">house</span> <span>MBTI Home</span></a>
                           </li>

                           
							<form action="list" method="get">
                           	<li class="nav-item input-group mb-4 shadow-sm rounded-4 overflow-hidden py-2 bg-white">
                              <span class="input-group-text material-icons border-0 bg-white text-primary "  style="color:#f3dba5 !important; ">search</span>
                              <input type="text" name="keyword" class="form-control border-0 fw-light ps-1" placeholder="제목 또는 내용 검색">
                           </li>
							</form>
                        </ul>
                        
                        <!--  MBTI 활동 순위 보여주기 -->
                        
                          <div class="bg-white rounded-4 overflow-hidden shadow-sm account-follow mb-4">
                              <h6 class="fw-bold text-body p-3 mb-0 border-bottom">지금 가장 활발히 활동 중!</h6>
                              <!-- Account Item -->
                              <a href="profile.html" class="p-3 border-bottom d-flex text-dark text-decoration-none account-item">
                                 <img src="${root}/image/mbti/고양이(INTP).png" class="img-fluid rounded-circle me-3" alt="profile-img">
                                 <div>
                                    <p class="fw-bold mb-0 pe-3 d-flex align-items-center">새침한 고양이 <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span></p>
                                    <div class="text-muted fw-light">
                                       <p class="mb-1 mbti-rank" >INTP</p>
                                    </div>
                                 </div>
                                 <div class="ms-auto">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                       <input type="checkbox" class="btn-check" id="btncheck7">
                                    </div>
                                 </div>
                              </a>
                              <!-- Account Item -->
                              <a href="profile.html" class="p-3 border-bottom d-flex text-dark text-decoration-none account-item">
                                 <img src="${root}/image/mbti/돌고래(ENFJ).png" class="img-fluid rounded-circle me-3" alt="profile-img">
                                 <div>
                                    <p class="fw-bold mb-0 pe-3 d-flex align-items-center">사교적인 돌고래 <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span></p>
                                    <div class="text-muted fw-light">
                                       <p class="mb-1 mbti-rank"  >ENFJ</p>
                                    </div>
                                 </div>
                                 <div class="ms-auto">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                       <input type="checkbox" class="btn-check" id="btncheck8">
                                    </div>
                                 </div>
                              </a>
                              <!-- Account Item -->
                              <a href="profile.html" class="p-3 d-flex text-dark text-decoration-none account-item">
                                 <img src="${root}/image/mbti/호랑이(INTJ).png" class="img-fluid rounded-circle me-3" alt="profile-img">
                                 <div>
                                    <p class="fw-bold mb-0 pe-3 d-flex align-items-center">전략가 호랑이<span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span></p>
                                    <div class="text-muted fw-light">
                                       <p class="mb-1 mbti-rank" >INTJ</p>
                                    </div>
                                 </div>
                                 <div class="ms-auto">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                       <input type="checkbox" class="btn-check" id="btncheck9">
                                    </div>
                                 </div>
                              </a>
                           </div>
                     </div>
                  </div>
               </aside>
               <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
                  <div class="fix-sidebar">
                     <div class="side-trend lg-none">
                     
                        <!--검색 버튼 구간-->
                        <div class="sticky-sidebar2 mb-3">

                           
                           <div class="bg-white rounded-4 overflow-hidden shadow-sm mb-4">
                              <h5 class="fw-bold text-body p-3 mb-0 border-bottom">MBTI별 궁합은 어떨까?</h5>
                              <!-- Trending Item -->
                              <a href="tags.html" class="p-3 border-bottom d-flex align-items-center text-dark text-decoration-none">
                                 <div class="center-block">
                                    <h6 class="center-block fw-bold ml-4 mb-3 pe-3" style="text-align:center; font-size:16px;">연애 궁합 BEST 3 <i class="fa-solid fa-cloud" style="color:#d6f5ff;"></i></h6>
                                 <img src="${root}/image/couple.png" width="200px;" class="img-fluid rounded-4 center-block m-4 " alt="couple">
                                 </div>
                              </a>
                              <!-- Trending Item -->
                                 <div>
                                    <div class="text-muted fw-light d-flex align-items-center">
                                    <p class="fw-bold m-3 mt-4 mb-0 pe-3 interest">#찰떡궁합 #아마도 환상의 짝꿍</p>
                                    </div>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">
                                    	1위. ENFP <i class="fa-solid fa-heart" style="color:#ffa8c9;"></i> INTJ (서로에게 필요한 존재) </small><br/>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">	
                                    	2위. ISTP <i class="fa-solid fa-heart" style="color:#ffa8c9;"></i> ESFJ (혼자만의 시간은 꼭 필요)</small><br/>
                                    	<small class="fw-bold m-3  mb-2 pe-3 text-dark" style="color:black !important;">
                                    	3위. ENFJ <i class="fa-solid fa-heart" style="color:#ffa8c9;"></i> INFP (충분한 감정 교류 가능!)
                                    </small>
                                 </div>
                                
                                
                                <div class="bg-white rounded-4 overflow-hidden shadow-sm mb-4">
                              <h5 class="fw-bold text-body p-3 mb-0 border-bottom"></h5>
                              <a href="tags.html" class="p-3 border-bottom d-flex align-items-center text-dark text-decoration-none">
                                 <div class="center-block">
                                    <h6 class="center-block fw-bold mb-3 pe-3" style="text-align:center; font-size:16px;">우정 궁합 BEST 3 <i class="fa-solid fa-umbrella-beach" style="color:#00ce7c;"></i></h6>
                                 <img src="${root}/image/friend.png" width="200px;" class="m-4 img-fluid rounded-4 center-block " alt="couple">
                                 </div>
                              </a>
                              
                                <div class="mb-4">
                                    <div class="text-muted fw-light d-flex align-items-center">
                                    <p class="fw-bold m-3 mt-4 mb-0 pe-3 interest">#깐부 #우리 우정 영원히</p>
                                    </div>
                                    <div>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">
                                    	1위. ESTJ <i class="fa-solid fa-plus" style="color:#ffa8c9;"></i> INTP (쿨하고 의리있다!) </small><br/>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">	
                                    	2위. INTJ <i class="fa-solid fa-plus" style="color:#ffa8c9;"></i> ENTP (분명 취미가 비슷할듯)</small><br/>
                                    	<small class="fw-bold m-3  mb-2 pe-3 text-dark" style="color:black !important;">
                                    	3위. INTP <i class="fa-solid fa-plus" style="color:#ffa8c9;"></i> ENFJ (반대가 끌리는 이유...)
                                    </small><BR>
                                    </div>
                                 </div>
                                 

						           </div>
						   </div>
                        </div>
                     </div>
                  </div>
               </aside>
            </div>
         </div>
      </div>
      


     
      <!-- 글 작성 모달 -->
     	<form action="write" method="post">
      <div class="modal fade" id="postModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 p-4 border-0 bg-light">
               <div class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
                  <a href="#" class="text-muted text-decoration-none material-icons" data-bs-dismiss="modal">arrow_back_ios_new</a>
                  <h5 class="modal-title text-muted ms-3 ln-0" id="staticBackdropLabel"><span class="material-icons md-32">account_circle</span></h5>
               </div>
               
               <!-- 제목 작성 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <input type="text" class="form-control rounded-5 border-0 shadow-sm" name="mbtiBoardTitle" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 50px">
                   <label for="floatingTextarea2" class="h6 text-muted mb-0">제목을 작성하세요.</label>
                </div>
             </div>
             	<!-- 내용 작성 -->
               <div class="modal-body p-0 mb-3">
                  <div class="form-floating">
                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" name="mbtiBoardContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
                  </div>
               </div>

               <div class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
                  <div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >0</span> 
                    	/
                    	<span class="text-muted total">100</span> 
                     </span>
                  </div>
                  <div class="ms-auto m-0">
                  	<button type="submit" class="writeButton btn btn-primary fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center" style="border-radius : 1em; background-color: #514e85; border:none; font-size: 14px !important;">작성!</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
     </form>

		 <!-- 게시글 수정 Modal -->
					<form action="edit" method="post">
					<input type="hidden" name="mbtiBoardNo" value="${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo }">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">게시글 수정하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="row">
											<input type="text" name="mbtiBoardTitle" class="modal-form"
												placeholder="제목">
											<textarea name="mbtiBoardContent" class="modal-form" rows="4"></textarea>

										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-edit"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-outline-success">수정</button>
									</div>
								</div>
							</div>
						</div>
					</form>


</body>




					

    <script src="${root}/js/time.js"></script>
<!-- 
	배포용 cdn (개발자 도구에서 vue가 안 보임)
	<script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script>
 -->
 
<script>
	const app = Vue.createApp({
		
		data(){
			return {
				// 게시글 번호
				mbtiBoardNo:${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo },
				memberNo:"${login}",
		        memberAdmin:"${auth}",
		        
		        // 신고에 필요한 정보
		        mbtiReportWriter: ${mbtiMemberListVO.mbtiBoardDto.memberNo },
				mbtiReportCategory: "", // 신고 분류
				mbtiReportContent: "", //신고 내역
		        
                //게시글 신고
                clubReportCategory:"",//신고분류
                clubReportContent:"",//신고내역
                isAlready:"", // 신고내역 저장
                mbtiReportList: {
                	mbtiBoardReportDto: {},
                }, // 신고내역 불러오기
                mbtiReportReporter: "",
                
				// 댓글 입력 정보
				mbtiReplyContent:"",
				
				// 댓글 목록
				mbtiBoardReplyList:[],
				
				// 좋아요 기능에 필요한 데이터
				itLike : false,
				likeCount : "",
				
				// 투표 공감 카운팅
				voteCount : "",
				// 투표 전체 개수 카운팅
				voteTotalCount : "",
				
                
			};
		},
		computed:{
	        isAnonymous(){
	        	return this.memberNo == "";
	        },
	        isMember(){
	        	return this.memberNo != "" && this.memberAdmin != "";
	        },
	        isAdmin(){
	        	return this.isMember && this.memberGrade == "관리자";
	        },
	        boardContentIsEmpty(){
	        	return this.mbtiReplyContent.length == 0;
	        },
	        
			isVotePercent () {
				var num = this.voteCount * 100.0 / this.voteTotalCount;
				if (isNaN(num)) { // 값이 없어서 NaN값이 나올 경우
					 num = 0;
					}
				return num.toFixed(0);
			},
			
	        textareaPlaceholder(){
	        	return this.isAnonymous ? "로그인 후 작성할 수 있습니다" : "새롭게 작성해 보세요!";
	        },
	        
		        //게시글 작성자 == 세션 멤버 일때 신고 불가
		        isBoardWriter(){
		        	return this.memberNo== ${mbtiMemberListVO.mbtiBoardDto.memberNo };
		        },
				
 		        //게시글 이미 신고한 자라면 신고불가
 		        isAlreadyReported(){
		        	//console.log("신고:", this.mbtiReportList.mbtiReportReporter); 	
		        	return this.memberNo == this.mbtiReportList.mbtiReportReporter;
 		        },
 		        
		},
		methods:{
			// 투표 *공감 
			addVote1(){
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardVote/",
	        		method:"post",
	        		data:{
	        			mbtiBoardNo:this.mbtiBoardNo,
	        			memberNo:this.memberNo,
	        			voteChoice : 1, 
	        		},
	        	})
	        	.then(resp=>{
	        		console.log(resp);
					if(resp.data.voteChoice == null) {
	        		//완성 시 코드
	        		  	   Swal.fire({
	        			         title: '공감해요!',
	        			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
	    		    			  imageWidth : 100
		        		  	        			 })
					}
					else {
 	        			 Swal.fire(
	        			          '투표가 취소 되었어요.',
	        			          '',
	        			          'success'
	        			        )
					}
	        		
	        		this.loadVote();
	        		this.loadVoteTotal();
	        		
	        	});
	        },
	        // 투표 *반대
			addVote2(){
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardVote/",
	        		method:"post",
	        		data:{
	        			mbtiBoardNo:this.mbtiBoardNo,
	        			memberNo:this.memberNo,
	        			voteChoice : 0, 
	        		},
	        	})
	        	.then(resp=>{
					if(resp.data.voteChoice == null) {
		        		//완성 시 코드
		        		  	   Swal.fire({
	        			         title: '공감하지 않아요.',
	        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
	    		    			  imageWidth : 100
		        		  	        			 })
						}
						else {
	 	        			 Swal.fire(
		        			          '투표가 취소 되었어요.',
		        			          '',
		        			          'success'
		        			        )
						}
	        		this.loadVote();
	        		this.loadVoteTotal();
	        		
	        	});
	        },
	        
	        // 투표 *공감* 카운팅
			  loadVote(){
                
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardVote/"+this.mbtiBoardNo,
	        		method:"get",
	        	})
	        	.then(resp=>{
	        		this.voteCount = resp.data;
	        		
	        	});
		},
		 // 투표 *전체 개수* 카운팅
			  loadVoteTotal(){
                
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardVote/total/"+this.mbtiBoardNo,
	        		method:"get",
	        	})
	        	.then(resp=>{
	        		this.voteTotalCount = resp.data;
	        		
	        	});
		},
		
		// 좋아요 개수 카운팅
		loadLikeCount() {
			axios({
        		url:"${pageContext.request.contextPath}/rest/mbtiBoardLike/"+this.mbtiBoardNo,
        		method:"get",
        	})
        	.then(resp=>{
        		this.likeCount = resp.data;
        	});
	
		},
		
			// 좋아요 
 			likeUpdate(){
				axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardLike/likeUpdate",
	        		method:"put",
	        		data:{
	        			memberNo:this.memberNo,
	        			mbtiBoardNo:this.mbtiBoardNo,
	        		},
	        	})
	        	.then(resp=>{
	        		console.log(resp);
	        		//완성 시 코드
	        		if(resp.data.itLike == 1) {
	        		  	   Swal.fire({
	        			         title: '좋아요를 취소했어요.',
	        			          imageUrl : '${pageContext.request.contextPath}/image/sad.png',
	    		    			  imageWidth : 100
		        		  	        			 })
	        		this.itLike = false;
	        		this.loadLikeCount();
	        		}
	        		else if(resp.data.itLike == 0 || resp.data.itLike == null) {
	        		  	   Swal.fire({
	        			         title: '좋아요',
	        			          imageUrl : '${pageContext.request.contextPath}/image/smile.png',
	    		    			  imageWidth : 100
		        		  	        			 })
	        		this.itLike = true;
	        		this.loadLikeCount();
	        		}
	        	}); 
			}, 
			
			// 댓글 추가
			addReply(){
				
	        	//미입력 시 차단
	        	if(this.boardContentIsEmpty) return;
	        	
	        	
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/",
	        		method:"post",
	        		data:{
	        			mbtiBoardNo:this.mbtiBoardNo,
	        			mbtiReplyContent:this.mbtiReplyContent
	        		},
	        	})
	        	.then(resp=>{
	        		
	        		//완성 시 코드
	        			 	        			 Swal.fire(
		        			          '댓글 등록 완료!',
		        			          '',
		        			          'success'
		        			        )
	        		this.mbtiBoardReplyContent = "";
	        		this.loadReply();
	        	});
	        },
	        
	        // 댓글 불러오기
			  loadReply(){
                
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/"+this.mbtiBoardNo,
		        		method:"get",
		        	})
		        	.then(resp=>{
		        		this.mbtiBoardReplyList = resp.data;
		        	});
			},
			
			isEditAndDeleteAvailable(memberNo){
	        	//1.관리자면 통과
	        	if(this.isAdmin) return true;
	        	
	        	//2. 현재사용자가 작성자라면 통과
	        	if(this.memberNo == memberNo) return true;
	        	
	        	//나머지 다 차단
	        	return false;
	        },
			// 댓글 삭제
			  deleteReply(index){
	        	const choice = window.confirm("정말 삭제하시겠습니까?");
	        	if(!choice) return;
	        	
	        	const reply = this.mbtiBoardReplyList[index];
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/"+reply.mbtiBoardReplyDto.replyNo,
	        		method:"delete",
	        	})
	        	.then(resp=>{
	        		this.loadReply();
	        	});
	        },
	        
            elapsedText(date) {
            	return dateformat.elapsedText(new Date(date));
            },
            
	        changeEditMode(index){
	        	this.mbtiBoardReplyList[index].edit = true;
	        },
	        changeDisplayMode(index){
	        	this.mbtiBoardReplyList[index].edit = false;	
	        },
	        
	        // 댓글 수정
	        editReply(index){
	        	const reply = this.mbtiBoardReplyList[index];
	        	if(reply.mbtiBoardReplyDto.mbtiReplyContent.length == 0) return;
	        	
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/",
	        		method:"put",
	        		data:{
	        			replyNo:reply.mbtiBoardReplyDto.replyNo,
	        			mbtiReplyContent:reply.mbtiBoardReplyDto.mbtiReplyContent
	        		},
	        	})
	        	.then(resp=>{
        			 Swal.fire(
       			          '댓글 수정 완료!',
       			          '',
       			          'success'
       			        )
	        		this.loadReply();
	        	});
	        },
	        
        	//게시글 신고 사유 미작성시 접수 버튼 비활성화
        	BoardReportReasonEmpty(){
        		return this.mbtiReportCategory.length==0 || this.mbtiReportContent.length==0;		
        	},
        	
        	// 게시글 신고 내역 불러오기
			  loadReport(){
                
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiReport/"+this.mbtiBoardNo,
	        		method:"get",
	        	})
	        	.then(resp=>{
	        		this.mbtiReportList = resp.data;
	        	});
		},
		
        	//게시글 신고
            boardReport(){
            	axios({
            		url:"${pageContext.request.contextPath}/rest/mbtiReport/report",
            		method:"post",
           			data:{
           				mbtiBoardNo:this.mbtiBoardNo,
           				mbtiReportTarget: this.mbtiBoardNo,
           				mbtiReportWriter:this.mbtiReportWriter, 
           				mbtiReportReporter:this.memberNo,
           				clubReportCategory:this.clubReportCategory,
           				clubReportContent:this.clubReportContent,
           			},
            	}).then(resp=>{
            		this.boardResult = resp.data
            		if(this.boardResult==1){
	        			 Swal.fire(
	        			          '신고가 완료되었습니다.',
	        			          '',
	        			          'success'
	        			        )
            			this.cancelReport();
            		}else{
	        			 Swal.fire(
	        			          '오류가 발생했습니다. 다시 시도해 주세요.',
	        			          '',
	        			          'error'
	        			        )
            			this.cancelReport();
            		}
            	})
	        },
	        
        	//신고 취소하면 리프레쉬
        	cancelReport(){
        		this.clubReportCategory='';
        		this.clubReportContent='';
        	},
        	
        	
        	
        	
		
		},
		    
		created(){
			this.loadReply();	
			this.loadVote();
			this.loadVoteTotal();
			this.loadLikeCount();
			this.loadReport();
		},
	});
	app.mount("#app");
	</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@next"></script>
<script src="${root}/js/time.js"></script>
<script src="${root}/js/mbtiboard.js"></script>
<script src="${root}/js/slick.min.js"></script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
