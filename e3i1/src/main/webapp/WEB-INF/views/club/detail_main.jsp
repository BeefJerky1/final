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
a {
	color : black;
}
a:hover {
	color : #514e85;
}

.memberPhoto:hover {
	transform: scale(1.05);
}

#app {
	background-color: #F8F9FA !important;
}

.clubMemberNick {
		font-weight: bold !important;
}

.profileModal {
	width :600px !important;
	height : 650px;
	border : none;
	border-radius : 1em;
	position: absolute !important;
}
.clubMemberList {
	font-weight: bold !important;
	margin-bottom: 0.3em;
	margin-top: 0.5em;
}

.clubModalDanger {
    background-color: #a7a7c1;
    border: none;
    color: white;
    padding: 0.4em 1em;
    border-radius: 16px;
    font-size: 17px;
    width: 140px;
    margin-left : 2em;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 4px 0px inset;
}
.clubModalDanger:hover {
    background-color: #9898bc;
}

.clubModalWarning {
	background-color: #efc873;
    border: none;
    color: white;
    padding: 0.4em 1em;
    border-radius: 16px;
    font-size: 17px;
    width: 140px;
    margin-left : 2em;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 4px 0px inset;
}

.clubModalWarning:hover {
    background-color: #e8bd61;
}



.clubModal {
	font-weight: bold !important;
	margin-bottom: 0.3em;
	font-size : 18px;
}

