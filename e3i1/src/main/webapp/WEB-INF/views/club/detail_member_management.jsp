<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modal.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/club.css">
<style>
.hash-tag {
	font-size: 12px;
	color: #686666;
	background-color: #E9E9E9;
	padding: 0px 0px;
	text-align: center;
}

.profile {
	width: 80px;
	height: 80px;
	border-radius: 70%;
	overflow: hidden;
}

.hiddenRow {
    padding: 0 !important;
}
</style>

<div id="app" class="container-fluid">

	<div class="row mt-4">

		<!-- 왼쪽 사이드바 -->
		<div class="col-md-3 mb-5">
			<div class="card shadow" style="margin-left: 1em;">
				<div class="card-body">
					<div class="card-title">
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
					</div>
					<hr>
					<div class="col-md-4 align-self-center"></div>

					<div class="card-title">
						<div class="row text-center my-2"
							v-if="clubList.memberDto != null">
							<span><i class="fa-solid fa-crown" style="color: #f6e58d;"></i></span>
							<span class="boldfontS">{{clubList.memberDto.memberNick}}</span>
						</div>
						<div class="row">
							<div class="col-md-4" width="16px" height="16px"
								style="margin-left: 0.8em; margin-top: 0.45em;">
								<img src="${root }/image/mbti/거북이(ISTP).png" class="profile"
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
				</div>

				<div class="card-body">
					<div class="card-title">

						<div class="text-center mb-3">
							<span class="boldfontS">소모임 멤버 MBTI TOP 3 <i
								class="fa-solid fa-ranking-star"></i></span>
						</div>

						<!-- v-for index를 []안에 사용할 방법을 찾으면 v-for로 반복할 예정 너무 복잡해지면 그냥 이대로 사용 -->
						<div class="row">
							<div class="col-md-4 text-center" v-if="mbtiList[0] != null">
								<img src="${root }/image/mbti/강아지(ENFP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[0].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[0].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[1] != null">
								<img src="${root }/image/mbti/물개(ESFP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[1].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[1].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[2] != null">
								<img src="${root }/image/mbti/원숭이(ESTP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[2].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[2].mbtiPercent}}%</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 중앙 -->
		<div class="col-md-6 mb-5">
			<div class="card">
				<div class="card-body">
					<div class="card-title text-center mt-2">
						<span class="boldfontL"  style="color:#3E4684;">소모임 회원 관리</span>
					</div>
				</div>
				<div class="card-body">
				
				 	 <table class="table table-hover text-center mb-4">
						<thead class="boldfontS">
							<th>회원이름</th>
							<th>회원등급</th>
							<th>신청/승인 날짜</th>
							<th>승인여부</th>
						</thead>
						<tbody v-for="(clubMember, index) in clubMemberList" :key="index" class="fontSS">
							<tr  @click="isHidden1['hidden1'] = !isHidden1['hidden1']">
								<td>{{clubMember.memberDto.memberNick}}</td>
								<td v-if="clubMember.clubMemberDto.clubMemberGrade == 1">관리자</td>
								<td v-if="clubMember.clubMemberDto.clubMemberGrade == 0">일반</td>
								<td>{{clubMember.clubMemberDto.clubMemberDate}}</td>
								<td v-if="clubMember.clubMemberDto.clubMemberPermission == 0">대기중</td>
								<td v-if="clubMember.clubMemberDto.clubMemberPermission == 1" style="color:green">승인</td>
								<td v-if="clubMember.clubMemberDto.clubMemberPermission == 2" style="color:red">거절</td>
							</tr>
							<tr :class="isHidden1" v-if="clubMember.clubMemberDto.clubMemberGrade != 1">
								<td colspan="4">
									<div if="clubMember.clubMemberDto.clubMemberAnswer1 != null">
										{{clubMember.clubMemberDto.clubMemberAnswer1}}
									</div>
									<div if="clubMember.clubMemberDto.clubMemberAnswer2 != null">
										{{clubMember.clubMemberDto.clubMemberAnswer2}}
									</div>
									<div if="clubMember.clubMemberDto.clubMemberAnswer3 != null">
										{{clubMember.clubMemberDto.clubMemberAnswer3}}
									</div>
									<div class="row mt-4" v-if="clubMember.clubMemberDto.clubMemberPermission == 0">
										<div class="col-md-6">
											<button class="btn-cancel" @click="removeHidden(index)">거절</button>
										</div>
										<div class="col-md-6">
											<button class="btn-create" @click="approveClub(index)">승인</button>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>

		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
			<button class="btn-create shadow" v-on:click="removeHidden">가입 거절 메세지</button>
			<div class="list-group mt-2" v-if="clubList.clubDto != null">
				<a class="list-group-item list-group-item-action disabled boldfontS" style="color:#3E4684;">소모임</a>
				<a class="list-group-item list-group-item-action boldfontSS" :href="'${pageContext.request.contextPath}/club/board?clubNo='+clubList.clubDto.clubNo">게시판</a> 
				<a class="list-group-item list-group-item-action boldfontSS" :href="'${pageContext.request.contextPath}/club/chat?clubNo='+clubList.clubDto.clubNo">채팅</a> 
			</div>
			<div class="list-group mt-2" v-if="leaderJudge">
				<a class="list-group-item list-group-item-action disabled boldfontS" style="color:#3E4684;">관리</a>
				<a class="list-group-item list-group-item-action boldfontSS" :href="'${pageContext.request.contextPath}/club/member_management?clubNo='+clubList.clubDto.clubNo">멤버 관리</a> 
				<a class="list-group-item list-group-item-action boldfontSS" :href="'${pageContext.request.contextPath}/club/edit?clubNo='+clubList.clubDto.clubNo">소모임 관리</a>  
			</div>

		</div>

	</div>
		
		
		
	<!-- 거절 모달창 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4" style="width:600px!important; height:450px!important; position:absolute!important;">
		
			<div class="container-fluid">
				<div class="modal-header">
					<span class="boldfontL">가입 거절 메세지</span>
				</div>
				<div class="text-start mt-2">
					<p class="boldfontSSS">
						*거절 메세지는 최대한 자세하고 친절하게 부탁드리겠습니다.
					</p>
				</div>		
				<div class="text-start mt-2">
					<textarea class="form-control rounded" v-model="clubMemberRefuseMsg"></textarea>
				</div>
						
				<div class="row mt-4">
				<div class="col">
					<button type="button" class="btn-cancel" @click="addHidden(index)">돌아가기</button>
				</div>
				<div class="col">
					<button type="submit" class="btn-create" @click="refuseClub(index)">거절하기</button>
				</div>
				</div>
			</div>
		</div>
	</div>
	
