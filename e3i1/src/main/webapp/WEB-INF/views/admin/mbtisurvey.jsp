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
</style>
</head>

<body>

	<div id="app" class="container-fluid">
		<div class="row">
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
            <li><a href="#" class="link-light rounded">MBTI 동물</a></li>
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
    <div class="col-lg-6 col-md-6 col-sm-6">
    	<div class="row mt-5">
    		<div class="col-lg-9 col-md-9 col-sm-9 text-center mt-5">
    		<h1>Mbti 설문</h1>
    		</div>
    	</div>
    	<div class="row">
                <div v-for="(mbti, index ) in allMbtiSurvey" v-bind:key="index" >
                    <div class="border border-opacity-10 p-4 col-lg-12 col-md-12 col-sm-12  rounded mt-3 "style="border-radius:1em !important">
                        <div v-if="!mbti.edit">
                        <div class="row" >
                            	<div class="col-lg-9 col-md-9 col-sm-9 mt-1">
                                <span class="question">{{mbti.surveyNo}}.{{mbti.surveyQuestion}}</span>
                                </div>
                              	<div class="col-lg-3 col-md-3 col-sm-3 mt-1">
                                 <button class="btn btn-primary" v-on:click="changeEditMode(index)">수정</button>
                                 <button class="btn btn-danger" v-on:click="deleteSurvey(index)">삭제</button>
                                 </div>
                        </div>
                        <div class="row" >
                        	    <div class="col-lg-9 col-md-9 col-sm-9 mt-1">
                                <span>답안:{{mbti.surveyAnswer1}}</span>
                                </div>
                              	<div class="col-lg-3 col-md-3 col-sm-3 mt-1">
                                 </div>
                        		<div class="col-lg-9 col-md-9 col-sm-9 mt-1">
                                <span>답안:{{mbti.surveyAnswer2}}</span>
                                </div>
                              	<div class="col-lg-3 col-md-3 col-sm-3 mt-1">
                                 </div>
                        	</div>
                        </div>
                        <div class="row" v-else>
                        <div class="col-lg-9 col-md-9 col-sm-9 mt-1">
                        <label>문제</label>
                     	<textarea class="form-control " v-model="mbti.surveyQuestion" style="border-radius:1em !important"></textarea>
                    	</div>
                    	<div class="col-lg-9 col-md-9 col-sm-9 mt-1">
                    	<label>답변1</label>
                     	<textarea class="form-control " v-model="mbti.surveyAnswer1" style="border-radius:1em !important"></textarea>
                    	</div>
                    	 <div class="col-lg-9 col-md-9 col-sm-9 mt-1">
                    	<label>답변2</label>
                     	<textarea class="form-control " v-model="mbti.surveyAnswer2" style="border-radius:1em !important"></textarea>
                    	</div>
                    	<div class="col-lg-3 col-md-3 col-sm-3 mt-1">
                    	<button class="btn btn-primary "  v-on:click="editSurvey(index)">수정</button>
                    	<button class="btn btn-secondary "  v-on:click="changeDisplayMode(index)">취소</button>
                        </div>
                    	 
                        </div>
                        </div>
                    </div>
                 </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 mt-5">
            <div v-if="this.survey" class="col-lg-9 col-md-9 col-sm-9  text-end mt-5">
            <div class="mt-5">
    			<button class="btn btn-success" v-on:click="insertMode()" >설문 추가</button>
            </div>
    		</div>
    		<div v-else class="mt-5">
    		</div>
    		<div class="row mt-5">
            <div class="col-lg-8 col-md-8 col-sm-8 offset-2 mt-5" v-if="this.insert==true">
             <div class="col-lg-12 col-md-12 col-sm-12 mt-1">
            <label>번호</label>
            <input type="number" class="form-control" v-model="this.no">
             </div>
    		 <div class="col-lg-12 col-md-12 col-sm-12 mt-1">
    		 <label>문제</label>
             <textarea class="form-control update-reply" v-model="this.question" ></textarea>
             </div>
             <div class="col-lg-12 col-md-12 col-sm-12 mt-1 rounded">
             <label>답변1</label>
             <textarea class="form-control update-reply" v-model="this.answer1" ></textarea>
             </div>
             <div class="col-lg-12 col-md-12 col-sm-12 mt-1 rounded " >
             <label>답변2</label>
             <textarea class="form-control update-reply" v-model="this.answer2" ></textarea>
    		 </div>
    		 <div class="col-lg-12 col-md-12 col-sm-12 mt-1 rounded">
    		 <button class="btn btn-primary form-control" v-on:click="insertSurvey()">등록</button>
    		 </div>
    		 <div class="col-lg-12 col-md-12 col-sm-12 mt-1 rounded">
    		 <button class="btn btn-secondary form-control" v-on:click="displayMode()">취소</button>    		 
    		 </div>
    	</div>
    	<div v-else></div>
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
        const app = Vue.createApp({
            data(){
                return {
                	allMbtiSurvey:{},
                	insert:false,
                	survey:true,
                	
                	//설문 등록
                	no:"",
                	question:"",
                	answer1:"",
                	answer2:"",
                };
            },
            computed:{
                
            },
            methods:{
				mbtisurveylist(){
					axios({
						url:"${pageContext.request.contextPath}/rest/admin/mbtisurvey/",
						method:"get",
					}).then(resp=>{
						this.allMbtiSurvey = resp.data
					})
				},
		        //수정모드
		        changeEditMode(index){
					this.allMbtiSurvey[index].edit=true;
		        },
		        //수정모드 해제
		        changeDisplayMode(index){
		        	this.allMbtiSurvey[index].edit=false;
		        },
		        //추가모드
		        insertMode(){
		        	this.survey=false;
					this.insert=true;
		        },
		        //추가모드 해제
		        displayMode(){
					this.insert=false;
					this.survey=true;
                	this.no = "";
                	this.question="";
                	this.answer1="";
                	this.answer2="";
		        },
		        //설문 수정
		        editSurvey(index){
		        	const mbti = this.allMbtiSurvey[index];
		        	if(mbti.surveyQuestion.length==0)return;
		        	if(mbti.surveyAnswer1.length==0)return;
		        	if(mbti.surveyAnswer2.length==0)return;
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/admin/mbtisurvey/",
		        		method:"put",
		        		data:{
		        			surveyNo: mbti.surveyNo,
		        			surveyQuestion: mbti.surveyQuestion,
		        			surveyAnswer1:mbti.surveyAnswer1,
		        			surveyAnswer2:mbti.surveyAnswer2,		        		
		        		},
		        	}).then(resp=>{
		        		this.mbtisurveylist();
		        	});
		        },
		        //설문 삭제
		        deleteSurvey(index){
		        	const mbti = this.allMbtiSurvey[index];
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/admin/mbtisurvey/"+mbti.surveyNo,
		        		method:"delete",
		        	}).then(resp=>{
		        		this.mbtisurveylist();
		        	});
		        },
		        //설문 추가
		        insertSurvey(){
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/admin/mbtisurvey/",
		        		method:"post",
		        		data:{
		        			surveyNo: this.no,
		           			surveyQuestion: this.question,
		        			surveyAnswer1:this.answer1,
		        			surveyAnswer2:this.answer2,		
		        		},
		        	}).then(resp=>{
		        		this.mbtisurveylist();
		        		this.displayMode();
		        	});
		        }
            },
            created(){
            	this.mbtisurveylist();
            },
        });
        app.mount("#app");
    </script>
</body>
</html>