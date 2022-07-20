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
				<div class="card-body">
					<div class="card-title text-center mt-2">
						<span class="boldfontL"  style="color:#3E4684;">소모임 회원 관리</span>
					</div>
				</div>
				<div class="card-body">
				
				 	 <table class="table table-hover text-center mb-4">
						<thead class="boldfontS">
							<th><input type="checkbox" v-model="selectAll"></th>
							<th>회원이름</th>
							<th>회원등급</th>
							<th>신청/승인 날짜</th>
							<th>승인여부</th>
						</thead>
						<tbody class="fontSS">
							<template v-for="(clubMember, index) in clubMemberList" :key="index">
								<tr class="show-detail">
									<th><input type="checkbox" v-model="selected" :value=clubMember.clubMemberDto.memberNo></th>
									<td v-if="clubMember.clubMemberDto != null">{{clubMember.memberDto.memberNick}}</td>
									<td v-if="clubMember.clubMemberDto.clubMemberGrade == 1">관리자</td>
									<td v-if="clubMember.clubMemberDto.clubMemberGrade == 0">일반</td>
									<td>{{convertTime(clubMember.clubMemberDto.clubMemberDate)}}</td>
									<td v-if="clubMember.clubMemberDto.clubMemberPermission == 0">대기중</td>
									<td v-if="clubMember.clubMemberDto.clubMemberPermission == 1" style="color:green">승인</td>
									<td v-if="clubMember.clubMemberDto.clubMemberPermission == 2" style="color:red">거절</td>
									<td v-if="clubMember.clubMemberDto.clubMemberGrade != 1" class="detail">
										<tr v-if="clubMember.clubMemberDto.clubMemberGrade != 1">
											<td colspan="6" v-if="clubMember != null">
												<div if="clubMember.clubMemberDto.clubMemberAnswer1 != null">
													답변1 : {{clubMember.clubMemberDto.clubMemberAnswer1}}
												</div>
												<div if="clubMember.clubMemberDto.clubMemberAnswer2 != null">
													답변2 :{{clubMember.clubMemberDto.clubMemberAnswer2}}
												</div>
												<div if="clubMember.clubMemberDto.clubMemberAnswer3 != null">
													답변3 : {{clubMember.clubMemberDto.clubMemberAnswer3}}
												</div>
												<div if="clubMember.clubMemberDto.clubRefuseCount != null">
													거절 횟수 : {{clubMember.clubMemberDto.clubRefuseCount}}
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
									</td>
								</tr>
							</template>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>

		<!-- 오른쪽 사이드바 -->
		<div class="col-md-3">
			<button class="btn-create shadow" v-on:click="removeHidden1">메세지 보내기</button>
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
					<div class="modal-title">
						<h4>승인 거절</h4>
					</div>
	             	<!-- 내용 작성 -->
	               <div class="modal-body p-0 mb-3">
	                  <div class="form-floating">
	                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" v-model="clubMemberRefuseMsg" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" :maxlength="contentMax"></textarea>
	                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
	                  </div>
	               </div>
					<span class="leg">
	                <span class="text-muted count2" >{{messageContent.length}}</span> 
	                    	/
	               <span class="text-muted total">{{contentMax}}</span> 
	               </span>		
					<div class="row mt-4">
					<div class="col">
						<button type="button" class="btn-cancel" @click="addHidden">취소</button>
					</div>
					<div class="col">
						<button type="submit" class="btn-create" v-on:click="refuseClub">전송</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		
		
	<!-- 전체메세지 모달창 -->
	<div class="modal" v-bind:class="isHidden1" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden1"></div>

		<div class="modal-content mt-4" style="width:600px!important; height:450px!important; position:absolute!important;">
		
			<div class="container-fluid">
				    <!-- 닉네임 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <div class=" rounded-5 border-0 shadow-sm readonly" id="floatingTextarea1" style="height: 50px"><b>To:{{selected}}</b></div>
                </div>
             </div>
               <!-- 제목 작성 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <input type="text" class="form-control rounded-5 border-0 shadow-sm" v-model="messageTitle"  id="floatingTextarea2" style="height: 50px" :maxlength="titleMax">
                   <label for="floatingTextarea2" class="h6 text-muted mb-0">제목을 작성하세요.</label>
                </div>
             </div>
             	<!-- 내용 작성 -->
               <div class="modal-body p-0 mb-3">
                  <div class="form-floating">
                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" v-model="messageContent"placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" :maxlength="contentMax"></textarea>
                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
                  </div>
               </div>
				<span class="leg">
                <span class="text-muted count2" >{{messageContent.length}}</span> 
                    	/
               <span class="text-muted total">{{contentMax}}</span> 
               </span>		
				<div class="row mt-4">
				<div class="col">
					<button type="button" class="btn-cancel" @click="addHidden1">취소</button>
				</div>
				<div class="col">
					<button type="submit" class="btn-create" v-on:click="sendMessage()">전송</button>
				</div>
				</div>
			</div>
		</div>
	</div>
	
