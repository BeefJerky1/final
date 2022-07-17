<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>mbti설문</title>
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
<style>
.card-img-top{
	width:250px !important;
	height:250px !important;
}
.fa-minus{
	color:red;
	cursor:pointer !important;
}
.fa-plus{
	color:green;
	cursor:pointer !important;
}
.question{
	color:red;
}
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
		<div class="row">
		<!-- 사이드바 -->
			<div class="col-lg-2 col-md-2 col-sm-2 border">
				<div class=" p-4">
					<a href="${root}"><img class="logo-item"
						src="${root }/image/LOGO.png"></a>
					<div class="row p-4 border-bottom">
						<span class="fs-5 fw-semibold">관리자 페이지</span>
					</div>
					 <ul class="list-unstyled ps-0 p-4">
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#user-collapse" aria-expanded="flase">
          회원
        </button>
        <div class="collapse" id="user-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/member" class="link-light rounded">회원 목록</a></li>
            <li><a href="#" class="link-light rounded">회원 차트</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#club-collapse" aria-expanded="false">
          소모임
        </button>
        <div class="collapse" id="club-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/club" class="link-light rounded">소모임 목록</a></li>
            <li><a href="#" class="link-light rounded">소모임 차트</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#board-collapse" aria-expanded="false">
         MBTI 게시판
        </button>
        <div class="collapse" id="board-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/mbtiboard" class="link-light rounded">게시글 목록</a></li>
            <li><a href="#" class="link-light rounded">게시글 차트</a></li>
          </ul>
        </div>
      </li>
           <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#mbti-collapse" aria-expanded="false">
        MBTI 설문
        </button>
        <div class="collapse" id="mbti-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${root}/admin/mbtisurvey" class="link-light rounded">MBTI 설문</a></li>
            <li><a href="${root}/admin/mbtianimal" class="link-light rounded">MBTI 동물</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          설정
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-light rounded">설정</a></li>
            <li><a href="#" class="link-light rounded">로그아웃</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
    </div>
    <!-- 메인화면 -->
    <div class="col-lg-8 col-md-8 col-sm-8 mt-5">
    <div class="row mt-5 text-center">
    	<div class="col-lg-12 col-md-12 col-sm-12">
			<h1>mbti 동물 사진</h1>
    	</div>
    	<div class="col-lg-12 col-md-12 col-sm-12 text-end">
    	<div class="col-lg-5 col-md-5 col-sm-5 offset-9 mt-5">
    		<button type="button" class=" btn btn-success" v-on:click="this.cancel=false" v-if=cancel>등록</button>
    		</div>
    						<div v-if="cancel">
    						</div>
    						<div v-else>
    						<div class="col-lg-5 col-md-5 col-sm-5 offset-9 mt-5">
    						<div>
    						<form class="form-floating">
    						<input  class="form-control" type="number" v-model="animalNo" id="animalNo">
    						<label for="animalNo">동물 번호</label>
    						</form>
    						</div>
    						<div>
    						<form class="form-floating">
    						<input class="form-control" type="text" v-model="animal" id="animal">
    						<label for="animal">동물</label>
    						</form>
    						</div>
    						<div>
    						<form class="form-floating">
    						<input  class="form-control"type="text" v-model="mbti" id="mbti">
    						<label for="mbit">mbti</label>
    						</form>
    						</div>
    						<div>
							<input class="form-control" type="file" accept="image/*" ref="photo" name="photo"/>
    						</div>
	    						<button type="button" class=" btn btn-success"  v-on:click="addAnimal()">등록</button>
    							<button type="button" class=" btn btn-secondary" v-on:click="this.cancel=true">취소</button>
    						</div>
    						</div>
    	</div> 
    	<div class="col-lg-12 col-md-12 col-sm-12 mb-5" style="display: grid ;grid-template-columns:repeat(4,1fr);" class="text-center">
			<div v-for="(animal, index) in mbtianimal">
				<div class="card" style="width: 18rem;">
					<div v-if="animal.animalPhotoDto.attachNo!=0">
					<img class="card-img-top" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+animal.animalPhotoDto.attachNo" alt="Card image cap">
					</div>
					<div v-else>
					<img class="card-img-top" src="https://via.placeholder.com/250/69f/fff.png" alt="Card image cap">
					</div>
  						<div class="card-body">
    						<h5 class="card-title">{{animal.mbtiAnimalDto.animalNo}}.{{animal.mbtiAnimalDto.mbti}}</h5>
    						<p class="card-text">{{animal.mbtiAnimalDto.animal}}</p>
							<button type="button" class=" btn btn-danger"  v-on:click="deleteAnimal(index)">삭제</button>
  						</div>
				</div>
			</div>    	
    	</div>
    </div>
   	</div>
    </div>

    </div>

    <!-- vue js도 lazy loading을 사용한다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://unpkg.com/vue@next"></script>
    <script src="${root}/js/sidebars.js"></script>
    <script>
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
            data(){
                return {
                	mbtianimal:[],
                	cancel:true,
                	animal:"",
                	animalNo:"",
                	mbti:"",
                };
            },
            computed:{
                
            },
            methods:{
				mbtiAnimalList(){
					axios({
						url:"${pageContext.request.contextPath}/rest/admin/mbtianimal/",
						method:"get",
					}).then(resp=>{
						this.mbtianimal = resp.data
					})
				},
				addAnimal(){
					let formData = new FormData();
					const fileInput = this.$refs.photo
					const fileData = fileInput.files[0];
					
					//동물번호 받기
					
					formData.append('file', fileData);
					formData.append('animalNo', this.animalNo);
					formData.append('animal', this.animal);
					formData.append('mbti', this.mbti);
					axios({
		        		url:"${pageContext.request.contextPath}/rest/admin/mbtianimal",
		        		method:"post",
		    			headers:{
		    				"Content-Type" : "multipart/form-data",
		    			},
		    			data:formData,
		        	})
		        	.then(resp=>{
		        		//완성 시 코드
		        		window.confirm("사진 등록이 완료되었습니다!");
		            	this.mbtiAnimalList();
		        	});
				},
				deleteAnimal(index){
					const choice = window.confirm("정말 삭제하시겠습니까?\n삭제한 데이터는 복구되지 않습니다");
					if(choice==false)return
					const animal = this.mbtianimal[index];
					console.log(animal)
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/admin/mbtianimal/"+animal.mbtiAnimalDto.animalNo,
		        		method:"delete",
		        	})
		        	.then(resp=>{
		        		this.mbtiAnimalList();
		        	});
				}
            },
            created(){
            	this.mbtiAnimalList();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>