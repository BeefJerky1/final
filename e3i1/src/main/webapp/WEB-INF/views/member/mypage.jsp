<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css">
<style>
.modal.fade {
	opacity:0;
	z-index:-2;
}
.point2 {
	font-size: 3em;
	font-weight: 900;
	color: #3E4684;
}
.tagtitle {
	font-weight: 900;
	font-size: 1.0em;
}

.tagtext {
	font-weight: 900;
	font-size: 0.85em;
}

.card {
	border-width: 0.3em;
}

.card:hover {
	border-color: #3E4684;
	border-width: 0.3em;
}

.maincolor {
	color: #3E4684;
	font-weight: 900;
	font-size: 1.0em;
}

.profile {
	border: 2.5px solid #3E4684;
	/* 	border: 4px solid #E9E9E9; */
	border-radius: 30px;
	padding: 2%;
	width: 100%;
	height: 450px;
	box-shadow: rgb(0 0 0/ 1%) 0px 19px 38px, rgb(0 0 0/ 22%) 0px 15px 12px;
}

.profileNick {
	font-size: 1.0em;
	font-weight: 900;
}

.profileMbti {
	background-color: #3E4684;
	color: white;
	border-radius: 5px;
	font-size: 0.7em;
	font-weight: 300;
}

.profileInterest {
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 13px;
	font-size: 0.8em;
	font-weight: 600;
}

.tableInterest {
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 5px;
	padding: 0.1em;
	font-size: 0.8em;
	font-weight: 600;
	width: 30px;
}

.tableInterest2 {
	color: #3E4684;
	font-size: 0.em;
	font-weight: 600;
	width: 30px;
}

.tabletitle{
	font-size: 0.9em;
}

.nav-link {
	color: #3E4684;
	font-weight: 900;
}

i {
	color: #3E4684;
}

.boldfont2{
	font-size: 0.8em;
	font-weight: 900;
}

.titlefont {
	font-size: 1.2em;
}

.boldfont {
	font-weight: 900;
}

.pluscount {
	width: 40px;
	height: 40px;
	margin-bottom: 5px;
}
.smalllabel{
	font-size: 0.8em;
}
.checked{
	border-color: #3E4684;
	border-width: 0.25em;
}
input[type="radio"]{
	display:none;
}
.img{
	position:absolute;
	cursor: pointer;
}

