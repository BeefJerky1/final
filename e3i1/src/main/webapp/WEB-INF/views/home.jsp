<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
a {
		text-decoration: none;
}
.main-area {
	margin-top : 2em;
	margin-bottom : 2em;
}

.main-title {
	font-weight : bold;
	font-size : 2.5rem;	
	color : #3e4684;

}

.main-content {
	padding : 2em;
	margin : 2em;
}

.second-title {
	color:#a7a7c1;
	font-weight : bold;
	font-size : 1rem;
}

.club-list {
	 float: left;
      z-index: 2;
      margin : 2rem;
}

.club-category {
	background-color : #e9e9e9;
	color : #454b54;
}
</style>
    <body>
     <!--  로딩 창 -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status" color="#3e4684;">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    
    
    
  <!-- main banner -->
    <div class="container"  id="app">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="./image/banner01.png" class="d-block w-100" alt="banner">
            </div>
            <div class="carousel-item">
                <img src="./image/banner02.png" class="d-block w-100" alt="banner">
            </div>
            <div class="carousel-item">
                <img src="./image/banner03.png" class="d-block w-100" alt="banner">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    
            <div class="main-area text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 600px;">
                <h6 class="second-title">Our Community</h6>
                <h1 class="mb-4 main-title">What is my MBTI type? <i class="fa-solid fa-face-smile" style="color:#f7d68a"></i></h1>
            </div>
        
        <div class="container-fluid bg-light overflow-hidden my-5 px-lg-0">
        <div class="container feature px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 feature-text py-5 wow fadeIn" data-wow-delay="0.1s">
                    <div class="p-lg-5 ps-lg-0 main-content">
                        <h6 class="second-title">What is SISO?</h6>
                        <h1 class="mb-4 main-title">MBTI & 소모임 커뮤니티</h1>
                        <p class="mb-4 pb-2">
                        내 MBTI를 검사하고 나와 성향이 비슷한 동물을 찾아보자. 내 MBTI와 일치하는 사람들은 어떤 취미를 가지고 있을까?
                        내가 관심있는 분야의 소모임에서 다양한 유형의 사람들을 만나보자! 
                        </p>
                        <div class="row g-4">
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">Find My MBTI</p>
                                        <h5 class="mb-0">#ENFP </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa-solid fa-dog"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">My Animal Type</p>
                                        <h5 class="mb-0">#사랑둥이 강아지</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa-solid fa-heart"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">My Favortie</p>
                                        <h5 class="mb-0">#액티비티매니아</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="d-flex align-items-center">
                                    <div class="btn-lg-square bg-primary rounded-circle">
                                        <i class="fa-solid fa-people-group"></i>
                                    </div>
                                    <div class="ms-4">
                                        <p class="mb-0">Persnal Club</p>
                                        <h5 class="mb-0">free community</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 pe-lg-0 wow fadeIn" data-wow-delay="0.5s" style="min-height: 540px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute img-fluid w-100 h-100" src="./image/main.png" style="object-fit: cover;" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
                <div class="main-area text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 600px;">
                <h6 class="second-title">Persnal Club</h6>
                <h1 class="mb-4 main-title">This Week Best Community <i class="fa-solid fa-crown" style="color:#f7d68a"></i></h1>
            </div>
    
    <!-- 소모임 보여주기 -->
   		 <div class="col-md-6 col-lg-4 wow fadeInUp main-area club-list" data-wow-delay="0.3s" v-for="(club,index) in clubList" v-bind:key="index" @click="toDetailPage(index)">
                    <div class="service-item rounded overflow-hidden">
                        <img class="img-fluid" src="https://via.placeholder.com/250/69f/fff.png" alt="">
                        <div class="position-relative p-4 pt-0">
                            <div class="service-icon">
                                <i class="fa-solid fa-face-smile fa-3x"></i>
                            </div>
                            <h4 class="mb-3">{{club.clubName}}</h4>
                            <span class="club-category">\#{{club.clubMainCategory}}</span>&nbsp;
                            <span class="club-category">\#{{club.clubSubCategory}}</span><br>
                            <span><a class="small fw-medium second-title" >Read More
                            <i class="fa-solid fa-angle-right"></i></a></span>
                        </div>
                    </div>
                </div>
             
             <div class="main-area text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.2s" style="max-width: 600px;">
                <h6 class="second-title">mbti community</h6>
                <h1 class="mb-4 main-title">MBTI TALK TALK TALK! <i class="fa-solid fa-comment-dots" style="color:#f7d68a"></i></h1>
            </div>
    
             
     
                
             
                
           <!--  mbti 게시판 글 보여주기 -->
           
           
 
</div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


    <!-- main Javascript -->

</body>
<script src="${root}/js/counter.js"></script>
<script src="${root}/js/easing.js"></script>
<script src="${root}/js/iso.js"></script>
<script src="${root}/js/lightbox.js"></script>
<script src="${root}/js/owl.js"></script>
<script src="${root}/js/waypoints.js"></script>
<script src="${root}/js/wow.js"></script>
<script src="${root}/js/main.js"></script>
<script src="https://unpkg.com/vue@next"></script>
  <script>
        const app = Vue.createApp({
          data() {
                return {
            		clubList: [],
                };
            },
            computed:{
            },

              // methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다
              methods:{
            	  // 소모임 디테일 페이지
            		toDetailPage(index){
            			window.location.href="${pageContext.request.contextPath}/club/detail?clubNo="+this.clubList[index].clubNo;
            		},
            },

            // watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
            },
            
            created() {
            	// 소모임 목록 불러오기
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