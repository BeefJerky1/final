<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modal.css">
<style>
.clubList {
	cursor: pointer;
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

.club-card {
	transform: scale(1);
	transition: transform 0.3s ease-in-out;
	border-radius: 0px 0px 30px 30px !important;
}

.club-card:hover {
	transform: scale(1.05);
}

input[type=radio] {
	display: none !important;
}

input[type=checkbox] {
	display: none !important;
}

.mbti-photo1 {
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
}

.mbti-photo2 {
	width: 30px;
	height: 30px;
	border-radius: 70%;
	overflow: hidden;
}

.mbti-photo3 {
	width: 60px;
	height: 60px;
	border-radius: 70%;
	transform: scale(1);
	transition: transform 0.1s ease-in-out;
}

.mbti-photo3:hover {
	transform: scale(1.3);
}

.checkedMbti {
	border: 3px solid #3E4684;
	transform: scale(1.3);
}

.main-card {
	border-width: 0.25em;
}

.main-card:hover {
	border-color: #3E4684;
	border-width: 0.25em;
}

.checkedMain {
	color: #3E4684;
	font-size: 18px;
	font-weight: bold;
	border-color: #3E4684;
	border-width: 0.25em;
}

.hash-tag{
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 15px;
	font-size: 1em;
	font-weight: 900;
	margin: 0.5em;
	padding: 0.15em;
	transform: scale(1);
	transition: transform 0.1s ease-in-out;
}
.hash-tag:hover{
	transform: scale(1.3);
	background-color: gray;
	color:white;
}
.checkedSub {
	background-color: gray;
	color: white;
}
.likeCount {
	position:absolute;
	left:10px;
	top:20px;
}
select{
	width: 100px; 
	padding: .5em .5em; 
	border: 0.5px solid lightgray;
	font-family: inherit;  
	border-radius: 20px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
	color:#3E4684;
	font-weight:900;
	background:url('${pageContext.request.contextPath}/image/arrow.jpg') no-repeat 97% 50%/15px auto;
}
.btn-create2{
	background-color: #3E4684;
    padding: 10px;
    border-radius: 30px;
    width: 100px;
    border: none;
    color: white;
    left:20px;
    bottom:10px;
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
			<div class="card" style="border: 4px solid lightgray">
				<div class="card-text row mt-4 mb-4">
					<div class="col-md-2 text-center align-self-center">관심 카테고리</div>

					<div class="col-md-10 row ps-4"
						style="border-left: 1px solid lightgray;">

						<div class="col-md-3 card main-card my-2"
							:class="checkedMain(main.categoryContent)"
							style="width: 12rem; border-radius: 30px;"
							v-for="(main, index) in mainCategory" :key="index">
							<label :for="'main'+index">
								<div class="card-body m-1" style="padding: 15px 0px;">
									<h6 class="card-title text-center tagtitle">
										<span class="maincolor">\# {{main.categoryContent}} <i
											class="fa-solid fa-person-running" class="coloricon"
											v-if="main.categoryNo == 1"></i> <i
											class="fa-brands fa-instagram-square"
											v-if="main.categoryNo == 2"></i> <i
											class="fa-solid fa-hand-sparkles" v-if="main.categoryNo == 3"></i>
											<i class="fa-solid fa-user-group" v-if="main.categoryNo == 4"></i>
											<i class="fa-solid fa-book" v-if="main.categoryNo == 5"></i>
											<i class="fa-solid fa-cart-shopping"
											v-if="main.categoryNo == 6"></i> <i
											class="fa-solid fa-clapperboard" v-if="main.categoryNo == 7"></i>
											<i class="fa-solid fa-mountain-sun"
											v-if="main.categoryNo == 8"></i> <i class="fa-solid fa-paw"
											v-if="main.categoryNo == 9"></i> <i class="fa-solid fa-house"
											v-if="main.categoryNo == 10"></i>
										</span>
									</h6>
									<input :id="'main'+index" name="mainCategory" type="radio"
										@change="checkMain($event)" v-model="mainList"
										:value="main.categoryContent">
								</div>
							</label>
						</div>
						<hr>
						<span class="text-center" v-if="isNull">상위 카테고리를 선택해주세요</span>
						<div class="row">
							<div class="col mt-4 mb-2 text-center" v-for="(sub, index) in subCategory" :key="index">
								<label :for="'sub'+index">
										<span :class="checkedSub(sub.categoryContent)" class="hash-tag text-center">\#{{sub.categoryContent}}</span>
										<input :id="'sub'+index" name="subCategory" type="radio"
											v-model="subList" :value="sub.categoryContent">
								</label>
							</div>
						</div>

					</div>

				</div>

				<div style="border-top: 1px solid lightgray">
					<div class="row mt-4 mb-4 row">
						<div class="col-md-2 text-center align-self-center" style="padding:0px;">관심지역</div>

						<div class="col-md-4 align-self-center"
							style="border-left: 1px solid lightgray">
							<select class="form-control rounded" @change="cityList"
								v-model="place1No">
								<option value="">시/도를 선택해주세요</option>
								<option v-for="(p1, index) in place1" v-bind:key="index"
									:value="p1.address1No">{{p1.province}}</option>
							</select>
						</div>

						<div class="col-md-4 align-self-center">
							<select class="form-control rounded" v-model="city2">
								<option value="">시/군/구를 선택해주세요</option>
								<option v-for="(p2, index) in place2" v-bind:key="index"
									:value="p2.city">{{p2.city}}</option>
							</select>
						</div>

						<div class="col-md-2 text-center align-self-center" style="padding:0px;">
							<button class="btn-create p-0" style="width: 100px; height: 38px"
								@click="resetPage(), searchClubList()">검색</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- mbti -->
	<div class="mt-4 text-center" style="padding: 0px 50px; margin: 0px;">
		<div class="col-md-12 card mt-4 row shadow">
			<div class="col card-body text-center">
				<label for="enfp" style="margin: 10px"> 
				<div class="hoverMbti">ENFP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ENFP')}"
					src="${pageContext.request.contextPath}/image/mbti/강아지(ENFP).png">
				</label> 
				<input id="enfp" type="checkbox" value="ENFP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="istp" style="margin: 10px"> 
				<div class="hoverMbti">ISTP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ISTP')}"
					src="${pageContext.request.contextPath}/image/mbti/거북이(ISTP).png">
				</label> <input id="istp" type="checkbox" value="ISTP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="intp" style="margin: 10px"> 
				<div class="hoverMbti">INTP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('INTP')}"
					src="${pageContext.request.contextPath}/image/mbti/고양이(INTP).png">
				</label> <input id="intp" type="checkbox" value="INTP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="estj" style="margin: 10px"> 
				<div class="hoverMbti">ESTJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ESTJ')}"
					src="${pageContext.request.contextPath}/image/mbti/늑대(ESTJ).png">
				</label> <input id="estj" type="checkbox" value="ESTJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="enfj" style="margin: 10px"> 
				<div class="hoverMbti">ENFJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ENFJ')}"
					src="${pageContext.request.contextPath}/image/mbti/돌고래(ENFJ).png">
				</label> <input id="enfj" type="checkbox" value="ENFJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="esfp" style="margin: 10px"> 
				<div class="hoverMbti">ESFP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ESFP')}"
					src="${pageContext.request.contextPath}/image/mbti/물개(ESFP).png">
				</label> <input id="esfp" type="checkbox" value="ESFP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="infj" style="margin: 10px"> 
				<div class="hoverMbti">INFJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('INFJ')}"
					src="${pageContext.request.contextPath}/image/mbti/백조(INFJ).png">
				</label> <input id="infj" type="checkbox" value="INFJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="entj" style="margin: 10px"> 
				<div class="hoverMbti">ENTJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ENTJ')}"
					src="${pageContext.request.contextPath}/image/mbti/사자(ENTJ).png">
				</label> <input id="entj" type="checkbox" value="ENTJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="istj" style="margin: 10px"> 
				<div class="hoverMbti">ISTJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ISTJ')}"
					src="${pageContext.request.contextPath}/image/mbti/양(ISTJ).png">
				</label> <input id="istj" type="checkbox" value="ISTJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="entp" style="margin: 10px"> 
				<div class="hoverMbti">ENTP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ENTP')}"
					src="${pageContext.request.contextPath}/image/mbti/여우(ENTP).png">
				</label> <input id="entp" type="checkbox" value="ENTP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="estp" style="margin: 10px"> 
				<div class="hoverMbti">ESTP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ESTP')}"
					src="${pageContext.request.contextPath}/image/mbti/원숭이(ESTP).png">
				</label> <input id="estp" type="checkbox" value="ESTP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="infp" style="margin: 10px"> 
				<div class="hoverMbti">INFP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('INFP')}"
					src="${pageContext.request.contextPath}/image/mbti/코끼리(INFP).png">
				</label> <input id="infp" type="checkbox" value="INFP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="esfj" style="margin: 10px"> 
				<div class="hoverMbti">ESFJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ESFJ')}"
					src="${pageContext.request.contextPath}/image/mbti/코알라(ESFJ).png">
				</label> <input id="esfj" type="checkbox" value="ESFJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="isfp" style="margin: 10px"> 
				<div class="hoverMbti">ISFP</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ISFP')}"
					src="${pageContext.request.contextPath}/image/mbti/판다(ISFP).png">
				</label> <input id="isfp" type="checkbox" value="ISFP" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="isfj" style="margin: 10px"> 
				<div class="hoverMbti">ISFJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('ISFJ')}"
					src="${pageContext.request.contextPath}/image/mbti/펭귄(ISFJ).png">
				</label> <input id="isfj" type="checkbox" value="ISFJ" v-model="mbtiList" @change="resetPage(), searchClubList()">

				<label for="intj" style="margin: 10px"> 
				<div class="hoverMbti">INTJ</div>
				<img class="mbti-photo3 shadow mt-2" :class="{'checkedMbti':checkedMbti('INTJ')}"
					src="${pageContext.request.contextPath}/image/mbti/호랑이(INTJ).png">
				</label> <input id="intj" type="checkbox" value="INTJ" v-model="mbtiList" @change="resetPage(), searchClubList()">
			</div>
		</div>
	</div>
	

	<div class="row mt-4 align-self-center">
		<div class="col-md-10 align-self-center" style="padding-left:30px;">
			<button class="btn-create2" v-on:click="removeHidden" @click.once="callList">소모임 생성</button>
		</div>
		<div class="col-md-2 text-end" style="padding-right:30px">
			<select v-model="orderType" @change="resetPage(), searchClubList()">
				<option value="total ASC, clv.club_no DESC">기본</option>
				<option value="clv.club_no DESC, total ASC">최신순&#9653;</option>
				<option value="clv.club_no ASC, total ASC">최신순&#9663;</option>
				<option value="clc.like_count DESC">좋아요순&#9653;</option>
				<option value="clc.like_count ASC">좋아요순&#9663;</option>
				<option value="total DESC">인원순&#9653;</option>
				<option value="total ASC">인원순&#9663;</option>
			</select>
		</div>
	</div>

	<div class="row">
		<div class="text-center" v-if="clubList.length == 0">
			<div>
				<h2>해당하는 소모임이 아직 없숭이다...</h2>
			</div>
			<div class="mt-4">
				<img src="${pageContext.request.contextPath}/image/mbti/원숭이(ESTP).png" style="width: 200px; height: 200px;">
			</div>
		</div>
		<div style="padding: 30px" class="col-md-4" v-for="(club,index) in clubList" v-bind:key="index">
			<div class="card club-card shadow" @click="toDetailPage(index)">
				<div class="likeCount">
					<i class="fa-solid fa-heart fa-2x" style="color: red;"></i>
				</div>
				<img src="https://via.placeholder.com/250/69f/fff.png" style="width: 100%; height: 300px;" class="card-img-top"
					v-if="!isClubProfile(index)"> 
				<img class="card-img-top" style="width: 100%; height: 300px;"
					:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+club.clubProfileDto.attachNo"
					v-if="isClubProfile(index)">
					
				<div class="card-body clubList">
					<div class="col-md-12">
						<h5 class="card-title"
							style="white-space: nowrap; overflow: hidden">{{club.clubDto.clubName}}</h5>
						<h6 style="color: gray" class="card-subtitle">\#{{club.clubDto.clubMainCategory}}
							\# {{club.clubDto.clubSubCategory}}</h6>
					</div>
				</div>
				<div class="card-body row"
					style="margin: 0px; padding: 0px 0px 10px 10px">
					<div class="col-md-9">
						<!-- 제일 많은 MBTI -->
						<img class="mbti-photo1"
							src="${pageContext.request.contextPath}/image/mbti/코끼리(INFP).png"
							v-if="!isAnimalG(index)"> <img class="mbti-photo1"
							:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+club.animalPhotoG.attachNo"
							v-if="isAnimalG(index)">
						<!-- 제일 적은 MBTI -->
						<img class="mbti-photo2"
							src="${pageContext.request.contextPath}/image/mbti/돌고래(ENFJ).png"
							v-if="!isAnimalL(index)"> <img class="mbti-photo2"
							:src="'${pageContext.request.contextPath}/attachment/download?attachNo='+club.animalPhotoL.attachNo"
							v-if="isAnimalL(index)">
					</div>
					<div class="col-md-3 text-end">
						<div class="row">
							<i class="fa-solid fa-user-group"></i>
						</div>
						<div class="row-md-12 text-end">
							{{club.clubMbtiPercentVO.total}}/{{club.clubDto.clubMemberLimit}}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4"
			style="width: 800px !important; position: absolute !important;">

			<input type="hidden" ref="clubLeader" value="${login}" />

			<div class="container-fluid">
				<div class="modal-header text-start">
					<h1>소모임 만들기</h1>
				</div>

				<div class="modal-body">
					<div class="mt-2 text-start">
						<h4>기본 정보</h4>
						<p style="font-size: 10px">*나와 같은 관심사를 가진 멤버를 모집하고 열심히 운영하여
							소모임을 성장시켜보세요.</p>
					</div>
					<div class="mt-2 text-start">
						<label>대표 이미지 설정</label> <input class="form-control" type="file"
							accept="image/*" ref="clubProfile" name="clubProfile"
							onchange="previewFile()" />
					</div>
					<div class="mt-2">
						<img class="preview" style="width: 100%; height: 100px">
					</div>
					<div class="mt-2 text-start">
						<label>소모임 이름</label> <input class="form-control rounded"
							type="text" name="clubName" v-model="clubName"
							v-on:input="clubName = $event.target.value" />
					</div>

					<div class="mt-2 text-start">
						<label>관심사</label>
						<div class="row">
							<div class="col">
								<select name="clubMainCategory" class="form-control rounded"
									@change="addSubCategoryList" v-model="clubMainCategory">
									<option value="">대분류를 선택해주세요</option>
									<option v-for="(category1,index) in mainCategoryList"
										v-bind:key="index" :value="category1.categoryContent">{{category1.categoryContent}}</option>
								</select>
							</div>
							<div class="col">
								<select name="clubSubCategory" class="form-control rounded"
									v-model="clubSubCategory">
									<option value="">소분류를 선택해주세요</option>
									<option v-for="(category2,index) in subCategoryList"
										v-bind:key="index" :value="category2.categoryContent">{{category2.categoryContent}}</option>
								</select>
							</div>
						</div>
					</div>

					<div class="mt-2 text-start">
						<label>지역</label>
						<div class="row">
							<div class="col">
								<select class="form-control rounded" @change="addCityList"
									v-model="address1No">
									<option value="">시/도를 선택해주세요</option>
									<option v-for="(address1, index) in address1List"
										v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
								</select>
							</div>
							<div class="col">
								<select name="clubPlace" class="form-control rounded"
									v-model="city">
									<option value="">시/군/구를 선택해주세요</option>
									<option v-for="(address2, index) in address2List"
										v-bind:key="index" :value="address2.city">{{address2.city}}</option>
								</select>
							</div>
						</div>
					</div>

					<div class="text-start mt-2">
						<label>소모임 소개</label>
						<textarea name="clubSummary" class="form-control rounded"
							v-model="clubSummary"></textarea>
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
						<label>질문1</label> <input class="form-control rounded" type="text"
							name="clubJoinQuestion1" v-model="clubJoinQuestion1" />
					</div>
					<div class="text-start" v-if="count > 1">
						<label>질문2</label> <input class="form-control rounded" type="text"
							name="clubJoinQuestion2" v-model="clubJoinQuestion2" />
					</div>
					<div class="text-start" v-if="count > 2">
						<label>질문3</label> <input class="form-control rounded" type="text"
							name="clubJoinQuestion3" v-model="clubJoinQuestion3" />
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
	  
	  reader.addEventListener('load', function () {
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
		
		isChecked : false,
		
	
		// 카테고리, 지역 목록용
		mainCategoryList: [],
		subCategoryList: [],
		address1List: [],
		address2List: [],
		
		// 소모임 생성 데이터
		clubLeader:"", 
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
		
		// 검색창 
		mainCategory:[],
		subCategory: [],
		place1: [],
		place2: [],
		
		place1No: "",
		city2: "",
		
		mainList:[],
		subList:[],
		mbtiList:[],
		
		page:1,
		orderType:"total ASC, clv.club_no DESC",
	};
},
computed: {
	isNull(){
		if(this.mainList.length != 0){
			return false;
		}
		return true;
	},
},
methods: {
	// mbti check
	checkedMbti(value){
		return this.mbtiList?.includes(value);
	},
	// 메인 체크여부
	checkedMain(target){
		const index1 = this.mainList.indexOf(target);
		return index1 >= 0 ? {checkedMain : true} : {checkedMain : false}
	},
	
	// 서브 체크여부
	checkedSub(target){
		const index2 = this.subList.indexOf(target);
		return index2 >= 0 ? {checkedSub : true} : {checkedSub : false}
	},
	
	isCheck(index){
		if(input[id=main+index]==checked){
			return true;
		}
		return false;
	},
	
	isClubProfile(index){
		if(this.clubList[index].clubProfileDto != null){
			if(this.clubList[index].clubProfileDto.attachNo != 0){
				return true;
			}
		}
		return false;
	},
	
	isAnimalG(index){
		if(this.clubList[index].animalPhotoG != null){
			if(this.clubList[index].animalPhotoG.attachNo != 0){
				return true;
			}
		}
		return false;
	},
	
	isAnimalL(index){
		if(this.clubList[index].animalPhotoL != null){
			if(this.clubList[index].animalPhotoL.attachNo != 0){
				return true;
			}
		}
		return false;
	},
	
	removeHidden(){
		if(this.$refs.clubLeader.value == ""){
			window.location.href="${pageContext.request.contextPath}/member/login/";
			return;
		}
		
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
		
		this.$refs.clubProfile.value = null;
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
		window.location.href="${pageContext.request.contextPath}/club/detail?clubNo="+this.clubList[index].clubDto.clubNo;
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
	
	// 검색 카테고리
	searchList(){
		// 메인 카테고리
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/category1",
			method:"get",
		}).then((resp) => {
			this.mainCategory.push(...resp.data);
		})	
		// 시/도 
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address1",
			method:"get",
		}).then((resp) => {
			this.place1.push(...resp.data);
		})	
	},
	// 검색 시/군/구
	cityList(){
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.place1No,
			method:"get",
		}).then((resp) => {
			this.city2 = "";
			this.place2 = [];
			this.place2.push(...resp.data);
		})		
	},
	
	// 메인 카테고리 검색 
	checkMain(event){
		this.isChecked = !this.isChecked;
		
		// 카테고리 - 분류
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/category2/"+this.mainList,
			method:"get",
		}).then((resp) => {
			this.subCategory = [];
			this.subCategory.push(...resp.data);
		})	
	},
	
	/* // 전체 목록
	clubAllList:_.debounce(function(){
		
		axios({
    		url: "${pageContext.request.contextPath}/rest/club/"+this.page,
    		method: "get",
    	})
    	.then(resp=>{
    		if(resp.data.length == 0){
    			return;
    		}
    		this.clubList.push(...resp.data);
    		this.page++;
    	});
	},250), */
	
	// 검색 및 전체 소모임 목록 
	searchClubList:_.debounce(function(){
		
		const clubComplexSearchVO = {};
		clubComplexSearchVO.page = this.page;
		clubComplexSearchVO.orderType = this.orderType;
		if(this.mainList != null && this.mainList.length > 0){
			clubComplexSearchVO.mainList = this.mainList;
		}; 
		if(this.subList != null && this.subList.length > 0){
			clubComplexSearchVO.subList = this.subList;
		};
		if(this.city2 != null && !this.city2 != ''){
			clubComplexSearchVO.city2 = this.city2;
		};
		if(this.mbtiList != null && this.mbtiList.length > 0){
			clubComplexSearchVO.mbtiList = this.mbtiList;
		};
		
		if(this.mainList.length > 0 || this.subList.length > 0 || this.city2 != '' || this.mbtiList.length > 0){
			console.log(clubComplexSearchVO);
			console.log("검색");
			axios({
				url: "${pageContext.request.contextPath}/rest/club/search",
				method: "post",
				data:clubComplexSearchVO, 
			}).then((resp) => {
				if(this.page == 1) {
					this.clubList = resp.data;
				}
				else{
					this.clubList.push(...resp.data);
				}
		    	this.page++;
			});
		}
		else{
			console.log("리스트");
			axios({
	    		url: "${pageContext.request.contextPath}/rest/club/"+this.page+"/"+this.orderType,
	    		method: "get",
	    	})
	    	.then(resp=>{
	    		if(resp.data.length == 0){
	    			return;
	    		}
	    		if(this.page == 1){
	    			this.clubList = resp.data;
	    		}
	    		else{
	    			this.clubList.push(...resp.data);
	    		}
	    		this.page++;
	    	});
		}
		
	},250),
	
	resetPage(){
		console.log("초기화");
		this.page = 1;
	},
},
mounted(){
	// 스크롤 이벤트 여기서 걸 예정이고 
	// 스크롤 이벤트는 디바운스로 처리해야한다.
	$(window).scroll((resp)=>{
	     var scrTop = $(window).scrollTop();
	     const bottom = ($(document).height() - $(window).height() - 10);
	     if(scrTop > bottom){
	    	this.searchClubList();
	     }
	});
},
created() {
	 this.searchList();
	 this.searchClubList();
	},
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>