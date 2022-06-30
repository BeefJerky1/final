<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
</style>

<div id="app" class="container-fluid">

	<div class="row mt-2">
		<div class="col">
			<h1 class="text-center">소모임 상세페이지</h1>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-8 offset-md-2">
			<button class="btn-create" v-on:click="removeHidden" @click.once="callList">소모임 생성</button>
		</div>
	</div>

	<div class="row border" v-for="(club,index) in clubList" v-bind:key="index">
		<div class="card">
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
	</div>

	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4">
			 <!-- <form action="create" method="post" enctype="multipart/form-data"> --> 
			 <form action="create" method="post" enctype="multipart/form-data"> 
			
				<!-- 세션 넣을 곳 -->
				<input type="hidden" v-model="clubLeader"/>
				
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
							<input class="form-control" type="file" name="attach" accept="img/*" />
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
							<label>질문1</label>
							<input class="form-control rounded"	type="text" name="clubJoinQuestion1" />
						</div>
						<div class="text-start">
							<label>질문2</label>
							<input class="form-control rounded" type="text" name="clubJoinQuestion2" />
						</div>
						<div class="text-start">
							<label>질문3</label> 
							<input class="form-control rounded" type="text" name="clubJoinQuestion3" />
						</div>

						<div class="row mt-4">
						<div class="col">
							<button type="button" class="btn-cancel" name="addHidden">돌아가기</button>
						</div>
						<div class="col">
							<button type="submit" class="btn-create" name="createClub">생성하기</button>
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
	};
},
computed: {},
methods: {},
created() {},
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>