.clubModalInterest {
	font-weight: bold !important;
	margin-top: 0.5em;
	margin-right : 0.3em;
	margin-bottom: 0.3em;
	font-size : 15px;
	background-color : #e8e9ea;
	border-radius : 1em;
	padding : 0.3em;
}
</style>
<div id="app" class="container-fluid">

	<div class="row mt-4">

		<!-- 왼쪽 사이드바 -->
		<div class="col-md-3">
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
									style="border: 1.5px solid #3E4684;"
									v-if="mbtiList[0].attachNo == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[0].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684;"
									v-if="mbtiList[0].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[0].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[0].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[1] != null">
								<img src="${root }/image/mbti/물개(ESFP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684;"
									v-if="mbtiList[1].attachNo == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[1].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684;"
									v-if="mbtiList[1].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[1].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[1].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[2] != null">
								<img src="${root }/image/mbti/원숭이(ESTP).png" class="mbtitop"
									style="border: 1.5px solid #3E4684;"
									v-if="mbtiList[2].attachNo == null"> <img
									:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[2].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684;"
									v-if="mbtiList[2].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[2].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[2].mbtiPercent}}%</p>
							</div>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="card-title">
						<div class="text-center mb-3">
							<span class="boldfontS">소모임 정모<i class="fa-solid fa-map"></i></span>
						</div>
						<div class="mt-2">
							<input type="datetime-local" class="form-control" id="dateLocal">
						</div>
						<div>
							
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- 중앙 -->
		<div class="col-md-6 mb-5">
			<div class="card shadow">
				<img src="https://via.placeholder.com/200/69f/fff.png"
					class="card-img-top" style="width: 100%; height: 300px;"
					v-if="clubList.clubProfileDto == null"> <img
					:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+clubList.clubProfileDto.attachNo"
					style="width: 100%; height: 400px;" class="card-img-top"
					v-if="clubList.clubProfileDto != null">
				<div class="card-body">
					<div class="card-title">
						<i class="fa-solid fa-comment"></i> <span class="boldfont">&nbsp;소모임
							소개</span>
					</div>
					<div class="card-text boldfontS" v-if="clubList.clubDto != null">
						{{clubList.clubDto.clubSummary}}</div>
				</div>

				<div class="card-body mt-4">
					<div class="card-title mt-4 mb-2">
						<span class="boldfont"><i class="fa-solid fa-mars-and-venus"></i>&nbsp;우리 지금 만나</span>
					</div>

					<div class="row mt-4">
					<div class="col text-center">
						<div class="mt-2">정모</div>
					</div>
					</div>
				</div>

				<div class="card-body mt-4">
					<div class="card-title mt-4 mb-2">
						<span class="boldfont"><i class="fa-solid fa-mars-and-venus"></i>&nbsp;우리 소모임 MBTI</span>
					</div>

					<div class="row mt-4">
						<div class="col text-center" v-if="mbtiList != null"
							v-for="(mbti, index) in mbtiList" :key="index">
							<img src="${root }/image/mbti/강아지(ENFP).png" class="mbtitop"
								style="width: 50px; height: 50px; border: 1.5px solid #3E4684;"
								v-if="mbtiList[index].attachNo == null"> <img
								:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[index].attachNo"
								class="mbtitop"
								style="width: 50px; height: 50px; border: 1.5px solid #3E4684;"
								v-if="mbtiList[index].attachNo != null">
							<div>
								<span class="boldfont">{{mbti.memberMbti}}</span>
							</div>
							<div>
								<span class="boldfontSS">{{mbti.mbtiPercent}}%</span>
							</div>
						</div>
					</div>
				</div>

				<div class="card-body mt-4">
					<div class="card-title mt-4 mb-2">
						<span class="boldfont"> <i class="fa-solid fa-users"></i>
							&nbsp; 우리 소모임 회원
						</span>
					</div>

					<div class="row mt-4 " v-for="(member, index) in clubMemberList" :key="index" style="width: 25%; float: left;">
						<div class="col text-center" >
							<!-- memberProfile 연결되면 프로필 사진으로 찍기 -->
						<img src="${root }/image/mbti/강아지(ENFP).png" class="mbtitop" style="width: 50px; height: 50px; border: 1.5px solid #3E4684;" v-if="member.memberProfileDto == null">
						<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+member.memberProfileDto.attachNo"
								class="mbtitop" style="width: 50px; height: 50px; border: 1.5px solid #3E4684;" v-if="member.memberProfileDto != null">  
				<%-- 			<img src="${root }/image/mbti/강아지(ENFP).png" class="memberPhoto mbtitop"
								style="width: 50px; height: 50px; border: 1.5px solid #3E4684; border-radius: 50%; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;"> --%>
							<div v-on:click="removeHidden2()" class="clubMemberList">
								<span v-on:click="modal(index)">{{member.memberDto.memberAnimal}}</span>
							</div>
							<div class="clubMemberList">
								<span
									style="background-color: #f3dba5; border-radius: 0.8em; padding: 5px;">@{{member.memberDto.memberNick}}</span><br>
							</div>
						</div>

					</div>
					
					<div class="modal rounded" :class="isHidden2">
						<div class="modal-content profileModal mt-4">
						<button type="button" class="btn-close" @click="addHidden2()" data-bs-dismiss="modal" aria-label="Close"></button>
							<div class="row mt-4">
								<div class="modal-body">
									<div class="row">
										<div class="col-lg-4 col-md-4 col-sm-4">
						<img src="${root }/image/mbti/강아지(ENFP).png" class="mbtitop"style="width: 100px; height: 100px;" v-if="memberProfile.memberProfileDto == null"> 
						<!-- ps. 사진 경로 지정이 안 되네요 ㅠㅠ  memberProfile은 이미 index값을 같이 불러온 객체입니다 -->
						<img
								:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+memberProfile.memberProfileDto.attachNo"
								class="mbtitop"
								style="width: 100px; height: 100px; border: 1.5px solid #3E4684;"
								v-if="memberProfile.memberProfileDto != null">
										</div>
										<div class="col-lg-8 col-md-8 col-sm-8" class="text-start">
											<h4>
												<span class="clubMemberNick">{{memberProfile.memberDto.memberNick}}</span>&nbsp;<i class="fa-solid fa-circle-check"></i>
											</h4>
											<span class="clubMemberList">{{memberProfile.memberDto.memberGender}} / </span>
											<span class="clubMemberList"><i class="fa-solid fa-location-dot"></i> {{memberProfile.memberDto.memberPlace1}} / </span>
											<span class="clubMemberList">{{memberProfile.memberDto.memberMbti}}</span><br>
											<span class="btn btn-outline-success mt-2">{{memberProfile.memberDto.memberAnimal}}</span>
										</div>
										
										<div class="row mt-4">
											<div class="col-lg-6col-md-6 col-sm-6">
												<button class="clubModalDanger">신고하기</button>
											</div>
											<div class="col-lg-6col-md-6 col-sm-6">
												<button class="clubModalWarning">차단하기</button>
											</div>
										</div>
										<div class="mt-4 mb-2 pt-2 border-top">
											<a href="https://www.instagram.com/{{memberProfile.memberDto.memberSnsId}}" style="float:left;">
											<span class="clubModal">SNS <i class="fa-brands fa-instagram"></i> {{memberProfile.memberDto.memberSnsId}}</span>
											</a>
										</div>
										<div class="mt-3 mb-2">
											<span class="clubModal"  style="float:left;">나의 관심분야</span><br>
											<div class="mb-1"  style="float:left;">
												<span class="clubModalInterest">{{memberProfile.memberDto.memberInterest1}}</span>
												<span class="clubModalInterest">{{memberProfile.memberDto.memberInterest2}}</span>
												<span class="clubModalInterest">{{memberProfile.memberDto.memberInterest3}}</span>
											</div>
										</div>
										<div class="mt-3 mb-3">
										<span class="clubModal"  style="float:left;">마지막 로그인</span><br>
										<span class="clubModal"  style="float:right;">{{convertTime(memberProfile.memberDto.memberLogindate)}}</span>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>
			</div>
				<button class="btn-create shadow mt-4" @click="deleteClub" v-if="isClubMember">소모임 탈퇴</button>
		</div>



		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
			<button class="btn-create shadow" v-on:click="removeHidden" v-if="isLimit">소모임 가입 신청</button>
			<button class="btn-create shadow" v-on:click="sorry" v-if="!isLimit">소모임 가입 신청</button>
			
			<div class="list-group mt-2" v-if="clubList.clubDto != null">
				<a class="list-group-item list-group-item-action disabled boldfontS"
					style="color: #3E4684;">소모임</a> <a
					class="list-group-item list-group-item-action boldfontSS"
					:href="'${pageContext.request.contextPath}/club/board?clubNo='+clubList.clubDto.clubNo">게시판</a>
				<a class="list-group-item list-group-item-action boldfontSS"
					:href="'${pageContext.request.contextPath}/club/chat?clubNo='+clubList.clubDto.clubNo" v-if="clubMemberJudge">채팅</a>
			</div>
			<div class="list-group mt-2" v-if="leaderJudge">
				<a class="list-group-item list-group-item-action disabled boldfontS"
					style="color: #3E4684;">관리</a> <a
					class="list-group-item list-group-item-action boldfontSS"
					:href="'${pageContext.request.contextPath}/club/member_management?clubNo='+clubList.clubDto.clubNo">멤버
					관리</a> <a class="list-group-item list-group-item-action boldfontSS"
					:href="'${pageContext.request.contextPath}/club/edit?clubNo='+clubList.clubDto.clubNo">소모임
					관리</a>
			</div>

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
				<div class="modal-header">
					<div class="text-start col-md-12" v-if="clubList.clubDto != null">
						<span class="boldfontL">소모임 가입 신청</span>
					</div>
				</div>

				<div class="modal-body">

					<div class="text-start">
						<p class="boldfontSSS">
							*소모임 성격과 맞지 않는 답변 시 가입이 거절 될 수 있습니다.<br> *답변은 성심성의껏 작성해주세요.
						</p>
					</div>
					<div class="mt-3" v-if="clubList.clubDto.clubJoinQuestion1 != null">
						<div class="text-start boldfontS">
							Q1.&nbsp;{{clubList.clubDto.clubJoinQuestion1}}</div>
						<div class="mt-2">
							<input type="text" class="form-control fontS"
								v-model="clubMemberAnswer1">
						</div>
					</div>

					<div class="mt-4" v-if="clubList.clubDto.clubJoinQuestion2 != null">
						<div class="text-start boldfontS">
							Q2.&nbsp;{{clubList.clubDto.clubJoinQuestion2}}</div>
						<div class="mt-2">
							<input type="text" class="form-control fontS"
								v-model="clubMemberAnswer2">
						</div>
					</div>

					<div class="mt-4" v-if="clubList.clubDto.clubJoinQuestion3 != null">
						<div class="text-start boldfontS">
							Q3.&nbsp;{{clubList.clubDto.clubJoinQuestion3}}</div>
						<div class="mt-2">
							<input type="text" class="form-control fontS"
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

