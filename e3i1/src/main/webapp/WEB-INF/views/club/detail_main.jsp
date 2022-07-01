<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/modal.css">
<style>
</style>

<div id="app" class="container-fluid">

	<div class="row mt-2">
		<div class="col">
			<h1 class="text-center">소모임 상세페이지</h1>
		</div>
	</div>

	<div class="row mt-4">
		<div class="col-md-3">
			<div class="card">
				<h1>소모임 정보 부분</h1>
			</div>
		</div>
		
		<div class="col-md-6">
			<div class="card">
				<h1>메인 부분</h1>
			</div>
		</div>
		
		<div class="col-md-3">
			<button class="btn-create" v-on:click="removeHidden">소모임 가입하기</button>
		</div>
	</div>





	<!-- 소모임 생성 모달 -->
	<div class="modal" v-bind:class="isHidden" class="rounded">
		<div class="modal-overlay" v-on:click="addHidden"></div>

		<div class="modal-content mt-4">
			 <!-- <form action="create" method="post" enctype="multipart/form-data"> --> 
			 <form action="create" method="post" enctype="multipart/form-data"> 
			
				<!-- 세션 넣을 곳 -->
				<!-- <input type="hidden" v-model="memberNo"/> -->
				
				<div class="container-fluid">
					<div class="modal-header text-start">
						<h1>소모임 가입하기</h1>
					</div>

					<div class="modal-body">
						<div class="mt-2 text-start">
							<h4>기본 정보</h4>
							<p style="font-size: 10px">*나와 같은 관심사를 가진 멤버들과 함께 추억을 만들어보세요.</p>
						</div>

						<div class="row mt-4">
						<div class="col">
							<button type="button" class="btn-cancel" @click="addHidden">돌아가기</button>
						</div>
						<div class="col">
							<button type="submit" class="btn-create" name="createClub">가입하기</button>
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
},
created() {},
});
app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>