</div>



<script>
const app = Vue.createApp({
data() {
	return {
		isHidden:{
			"hidden" : true,
		},
		
		isHidden1: {
			"hidden1" : true,
		},
		
		// 소모임 상세에 필요한 정보(소모임, 소모임좋아요, mbti, 소모임프로필)
		clubList:[],
		mbtiList:[],
		// 소모임 회원 목록
		clubMemberList: [],
		
		memberNo:"${login}",
		
		isLike:false,
		
		clubMemberRefuseMsg:"",
		index:"",
	};
},
computed: {
	// clubNo 파라미터 값
	clubNo(){
		const href = window.location.href;
		const url = new URL(href);
		return url.searchParams.get("clubNo");
	},
	
	leaderJudge(){
		if(this.clubList.clubDto != null){
			if(this.memberNo == this.clubList.clubDto.clubLeader){
				return true;
			}
		}
		return false;
	},
},
methods: {
	
	removeHidden(index){
		this.isHidden["hidden"] = false;
		
		this.index = index;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
		
		this.clubMemberRefuseMsg = "";
		this.index = "";
	},
	
	existLike(){
		// 좋아요 여부
		if(this.memberNo == null || this.memberNo == "") {
			this.isLike = false;
			return;
		}
		axios({
			url: "${pageContext.request.contextPath}/rest/club/is_like/"+this.clubNo+"/"+this.memberNo,
			method: "get",
			data: {
				clubNo:this.clubNo,
				memberNo:this.memberNo,
			},
		}).then((resp) => {
			this.isLike = resp.data;
		});
	},
	
	likeClub(){
		const session = this.$refs.memberNo.value;
		if(session == null || session == ""){
			window.alert("로그인을 해주세요");
			return;
		}
		else{
			this.memberNo = session;
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
				this.isLike = false;
				return;
			}
			window.alert("좋아요 완료!");
			this.isLike = true;
		});
	},
	
	// 소모임 가입 승인
	approveClub(index){
		axios({
			url:"${pageContext.request.contextPath}/rest/club/approve",
			method:"put",
			data: {
				clubMemberNo:this.clubMemberList[index].clubMemberDto.clubMemberNo,
			},
		}).then((resp) => {
			if(resp.data == 0){
				window.alert("승인 실패");
				return;
			}
			window.alert("승인 완료!");
			window.location.href="${pageContext.request.contextPath}/club/member_management?clubNo="+this.clubNo;
		});
	},
	
	// 소모임 가입 거절
	refuseClub(index){
		axios({
			url:"${pageContext.request.contextPath}/rest/club/refuse",
			method:"put",
			data: {
				clubMemberNo:this.clubMemberList[this.index].clubMemberDto.clubMemberNo,
				clubMemberRefuseMsg:this.clubMemberRefuseMsg,
			},
		}).then((resp) => {
			if(resp.data == 0){
				window.alert("승인 실패");
				return;
			}
			window.alert("승인 완료!");
			window.location.href="${pageContext.request.contextPath}/club/member_management?clubNo="+this.clubNo;
		});
	},
	
},

created() {
	this.existLike();
	
	axios({
		url: "${pageContext.request.contextPath}/rest/club/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.clubList = resp.data;
	})
	
	// 소모임 회원 정보
	axios({
		url: "${pageContext.request.contextPath}/rest/club/member/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.clubMemberList = resp.data;
	})
	
	
	// mbti
	axios({
		url: "${pageContext.request.contextPath}/rest/category_n_address/mbti/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.mbtiList = resp.data;
	})
},

mounted(){},


});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>