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
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

.hidden {
	display: none;
}
</style>

<div id="app" class="container-fluid">

	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<div class="p-4 text-dark bg-light">
				<h1>소모임</h1>
			</div>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<div class="p-4 text-dark bg-light">
				<button class="btn btn-primary" v-on:click="removeHidden">소모임 생성</button>
			</div>
		</div>
	</div>

	<div class="row">
		<table class="table table-border">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>카테고리</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="(club,index) in clubList" v-bind:key="index">
					<td>{{club.clubNo}}</td>
					<td>{{club.clubName}}</td>
					<td>{{club.clubMainCategory}}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden">
		<div class="modal-overlay" v-on:click="addHidden"></div>
		<div class="modal-content">
			<form action="create" method="post">
				<input type="hidden" name="clubLeader" value="${login}">
				<div class="row center">
					<div class="row center">
						<h1>소모임 생성</h1>
					</div>
					<div class="row">
						<label>소모임 이름</label> <input type="text" name="clubName">
					</div>
					<div class="row">
						<label>소모임 설명</label>
						<textarea rows="10" cols="10" name="clubSummary"></textarea>
					</div>
					<div class="row">
						<label>소모임 대분류</label> <select name="clubMainCategory">
							<option>아웃도어/여행</option>
							<option>문화/공연/축제</option>
							<option>사교/인맥</option>
							<option>야구관람</option>
							<option>게임/오락</option>
							<option>자유주제</option>
							<option>운동/스포츠</option>
						</select>
					</div>
					<div class="row">
						<label>소모임 소분류</label> <input type="text" name="clubSubCategory">
						<!-- 대분류에서 선택한 하위항목에 맞는 목록이 보여지게 js사용하면 될듯 -->
					</div>
					<div class="row">
						<label>소모임 지역</label> <input type="text" name="clubPlace">
					</div>
					<div class="row">
						<label>소모임 질문1</label> <input type="text" name="clubJoinQuestion1">
					</div>
					<div class="row">
						<label>소모임 질문2</label> <input type="text" name="clubJoinQuestion2">
					</div>
					<div class="row">
						<label>소모임 질문3</label> <input type="text" name="clubJoinQuestion3">
					</div>
					<div class="row center">
						<button type="button" id="close" class="btn"
							v-on:click="addHidden">돌아가기</button>
						<button type="submit" class="btn btn-primary">생성하기</button>
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