</style>
</head>
<body>
	<div id="app" class="container-fluid" style="width: 91%;">
		<div class="container-fluid">
			<div>
				<div class="row text-center">
					<img src="${root }/image/mypage.png"
						style="width: 1700px; height: 240px;" />
				</div>

				<div class="row mt-4">
					<div class="col-md-3">
					
						<div class="col-md-3 profile">
							<div class="profileimg text-center mt-3 mb-2">
								<i class="fa-solid fa-xmark img" style="color:red;" @click="deleteProfile"></i>
								<img src="${root }/image/mbti/거북이(ISTP).png" style="border-radius: 50%; width: 140px; height: 140px;" v-if="memberList.memberProfileDto == null" />
								<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+memberList.memberProfileDto.attachNo" style="border-radius: 50%; width: 140px; height: 140px;" v-if="memberList.memberProfileDto != null"/>
								<label for="img" class="img">
									<i class="fa-solid fa-image"></i>
								</label>
								<input type="file" id="img" accept="image/*" ref="memberProfile" @change="changeProfile()" style="display:none;"> 
							</div>
							<div class="ml-5 text-center mb-3">
								<span class="profileNick"><i class="fa-solid fa-user"></i>&nbsp;${memberDto.memberNick}</span>
								<span class="profileMbti" style="margin-left: 0.5em;">${memberDto.memberAnimal}</span>
							</div>
							<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest1}</div>
							<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest2}</div>
							<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest3}</div>
							<div class="text-center profileInterest my-1 mx-5">\#${memberDto.memberMbti}</div>

							<div class="row text-center">
								<a href="#">
									<button class="btn btn-outline-success m-1 mt-3" type="button" @click="removeHidden">관심분야 변경하기</button>
								</a>
							</div>
							<div class="row text-center">
								<a href="#">
									<button class="btn btn-outline-success m-1 " type="button" @click="removeHidden1">MBTI검사 다시하기</button>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<ul class="nav nav-tabs tabtitle">
							<li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#club">내 소모임</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#mbti-board">MBTI 게시판</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#buy">회원 증가권 구매</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#blocked">차단된 사용자</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#info">개인정보 수정</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#pw">비밀번호 변경</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#exit">회원탈퇴</a></li>
						</ul>
						
						<div class="tab-content">
							<div class="tab-pane fade show active" id="club">
								<p>
								<div class="titlefont boldfont mx-1">
									<i class="fa-solid fa-crown"></i>&nbsp;운영중인 소모임
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberClub, index) in memberClubList" :key="index">
											<td v-if="isClubLeader(index)">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+memberClub.clubDto.clubNo">
													{{memberClub.clubDto.clubName}}
												</a>
											</td>
											<td  v-if="isClubLeader(index)">
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubMainCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubSubCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubPlace}}</span>
											</td>
										 	<td  v-if="isClubLeader(index)">
												<span class="tableInterest mx-2">{{memberClub.clubDto.clubMemberCount}} / {{memberClub.clubDto.clubMemberLimit}}</span>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="titlefont boldfont mt-5 mx-1">
									<i class="fa-solid fa-person-circle-check"></i>&nbsp;가입한 소모임
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberClub, index) in memberClubList" :key="index">
											<td v-if="isClubMember(index)">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+memberClub.clubDto.clubNo">
													{{memberClub.clubDto.clubName}}
												</a>
											</td>
											<td  v-if="isClubMember(index)">
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubMainCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubSubCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubPlace}}</span>
											</td>
										 	<td  v-if="isClubMember(index)">
												<span class="tableInterest mx-2">{{memberClub.clubDto.clubMemberCount}} / {{memberClub.clubDto.clubMemberLimit}}</span>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="titlefont boldfont mt-5 mx-1">
									<i class="fa-solid fa-heart"></i>&nbsp;관심있는 소모임
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberClub, index) in memberClubList" :key="index">
											<td v-if="isLikeClub(index)">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+memberClub.clubDto.clubNo">
													{{memberClub.clubDto.clubName}}
												</a>
											</td>
											<td  v-if="isLikeClub(index)">
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubMainCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubSubCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubPlace}}</span>
											</td>
										 	<td  v-if="isLikeClub(index)">
												<span class="tableInterest mx-2">{{memberClub.clubDto.clubMemberCount}} / {{memberClub.clubDto.clubMemberLimit}}</span>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="titlefont boldfont mt-5 mx-1">
									<i class="fa-solid fa-person-circle-minus"></i>&nbsp;승인 대기중인 소모임
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 40%;"></th>
											<th style="width: 35%;"></th>
											<th style="width: 15%;"></th>
											<th style="width: 10%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberClub, index) in memberClubList" :key="index">
											<td v-if="waitClub(index) && memberClub.clubDto != null">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+memberClub.clubDto.clubNo">
													{{memberClub.clubDto.clubName}}
												</a>
											</td>
											<td  v-if="waitClub(index) && memberClub.clubDto != null">
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubMainCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubSubCategory}}</span>
												<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubPlace}}</span>
											</td>
										 	<td  v-if="waitClub(index) && memberClub.clubDto != null">
												<span class="tableInterest2 mx-2" v-if="memberClub.clubMemberDto != null"> {{elapsedText(memberClub.clubMemberDto.clubMemberDate)}}</span>
											</td>
											<td v-if="waitClub(index) && memberClub.clubDto != null">
												<spane style="color:red; cursor:pointer;" @click="cancelRequest(index)">취소</spane>
											</td>
										</tr>
									</tbody>
								</table>
								
								
								<div class="titlefont boldfont mt-5 mx-1">
									<i class="fa-solid fa-person-circle-xmark"></i>&nbsp;승인 거절된 소모임
								</div>
								
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody class="show-detail">
										<template v-for="(memberClub, index) in memberClubList" :key="index">
											<tr v-if="rejectClub(index)" class="show-detail">
												<td  v-if="rejectClub(index)">
													<a class="tableInterest2" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+memberClub.clubDto.clubNo">
														{{memberClub.clubDto.clubName}}
													</a>
												</td>
												<td  v-if="rejectClub(index)">
													<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubMainCategory}}</span>
													<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubSubCategory}}</span>
													<span class="tableInterest mx-2">\#{{memberClub.clubDto.clubPlace}}</span>
												</td>
											 	<td v-if="rejectClub(index)">
													<span class="tableInterest2 mx-2"> {{elapsedText(memberClub.clubMemberDto.clubMemberDate)}}</span>
												</td>	
												<td>
													<tr class="detail">
														<td colspan="3" v-if="rejectClub(index)">
															<span>
																거절 메세지: {{memberClub.clubMemberDto.clubMemberRefuseMsg}}
															</span>
														</td>
													</tr>
												</td>
											</tr>
										</template>
									</tbody>
								</table>
								
							</div>
							
							<!-- mbti 게시글 -->
							<div class="tab-pane fade" id="mbti-board">
							
								<div class="titlefont boldfont mt-3 mx-1">
									<i class="fa-solid fa-file-pen"></i>&nbsp; 작성한 게시글
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberMbti, index) in memberMbtiList" :key="index">
											<td v-if="memberMbti.mbtiBoardDto.mbtiBaordNo != null">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/mbtiBoard/detail?mbtiBoardNo='+memberMbti.mbtiBoardDto.mbtiBoardNo">
													{{memberMbti.mbtiBoardDto.mbtiBoardTitle}}
												</a>
											</td>
										 	<td v-if="memberMbti.mbtiBoardDto.mbtiBaordNo != null">
												<span class="tableInterest2 mx-2" v-if="memberMbti.clubMemberDto != null"> {{convertTime(memberMbti.mbtiBoardDto.mbtiBoardTime)}}</span>
											</td>
											<td v-if="memberMbti.mbtiBoardDto.mbtiBaordNo != null">
												<span class="mx-2">
													<i class="fa-solid fa-heart"></i>
													{{memberMbti.mbtiBoardDto.likeCount}}
												</span>
											</td>
										</tr>
									</tbody>
								</table>
								
								<div class="titlefont boldfont mt-5 mx-1">
									<i class="fa-solid fa-heart"></i>&nbsp; 좋아요한 게시글
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberMbti, index) in memberMbtiList" :key="index">
											<td v-if="memberMbti.mbtiBoardLikeDto != null">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/mbtiBoard/detail?mbtiBoardNo='+memberMbti.mbtiBoardDto.mbtiBoardNo">
													{{memberMbti.mbtiBoardDto.mbtiBoardTitle}}
												</a>
											</td>
										 	<td v-if="memberMbti.mbtiBoardLikeDto != null">
												<span class="tableInterest2 mx-2" v-if="memberMbti.clubMemberDto != null"> {{convertTime(memberMbti.mbtiBoardDto.mbtiBoardTime)}}</span>
											</td>
											<td v-if="memberMbti.mbtiBoardLikeDto != null">
												<span class="mx-2">
													<i class="fa-solid fa-heart"></i>
													{{memberMbti.mbtiBoardDto.likeCount}}
												</span>
											</td>
										</tr>
									</tbody>
								</table>
								
								
								<div class="titlefont boldfont mt-5 mx-1">
									<i class="fa-solid fa-check-to-slot"></i>&nbsp; 투표한 게시글
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 45%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 15%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(memberMbti, index) in memberMbtiList" :key="index">
											<td v-if="memberMbti.mbtiBoardVoteDto != null">
												<a class="tableInterest2" :href="'${pageContext.request.contextPath}/mbtiBoard/detail?mbtiBoardNo='+memberMbti.mbtiBoardDto.mbtiBoardNo">
													{{memberMbti.mbtiBoardDto.mbtiBoardTitle}}
												</a>
											</td>
										 	<td v-if="memberMbti.mbtiBoardVoteDto != null">
												<span class="tableInterest2 mx-2" v-if="memberMbti.clubMemberDto != null"> {{convertTime(memberMbti.mbtiBoardDto.mbtiBoardTime)}}</span>
											</td>
											<td v-if="memberMbti.mbtiBoardVoteDto != null">
												<span class="mx-2">
													<i class="fa-solid fa-heart"></i>
													{{memberMbti.mbtiBoardDto.likeCount}}
												</span>
											</td>
										</tr>
									</tbody>
								</table>
								
								
							</div>
							
							
							<div class="tab-pane fade" id="buy">
								<p>
								<div class="titlefont boldfont mx-1">
									<i class="fa-solid fa-cart-shopping"></i>&nbsp;구매하기
								</div>
								<div class="boldfontSS text-center mb-3">
									<i class="fa-solid fa-circle-info"></i>&nbsp;소모임 회원은 최대 200명까지 증원 가능합니다. 
								</div>
								<form action="${pageContext.request.contextPath}/pay_purchase" method="post">
								<div class="row row-cols-1 row-cols-md-4 g-10 my-2">
									<div class="col">
										<label for="pay1">
										<div class="card my-2" :class="{'checked':isCheckedPlus('1')}" style="width: 11rem; border-radius: 30px;">
											<div class="card-body m-1">
												<input type="radio" name="clubPlusNo" id="pay1" value="1" v-model="clubPlusNo">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>10명</span>
												</h5>
												<p class="card-text text-center tagtext">
													<i class="fa-solid fa-won-sign"></i>10000
												</p>
											</div>
										</div>
										</label>
									</div>
									<div class="col">
										<label for="pay2">
										<div class="card my-2" style="width: 11rem; border-radius: 30px;" :class="{'checked':isCheckedPlus('2')}">
											<div class="card-body m-1">
												<input type="radio" name="clubPlusNo" id="pay2" value="2" v-model="clubPlusNo">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>30명</span>
												</h5>
												<p class="card-text text-center tagtext boldfont">
													<i class="fa-solid fa-won-sign"></i>25000
												</p>
											</div>
										</div>
										</label>
									</div>
									<div class="col">
										<label for="pay3">
										<div class="card my-2" style="width: 11rem; border-radius: 30px;" :class="{'checked':isCheckedPlus('3')}">
											<div class="card-body m-1">
												<input type="radio" name="clubPlusNo" id="pay3" value="3" v-model="clubPlusNo">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>50명</span>
												</h5>
												<p class="card-text text-center tagtext">
													<i class="fa-solid fa-won-sign"></i>35000
												</p>
											</div>
										</div>
										</label>
									</div>
									<div class="col">
										<label for="pay4">
										<div class="card my-2" style="width: 11rem; border-radius: 30px;" :class="{'checked':isCheckedPlus('4')}">
											<div class="card-body m-1">
												<input type="radio" name="clubPlusNo" id="pay4" value="4" v-model="clubPlusNo">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>100명</span>
												</h5>
												<p class="card-text text-center tagtext">
													<i class="fa-solid fa-won-sign"></i>60000
												</p>
											</div>
										</div>
										</label>
									</div>
								</div>
									<div class="mx-1 mt-4 titlefont boldfont">
										<i class="fa-solid fa-check"></i>&nbsp;결제할 소모임
									</div>
									<table class="table text-center">
										<thead>
											<tr>
												<th style="width: 50%;"></th>
												<th style="width: 30%;"></th>
												<th style="width: 20%;"></th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="(memberClub, index) in memberClubList" :key="index">
												<td v-if="isClubLeader(index)">
													<a class="tableInterest2" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+memberClub.clubDto.clubNo">
														{{memberClub.clubDto.clubName}}
													</a>
											 	<td  v-if="isClubLeader(index)">
													<span class="tableInterest mx-2">{{memberClub.clubDto.clubMemberCount}} / {{memberClub.clubDto.clubMemberLimit}}</span>
												</td>
												<td v-if="isClubLeader(index)">
													<input type="radio" name="clubNo" :value="memberClub.clubDto.clubNo" style="display:inline;" v-model="clubPayNo">
												</td>
											</tr>
										</tbody>
										</table>
								<div class="row" style="float: right;">
									<button type="submit" class="btn btn-outline-success mb-3">구매</button>
								</div>
								</form>
								<div class="mx-1 titlefont boldfont mt-5">
										<i class="fa-solid fa-receipt"></i>&nbsp;구매 및 사용내역
									</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th style="width: 10%;"></th>
											<th style="width: 40%;"></th>
											<th style="width: 20%;"></th>
											<th style="width: 30%;"></th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(pay, index) in memberPayDetail" :key="index">
											<td class="tableInterest" v-if="isMemberPay(index)">{{pay.paymentDto.paymentStatus}}</td>
											<td class="tableInterest" v-if="isMemberPay(index)">{{pay.clubDto.clubName}}</td>											
											<td class="tableInterest" v-if="isMemberPay(index)">{{pay.paymentDto.paymentName}} 증가</td>											
											<td class="tableInterest" v-if="isMemberPay(index)">{{convertTime(pay.paymentDto.paymentTime)}}</td>
										</tr>
									</tbody>
								</table>
								</div>
							<div class="tab-pane fade" id="blocked">
								<div class="titlefont boldfont mx-1 mt-3">
								<i class="fa-solid fa-person-circle-xmark"></i>&nbsp;차단된 사용자
								</div>
								<table class="table text-center">
									<thead>
										<tr>
											<th class="tableInterest2">사용자 닉네임</th>
											<th class="tableInterest2">관리</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="( block , index ) in blockedList">
											<td>{{block.memberDto.memberNick}}</td>
											<td>
											<div class="dropdown">
											  <button class="btn btn-outline-primary dropdown-toggle"  v-on:click="detail(index)" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
											   상세보기
											  </button>
											  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
											    <li><a class="dropdown-item" href="#" v-on:click="notAnymore()">차단해제</a></li>
											  </ul>
											</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade" id="info">
								<p>
								<div class="boldfont2 text-center mt-4 mb-4">
												<i class="fa-solid fa-circle-exclamation"></i>
												MBTI와 관심태그는 프로필에서 변경 가능합니다.
									</div>
								<form action="information" method="post">
									<div class="col-md-6 offset-md-3 mt-2">
										<div class="row text-center mt-3 mb-5">

											<div class="input-group input-group-sm mb-3">
												<span class="input-group-text px-3"
													id="inputGroup-sizing-sm">Name</span> <input type="text"
													class="form-control" aria-label="Sizing example input"
													aria-describedby="inputGroup-sizing-sm" name="memberName"
													autocomplete="off" value="${memberDto.memberName}" required>
											</div>

											<div class="input-group input-group-sm mb-3">
												<span class="input-group-text" id="inputGroup-sizing-sm">Nickname</span>
												<input type="text" class="form-control"
													aria-label="Sizing example input"
													aria-describedby="inputGroup-sizing-sm" name="memberNick"
													autocomplete="off" value="${memberDto.memberNick}" required>
											</div>

											<div class="input-group input-group-sm mb-3">
												<span class="input-group-text px-3"
													id="inputGroup-sizing-sm">Phone</span> <input type="text"
													class="form-control" aria-label="Sizing example input"
													aria-describedby="inputGroup-sizing-sm" name="memberPhone"
													autocomplete="off" value="${memberDto.memberPhone}"
													placeholder="'-' 제외 입력" required>
											</div>

											<div class="input-group input-group-sm mb-3">
												<span class="input-group-text" id="inputGroup-sizing-sm">Instagram
													Id</span> <input type="text" class="form-control"
													aria-label="Sizing example input"
													aria-describedby="inputGroup-sizing-sm" name="memberSnsId"
													autocomplete="off" value="${memberDto.memberSnsId}">
											</div>

											<div class="input-group-sm">
												<label class="input-group-text" for="inputGroupSelect01">Gender</label>
												<select class="form-select" id="inputGroupSelect01"
													name="memberGender">
													<option value="${memberDto.memberGender}">${memberDto.memberGender}</option>
													<option value="남자">남자</option>
													<option value="여자">여자</option>
												</select>
											</div>
											<div class="mt-2 text-start">
												<label class="label1 smalllabel">관심 지역1</label>
												<div class="row">
													<div class="col">
														<select class="form-control rounded"
															@change="addCityList1" v-model="address1No">
															<option value="" selected>시/도</option>
															<option v-for="(address1, index) in address1List1"
																v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
														</select>
													</div>
													<div class="col">
														<select name="memberPlace1" class="form-control rounded"
															v-model="city1">
															<option value="${memberDto.memberPlace1}">${memberDto.memberPlace1}</option>
															<option v-for="(address2, index) in address2List1"
																v-bind:key="index" :value="address2.city">{{address2.city}}</option>
														</select>
													</div>
												</div>
											</div>
											<div class="mt-2 text-start">
												<label class="label1 smalllabel">관심 지역2</label>
												<div class="row">
													<div class="col">
														<select class="form-control rounded"
															@change="addCityList2" v-model="address2No">
															<option value="">시/도</option>
															<option v-for="(address1, index) in address1List2"
																v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
														</select>
													</div>
													<div class="col">
														<select name="memberPlace2" class="form-control rounded"
															v-model="city2">
															<option value="${memberDto.memberPlace2 }">${memberDto.memberPlace2 }</option>
															<option v-for="(address2, index) in address2List2"
																v-bind:key="index" :value="address2.city">{{address2.city}}</option>
														</select>
													</div>
												</div>
											</div>
											<div class="mt-2 text-start">
												<label class="label1 smalllabel">관심 지역3</label>
												<div class="row">
													<div class="col">
														<select class="form-control rounded"
															@change="addCityList3" v-model="address3No">
															<option value="">시/도</option>
															<option v-for="(address1, index) in address1List3"
																v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
														</select>
													</div>
													<div class="col">
														<select name="memberPlace3" class="form-control rounded"
															v-model="city3">
															<option value="${memberDto.memberPlace3 }">${memberDto.memberPlace3}</option>
															<option v-for="(address2, index) in address2List3"
																v-bind:key="index" :value="address2.city">{{address2.city}}</option>
														</select>
													</div>
												</div>
											</div>
											<input type="hidden" name="memberInterest1" value="${memberDto.memberInterest1}">
											<input type="hidden" name="memberInterest2" value="${memberDto.memberInterest2}">
											<input type="hidden" name="memberInterest3" value="${memberDto.memberInterest3}">
											<button type="submit" class="btn btn-outline-success mt-4">수정하기</button>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="pw">
								<p>
									<div class="boldfont2 text-center mt-5 mb-5">
												<i class="fa-solid fa-circle-exclamation"></i>
												비밀번호는 영문대소문자/숫자/특수문자 포함 8~16자로 설정하세요.
											
									</div>
									<form action="password" method="post">
									<div class="col-md-6 offset-md-3">
										<div class="row text-center mb-5">
											<div class="form-floating mb-4">
												<input type="password" class="form-control" name="currentPw"
													autocomplete="off" required> <label
													for="floatingInput">기존 비밀번호</label>
											</div>

											<div class="form-floating mb-4">
												<input type="password" class="form-control" name="changePw"
													autocomplete="off" required> <label
													for="floatingInput">변경할 비밀번호</label>
											</div>
											<button type="submit" class="btn btn-outline-success">변경하기</button>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="exit">
								<p>
								<form action="exit" method="post">
									<div class="col-md-6 offset-md-3">
										<div class="row text-center mt-3 mb-5">
											<p class="mt-4 boldfont2">
												<i class="fa-solid fa-circle-exclamation"></i></i>
												소모임을 운영하고 있는 회원은<br> 소모임을 폐쇄한 뒤 탈퇴 회원탈퇴가 가능합니다.<br><br>
												탈퇴를 원하시면 비밀번호를 입력하세요.
											</p>
											<div class="form-floating mb-3 mt-4">
												<input type="password" class="form-control" name="memberPw"
													autocomplete="off" required>
												<label for="floatingInput">비밀번호 입력</label>
											</div>

											<button type="submit" class="btn btn-outline-success my-2">탈퇴하기</button>
										</div>
									</div>
								</form>
							</div>
							
								<!-- 관심분야 모달창 -->
								 <div class="modal" v-bind:class="isHidden" class="rounded">
									<div class="modal-overlay" v-on:click="addHidden"></div>
							
									<div class="modal-content mt-4" style="width:1000px!important; height:700px!important; position:absolute!important;">
									
										<div class="container-fluid">
											<div class="modal-header">
												<span class="boldfont">관심분야 변경하기</span>
												<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest1}</div>
												<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest2}</div>
												<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest3}</div>
											</div>
											
											
											
											<div class="row row-cols-1 row-cols-md-3 g-10 my-2">
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#인스타그래머')}" style="width: 15rem; border-radius: 30px;">
														<label for="cat1">
															<div class="card-body m-1">
																<h5 class="card-title text-center tagtitle"><label class="maincolor"># </label> 인스타그래머 
																<i class="fa-brands fa-instagram-square"></i>
																</h5>
																<input id="cat1" type="checkbox" value="\#인스타그래머" v-model="interest">
																<p class="card-text text-center tagtext">
																	남는 건 사진 뿐!<br>내 모든 순간을 남기자!
																</p>
															</div>
														</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#액티비티매니아')}" style="width: 15rem; border-radius: 30px;">
														<label for="cat2">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 액티비티매니아
															<i class="fa-solid fa-person-running" class="coloricon"></i></h5>
															<input id="cat2" type="checkbox" value="\#액티비티매니아" v-model="interest">
															<p class="card-text text-center tagtext">
																나를 죽이지 못한 고통은<br>나를 더욱 강하게 만든다!
															</p>
														</div>
														</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#친구해요')}" style="width: 15rem; border-radius: 30px;">
														<label for="cat3">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 친구해요
															<i class="fa-solid fa-user-group"></i></h5>
															<input id="cat3" type="checkbox" value="\#친구해요" v-model="interest">
															<p class="card-text text-center tagtext">다들 모여!<br>사람 만나는 게 제일 좋아!</p>
														</div>
														</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#뇌색남녀')}" style="width: 15rem; border-radius: 30px;">
														<label for="cat4">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 뇌색남녀
															<i class="fa-solid fa-book"></i></h5>
															<input id="cat4" type="checkbox" value="\#뇌색남녀" v-model="interest">
															<p class="card-text text-center tagtext">
																지금 잠을 자면 꿈을 꾸지만<br>지금 공부하면 꿈을 이룰지도..?
															</p>
														</div>
														</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#텅장되자')}" style="width: 15rem; border-radius: 30px;">
													<label for="cat5">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 텅장되자
															<i class="fa-solid fa-cart-shopping"></i></h5>
															<input id="cat5" type="checkbox" value="\#텅장되자" v-model="interest">
															<p class="card-text text-center tagtext">
																사는재미 없으면<br>사는 재미라도!
															</p>
														</div>
													</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#킹스맨')}" style="width: 15rem; border-radius: 30px;">
													<label for="cat6">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 킹스맨
															<i class="fa-solid fa-clapperboard"></i></h5>
															<input id="cat6" type="checkbox" value="\#킹스맨" v-model="interest">
															<p class="card-text text-center tagtext">
																관람객 매너가<br>명작을 만든다!
															</p>
														</div>
													</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#집돌이집순이')}" style="width: 15rem; border-radius: 30px;">
													<label for="cat7">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 집돌이집순이
															<i class="fa-solid fa-house"></i></i></h5>
															<input id="cat7" type="checkbox" value="\#집돌이집순이" v-model="interest">
															<p class="card-text text-center tagtext">
																집에서 할 게<br>얼마나 많은데?!
															</p>
														</div>
													</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#금손모임')}" style="width: 15rem; border-radius: 30px;">
													<label for="cat8">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 금손모임
															<i class="fa-solid fa-hand-sparkles"></i></i></h5>
															<input id="cat8" type="checkbox" value="\#금손모임" v-model="interest">
															<p class="card-text text-center tagtext">똥손도 괜찮아요~<br>함께 만들어요!</p>
														</div>
													</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#자연인')}" style="width: 15rem; border-radius: 30px;">
													<label for="cat9">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 자연인
															<i class="fa-solid fa-mountain-sun"></i></h5>
															<input id="cat9" type="checkbox" value="\#자연인" v-model="interest">
															<p class="card-text text-center tagtext">
																산은 산이요~<br>물은 물이로다~
															</p>
														</div>
													</label>
													</div>
												</div>
							
												<div class="col">
													<div class="card my-2" :class="{'checked':isChecked('\#집사님')}" style="width: 15rem; border-radius: 30px;">
													<label for="cat10">
														<div class="card-body m-1">
															<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 집사님
															<i class="fa-solid fa-paw"></i></h5>
															<input id="cat10" type="checkbox" value="\#집사님" v-model="interest">
															<p class="card-text text-center tagtext">
																저는 주인님을<br>모시고 있습니다!
															</p>
														</div>
													</label>
													</div>
												</div>
											</div>
											
													
											<div class="row mt-4">
											<div class="col">
												<button type="button" class="btn-cancel" @click="addHidden">돌아가기</button>
											</div>
											<div class="col">
												<button type="button" class="btn-create" @click="memberInterest">변경하기</button>
											</div>
											</div>
										</div>
									</div>
								</div> 
								
								<!-- MBTI검사 모달창 -->
								<div class="modal rounded" :class="isHidden1">
									<div class="modal-overlay" v-on:click="addHidden1"></div>
							
									<div class="modal-content mt-4" style="width:950px!important; height:700px!important; position:absolute!important; padding:0px; margin:0px">
									
										<div class="container-fluid">
											<div class="modal-header">
												<span class="boldfont">MBTI검사</span>
												<div class="text-end" @click="addHidden1()" style="cursor:pointer">
													<i class="fa-solid fa-x"></i>
												</div>
											</div>
											
											
											<!-- 1번째 페이지 -->
											<div class="container w500 m30 page">
												<div class="col-md-12 mb-5 p-4 text-dark rounded">
													<div class="col-md-8 offset-md-2">
														<c:forEach var="mbtiSurveyDto" items="${list}">
															<c:if test="${mbtiSurveyDto.surveyNo < 4}">
																<div class="text-center">
																	<div class="row">
																		<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
																	</div>
																	<div class="row my-2">
																		<button type="button" value="E" class="btn btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
																	</div>
																	<div class="row mt-2 mb-4">
																		<button type="button" value="I" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
																	</div>
																	<span class="answer" style="display: none;"></span>
																</div>
															</c:if>
														</c:forEach>
														<span class="answer-record1"></span>
									
									
														<button type="button" class="btn btn-prev mt-1"
															style="float: left;">이전</button>
														<button type="button" class="btn btn-next mt-1 ml-2"
															style="float: right;">다음</button>
									
													</div>
												</div>
											</div>
									
											<!-- 2번째 페이지 -->
											<div class="container w500 m30 page">
												<div class="col-md-12 mb-5 p-4 text-dark rounded">
													<div class="col-md-8 offset-md-2">
														<c:forEach var="mbtiSurveyDto" items="${list}">
															<c:if
																test="${mbtiSurveyDto.surveyNo >= 4 && mbtiSurveyDto.surveyNo < 7}">
																<div class="text-center">
																	<div class="row">
																		<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
																	</div>
																	<div class="row my-2">
																		<button type="button" value="N" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
																	</div>
																	<div class="row my-2 mb-4">
																		<button type="button" value="S" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
																	</div>
																	<span class="answer" style="display: none;"></span>
																</div>
															</c:if>
														</c:forEach>
														<span class="answer-record2"></span>
									
														<button type="button" class="btn btn-prev mt-1"
															style="float: left;">이전</button>
														<button type="button" class="btn btn-next mt-1"
															style="float: right;">다음</button>
													</div>
												</div>
											</div>
									
											<!-- 3번째 페이지 -->
											<div class="container w500 m30 page">
												<div class="col-md-12 mb-5 p-4 text-dark rounded">
													<div class="col-md-8 offset-md-2">
														<c:forEach var="mbtiSurveyDto" items="${list}">
															<c:if
																test="${mbtiSurveyDto.surveyNo >= 7 && mbtiSurveyDto.surveyNo < 10}">
																<div class="text-center">
																	<div class="row">
																		<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
																	</div>
																	<div class="row my-2">
																		<button type="button" value="F" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
																	</div>
																	<div class="row my-2 mb-4">
																		<button type="button" value="T" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
																	</div>
																	<span class="answer" style="display: none;"></span>
																</div>
															</c:if>
														</c:forEach>
														<span class="answer-record3"></span>
									
														<button type="button" class="btn btn-prev mt-1"
															style="float: left;">이전</button>
														<button type="button" class="btn btn-next mt-1"
															style="float: right;">다음</button>
													</div>
												</div>
											</div>
									
											<!-- 4번째 페이지 -->
											<div class="container w500 m30 page">
												<div class="col-md-12 mb-5 p-4 text-dark rounded">
													<div class="col-md-8 offset-md-2">
														<c:forEach var="mbtiSurveyDto" items="${list}">
															<c:if test="${mbtiSurveyDto.surveyNo >= 10 && mbtiSurveyDto.surveyNo < 13}">
																<div class="text-center">
																	<div class="row">
																		<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
																	</div>
																	<div class="row my-2">
																		<button type="button" value="J" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
																	</div>
																	<div class="row my-2 mb-4">
																		<button type="button" value="P" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
																	</div>
																	<span class="answer" style="display: none;"></span>
																</div>
															</c:if>
														</c:forEach>
														<span class="answer-record4"></span>
									
														<button type="button" class="btn btn-prev mt-1"
															style="float: left;">이전</button>
														<button type="button" class="btn btn-next mt-1"
															style="float: right;" @click="callAnimal">다음</button>
													</div>
												</div>
											</div>
											
										 	<!-- 5번째 페이지 -->
										 	<div class="container w500 m30 page">
												<div class="col-md-12 mb-5 p-4 text-dark rounded">
													<div class="col-md-8 offset-md-2">
													
														<div>
															<div class="boldfontL mt-4">
																<i class="fa-solid fa-hand"></i>&nbsp;<span style="color:#3E4684;">잠깐 멈춰보시&nbsp;<span style="color:#F4B759;">개!!</span></span>
															</div>
															<div class="text-center mt-5 mb-5">
																<img src="${pageContext.request.contextPath}/image/mbti/강아지(ENFP).png" style="width:300px; height:300px">  
															</div>
															<div class="text-center boldfontS mt-4 mb-5" style="margin-left: 5px;">
																<span style="color:#3E4684;">* 결과와 같은 프로필로 변경을 원치 않으실 경우 <span style="color:red;">'변경하기'</span> 버튼을 눌러주시개!<br></span>
																<span style="color:#3E4684;">* 결과와 같은 프로필로 변경을 원할 경우 <span style="color:red;">'+프로필'</span> 버튼을 눌러주시개!</span>
															</div>
															
														</div>
														
														<button type="button" class="btn btn-prev mt-1"
															style="float: left;">이전</button>
														<button type="button" class="btn btn-next mt-1"
															style="float: right;" @click="callAnimal">다음</button>
													</div>
												</div>
											</div> 
											
											<!-- 6번째 페이지 -->
											<div class="container w500 m30 page">
												<input type="hidden" name="memberMbti" ref="memberMbti">
												<div class="col-md-8 offset-md-2 mb-5 p-4 ">
													<input type="hidden" name="memberAnimal" :value="memberAnimal.mbtiAnimalDto.animal" v-if="memberAnimal.mbtiAnimalDto != null">
													<input type="hidden" name="attachNo" :value="memberAnimal.attachmentDto.attachNo" v-if="memberAnimal.attachmentDto != null">
													<div class="row">
													<div class="boldfontL text-center mb-5">
													<i class="fa-solid fa-quote-left"></i>&nbsp;MBTI 성향분석 완료!&nbsp;<i class="fa-solid fa-quote-right"></i></div>
														<div v-if="memberAnimal != null">
															<div class=" text-center mb-4">
																<img src="${pageContext.request.contextPath}/image/mbti/코끼리(INFP).png" v-if="memberAnimal.attachmentDto == null" style="width:300px; height:300px">  
																<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+memberAnimal.attachmentDto.attachNo" v-if="memberAnimal.attachmentDto != null" style="width:300px; height:300px">
															</div>
															<div class="text-center boldfontM mb-2" style="color:#F7D68A;" v-if="memberAnimal.mbtiAnimalDto != null">{{memberAnimal.mbtiAnimalDto.animal}}&nbsp;(<span style="color:#F7D68A;">&nbsp;{{memberAnimal.mbtiAnimalDto.mbti}}&nbsp;</span>)<br></div> 
															<div class="text-center boldfont" v-if="memberAnimal.mbtiAnimalDto != null">{{memberAnimal.mbtiAnimalDto.mbtiSummary}}</div>
														</div>
													</div>
													<div class="mt-4">
														<div class="col-md-12 row text-center" style="margin:0px;">
															<div class="col-md-6">
																<button type="submit" class="btn btn-outline-success" style="width: 50%;" @click="memberMbti">변경하기</button>
															</div>
															<div class="col-md-6">
																<button type="submit" class="btn btn-outline-success" style="width: 50%;" @click="changeAnimalProfile">+ 프로필</button>
															</div>
														</div>
													</div>
											
													<div class="row mt-4">
														<button type="button" class="btn btn-prev">이전</button>
														<button type="button" class="btn btn-next" style="display:none;">다음</button>
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
				</div>
			</div>
			
		<!--  프로필 모달 -->
      <div v-if="this.blockedDetail!=null">
      <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            <div class="modal-body">
                <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <a><img src="https://placeimg.com/120/120/animals" class="rounded"></a>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
		            <h4><b>{{blockedDetail.memberDto.memberNick}}</b></h4>
		            <span>{{blockedDetail.memberDto.memberGender}}/</span><span>{{elapsedText(blockedDetail.memberDto.memberBirth)}}/</span> <span>{{blockedDetail.memberDto.memberPlace1}}</span>           
                </div>
                <div class="row mt-5">
                	<h5><b>SNS계정</b><img style="width:25px "src="https://cdn-icons-png.flaticon.com/512/1384/1384063.png"></h5>
                	<h5>{{blockedDetail.memberDto.memberSnsId}}</h5>
                </div>
                <div class="row mt-5">
                	<h5><b>나의 관심분야</b></h5>
                	<div class="col-lg-12 col-md-12 col-sm-12">
		            <button class="btn btn-outline-secondary btn-sm">{{blockedDetail.memberDto.memberInterest1}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{blockedDetail.memberDto.memberInterest2}}</button>
		            <button class="btn btn-outline-secondary btn-sm">{{blockedDetail.memberDto.memberInterest3}}</button>
		            </div>
                </div>
				<div class="row mt-5">
					<h5><b>마지막 로그인</b></h5>
					<h5>{{convertTime(blockedDetail.memberDto.memberLogindate)}}({{elapsedText(blockedDetail.memberDto.memberLogindate)}})</h5>
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
	</div>

	<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="${root}/js/time.js"></script>