</div>



<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(".show-detail").click(function(){
	    	 console.log("되는가");
	});
	$(".show-detail").each(function(){
	     $(this).click(function() {
	    	 console.log("되는가");
	        $(this).children("tr").find(".detail").toggle();
	     });
	  });
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
		
		
        //메세지
        messageContent:"",
        messageTitle:"",
        checked:"",
        selected: [],
        titleMax:30,
        contentMax:300,
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
		return this.clubList.clubDto != null && this.memberNo == this.clubList.clubDto.clubLeader
	},
	selectAll: {
        get: function () {
            return this.clubMemberList ? this.selected.length == this.clubMemberList.length : false;
        },
        set: function (value) {
            var selected = [];

            if (value) {
                this.clubMemberList.forEach(function (clubMember) {
                    selected.push(clubMember.memberDto.memberNo);
                });
            }

            this.selected = selected;
        }
    },
},
methods: {
	//moment js
    convertTime(time){
    	return moment(time).format('YYYY-MM-DD'); 
    },
	
	removeHidden(index){
    	console.log("되나");
		this.isHidden["hidden"] = false;
		
		this.index = index;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
		
	},
	
	removeHidden1(){
		this.isHidden1["hidden1"] = false;
		
	},
	
	addHidden1(){
		this.isHidden1["hidden1"] = true; 
		
		this.messageContent = "";
		this.messageTitle = "";
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
	refuseClub(){
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
			window.alert("거절 완료");
			window.location.href="${pageContext.request.contextPath}/club/member_management?clubNo="+this.clubNo;
		});
	},
	//회원에게 메세지 보내기
	sendMessage(){
			if(this.messageContent=='' ||this.messageContent==null)return
			let formData = new FormData();
	    for (let i = 0; i < this.selected.length; i++) { 
	        formData.append("asdf", this.selected[i]); // 반복문을 활용하여 파일들을 formData 객체에 추가한다
	     }
		formData.append('messageWriter', this.memberNo);
		formData.append('messageContent', this.messageContent);
		formData.append('messageTitle', this.messageTitle);
				axios({
					url:"${pageContext.request.contextPath}/rest/message/sendAll",
					method:"post",
					headers:{
    				"Content-Type" : "multipart/form-data",
    			},
					data:formData,
					
				}).then(resp=>{
					this.selected=resp.data;
					window.alert(this.selected.length+"명의 회원에게 메세지가 전달하였습니다.")
					this.addHidden();
					window.location.href="${pageContext.request.contextPath}/club/member_management?clubNo="+this.clubNo;
				})
    	
    	
			
		},
	
},
mounted(){
	$(function(){
		$(".show-detail").click(function(){
	    	 console.log("되는가");
		});
		$(".show-detail").each(function(){
			 console.log("되나");
		     $(this).click(function() {
		   	  console.log("되나");
		        $(this).children("tr").find(".detail").toggle();
		     });
		  });
	});
},
created() {
	this.existLike();
	
	axios({
		url: "${pageContext.request.contextPath}/rest/club/detail/"+this.clubNo,
		method: "get",
	}).then((resp) => {
		this.clubList = resp.data;
	})
	
	// 소모임 신청 회원 정보
	axios({
		url: "${pageContext.request.contextPath}/rest/club/member_permission/"+this.clubNo,
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