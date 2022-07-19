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

.message-wrapper > .message {
	display:flex;
}
.message-wrapper > .message.admin {
	color:red
}
.message-wrapper > .message > .user {
	padding:0.25em;	
	min-width: 100px;
}
.message-wrapper > .message > .text{
	padding:0.25em;
	flex-grow:1;	
}
.message-wrapper > .message > .time{
	padding:0.25em;	
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
								<a :href="'${pageContext.request.contextPath}/club/detail?clubNo='+clubList.clubDto.clubNo">
									<i class="fa-solid fa-house"></i>
								</a> <span class="boldfont">&nbsp;&nbsp;{{clubList.clubDto.clubName}}&nbsp;&nbsp;</span>
								<span @click="likeClub"> <i class="fa-solid fa-heart" style="color: red;" v-if="isLike"></i> <i
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
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<div class="card-title">
						<h4 style="font-weight: bold">소모임 채팅</h4>
					</div>
				</div>
				<div class="card-body">
					<input type="text" class="send-input">
					<button class="btn-send">전송</button>
					
					<!-- 메세지 출력 공간 -->
					<div class="message-wrapper"></div>
				</div>
			</div>
		</div>

		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
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



</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
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
		
		clubMemberAnswer1:"",
		clubMemberAnswer2:"",
		clubMemberAnswer3:"",
		memberNo:"${login}",
		
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
	
},
mounted(){
	$(function() {
		disconnectOperation();//최초 상태 설정

		// 주소 자동 계산
		// - 표준 웹소켓 API는 주소를 ws:// 부터 작성해야 하므로 불필요한 host, port 등을 작성해야 한다.
		// - 웹소켓은 지원하는 브라우저가 적다(구버전 브라우저에서는 안됨)
		// - 이를 해결하기 위해 sockjs를 사용한다.
		var uri = "${pageContext.request.contextPath}/ws/channel";

		//접속 - 자바스크립트 표준 API 사용
		socket = new SockJS(uri);

		socket.onopen = function(e) {
			connectOperation();
			
			// 접속하자마자 나의 채널명을 서버로 전송해야한다(입장메세지)
			var message = {
				type: 1,
				name:"${channelName}",
			};
			var json = JSON.stringify(message);
			socket.send(json);
			
		};
		socket.onclose = function(e) {
			// console.log(arguments);
			disconnectOperation();
		};
		socket.onerror = function() {
			// console.log(arguments);
			alert("서버와의 연결 오류가 발생하였습니다.");
			disconnectOperation();
		};
		socket.onmessage = function(e) {
			// tip. 콘솔화면에 그냥 검은글자로 나오면 Stirng이다.
			// console.log(e.data);
			var data = JSON.parse(e.data); // json을 객체로 복구
			// var timeObject = new Date(data.time); // 날짜 객체로 변환(자바스크립트 표준 API)
			var timeObject = moment(data.time).format("YYYY-MM-DD hh:mm:ss"); // 날짜 객체로 변환(moment js)
			
			var div = $("<div>").addClass("message");
			if(data.auth == "관리자"){
				div.addClass("admin");
			}
			
			var span1 = $("<span>").addClass("user").text(data.memberId);
			var span2 = $("<span>").addClass("text").text(data.text);
			var span3 = $("<span>").addClass("time").text(timeObject);
			
			div.append(span1).append(span2).append(span3);
			$(".message-wrapper").append(div);
		};

		$(".btn-send").click(function() {
			// 채팅메세지를 보내야 한다.
			var text = $(".send-input").val();
			if (!text) return;
			
			var message = {
					type:2,
					name:"${channelName}",
					message:text
			};

			var json = JSON.stringify(message);
			socket.send(json); // 전송 명령 

			$(".send-input").val(""); // 초기화
		});

		function connectOperation() {//연결되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", false); // 입력창 활성화 
			$(".btn-send").prop("disabled", false); // 전송버튼 활성화
		};
		function disconnectOperation() {//연결 종료되면 처리할 화면 작업을 구현
			$(".send-input").prop("disabled", true); // 입력창 비활성화 
			$(".btn-send").prop("disabled", true); // 전송버튼 비활성화
		};
	});
},
created() {
	this.existLike();
	
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
},


});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>