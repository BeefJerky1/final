<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<head>
      <!-- Slich Slider -->
      
      <link rel="stylesheet" type="text/css" href="${root}/css/slick.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/slick-theme.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/slick-theme.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/icofont.min.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/materialdesignicons.min.css">
      <link rel="stylesheet" type="text/css" href="${root}/css/mbtiboard.css">
      
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<style>
  .pagination{
        text-align: center;
        /*이 설정을 하면 내부 항목의 줄바꿈이 일어나지 않는다*/
        white-space: nowrap;
        /*영역을 넘어가는 내용에 대해 표시하지 않도록 설정한다*/
        overflow: hidden;
    }
    .pagination > a {
	color: white !important;
    text-decoration: none;
    display: inline-block;
    min-width: 2em;
    text-align: center;
    padding: 0.5em;
    margin: 0.2em;
    background-color: #514e85;
    border-radius: 1em;
}

   
.pagination > a.active-color {background-color: #f3dba5 !important;}

.search-icon {
    position: relative;
    left: 2em;
    top: 1.2em !important;
    color: #9aa0a6;
}

.colorChange {
	color : red !important;
}
</style>
<script type="text/javascript">

$(function(){
	
	// 내용 글자수 카운트
	
	$(".reviewC").on("input", function(){
		
		var size = $(this).val().length;
		
		var target = $(".leg").children(".count2");
		target.text(size);
		
		if(size > 100){

			target.addClass('colorChange');
			$(".writeButton").off('click');
			
		}
		else {
			target.css("color", "white");
		}
		
		if (size>100) {
			$(".writeButton").click(function(e){
				e.preventDefault();
			});
		}
		
	});
});

</script>

<body>

   <body class="bg-light">
      <div class="web-none d-flex align-items-center px-3 pt-3">
      
      <!--  반응형 디자인 추가 -->
         <img src="${root}/image/LOGO.png" class="img-fluid logo-mobile">

         <button class="ms-auto btn  ln-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
         <span class="material-icons">menu</span>
         </button>
      </div>
      
      <div class="py-4" >
         <div class="container">
            <div class="row position-relative">
            
               <!-- Main Content -->
               <main class="col col-xl-6 order-xl-2 col-lg-12 order-lg-1 col-md-12 col-sm-12 col-12">
                  <div class="main-content">
                     <div class="mb-4 d-flex align-items-center">
                        <div class="d-flex align-items-center">
                           <p class="ms-2 mb-0 fw-bold text-body fs-6">MBTI Community  <i class="fa-solid fa-heart fx-2" style="color:#ffa8c9;"></i></p>
                        </div>
                     </div>
                     
                     <!--  글 작성 모달 -->
                       <div class="input-group shadow-sm mb-3 rounded-4 overflow-hidden py-2 bg-white" data-bs-toggle="modal" data-bs-target="#postModal">
                           <span class="input-group-text material-icons border-0 bg-white text-primary" style="color: #514e85 !important;">account_circle</span>
                           <input type="text" class="form-control border-0 fw-light ps-1" placeholder="새로운 글을 작성해 보세요.">
                           <a href="#" class="text-decoration-none input-group-text bg-white border-0 material-icons text-primary" style="color: #514e85 !important;">add_circle</a>
                        </div>
                     
                    <!--  정렬 버튼 구간 -->
             	 <ul class=" top-osahan-nav-tab nav nav-pills justify-content-center nav-justified mb-4 shadow-sm rounded-4 overflow-hidden bg-white mt-4" id="pills-tab" role="tablist">
                        <li class="nav-item" role="presentation">
                           <button class="p-3 nav-link  active nav-area" id="pills-feed-tab" data-bs-toggle="pill" data-bs-target="#pills-feed" type="button" role="tab" aria-controls="pills-feed" aria-selected="true">new!</button>
                        </li>
                        <li class="nav-item" role="presentation">
                           <button class="p-3 nav-link nav-area" id="pills-people-tab" data-bs-toggle="pill" data-bs-target="#pills-people" type="button" role="tab" aria-controls="pills-people" aria-selected="false">좋아요순</button>
                        </li>
                        <li class="nav-item" role="entation">
                           <button class="p-3 nav-link nav-area" id="pills-trending-tab" data-bs-toggle="pill" data-bs-target="#pills-trending" type="button" role="tab" aria-controls="pills-trending" aria-selected="false">투표순</button>
                        </li>
                        <li class="nav-item" role="presentation">
                           <button class="p-3 nav-link nav-area" id="pills-mentions-tab" data-bs-toggle="pill" data-bs-target="#pills-mentions" type="button" role="tab" aria-controls="pills-mentions" aria-selected="false">댓글순</button>
                        </li>
                     </ul>
                     
                     <!-- mbti 게시글 부분 -->
           			 <c:forEach var="mbtiMemberListVO" items="${list }">
                     <a href="detail?mbtiBoardNo=${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo}">
                     <div class="bg-white rounded-4 shadow-sm profile mb-2"  id="mbti-board">
                        <div class="d-flex align-items-center px-3 pt-3">
                        
                        <!-- 프로필 이미지 들어가는 공간! -->
                           <img src="${root}/image/mbti/강아지(ENFP).png" class="img-fluid rounded-circle" alt="profile-img">
                           <div class="ms-3">
                              <h6 class="mb-0 d-flex align-items-start text-body fs-6 fw-bold">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTitle }<span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon"  style="background-color:#514e85 !important;">done</span></h6>
                              <p class="text-muted mb-0">${mbtiMemberListVO.memberDto.memberAnimal }</p>
                           </div>
                           <div class="ms-auto btn-group" role="group" aria-label="Basic checkbox toggle button group">
                              <input type="checkbox" class="btn-check" id="btncheck1">
                           </div>
                        </div>
                        <div class="p-3 " style="color : #6c757d !important;">
                           <p class="mb-2 fs-6">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardContent }</p>
                           <p class="mb-2 fs-8 mbti-board-area">
                              <span class="time"><fmt:formatDate value="${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTime}" pattern="yyyy-MM-dd hh-mm" /></span></p>
                           <p class="mb-2 fs-8 mbti-board-area">
                           <span class="interest">${mbtiMemberListVO.memberDto.memberInterest1 }</span>
                           <span class="interest">${mbtiMemberListVO.memberDto.memberInterest2 }</span>
                           <span class="interest">${mbtiMemberListVO.memberDto.memberInterest3}</span>
                           </p>
                           
                           <div class="d-flex followers">
                              <div>
                                 <p class="mb-0"><i class="fa-solid fa-heart fx-2" style="color:#ffa8c9;"></i> LIKE 
                              </div>
                              <div class="ms-5 ps-5">
                                 <div class="d-flex">
                                 <a href="#" class="text-muted text-decoration-none d-flex align-items-start fw-light"><span class="material-icons md-20 me-2" style="color:#f3dba5 !Important;">chat_bubble_outline</span>
                                 <span class= "mbti-board-area">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardReplyCount}</span></a>
	                                 </div>
	                              </div>
	                           </div>
	                        </div>
                    	 </div>
                       </a>
			</c:forEach>
                     
    

                  </div>
                    <div class="pagination" style="float:none; margin:auto; justify-content: center;">
	
			<c:if test="${p > 1}">
				<c:choose>
					<c:when test="${search}">
						<a href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
					</c:when>
					<c:otherwise>
						<a href="list?p=1&s=${s}">&laquo;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
	
			<c:if test="${startBlock > 1}">
				<c:choose>
					<c:when test="${search}">
						<a href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
					</c:when>
					<c:otherwise>
						<a href="list?p=${startBlock-1}&s=${s}">&laquo;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
	
			<!-- 숫자 링크 영역 -->
			<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
				<c:choose>
					<c:when test="${search}">
						<c:choose>
							<c:when test="${i == p}">
								<a class="active" href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${i == p}">
								<a class="active" href="list?p=${i}&s=${s}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="list?p=${i}&s=${s}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<!-- 다음 버튼 영역 -->
			<c:if test="${endBlock < lastPage}">
				<c:choose>
					<c:when test="${search}">
						<a href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
					</c:when>
					<c:otherwise>
						<a href="list?p=${endBlock+1}&s=${s}">&gt;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
	
			<c:if test="${p < lastPage}">
				<c:choose>
					<c:when test="${search}">
						<a href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
					</c:when>
					<c:otherwise>
						<a href="list?p=${lastPage}&s=${s}">&raquo;</a>
					</c:otherwise>
				</c:choose>
			</c:if>
	
		</div>
	
               </main>
               <aside class="col col-xl-3 order-xl-1 col-lg-6 order-lg-2 col-md-6 col-sm-6 col-12">
                  <div class="p-2 bg-light offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample">
                     <div class="sidebar-nav mb-3">
                        <div class="pb-4">
                           <a href="${root}/" class="text-decoration-none">
                           <img src="${root}/image/LOGO.png" class="img-fluid logo" alt="brand-logo">
                           </a>
                        </div>
                        <ul class="navbar-nav justify-content-end flex-grow-1">
  
                           <li class="nav-item">
                              <a href="profile.html" class="nav-link active"><span class="material-icons me-3">house</span> <span>Feed</span></a>
                           </li>
                           
                        </ul>
                     </div>
                  </div>
                  <!-- Sidebar -->
                  <div class="ps-0 m-none fix-sidebar">
                     <div class="sidebar-nav mb-3">
                        <div class="pb-4 mb-4">
                           <a href="${root}/" class="text-decoration-none">
                           <img src="${root}/image/LOGO.png" class="img-fluid logo" alt="brand-logo">
                           </a>
                        </div>
                        <ul class="navbar-nav justify-content-end flex-grow-1">

                           <li class="nav-item">
                              <a href="${root}/mbtiBoard/list" class="nav-link active" style="color: #514e85 !important;"><span class="material-icons me-3">house</span> <span>MBTI Home</span></a>
                           </li>

                           
							<form action="list" method="get">
                           	<li class="nav-item input-group mb-4 shadow-sm rounded-4 overflow-hidden py-2 bg-white">
                              <span class="input-group-text material-icons border-0 bg-white text-primary "  style="color:#f3dba5 !important; ">search</span>
                              <input type="text" name="keyword" class="form-control border-0 fw-light ps-1" placeholder="제목 또는 내용 검색">
                           </li>
							</form>
                        </ul>
                        
                        <!--  MBTI 활동 순위 보여주기 -->
                        
                          <div class="bg-white rounded-4 overflow-hidden shadow-sm account-follow mb-4">
                              <h6 class="fw-bold text-body p-3 mb-0 border-bottom">지금 가장 활발히 활동 중!</h6>
                              <!-- Account Item -->
                              <a href="profile.html" class="p-3 border-bottom d-flex text-dark text-decoration-none account-item">
                                 <img src="${root}/image/mbti/고양이(INTP).png" class="img-fluid rounded-circle me-3" alt="profile-img">
                                 <div>
                                    <p class="fw-bold mb-0 pe-3 d-flex align-items-center">새침한 고양이 <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span></p>
                                    <div class="text-muted fw-light">
                                       <p class="mb-1 mbti-rank" >INTP</p>
                                       <span class="text-muted d-flex align-items-center small">50%</span>
                                    </div>
                                 </div>
                                 <div class="ms-auto">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                       <input type="checkbox" class="btn-check" id="btncheck7">
                                    </div>
                                 </div>
                              </a>
                              <!-- Account Item -->
                              <a href="profile.html" class="p-3 border-bottom d-flex text-dark text-decoration-none account-item">
                                 <img src="${root}/image/mbti/돌고래(ENFJ).png" class="img-fluid rounded-circle me-3" alt="profile-img">
                                 <div>
                                    <p class="fw-bold mb-0 pe-3 d-flex align-items-center">사교적인 돌고래 <span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span></p>
                                    <div class="text-muted fw-light">
                                       <p class="mb-1 mbti-rank"  >ENFJ</p>
                                       <span class="text-muted d-flex align-items-center small">30%</span>
                                    </div>
                                 </div>
                                 <div class="ms-auto">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                       <input type="checkbox" class="btn-check" id="btncheck8">
                                    </div>
                                 </div>
                              </a>
                              <!-- Account Item -->
                              <a href="profile.html" class="p-3 d-flex text-dark text-decoration-none account-item">
                                 <img src="${root}/image/mbti/호랑이(INTJ).png" class="img-fluid rounded-circle me-3" alt="profile-img">
                                 <div>
                                    <p class="fw-bold mb-0 pe-3 d-flex align-items-center">전략가 호랑이<span class="ms-2 material-icons bg-primary p-0 md-16 fw-bold text-white rounded-circle ov-icon" style="background-color:#514e85 !important;">done</span></p>
                                    <div class="text-muted fw-light">
                                       <p class="mb-1 mbti-rank" >INTJ</p>
                                       <span class="text-muted d-flex align-items-center small">20%</span>
                                    </div>
                                 </div>
                                 <div class="ms-auto">
                                    <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
                                       <input type="checkbox" class="btn-check" id="btncheck9">
                                    </div>
                                 </div>
                              </a>
                           </div>
                     </div>
                  </div>
               </aside>
               <aside class="col col-xl-3 order-xl-3 col-lg-6 order-lg-3 col-md-6 col-sm-6 col-12">
                  <div class="fix-sidebar">
                     <div class="side-trend lg-none">
                     
                        <!--검색 버튼 구간-->
                        <div class="sticky-sidebar2 mb-3">

                           
                           <div class="bg-white rounded-4 overflow-hidden shadow-sm mb-4">
                              <h5 class="fw-bold text-body p-3 mb-0 border-bottom">MBTI별 궁합은 어떨까?</h5>
                              <!-- Trending Item -->
                              <a href="tags.html" class="p-3 border-bottom d-flex align-items-center text-dark text-decoration-none">
                                 <div class="center-block">
                                    <h6 class="center-block fw-bold ml-4 mb-3 pe-3" style="text-align:center; font-size:16px;">연애 궁합 BEST 3 <i class="fa-solid fa-cloud" style="color:#d6f5ff;"></i></h6>
                                 <img src="${root}/image/couple.png" width="200px;" class="img-fluid rounded-4 center-block m-4 " alt="couple">
                                  <img src="${root}/image/couple.png" width="200px;" class="img-fluid rounded-4 center-block m-4 " alt="couple">
                                 </div>
                              </a>
                              <!-- Trending Item -->
                                 <div>
                                    <div class="text-muted fw-light d-flex align-items-center">
                                    <p class="fw-bold m-3 mt-4 mb-0 pe-3 interest">#찰떡궁합 #아마도 환상의 짝꿍</p>
                                    </div>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">
                                    	1위. ENFP <i class="fa-solid fa-heart" style="color:#ffa8c9;"></i> INTJ (서로에게 필요한 존재) </small><br/>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">	
                                    	2위. ISTP <i class="fa-solid fa-heart" style="color:#ffa8c9;"></i> ESFJ (혼자만의 시간은 꼭 필요)</small><br/>
                                    	<small class="fw-bold m-3  mb-2 pe-3 text-dark" style="color:black !important;">
                                    	3위. ENFJ <i class="fa-solid fa-heart" style="color:#ffa8c9;"></i> INFP (충분한 감정 교류 가능!)
                                    </small>
                                 </div>
                                
                                
                                <div class="bg-white rounded-4 overflow-hidden shadow-sm mb-4">
                              <h5 class="fw-bold text-body p-3 mb-0 border-bottom"></h5>
                              <a href="#" class="p-3 border-bottom d-flex align-items-center text-dark text-decoration-none">
                                 <div class="center-block">
                                    <h6 class="center-block fw-bold mb-3 pe-3" style="text-align:center; font-size:16px;">우정 궁합 BEST 3 <i class="fa-solid fa-umbrella-beach" style="color:#00ce7c;"></i></h6>
                                 <img src="${root}/image/friend.png" width="200px;" class="m-4 img-fluid rounded-4 center-block " alt="couple">
                                 </div>
                              </a>
                              
                                <div class="mb-4">
                                    <div class="text-muted fw-light d-flex align-items-center">
                                    <p class="fw-bold m-3 mt-4 mb-0 pe-3 interest">#깐부 #우리 우정 영원히</p>
                                    </div>
                                    <div>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">
                                    	1위. ESTJ <i class="fa-solid fa-plus" style="color:#ffa8c9;"></i> INTP (쿨하고 의리있다!) </small><br/>
                                    <small class="fw-bold m-3 mb-2 pe-3 text-dark" style="color:black !important;">	
                                    	2위. INTJ <i class="fa-solid fa-plus" style="color:#ffa8c9;"></i> ENTP (분명 취미가 비슷할듯)</small><br/>
                                    	<small class="fw-bold m-3  mb-2 pe-3 text-dark" style="color:black !important;">
                                    	3위. INTP <i class="fa-solid fa-plus" style="color:#ffa8c9;"></i> ENFJ (반대가 끌리는 이유...)
                                    </small><BR>
                                    </div>
                                 </div>
                                 
						           </div>
						   </div>
                        </div>
                     </div>
                  </div>
               </aside>
            </div>
         </div>
      </div>
      


     
      <!-- 글 작성 모달 -->
     	<form action="write" method="post">
      <div class="modal fade" id="postModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 p-4 border-0 bg-light">
               <div class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
                  <a href="#" class="text-muted text-decoration-none material-icons" data-bs-dismiss="modal">arrow_back_ios_new</a>
                  <h5 class="modal-title text-muted ms-3 ln-0" id="staticBackdropLabel"><span class="material-icons md-32">account_circle</span></h5>
               </div>
               
               <!-- 제목 작성 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <input type="text" class="form-control rounded-5 border-0 shadow-sm" name="mbtiBoardTitle" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 50px">
                   <label for="floatingTextarea2" class="h6 text-muted mb-0">제목을 작성하세요.</label>
                </div>
             </div>
             	<!-- 내용 작성 -->
               <div class="modal-body p-0 mb-3">
                  <div class="form-floating">
                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" name="mbtiBoardContent" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"></textarea>
                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
                  </div>
               </div>

               <div class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
                  <div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >0</span> 
                    	/
                    	<span class="text-muted total">100</span> 
                     </span>
                  </div>
                  <div class="ms-auto m-0">
                  	<button type="submit" class="writeButton btn btn-primary fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center" style="border-radius : 1em; background-color: #514e85; border:none; font-size: 14px !important;">작성!</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
     </form>

 






</body>
    <script type="text/javascript">
$(".pagination>a").click(function() {
    toggleClass(".active-color");
});
</script>

<!-- 
	배포용 cdn (개발자 도구에서 vue가 안 보임)
	<script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script>
-->

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@next"></script>
<script src="${root}/js/time.js"></script>
<script src="${root}/js/mbtiboard.js"></script>
<script src="${root}/js/slick.min.js"></script>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>