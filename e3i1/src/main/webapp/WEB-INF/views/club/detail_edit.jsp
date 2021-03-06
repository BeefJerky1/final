<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal.css">
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
.btn-plus {
	background-color: #3E4684;
	color: white;
}

.btn-minus {
	background-color: white;
	border: 1px solid #3E4684;
	color: #3E4684;
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
								<img src="${root }/image/mbti/거북이(ISTP).png" class="profile" v-if="clubList.memberProfileDto == null"> 
								<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+clubList.memberProfileDto.attachNo"
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
								<img src="${root }/image/mbti/강아지(ENFP).png" class="mbtitop" style="border: 1.5px solid #3E4684;" v-if="mbtiList[0].attachNo == null">
								<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[0].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684;" v-if="mbtiList[0].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[0].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[0].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[1] != null">
								<img src="${root }/image/mbti/물개(ESFP).png" class="mbtitop" style="border: 1.5px solid #3E4684;" v-if="mbtiList[1].attachNo == null">
								<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[1].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684;" v-if="mbtiList[1].attachNo != null">
								<p style="margin: 0px 0px; font-weight: bold;">{{mbtiList[1].memberMbti}}</p>
								<p class="boldfontSS" style="margin: 0px 0px;">{{mbtiList[1].mbtiPercent}}%</p>
							</div>
							<div class="col-md-4 text-center" v-if="mbtiList[2] != null">
								<img src="${root }/image/mbti/원숭이(ESTP).png" class="mbtitop" style="border: 1.5px solid #3E4684;" v-if="mbtiList[2].attachNo == null">
								<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+mbtiList[2].attachNo"
									class="mbtitop" style="border: 1.5px solid #3E4684;" v-if="mbtiList[2].attachNo != null">
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
				<div class="card-body mt-2">
					<div class="card-title text-center">
						<span class="boldfontL" style="color:#3E4684;">소모임 관리</span>
					</div>
				</div>
				<div class="card-body" v-if="clubList.clubDto != null">
				
					<input type="hidden" ref="clubLeader" value="${login}"/>
					
					<div>
						<label class="boldfontS">소모임 프로필</label>
					</div>
					<div class="card-img-top mt-2">
						<img class="preview" :src="uploadImageFile+clubList.clubProfileDto.attachNo" style="width:100%; height: 350px; border:0.5px solid black; margin-bottom:1em;">	
						<input type="file" class="form-control boldfontS" accept="image/*" ref="clubProfile" onchange="previewFile()">
					</div>
					<div class="mt-4">
						<label class="boldfontS">소모임 이름</label>
						<input class="form-control fontS" type="text" v-model="clubName" v-on:input="clubName = $event.target.value">
					</div>
					<div class="mt-4">
						<label class="boldfontS">소모임 설명</label>
						<textarea class="form-control fontS" type="text" v-model="clubSummary"></textarea>
					</div>
					<div class="text-end mt-4" v-if="clubList.clubDto.clubJoinQuestion3 == null">
						<button @click="addInput" class="btn btn-plus">+</button>
						<button @click="removeInput" class="btn btn-minus">-</button>
					</div>
					<div class="mt-4" v-if="clubList.clubDto.clubJoinQuestion1 != null">
						<label class="boldfontS">가입 질문1</label>
						<input class="form-control fontS" type="text" v-model="clubJoinQuestion1">
					</div>
					<div class="mt-2" v-if="clubList.clubDto.clubJoinQuestion2 != null">
						<label class="boldfontS">가입 질문2</label>
						<input class="form-control fontS" type="text" v-model="clubJoinQuestion2">
					</div>
					<div class="mt-2" v-if="clubList.clubDto.clubJoinQuestion3 != null">
						<label class="boldfontS">가입 질문3</label>
						<input class="form-control fontS" type="text" v-model="clubJoinQuestion3">
					</div>
					 <div class="mt-2" v-if="count > 2 && clubList.clubDto.clubJoinQuestion2 == null">
					 	<label class="boldfontS">가입 질문2</label>
					 	<input class="form-control fontS" type="text" v-model="clubJoinQuestion2">
					</div>
					 <div class="mt-2" v-if="count > 3 && clubList.clubDto.clubJoinQuestion3 == null">
					 	<label class="boldfontS">가입 질문3</label>
					 	<input class="form-control fontS" type="text" v-model="clubJoinQuestion3">
					</div>
				</div>
				<div class="card-footer">
					<button class="btn-create" @click="editClub">정보 수정하기</button>
				</div>
			</div>
		</div>
		
		


		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
			<div class="list-group" v-if="clubList.clubDto != null">
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
</div>



<script>
// 파일 미리보기
function previewFile() {
	  var preview = document.querySelector('.preview');
	  var file = document.querySelector('input[type=file]').files[0];
	  var reader = new FileReader();

	  reader.addEventListener('load',
	    function () {
	      preview.src = reader.result;
	    },
	    false
	  );

	  if (file) {
	    reader.readAsDataURL(file);
	  }
}
  
const app = Vue.createApp({
data() {
	return {
		isHidden:{
			"hidden" : true,
		},
		
		// 소모임 상세에 필요한 정보(소모임, 소모임좋아요, mbti, 소모임프로필)
		clubList:[],
		mbtiList:[],
		
		memberNo:"${login}",
		
		uploadImageFile:"${pageContext.request.contextPath}/attachment/download?attachNo=",
				
		// 소모임 수정에 필요한 정보
		clubLeader: "",
		clubName: "",
		clubSummary: "",
		clubJoinQuestion1:"",
		clubJoinQuestion2:"",
		clubJoinQuestion3:"",
		
		isLike:false,
		
		// 파일 업로드 
		file:[],
		filesPreview:[],
		uploadImageIndex: 0, // 이미지 업로드를 위한 변수
		
		count: 1,
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
	addInput(){
		if(this.count >= 4) return;
		this.count = this.count + 1;
	},
	removeInput(){
		if(this.count <= 1) {
			this.clubJoinQuestion1 = "";
			return;
		}
		else if(this.count == 2){
			this.clubJoinQuestion2 = "";
		}
		else if(this.count == 3){
			this.clubJoinQuestion3 = "";
		}
		
		this.count = this.count - 1;
	},
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
		
		this.clubMemberAnswer1 = "";
		this.clubMemberAnswer2 = "";
		this.clubMemberAnswer3 = "";
	},
	
	// 좋아요 여부
	existLike(){
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
	
	// 소모임 좋아요
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
	
	// 소모임 정보 수정
	editClub(){
		let formData = new FormData();
		
		const fileInput = this.$refs.clubProfile;
		const fileData = fileInput.files[0];
		
		const session = this.$refs.clubLeader.value;
		if(session == null || session == ""){
			window.alert("로그인을 해주세요"); 
			return;
		}
		else{
			this.clubLeader = session;
		}
		
		// without file
		if(fileInput.files.length == 0) {
			axios({
				url:"${pageContext.request.contextPath}/rest/club/edit2",
				method:"put",
				data:{
					clubNo: this.clubNo,
					clubLeader: this.clubLeader,
					clubName: this.clubName,
					clubSummary: this.clubSummary,
					clubJoinQuestion1: this.clubJoinQuestion1,
					clubJoinQuestion2: this.clubJoinQuestion2,
					clubJoinQuestion3: this.clubJoinQuestion3,
				},
			}).then((resp) => {
				if(resp.data == 0){
					window.alert("정보 변경에 실패했습니다.");
					return;
				}
				window.alert("정보 변경 완료!");
				window.location.href="${pageContext.request.contextPath}/club/edit?clubNo="+this.clubNo;
			});
		}
		// with file
		else {	
			formData.append('clubProfile', fileData);
			formData.append('clubNo', this.clubNo);
			formData.append('clubLeader', this.clubLeader);
			formData.append('clubName', this.clubName);
			formData.append('clubSummary', this.clubSummary);
			formData.append('clubJoinQuestion1', this.clubJoinQuestion1);
			formData.append('clubJoinQuestion2', this.clubJoinQuestion2);
			formData.append('clubJoinQuestion3', this.clubJoinQuestion3);
			formData.append('attachNo', this.clubList.clubProfileDto.attachNo);
			
			axios({
				url:"${pageContext.request.contextPath}/rest/club/edit",
				method:"post",
				headers:{
					"Content-Type" : "multipart/form-data",
				},
				data: formData,
			}).then((resp) => {
				if(resp.data == 0){
					window.alert("정보 변경에 실패했습니다.");
					return;
				}
				window.alert("정보 변경 완료!");
				window.location.href="${pageContext.request.contextPath}/club/edit?clubNo="+this.clubNo;
			});
		}
	},
	
},

created() {
	this.existLike();
	
	axios({
		url: "${pageContext.request.contextPath}/rest/club/detail/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.clubList = resp.data;
		
		var count = this.count;
		if(this.clubList.clubDto.clubJoinQuestion1 != null){
			count = count + 1;
		}
		if(this.clubList.clubDto.clubJoinQuestion2 != null){
			count = count + 1;
		}
		if(this.clubList.clubDto.clubJoinQuestion3 != null){
			count = count + 1;
		}
		
		this.count = count;
		this.clubName = this.clubList.clubDto.clubName;
		this.clubSummary = this.clubList.clubDto.clubSummary;
		this.clubJoinQuestion1 = this.clubList.clubDto.clubJoinQuestion1;
		this.clubJoinQuestion2 = this.clubList.clubDto.clubJoinQuestion2;
		this.clubJoinQuestion3 = this.clubList.clubDto.clubJoinQuestion3;
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