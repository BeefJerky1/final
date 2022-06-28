<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.modal-overlay {
	background-color: rgba(0, 0, 0, 0.6);
	width: 100%;
	height: 100%;
	position: absolute;
}

.modal-content {
	background-color: white;
	padding: 50px 100px;
	text-align: center;
	position: relative;
	border-radius: 10px;
	width: 50%;
	height: 90%;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	max-height: 100%;
	overflow-y: auto;
}

.hidden {
	display: none;
}

textarea {
    width: 100%;
    height: 10em;
    border: none;
    resize: none;
 }
 
 .btn-create {
    background-color: #3E4684;
    padding: 10px;
    border-radius: 10px;
    width: 100%;
    border: none;
    color: white;
}

.btn-create:hover {
    transform: scale(1.05);
    background-color: #3E4684;
    border: none;
    color: white;
}
.btn-cancel {
	border: 1px solid #3E4684;
	background-color: white;
	color:#3E4684;
	padding: 10px;
	width: 100%;
	border-radius: 10px;
}
.btn-cancel:hover {
    transform: scale(1.05);
    background-color: white;
    border: 1px solid #3E4684;
    color: #3E4684;
}
</style>

<div id="app" class="container-fluid">

	<div class="row mt-2">
		<div class="col">
			<h1 class="text-center">소모임</h1>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<button class="btn-create" v-on:click="removeHidden">소모임 생성</button>
		</div>
	</div>

	<div class="row border" v-for="(club,index) in clubList"
		v-bind:key="index">
		<div>
			<img src="#">
		</div>
		<div>
			<span>{{club.clubName}}</span>
		</div>
		<div>
			<span>{{club.clubMainCategory}} / {{club.clubSubCategory}}</span>
		</div>
	</div>

	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4">
			<form action="create" method="post" enctype="multipart/form-data">
				<input type="hidden" name="clubLeader" value="${login}" />
				<div class="container-fluid">
					<div class="modal-header text-start">
						<h1>소모임 만들기</h1>
					</div>

					<div class="modal-body">
						<div class="mt-2 text-start">
							<h4>기본 정보</h4>
							<p style="font-size: 10px">*나와 같은 관심사를 가진 멤버를 모집하고 열심히 운영하여 소모임을 성장시켜보세요.</p>
						</div>
						<div class="mt-2 text-start">
							<label>대표 이미지 설정</label> <input class="form-control" type="file"
								name="attach" accept="img/*" />
						</div>
						<div class="mt-2 text-start">
							<label>소모임 이름</label> <input class="form-control rounded"
								type="text" name="clubName" />
						</div>

						<div class="mt-2 text-start">
							<label>관심사</label>
							<div class="row">
								<div class="col">
									<select name="clubMainCategory" class="form-control rounded">
										<option>#킹스맨</option>
										<option>#자연인</option>
									</select>
								</div>
								<div class="col">
									<select name="clubSubCategory" class="form-control rounded">
										<option>여행</option>
										<option>등산</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="mt-2 text-start">
							<label>지역</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded">
										<option>시/도</option>
									</select>
								</div>
								<div class="col">
									<select name="clubPlace" class="form-control rounded">
										<option>시/군/구</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="text-start mt-2">
							<label>소모임 소개</label>
							<textarea name="clubSummary" class="form-control rounded"></textarea>
						</div>
						<hr />
						<div class="text-start mt-2">
							<h4>가입 질문</h4>
							<p style="font-size: 10px">
								*질문 1개는 필수로 등록해야 합니다. <br> *질문은 최대 3개까지 설정가능합니다.
							</p>
						</div>
						<div class="text-start">
							<label>질문1</label> <input class="form-control rounded"
								type="text" name="clubJoinQuestion1" />
						</div>
						<div class="text-start">
							<label>질문2</label> <input class="form-control rounded"
								type="text" name="clubJoinQuestion2" />
						</div>
						<div class="text-start">
							<label>질문3</label> <input class="form-control rounded"
								type="text" name="clubJoinQuestion3" />
						</div>

						<div class="row mt-4">
						<div class="col">
							<button type="button" id="close" class="btn-cancel" v-on:click="addHidden">돌아가기</button>
						</div>
						<div class="col">
							<button type="submit" class="btn-create">생성하기</button>
						</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<script>
  
//div[id=app]을 제어할 수 있는 Vue instance를 생성
const app = Vue.createApp({
//data : 화면을 구현하는데 필요한 데이터를 작성한다.
data() {
	return {
		clubList: [],
		categoryList: [],
		
		isHidden:{
			"hidden" : true,
		},
	};
},
//computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
// - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
computed: {},
//methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
methods: {
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
	},
},
//watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
created() {
	axios({
			url: "${pageContext.request.contextPath}/rest/club/",
			method: "get",
		}).then((resp) => {
		//완성 시 코드
		this.clubList.push(...resp.data);
		})
	},
});
app.mount("#app");
</script>