<script>
$(".show-detail").click(function(){
	console.log("되는가");
});
$(".show-detail").each(function(index, element){
    $(this).click(function() {
       $(this).children("tr").find(".detail").toggle();
    });
 });
const app = Vue.createApp({
data() {
	return {
		isHidden:{
			"hidden" : true,
		},
		isHidden1:{
			"hidden1" : true,	
		},
		// 지역 목록용
		address1List1: [],
		address2List1: [],
		
		address1List2: [],
		address2List2: [],
		
		address1List3: [],
		address2List3: [],
				
		// 시/도 번호
		address1No : "",
		address2No : "",
		address3No : "",
		// 시/군/구 값
		city1: "${memberDto.memberPlace1}",		
		city2: "${memberDto.memberPlace2}",		
		city3: "${memberDto.memberPlace3}",		
		
		memberNo : ${login},
		
		memberList:[],
		memberClubList: [],		
		memberMbtiList: [],
		
		interest:[],
		memberAnimal:[],
		
		clubPlusNo:[],
		
		blockedList:null,//차단된 회원목록
		blockedDetail:null,//프로필 정보
		notBlocked:"",
		
		// 결제 
		clubPayNo:[],
		memberPayDetail:[],
	};
},
computed: {
	error(){
		const href = window.location.href;
		const url = new URL(href);
		return url.searchParams.get("error");
	},
	success(){
		const href = window.location.href;
		const url = new URL(href);
		return url.searchParams.get("success");
	},
},
methods: {
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
	},
	
	removeHidden1(){
		this.isHidden1["hidden1"] = false;
	},
	
	addHidden1(){
		this.isHidden1["hidden1"] = true; 
	},
	
	isMemberPay(index){
		return this.memberPayDetail[index].paymentDto != null && this.memberPayDetail[index].clubDto != null;
	},
	isClubLeader(index){
		return this.memberClubList[index].clubMemberDto.clubMemberGrade == 1;
	},
	isClubMember(index){
		return this.memberClubList[index].clubMemberDto.clubMemberGrade == 0 && this.memberClubList[index].clubMemberDto.clubMemberPermission == 1;
	},
	isLikeClub(index){
		return this.memberClubList[index].clubLikeDto.clubLikeNo != 0;
	},
	waitClub(index){
		return this.memberClubList[index].clubMemberDto.clubMemberPermission == 0  && this.memberClubList[index].clubMemberDto != null;
	},
	rejectClub(index){
		return this.memberClubList[index].clubMemberDto.clubMemberPermission == 2;
	},
	
	// checkbox 
	isChecked(value){
		// 체크박스 갯수제한
		if(this.interest.length > 3){
			this.interest?.shift();
		}
		return this.interest?.includes(value);
	},
	
	isCheckedPlus(value){
		if(this.clubPlusNo.length == 0) return; 
		return this.clubPlusNo?.includes(value);
	},
	
	// 시/군/구 추가
	addCityList1(){
		if(this.address1No == ""){
			this.address2List1 = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address1No,
			method:"get",
		}).then((resp) => {
			this.city1 = "${memberDto.memberPlace1}";
			this.address2List1 = [];
			this.address2List1.push(...resp.data);
		})		
	},
	
	addCityList2(){
		if(this.address2No == ""){
			this.address2List2 = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address2No,
			method:"get",
		}).then((resp) => {
			this.city2 = "${memberDto.memberPlace2}";
			this.address2List2 = [];
			this.address2List2.push(...resp.data);
		})		
	},
	
	addCityList3(){
		if(this.address3No == ""){
			this.address2List3 = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address3No,
			method:"get",
		}).then((resp) => {
			this.city3 = "${memberDto.memberPlace3}";
			this.address2List3 = [];
			this.address2List3.push(...resp.data);
		})		
	},
	//시간 바꾸기
    elapsedText(date) {
    	return dateformat.elapsedText(new Date(date));
    },
    //moment js
    convertTime(time){
    	return moment(time).format('YYYY-MM-DD'); 
    },
    
    memberInterest(){
    	axios({
			url:"${pageContext.request.contextPath}/rest/mypage/member_interest",
			method:"put",
			data:{
				memberNo : this.memberNo,
				memberInterest1 : this.interest[0],
				memberInterest2 : this.interest[1],
				memberInterest3 : this.interest[2],
			},
		}).then((resp) => {
			if(resp.data != 0){
				location.reload();
				window.alert("관심분야가 성공적으로 변경되었습니다!");
			}
		})			
    },
    
    memberMbti(){
    	const mbti = this.$refs.memberMbti;
    	
    	axios({
			url:"${pageContext.request.contextPath}/rest/mypage/member_mbti",
			method:"put",
			data:{
				memberNo : this.memberNo,
				memberMbti : mbti.value,
				memberAnimal : this.memberAnimal.mbtiAnimalDto.animal,
			},
		}).then((resp) => {
			if(resp.data != 0){
				location.reload();
				window.alert("MBTI가 성공적으로 변경되었습니다!");
			}
		})				
    },
    
    callAnimal(){
    	const mbti = this.$refs.memberMbti;
    	
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/animal/"+mbti.value,
			method:"get",
		}).then((resp) => {
			this.memberAnimal = resp.data;
		})
	},
	
	changeAnimalProfile(){
		const mbti = this.$refs.memberMbti;
		
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/member_mbti_profile",
			method:"put",
			data:{
				memberNo : this.memberNo,
				memberMbti : mbti.value,
				memberAnimal : this.memberAnimal.mbtiAnimalDto.animal,
				attachNo : this.memberAnimal.attachmentDto.attachNo,
			},
		}).then((resp) => {
			location.reload();
			window.alert("MBTI 및 프로필이 성공적으로 변경되었습니다!");
		})
	},
	
	changeProfile(){
		if(window.confirm("프로필을 변경하시겠습니까?")){
			let formData = new FormData();
			
			const fileInput = this.$refs.memberProfile;
			if(fileInput.files.length == 0) return;
			
			console.log(this.memberList.memberProfileDto.attachNo);
			
			const fileData = fileInput.files[0];
			formData.append('attach', fileData);
			formData.append('memberNo', this.memberNo);
			formData.append('attachNo', this.memberList.memberProfileDto.attachNo);
			
			axios({
				url:"${pageContext.request.contextPath}/rest/mypage/member_profile",
				method:"post",
				headers:{
					"Content-Type" : "multipart/form-data",
				},
				data: formData,
			}).then((resp) => {
				if(resp.data == 0){
					window.alert("프로필 변경에 실패했습니다.");
					return;
				}
				window.alert("프로필 변경 완료!");
				location.reload();
			});
		}
		else{
			return;
		}
	},
	
	// 가입요청 취소
	cancelRequest(index){
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/cancel_request/"+this.memberClubList[index].clubDto.clubNo,
			method:"delete",
		}).then(resp=>{
			if(resp.data == 0){
				window.alert("취소할 수 없습니다.");
				return;
			}
			window.alert("가입신청이 취소되었습니다.");
			location.reload();
		})
	},
	
	// 프로필 사진 삭제 - mbti 프로필로 변경
	deleteProfile(){
	    const mbti = this.memberList.memberDto.memberMbti;
	    	
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/animal/"+mbti,
			method:"get",
		}).then((resp) => {
			
			this.memberAnimal = resp.data;
			
			axios({
				url:"${pageContext.request.contextPath}/rest/mypage/delete_profile/"+this.memberAnimal.animalPhotoDto.attachNo,
				method:"put",
			}).then(resp=>{
				if(resp.data == 0){
					window.alert("삭제가 실패했습니다.");
					return;
				}
				window.alert("프로필 사진이 정상적으로 삭제되었습니다.");
				location.reload();
			})
		})
	},
	
	//차단된 사용자 목록
	blocked(){
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/block/"+this.memberNo,
			method:"get",
		}).then(resp=>{
			this.blockedList=resp.data
		})
	},
	//차단된 회원 상세 조회
	detail(index){
		const target= this.blockedList[index];
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/blockdetail/"+target.blockedDto.blockedNo,
			method:"get",
		}).then(resp=>{
			this.blockedDetail=resp.data
		})
	},
	//차단된 회원 해제
	notAnymore(){
		const choice = window.confirm("차단 목록에서 삭제 하시겠습니까?");
		if(choice==false)return
		const blockedNo= this.blockedDetail.blockedDto.blockedNo
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/block/"+blockedNo,
			method:"delete"
		}).then(resp=>{
			this.notBlocked=resp.data
			if(this.notBlocked==1){
				window.alert("차단해제 되었습니다.")
			}
			this.blocked();
		})
	},
},
mounted(){
	$(function() {
		// 현재 페이지 
		var index = 0;

		// 처음 페이지를 제외하고 모두 숨김 처리
		move(index);

		// 각 mbti count 변수
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		var count4 = 0;
		var count5 = 0;

		// mbti 결과 저장 변수
		var mbti1 = "";
		var mbti2 = "";
		var mbti3 = "";
		var mbti4 = "";

		// 다음 버튼을 누르면 다음 페이지가 나오도록 구현
		$(".btn-next").not(":last").click(function() {
			move(++index);

			if (index == 4) {
				$(".answer").each(function() {
					if ($(this).text() == 'E') {
						count1++;
					} else if ($(this).text() == 'N') {
						count2++;
					} else if ($(this).text() == 'F') {
						count3++;
					} else if ($(this).text() == 'P') {
						count4++;
					} else {
						count5++;
					}
				});

				// mbti 결과 도출
				if (count1 >= 2) {
					mbti1 = 'E';
				} else {
					mbti1 = 'I';
				}

				if (count2 >= 2) {
					mbti2 = 'N';
				} else {
					mbti2 = 'S';
				}

				if (count3 >= 2) {
					mbti3 = 'F';
				} else {
					mbti3 = 'T';
				}

				if (count4 >= 2) {
					mbti4 = 'P';
				} else {
					mbti4 = 'J';
				}
				// mbti결과값 input에 저장
				var memberMbti = $("input[name=memberMbti]").val(mbti1 + mbti2 + mbti3 + mbti4);
				
				// 확인용
				console.log($("input[name=memberMbti]").val());
			}

		});
		// 이전 버튼을 누르면 이전 페이지가 나오도록 구현
		$(".btn-prev").not(":first").click(function() {
			move(--index);
		});

		var mbti;

		// 질문버튼 클릭시 기능
		$(".btn-answer1").click(
				function() {
					// 선택된 값 저장
					mbti = $(this).val();
					$(this).parent("div").parent("div").find(".answer").text(
							mbti);

					// 색변경
					$(this).css("background-color", "#3E4684");
					$(this).css("border-color", "#3E4684");
					$(this).css("border-width", "0.25em");
					$(this).css("color", "white");
					$(this).parent("div").parent("div").find(".btn-answer2")
							.css("background-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer2")
							.css("color", "#3E4684");
					$(this).parent("div").parent("div").find(".btn-answer2")
					.css("border-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer2")
					.css("border-width", "0.25em");
				});
		$(".btn-answer2").click(
				function() {
					// 선택된 값 저장		
					mbti = $(this).val();
					$(this).parent("div").parent("div").find(".answer").text(
							mbti);

					// 색변경
					$(this).css("background-color", "#3E4684");
					$(this).css("border-color", "#3E4684");
					$(this).css("border-width", "0.25em");
					$(this).css("color", "white");
					$(this).parent("div").parent("div").find(".btn-answer1")
							.css("background-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer1")
							.css("color", "#3E4684");
					$(this).parent("div").parent("div").find(".btn-answer1")
					.css("border-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer1")
					.css("border-width", "0.25em");
				});

		function move(index) {
			$(".page").hide();
			$(".page").eq(index).show();
		}
	});
	

	// error 처리 
	if(this.error == 1){
		window.alert("정보변경에 실패했습니다.");
	}
	
	// success 처리 
	if(this.success == 1){
		window.alert("정보변경에 성공했습니다.");
	}
	
	// error 처리 
	if(this.error == 2){
		window.alert("비밀번호 변경에 실패했습니다.");
	}
	// success 처리 
	if(this.success == 2){
		window.alert("비밀번호 변경에 성공했습니다.");
	}
	// error 처리
	if(this.error == 3){
		window.alert("소모임 회원 증원은 최대 200명까지만 가능합니다.");
	}
	// error 처리
	if(this.error == 4){
		window.alert("증원 시킬 소모임이 없습니다.");
	}
},
created() {
		//차단 목록
		this.blocked();
		// 시/도 
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address1",
			method:"get",
		}).then((resp) => {
			this.address1List1.push(...resp.data);
			this.address1List2.push(...resp.data);
			this.address1List3.push(...resp.data);
		})	
	
		// 회원 정보
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/member/"+this.memberNo,
			method:"get",
		}).then((resp) => {
			this.memberList = resp.data;
		})	
		
		// 회원 소모임 정보
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/club/"+this.memberNo,
			method:"get",
		}).then((resp) => {
			this.memberClubList = resp.data;
		})	
		
		// 회원 mbti 게시판 정보
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/mbti/"+this.memberNo,
			method:"get",
		}).then((resp) => {
			this.memberMbtiList = resp.data;
		})	
		
		// 회원 결제 정보
		axios({
			url:"${pageContext.request.contextPath}/rest/mypage/member_pay/"+this.memberNo,
			method:"get",
		}).then((resp) => {
			this.memberPayDetail = resp.data;
		})	
	},
});
app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>