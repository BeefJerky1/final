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
			<button class="btn-create" v-on:click="removeHidden" @click.once="callList">소모임 생성</button>
		</div>
	</div>

	<div class="row border" v-for="(club,index) in clubList" v-bind:key="index">
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
							<label>소모임 이름</label> 
							<input class="form-control rounded" type="text" name="clubName" />
						</div>

						<div class="mt-2 text-start">
							<label>관심사</label>
							<div class="row">
								<div class="col">
									<select name="clubMainCategory" class="form-control rounded" @change="addSubCategoryList" v-model="superNo">
										<option value="">대분류를 선택해주세요</option>
										<option v-for="(category1,index) in mainCategoryList" v-bind:key="index" :value="category1.categoryNo">{{category1.categoryContent}}</option>
									</select>
								</div>
								<div class="col">
									<select name="clubSubCategory" class="form-control rounded" v-model="subCategory">
										<option value="">소분류를 선택해주세요</option>
										<option v-for="(category2,index) in subCategoryList" v-bind:key="index" :value="category2.categoryContent">{{category2.categoryContent}}</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="mt-2 text-start">
							<label>지역</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList" v-model="address1No">
										<option value="">시/도를 선택해주세요</option>
										<option v-for="(address1, index) in address1List" v-bind:key="index" :value="address1.address1No" >{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="clubPlace" class="form-control rounded" v-model="city">
										<option value="">시/군/구를 선택해주세요</option>
										<option v-for="(address2, index) in address2List" v-bind:key="index" :value="address2.city">{{address2.city}}</option>
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



<script>
  
const app = Vue.createApp({
data() {
	return {
		// 소모임 목록용
		clubList: [],
		
		// 카테고리 대분류 번호
		superNo:"",
		// 카테고리 소분류
		subCategory:"",
		
		// 시/도 번호
		address1No : "",
		// 시/군/구 값
		city: "",
		
		
		// 카테고리, 지역 목록용
		mainCategoryList: [],
		subCategoryList: [],
		address1List: [],
		address2List: [],
		
		isHidden:{
			"hidden" : true,
		},
	};
},
computed: {},
methods: {
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
	},
	
	// 가입시 필요한 카테고리, 지역 목록
	callList(){
		// 카테고리 - 대분류
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/category1",
			method:"get",
		}).then((resp) => {
			this.mainCategoryList.push(...resp.data);
		})	
		
		// 시/도 
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address1",
			method:"get",
		}).then((resp) => {
			this.address1List.push(...resp.data);
		})	
	},
	
	// 시/군/구 추가
	addCityList(){
		if(this.address1No == ""){
			this.address2List = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address1No,
			method:"get",
		}).then((resp) => {
			this.city = "";
			this.address2List = [];
			this.address2List.push(...resp.data);
		})		
	},
	// 카테고리 소분류 추가
	addSubCategoryList(){
		if(this.superNo == ""){
			this.subCategoryList = [];
			return;
		}
		// 카테고리 - 분류
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/category2/"+this.superNo,
			method:"get",
		}).then((resp) => {
			this.subCategory = "";
			this.subCategoryList = [];
			this.subCategoryList.push(...resp.data);
		})	
	},
},
created() {
	axios({
			url: "${pageContext.request.contextPath}/rest/club/",
			method: "get",
		}).then((resp) => {
			this.clubList.push(...resp.data);
		})
	},
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>