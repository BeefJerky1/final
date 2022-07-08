<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal.css">
<style>
.clubList{
	cursor: pointer;
}
.btn-plus{
	background-color:#3E4684;
	color: white;
}
.btn-minus{
	background-color:white;
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
	
	<!-- 검색창 -->
	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<div class="card">
				<div class="card-text">
					<p>검색부분</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 비회원이면 로그인 페이지로 보내기 -->
	
	
	
	<div class="row mt-4">
		<div class="col-md-2 offset-md-10" style="padding-right:50px">
			<button class="btn-create" v-on:click="removeHidden" @click.once="callList">소모임 생성</button>
		</div>
	</div>
	
	<div class="row mt-4">
		<div style="padding:50px"class="col-md-4" v-for="(club,index) in clubList" v-bind:key="index" @click="toDetailPage(index)">
			<div class="card">
				<img src="https://via.placeholder.com/250/69f/fff.png" class="card-img-top">
				<div class="card-body clubList">
					<h5 class="card-title" style="white-space:nowrap; overflow:hidden">{{club.clubName}}</h5>
					<h6 style="color:gray" class="card-subtitle">\#{{club.clubMainCategory}} / {{club.clubSubCategory}}</h6>
				</div>
			</div>
		</div>
	</div>


	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4" style="width:600px!important; position:absolute!important;">
		
				<!-- 세션 넣을 곳 -->
				<input type="hidden" ref="clubLeader" value="${login}"/>
				
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
							<label>대표 이미지 설정</label> 
							<input class="form-control" type="file" name="attach" accept="image/*" ref="clubProfile" name="clubProfile" onchange="previewFile()"/>
						</div>  
						<div class="mt-2">
							<img class="preview" style="width:100%; height:100px">
						</div>
						<div class="mt-2 text-start">
							<label>소모임 이름</label> 
							<input class="form-control rounded" type="text" name="clubName" v-model="clubName" v-on:input="clubName = $event.target.value" />
						</div>

						<div class="mt-2 text-start">
							<label>관심사</label>
							<div class="row">
								<div class="col">
									<select name="clubMainCategory" class="form-control rounded" @change="addSubCategoryList" v-model="clubMainCategory">
										<option value="">대분류를 선택해주세요</option>
										<option v-for="(category1,index) in mainCategoryList" v-bind:key="index" :value="category1.categoryContent">{{category1.categoryContent}}</option>
									</select>
								</div>
								<div class="col">
									<select name="clubSubCategory" class="form-control rounded" v-model="clubSubCategory">
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
							<textarea name="clubSummary" class="form-control rounded" v-model="clubSummary"></textarea>
						</div>
						<hr />
						<div class="text-start mt-2">
							<h4>가입 질문</h4>
							<p style="font-size: 10px">
								*질문 1개는 필수로 등록해야 합니다. <br> *질문은 최대 3개까지 설정가능합니다.
							</p>
						</div>
						
						<!-- 버튼 디자인 추후에 할 예정 -->
						<div class="text-end">
							<button @click="addInput" class="btn btn-plus">+</button>
							<button @click="removeInput" class="btn btn-minus">-</button>
						</div>
						<div class="text-start">
							<label>질문1</label>
							<input class="form-control rounded"	type="text" name="clubJoinQuestion1" v-model="clubJoinQuestion1" />
						</div>
						<div class="text-start" v-if="count > 1">
							<label>질문2</label>
							<input class="form-control rounded" type="text" name="clubJoinQuestion2" v-model="clubJoinQuestion2"/>
						</div>
						<div class="text-start" v-if="count > 2">
							<label>질문3</label> 
							<input class="form-control rounded" type="text" name="clubJoinQuestion3" v-model="clubJoinQuestion3"/>
						</div>

						<div class="row mt-4">
						<div class="col">
							<button type="button" class="btn-cancel" @click="addHidden">돌아가기</button>
						</div>
						<div class="col">
							<button type="submit" class="btn-create" @click="createClub">생성하기</button>
						</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</div>



<!-- 로다쉬 적용해야함 -->
<script>
//파일 미리보기
function previewFile() {
	  var preview = document.querySelector('.preview');
	  var file = document.querySelector('input[type=file]').files[0];
	  var reader = new FileReader();

	  reader.addEventListener(
	    'load',
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
		// 소모임 목록용
		clubList: [],
		
		isHidden:{
			"hidden" : true,
		},
		
	
		// 카테고리, 지역 목록용
		mainCategoryList: [],
		subCategoryList: [],
		address1List: [],
		address2List: [],
		
		// 소모임 생성 데이터
		clubLeader:"", // 세션으로 바꿔줘야 하는 부분
		clubName:"",
		clubSummary:"",
		clubJoinQuestion1:"",
		clubJoinQuestion2:"",
		clubJoinQuestion3:"",
		
		// 카테고리 대분류 번호
		clubMainCategory:"",
		// 카테고리 소분류
		clubSubCategory:"",
		
		// 시/도 번호
		address1No : "",
		// 시/군/구 값
		city: "",	
		
		count: 1,
	
	};
},
computed: {},
methods: {
	removeHidden(){
		this.isHidden["hidden"] = false;
	},
	
	addHidden(){
		this.isHidden["hidden"] = true; 
		
		this.clubName = "";
		this.clubSummary = "";
		this.clubMainCategory = "";
		this.clubSubCategory = "";
		this.address1No = "";
		this.city = "";
		this.clubJoinQuestion1 = "";
		this.clubJoinQuestion2 = "";
		this.clubJoinQuestion3 = "";
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
		if(this.clubMainCategory == ""){
			this.subCategoryList = [];
			return;
		}
		// 카테고리 - 분류
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/category2/"+this.clubMainCategory,
			method:"get",
		}).then((resp) => {
			this.clubSubCategory = "";
			this.subCategoryList = [];
			this.subCategoryList.push(...resp.data);
		})	
	},
	
	// 소모임 생성 with file
	createClub(){
		let formData = new FormData();
		
		//const fileInput = document.querySelector("input[name=clubProfile]");
		const fileInput = this.$refs.clubProfile;
		if(fileInput.files.length == 0) return;
		const fileData = fileInput.files[0];
		
		const session = this.$refs.clubLeader.value;
		if(session == null || session == ""){
			window.alert("로그인을 해주세요"); // 어차피 로그인을 해야지만 생성창이 뜨게 할 예정이라 필요없음
			return;
		}
		else{
			this.clubLeader = session;
		}
		
		formData.append('clubProfile', fileData);
		formData.append('clubLeader', this.clubLeader);
		formData.append('clubName', this.clubName);
		formData.append('clubSummary', this.clubSummary);
		formData.append('clubMainCategory', this.clubMainCategory);
		formData.append('clubSubCategory', this.clubSubCategory);
		formData.append('clubPlace', this.clubPlace);
		formData.append('clubJoinQuestion1', this.clubJoinQuestion1);
		formData.append('clubJoinQuestion2', this.clubJoinQuestion2);
		formData.append('clubJoinQuestion3', this.clubJoinQuestion3);
		
		axios({
			url:"${pageContext.request.contextPath}/rest/club/",
			method:"post",
			headers:{
				"Content-Type" : "multipart/form-data",
			},
			data: formData,
		}).then((resp) => {
			if(resp.data == 0){
				window.alert("이미 소모임을 가지고 있습니다.");
				return;
			}
			window.alert("소모임 생성 완료!");
			window.location.href="${pageContext.request.contextPath}/club/detail?clubNo="+resp.data;
		});
	},
	
	// 디테일 페이지 이동
	toDetailPage(index){
		window.location.href="${pageContext.request.contextPath}/club/detail?clubNo="+this.clubList[index].clubNo;
	},
	addInput(){
		if(this.count >= 3) return;
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

},
watch:{
	// 스크롤 이벤트 여기서 걸 예정이고 
	// 스크롤 이벤트는 디바운스로 처리해야한다.
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