let dateElement = document.getElementById('dateLocal');
let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -5);
dateElement.value = date;
dateElement.setAttribute("min", date);

const app = Vue.createApp({
data() {
	return {
		isHidden:{
			"hidden" : true,
		},
		
		isHidden2:{
			"hidden" : true,
		},
		
		// 소모임 상세에 필요한 정보(소모임, 소모임좋아요, mbti, 소모임프로필)
		clubList:[],
		mbtiList:[],
		clubMemberList:[],
		
		clubMemberAnswer1:"",
		clubMemberAnswer2:"",
		clubMemberAnswer3:"",
		memberNo:"${login}",
		
		isLike:false,
		
		clubMemberDto:[], 
		
		memberProfile:{
			memberDto : {},
			memberProfileDto : {},
		},
		True:1,
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
	
	clubMemberJudge(){
		if(this.clubMemberDto.clubMemberNo != null){
			return true;
		}
		return false;
	},
},
methods: {
	// 소모임 인원제한
	isLimit(){
		return this.clubList.clubDto.clubMemberLimit == this.clubList.clubMbtiPercent.total; 
	},
	sorry(){
		window.alert("소모임 정원이 모두 찼습니다.");
	},
	
	// 해당 소모임 회원여부 확인
	isClubMember(){
		if(this.memberNo == null || this.memberNo == "") {
			return;
		}
		
		axios({
     		url:"${pageContext.request.contextPath}/rest/club/is_club_member/"+this.clubNo+"/"+this.memberNo,
    		method:"get",
    	})
    	.then(resp=>{
    		this.clubMemberDto = resp.data;
    	});		
	},
	
	// 모달로 프로필 조회
	 modal(index){
	     	
			const memberNo = this.clubMemberList[index].memberDto.memberNo;
	         	axios({
	         		url:"${pageContext.request.contextPath}/rest/club/modal/"+memberNo,
	        		method:"get",
	        	})
	        	.then(resp=>{
	        		this.memberProfile = resp.data;
	  				console.log("this.memberProfile= ",this.memberProfile);
	        	});		
	 },
	
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	removeHidden2(){
		this.isHidden2["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
		
		this.clubMemberAnswer1 = "";
		this.clubMemberAnswer2 = "";
		this.clubMemberAnswer3 = "";
	},
	addHidden2(){
		this.isHidden2["hidden"] = true; 
		
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
		
		if(this.clubList.clubDto.clubJoinQuestion1 != null){
			if(this.clubMemberAnswer1 == "" || this.clubMemberAnswer1 == null){
				window.alert("가입 질문에 대한 대답이 필요합니다.");
				return;
			}
		}
		if(this.clubList.clubDto.clubJoinQuestion2 != null){
			if(this.clubMemberAnswer2 == "" || this.clubMemberAnswer2 == null){
				window.alert("가입 질문에 대한 대답이 필요합니다.");
				return;
			}
		}
		if(this.clubList.clubDto.clubJoinQuestion3 != null){
			if(this.clubMemberAnswer3 == "" || this.clubMemberAnswer3 == null){
				window.alert("가입 질문에 대한 대답이 필요합니다.");
				return;
			}
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
			console.log(resp.data);
			if(resp.data == 0){
				window.alert("이미 가입 신청 완료된 소모임입니다.");
				this.addHidden();
				return;
			}
			if(resp.data == -1){
				window.alert("3회 이상 가입 거절된 상태이기 때문에, 더이상 가입 신청을 할 수 없습니다.");
				this.addHidden();
				return;
			}
			window.alert("소모임 가입신청 완료!");
			this.addHidden();
		});
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
	
	// 회원 탈퇴
	deleteClub(){
		
		window.confirm("소모임을 탈퇴 하시겠습니까?");
		
		axios({
			url:"${pageContext.request.contextPath}/rest/club/member/"+this.memberNo+"/"+this.clubNo,
			method:"delete",
		}).then((resp) => {
			if(resp.data == 0){
				window.alert("탈퇴 실패");
				return;
			}
			window.alert("탈퇴 완료");
			location.reload();
		});
	},
	
	//moment js
    convertTime(time){
    	return moment(time).format('llll'); // 2022년 7월 4일 월요일 오후 9:46
	},
},
created() {
	this.existLike();
	
	// 소모임 회원 정보
	axios({
		url: "${pageContext.request.contextPath}/rest/club/member/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.clubMemberList = resp.data;
	});
	
	// 소모임 상세 정보
	axios({
		url: "${pageContext.request.contextPath}/rest/club/detail/"+this.clubNo,
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
	
	// 소모임 회원 여부 판단
	this.isClubMember();
},
mounted(){},
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>