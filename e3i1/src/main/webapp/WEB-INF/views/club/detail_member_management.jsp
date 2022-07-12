<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modal.css">
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
		<div class="col-md-3">
			<div class="card">

				<div class="card-body">

					<div class="card-title">
						<div class="row">
							<div class="col-md-2 align-self-center">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-home" width="44"
	                            height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
	                            stroke-linecap="round" stroke-linejoin="round">
	                            <path stroke="none" d="M0 0h24v24H0z" fill="none" />
	                            <polyline points="5 12 3 12 12 3 21 12 19 12" />
	                            <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7" />
	                            <path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6" />
							</div>
							<div class="col-md-8 align-self-center"
								v-if="clubList.clubDto != null">
								<h4 style="margin: 0px;">{{clubList.clubDto.clubName}}</h4>
							</div>
							<div class="col-md-2 align-self-center">
								<div class="row" @click="likeClub">
									<i class="fa-solid fa-heart" style="color: red;" v-if="isLike"></i>
									<i class="fa-regular fa-heart" style="color: red;" v-if="!isLike"></i>
								</div>
								<div class="row mt-2">
									<i class="fa-solid fa-bullhorn"></i>
								</div>
							</div>
						</div>
					</div>
					<hr>

					<div class="card-title">
						<div class="row">
							<div class="col-md-2" width="10px" height="10px">
								<img src="https://via.placeholder.com/250/69f/fff.png" class="profile" v-if="clubList.memberProfileDto == null" >
								<img :src="'${pageContext.request.contextPath}/attachment/download?attachmentNo='+clubList.memberProfileDto.attachNo" class="profile" v-if="clubList.memberProfileDto != null">
							</div>
							<div class="col-md-8 offset-md-2 row align-self-center">
								<div class="col-md-3">
									<i class="fa-solid fa-crown fa-2x" style="color: #f6e58d"></i>
								</div>
								<div class="col-md-9 align-self-center"
									v-if="clubList.memberDto != null">
									<h5 style="margin: 0px;">{{clubList.memberDto.memberNick}}</h5>
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
					</div>
				</div>

				<div class="card-body">
					<div class="card-title">

						<div class="col row">
							<div class="col-md-2">
								<i class="fa-solid fa-ranking-star"></i>
							</div>
							<div class="col-md-10" style="padding:0px">
								<h4 style="font-weight: bold">우리 소모임 MBTI 순위</h4>
							</div>
						</div>

						<!-- v-for index를 []안에 사용할 방법을 찾으면 v-for로 반복할 예정 너무 복잡해지면 그냥 이대로 사용 -->
						<div class="row mt-4" v-if="mbtiList[0] != null">
							<div class="col-md-4">
								<img src="https://via.placeholder.com/250/69f/fff.png" class="profile">
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
			</div>
		</div>


		<!-- 중앙 -->
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h4 style="font-weight: bold">소모임 회원관리</h4>
					</div>
				</div>
				<div class="card-body">
				
				 	 <table class="table table-hover">
						<thead>
							<th>회원이름</th>
							<th>회원등급</th>
							<th>신청/승인 날짜</th>
							<th>승인여부</th>
						</thead>
						<tbody v-for="(clubMember, index) in clubMemberList" :key="index">
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
				
			<div class="accordion">
				<div class="accordion-item"  v-if="clubList.clubDto != null">
                      <h2 class="accordion-header" id="headingOne">
                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                          	소모임
                         </button>
                      </h2>
					<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                          <div class="accordion-body">
                             <a class="dropdown-item" :href="'${pageContext.request.contextPath}/club/detail?clubNo='+clubList.clubDto.clubNo">
								소모임 홈
							</a>
							<a class="dropdown-item" :href="'${pageContext.request.contextPath}/club/board/'+clubList.clubDto.clubNo">
								소모임 게시판
							</a>
							<a class="dropdown-item" :href="'${pageContext.request.contextPath}/club/chat?clubNo='+clubList.clubDto.clubNo">
								소모임 채팅방
							</a>
                         </div>
                     </div>
                 </div>
				
				<div class="accordion-item" v-if="leaderJudge">
                      <h2 class="accordion-header" id="headingTwo">
                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          	소모임 관리
                         </button>
                      </h2>
					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                          <div class="accordion-body">
                             <a class="dropdown-item" :href="'${pageContext.request.contextPath}/club/edit?clubNo='+clubList.clubDto.clubNo">소모임 정보변경</a>
                             <a class="dropdown-item" :href="'${pageContext.request.contextPath}/club/member_management?clubNo='+clubList.clubDto.clubNo">소모임 회원관리</a>
                         </div>
                     </div>
                 </div>
			</div>
		</div>
		
		
		
	<!-- 거절 모달창 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4" style="width:600px!important; height:450px!important; position:absolute!important;">
		
			<div class="container-fluid">
				<div class="modal-header text-start">
					<h3>소모임 가입 거절 메세지</h3>
				</div>
				<div class="text-start mt-2">
					<p style="font-size: 10px">
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