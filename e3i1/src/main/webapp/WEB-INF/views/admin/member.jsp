<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원관리</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="${root}/css/sidebars.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/club.css">
<style>
.cont {
	background-color: white;
	color: black;
}

.info {
	height: 59px;
}

li button {
	color: black !important;
}

li button:hover {
	color: white !important;
	background-color: #3E4684 !important
}

.container-fluid {
	padding-left: 0px !important;
}

li a {
	background-color: white !important;
	color: black !important;
}

li a:hover {
	background-color: #3E4684 !important;
	color: white !important;
}

.logo-item {
	width: 100% !important;
}

.tableInterest2 {
	background-color: #E9E9E9;
	color: #3E4684;
	font-size: 0.85em;
	font-weight: 600;
	width: 30px;
}
</style>
</head>

<body>

	<div id="app" class="container-fluid">
		<div class="row mb-5">
			<div class="col-lg-2 col-md-2 col-sm-2 border">
				<div class=" p-4">
					<a href="${root}"><img class="logo-item"
						src="${root }/image/LOGO.png"></a>
					<div class="row p-4 border-bottom">
						<span class="fs-5 fw-semibold"><a href="${root}/admin/">관리자
								페이지</a></span>
					</div>
					<ul class="list-unstyled ps-0 p-4">
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#user-collapse"
								aria-expanded="flase">회원</button>
							<div class="collapse" id="user-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/member"
										class="link-light rounded">회원 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#payment-collapse"
								aria-expanded="false">결제</button>
							<div class="collapse" id="payment-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/payment"
										class="link-light rounded">결제 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#club-collapse"
								aria-expanded="false">소모임</button>
							<div class="collapse" id="club-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/club"
										class="link-light rounded">소모임 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#board-collapse"
								aria-expanded="false">MBTI 게시판</button>
							<div class="collapse" id="board-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/mbtiboard"
										class="link-light rounded">게시글 목록</a></li>
								</ul>
							</div>
						</li>
						<li class="mb-1">
							<button
								class="btn btn-toggle align-items-center rounded collapsed"
								data-bs-toggle="collapse" data-bs-target="#mbti-collapse"
								aria-expanded="false">MBTI 설문</button>
							<div class="collapse" id="mbti-collapse">
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><a href="${root}/admin/mbtisurvey"
										class="link-light rounded">MBTI 설문</a></li>
									<li><a href="${root}/admin/mbtianimal"
										class="link-light rounded">MBTI 동물</a></li>
								</ul>
							</div>
						</li>
						<li class="border-top my-3"></li>
					</ul>
				</div>
			</div>
			<!-- 중앙 -->
			<div class="col-md-6 mb-5">
				<div class="card">
					<div class="card-body">
						<div class="card-title text-center mt-2">
							<span class="boldfontL" style="color: #3E4684;">회원 관리</span>
						</div>
					</div>
					<div class="card-body">

						<table class="table table-hover text-center mb-4">
							<thead class="boldfontS">
								<tr>
									<th><input type="checkbox" id="checkbox"
										v-model="selectAll"></th>
									<th>번호</th>
									<th>이메일</th>
									<th>닉네임</th>
									<th>이름</th>
									<th>성별</th>
									<th>생일</th>
									<th>소모임</th>
									<th>신고</th>
									<th>마지막 로그인</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
								<tr v-for="(member1 , index) in member">
									<td><input type="checkbox" v-model="selected"
										:value=member1.memberNo></td>
									<td>{{member1.memberNo}}</td>
									<td>{{member1.memberEmail}}</td>
									<td>{{member1.memberNick}}</td>
									<td>{{member1.memberName}}</td>
									<td>{{member1.memberGender}}</td>
									<td>{{convertTime(member1.memberBirth)}}</td>
									<!--   					<td>{{member.memberInterest1}}</td> -->
									<td>{{member1.memberClubCount}}</td>
									<td>{{member1.memberReportCount}}</td>
									<td>{{elapsedText(member1.memberLogindate)}}</td>
									<td>
										<button type="button" class="btn btn-outline-secondary"
											v-on:click=" select(index)">수정</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<button type="button" v-on:click="append()"
						:disabled="this.dataFull == true"
						class="form-control btn-outline-primary "
						style="border-radius: 1em !important">더보기
						({{showMember}}/{{totalMember}})</button>
					<!--  게시글 더보기에서 메시지 보내기  -->
					<div class="modal fade" id="postModal" data-bs-keyboard="false"
						tabindex="-1" aria-labelledby="staticBackdropLabel"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content rounded-4 p-4 border-0 bg-light">
								<div
									class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
									<a href="#"
										class="text-muted text-decoration-none material-icons"
										data-bs-dismiss="modal">arrow_back_ios_new</a>
									<h5 class="modal-title text-muted ms-3 ln-0"
										id="staticBackdropLabel">
										<span class="material-icons md-32">account_circle</span>
									</h5>
								</div>
								<!-- 닉네임 -->
								<div class="modal-body p-0 mb-3">
									<div class="form-floating">
										<div class=" rounded-5 border-0 shadow-sm readonly"
											id="floatingTextarea1" style="height: 50px">
											<b>To:{{selected}}</b>
										</div>
									</div>
								</div>
								<!-- 제목 작성 -->
								<div class="modal-body p-0 mb-3">
									<div class="form-floating">
										<input type="text"
											class="form-control rounded-5 border-0 shadow-sm"
											v-model="messageTitle" id="floatingTextarea2"
											style="height: 50px"> <label for="floatingTextarea2"
											class="h6 text-muted mb-0">제목을 작성하세요.</label>
									</div>
								</div>
								<!-- 내용 작성 -->
								<div class="modal-body p-0 mb-3">
									<div class="form-floating">
										<textarea
											class="reviewC form-control rounded-5 border-0 shadow-sm"
											v-model="messageContent" placeholder="Leave a comment here"
											id="floatingTextarea2" style="height: 200px"></textarea>
										<label for="floatingTextarea2" class="h6 text-muted mb-0">내용을
											작성하세요.</label>
									</div>
								</div>

								<div
									class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
									<div
										class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
										<span class="leg"> <span class="text-muted count2">0</span>
											/ <span class="text-muted total">100</span>
										</span>
									</div>
									<div class="ms-auto m-0">
										<button type="button" v-on:click="sendMessage()"
											data-bs-dismiss="modal" data-bs-target="#postModal"
											class="writeButton btn btn-primary fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center"
											style="border-radius: 1em; background-color: #514e85; border: none; font-size: 14px !important;">보내기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</div>
			</div>
			<!-- 중앙 끝 -->
			<!-- 사이드바  -->
			<div class="col-md-3">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 mt-5 p-4">
						<h5>회원 목록 (총: {{count}}명)</h5>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 mt-5 p-4 text-start">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<h5>검색</h5>
								<form class="form-floating">
									<input type="text" class="form-control" v-model="memberNo"
										id="memberNo" placeholder="번호"> <label for="memberNo">번호</label>
								</form>
								<form class="form-floating">
									<input type="text" class="form-control" v-model="memberEmail"
										id="memberEmail" placeholder="이메일"> <label
										for="memberEmail">이메일</label>
								</form>
								<form class="form-floating">
									<input type="text" class="form-control" v-model="memberNick"
										id="memberNick" placeholder="닉네임"> <label
										for="memberNick">닉네임</label>
								</form>
								<form class="form-floating">
									<input type="text" class="form-control" v-model="memberName"
										id="memberName" placeholder="이름"> <label
										for="memberName">이름</label>
								</form>
								<form class="form-floating">
									<input type="text" class="form-control" v-model="memberPhone"
										id="memberPhone" placeholder="전화번호"> <label
										for="memberPhone">전화번호</label>
								</form>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<h5>정렬</h5>
								<select class="form-control" v-model="column"
									v-on:change="memberList()">
									<option value="member_no">회원번호</option>
									<option value="member_nick">닉네임</option>
									<option value="member_name">이름</option>
									<option value="member_email">이메일</option>
									<option value="member_logindate">로그인 날짜</option>
								</select> <select class="form-control mb-5" v-model="order"
									v-on:change="memberList()">
									<option value="asc">오름차순</option>
									<option value="desc">내림차순</option>
								</select>
								<button type="button" class="btn btn-primary form-control"
									v-on:click="search()">조회</button>
								<button type="button" class="btn btn-success form-control"
									v-on:click="reset()">초기화</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- vue js도 lazy loading을 사용한다 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://unpkg.com/vue@next"></script>
	<script src="${root}/js/sidebars.js"></script>
	<script src="${root}/js/time.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
	<!-- char.js cdn-->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>
	<script>
        const app = Vue.createApp({
            data(){
                return {
                	deleteResult:"",//삭제 결과
//     				orderType:"memberNoAsc",//정렬 방식
    				editMode:false,
    				
    				//더보기
    				allMember:{},//전체 리스트
    				member:{}, //보여지는 리스트
    	            totalMember:0, //전체 멤버
                    showMember:10, //보여주는 멤버 수
                    MemberLeft:0,//남은 멤버 수
                    dataFull:false,
                    
                    //검색
                    memberEmail:"",
                    memberName:"",
                    memberPhone:"",
                    memberNick:"",
                    memberNo:"", 
                    column:"member_no",
                    order:"asc",
                    
                    //총 회원수
                    count:"",
                    
                    
                    //메세지
                    messageContent:"",
                    messageTitle:"",
                    admin:"1",	
                    checked:"",
                    selected: [],
                    allSelected: false,
                };
            },
            computed:{
            	
            	selectAll: {
                    get: function () {
                        return this.allMember ? this.selected.length == this.allMember.length : false;
                    },
                    set: function (value) {
                        var selected = [];

                        if (value) {
                            this.allMember.forEach(function (member1) {
                                selected.push(member1.memberNo);
                            });
                        }

                        this.selected = selected;
                    }
                },
            },
            methods:{
            	//멤버 전체 조회
				memberList(){
            			axios({
    						url:"${pageContext.request.contextPath}/rest/admin/member/"+this.column+"/"+this.order,
    						method:"get",
    					}).then(resp=>{
    						let data = []
    						for(var i = 0; i<this.showMember;i++){
    							data.push(resp.data[i])
    						}
    						this.allMember = resp.data,
    						this.member = data,
    						this.totalMember = this.allMember.length
    						if(this.totalMember < this.showMember){
    							this.showMember = this.totalMember;
    							this.member = this.allMember;
    	                		this.dataFull=true;
    						}else if(this.totalMember==this.showMember){
    	                		this.dataFull=true;
    						}
    					});
			
				},
				append(){
                	this.memberLeft = this.totalMember- this.showMember;
                	if(this.memberLeft < 5){
						this.showMember = this.totalMember;
						this.member = this.allMember;
						this.memberLeft = this.totalMember- this.showMember;
	                	this.memberList();
                	}else 
                	if(this.memberLeft >= 5){
                		this.showMember +=5
                		this.memberLeft = this.totalMember- this.showMember;
                	let data =[]
                	for(var i=0; i<this.showMember; i++){
                		data.push(this.allMember[i])
                	}
                	this.member = data
                	this.memberList();
                	//남은 게시글 수가 0개라면 버튼 클릭 X
                	}else if(this.memberLeft==0){
                		this.dataFull=true;
                		
                	}
                	
                },
				//멤버 상세 조회
	            select: function(index) {
	                	const member = this.allMember[index];
	                	window.location.href='http://localhost:8080/e3i1/admin/member_detail?memberNo='+member.memberNo;
	              },
				//멤버 삭제
	             deleteMember(){
						const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
						if(choice==false)return
                    	axios({
                    		url:"${pageContext.request.contextPath}/rest/admin/member/"+this.selected,
                    		method:"delete",
                    	}).then(resp=>{
                    		this.deleteResult = resp.data;
							window.alert("회원이 삭제되었습니다.")
                    		this.memberList();
                    		
                    	})
                	
                },
                //시간 바꾸기
                elapsedText(date) {
                	return dateformat.elapsedText(new Date(date));
                },
                //moment js
		        convertTime(time){
                	return moment(time).format("MM/DD");   //월 일
		        },
		        //검색
                search(){
           			axios({
						url:"${pageContext.request.contextPath}/rest/admin/member/",
						method:"post",
						data:{
							memberEmail:this.memberEmail,
			                memberName:this.memberName,
			                memberPhone:this.memberPhone,
			                memberNick:this.memberNick,
			                memberNo:this.memberNo, 
							column:this.column,
							order:this.order,
						}
					}).then(resp=>{
						let data = []
						for(var i = 0; i<this.showMember;i++){
							data.push(resp.data[i])
						}
						this.allMember = resp.data,
						this.member = data,
						this.totalMember = this.allMember.length
						
						if(this.totalMember < this.showMember){
// 							this.showReply = this.totalReply; //보이는 수를 전체 게시글수로 변경
							this.member = this.allMember;	//게시글에 게시글 전체를 넣는다.
	                		this.dataFull=true;	//버튼은 disable
						}else if(this.totalMember>this.showMember){ 
	                		this.dataFull=false; //버튼은 disable
						}else if(this.totalMember==this.showMember){//전체 게시글 수와 보이는 게시글 수가 동일하면
							this.dataFull=true;	//버튼은 disable
						}
					});
                },
                reset(){
                	this.order="asc";
                	this.column="member_no";
                	this.memberEmail ="",
	                this.memberName ="",
	               	this.memberPhone ="",
	                this.memberNick ="",
	                this.memberNo ="", 
                	this.memberList();
                },
                memberCount(){
                	axios({
                		url:"${pageContext.request.contextPath}/rest/admin/membercount",
                		method:"get",
                	}).then(resp=>{
                		this.count =resp.data
                	})
                },
 				sendMessage(){
	 				if(this.messageContent=='' ||this.messageContent==null)return
	 				let formData = new FormData();
            	    for (let i = 0; i < this.selected.length; i++) { 
            	        formData.append("asdf", this.selected[i]); // 반복문을 활용하여 파일들을 formData 객체에 추가한다
            	     }
            		formData.append('messageWriter', this.admin);
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
	 						console.log(this.selected)
	 						window.alert(this.selected.length+"명의 회원에게 메세지가 전달하였습니다.")
	 					})
                	
                	
 					
 				},
		       
            },
            created(){
            	this.memberList();
            	this.memberCount();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>