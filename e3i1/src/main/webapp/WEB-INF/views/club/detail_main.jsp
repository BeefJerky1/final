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
								<i class="fa-solid fa-house-chimney fa-2x"
									style="color: lightgray;"></i>
							</div>
							<div class="col-md-8 align-self-center"
								v-if="clubList.clubDto != null">
								<h4 style="margin: 0px;">{{clubList.clubDto.clubName}}</h4>
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
					</div>
					<hr>

					<div class="card-title">
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
					</div>
				</div>

				<div class="card-body">
					<div class="card-title">

						<div class="col">
							<h4 style="font-weight: bold">우리 소모임 MBTI 순위</h4>
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
			</div>
		</div>


		<!-- 중앙 -->
		<div class="col-md-6">
			<div class="card" style="height: 800px;">
				<img src="https://via.placeholder.com/250/69f/fff.png"
					class="card-img-top" style="width: 100%; height: 350px;">
				<div class="card-body">
					<div class="card-title">
						<h4 style="font-weight: bold">소모임 소개</h4>
					</div>
					<div class="card-text" v-if="clubList.clubDto != null">
						<h5>{{clubList.clubDto.clubSummary}}</h5>
					</div>
				</div>

				<div class="card-body mt-4">
					<div class="card-title mt-4">
						<h4 style="font-weight: bold">우리 소모임 MBTI</h4>
					</div>

					<div class="card-text" v-if="clubList.clubMbtiPercent != null">

					</div>

				</div>
			</div>
		</div>

		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
			<button class="btn-create" v-on:click="removeHidden">소모임
				가입하기</button>
		</div>

	</div>



	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden" class="rounded"
		v-if="clubList.clubDto != null">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4"
			style="width: 600px !important; position: absolute !important;">
			<input type="hidden" ref="memberNo" value="${login}" />

			<div class="container-fluid">
				<div class="ow">
					<div class="modal-header text-start col-md-12"
						v-if="clubList.clubDto != null">
						<h2>{{clubList.clubDto.clubName}} 가입하기</h2>
					</div>
				</div>

				<div class="modal-body">

					<div class="text-start">
						<h4>가입 질문</h4>
						<p style="font-size: 10px">
							*소모임 성격과 맞지 않는 답변 시 가입이 거절 될 수 있습니다.<br> *답변은 성심성의껏 작성해주세요.
						</p>
					</div>
					<div class="mt-2" v-if="clubList.clubDto.clubJoinQuestion1 != null">
						<div class="text-start">
							<h6>Q1.{{clubList.clubDto.clubJoinQuestion1}}</h6>
						</div>
						<div class="mt-2">
							<input type="text" class="form-control"
								v-model="clubMemberAnswer1">
						</div>
					</div>

					<div class="mt-4" v-if="clubList.clubDto.clubJoinQuestion2 != null">
						<div class="row text-start">
							<h6>Q2.{{clubList.clubDto.clubJoinQuestion2}}</h6>
						</div>
						<div class="mt-2">
							<input type="text" class="form-control"
								v-model="clubMemberAnswer2">
						</div>
					</div>

					<div class="mt-4" v-if="clubList.clubDto.clubJoinQuestion3 != null">
						<div class="row text-start">
							<h6>Q3.{{clubList.clubDto.clubJoinQuestion3}}</h6>
						</div>
						<div class="mt-2">
							<input type="text" class="form-control"
								v-model="clubMemberAnswer3">
						</div>
					</div>

					<div class="mt-2">
						<p class="text-start" style="color: red; font-size: 10px;">*답변
							시 회원님의 소중한 개인정보가 유출되지 않도록 주의해주시기 바랍니다.</p>
					</div>

					<div class="row mt-4">
						<div class="col">
							<button type="button" class="btn-cancel" @click="addHidden">돌아가기</button>
						</div>
						<div class="col">
							<button type="submit" class="btn-create"
								@click="insertClubMember">가입하기</button>
						</div>
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
		
		// 소모임 상세에 필요한 정보(소모임, 소모임좋아요, mbti, 소모임프로필)
		clubList:[],
		mbtiList:[],
		
		clubMemberAnswe1:"",
		clubMemberAnswe2:"",
		clubMemberAnswe3:"",
		memberNo:"",
		
		isLike:false,
	};
},
computed: {
	// clubNo 파라미터 값
	clubNo(){
		const href = window.location.href;
		const url = new URL(href);
		return url.searchParams.get("clubNo");
	},
},
methods: {
	
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
		
		this.clubMemberAnswer1 = "";
		this.clubMemberAnswer2 = "";
		this.clubMemberAnswer3 = "";
	},
	
	insertClubMember(){
		const session = this.$refs.memberNo.value;
		if(session == null || session == ""){
			window.alert("로그인을 해주세요");
			return;
		}
		else{
			this.memberNo = session;
		}
		
		axios({
			url:"${pageContext.request.contextPath}/rest/club/member",
			method:"post",
			data: {
				clubMemberAnswer1:this.clubMemberAnswer1,
				clubMemberAnswer2:this.clubMemberAnswer2,
				clubMemberAnswer3:this.clubMemberAnswer3,
				clubNo:this.clubNo,
				memberNo:this.memberNo,
			},
		}).then((resp) => {
			if(resp.data == 0){
				window.alert("이미 가입 신청 완료된 소모임입니다.");
				this.addHidden();
				return;
			}
			window.alert("소모임 가입신청 완료!");
			this.addHidden();
		});
	},
	
	existLike(){
		const session = this.$refs.memberNo.value;
		if(session == null || session == ""){
			this.isLike = false;
			return;
		}
		else{
			this.memberNo = session;
			
			// 좋아요 여부
			axios({
				url: "${pageContext.request.contextPath}/rest/club/is_like",
				method: "post",
				data: {
					clubNo:this.clubNo,
					memberNo:this.memberNo,
				},
			}).then((resp) => {
				this.isLike = resp.data;
			});
		}
			
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
				return;
			}
			window.alert("좋아요 완료!");
		});
	},
	
},

created() {
	
	axios({
		url: "${pageContext.request.contextPath}/rest/club/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.clubList = resp.data;
	})
	
	
	// mbti
	axios({
		url: "${pageContext.request.contextPath}/rest/category_n_address/mbti/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.mbtiList = resp.data;
	})
},


});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>