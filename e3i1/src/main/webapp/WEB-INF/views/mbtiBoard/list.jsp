<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
a {
	text-decoration: none;
	color: #686666;
}

.mbti-board:hover {
	transform: scale(1.02);
	color: #686666;
	font-size: 12px;
}

.modal-form {
	display: block;
	width: 100%;
	padding: 0.375rem 0.75rem;
	margin: 0.3rem 0.1rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 1rem !important;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.input-box {
	width: auto;
	height: 40px;
	border-radius: 24px;
	background-color: white;
	padding-left: 40px;
	padding-right: 40px;
	font-size: 15px;
	border: 1px solid #ced4da;
}

.input-box:focus {
	outline: 1px solid #3E4684 !important;
}

.interest {
	background-color: #E9E9E9;
}

.like-btn {
	float : right !important;
	margin-right: 0.4rem;
}


/* .card {
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(50%,-50%);

} */
</style>


<div class="container ">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${root }/image/banner01.png" class="d-block w-100"
					alt="banner">
			</div>
			<div class="carousel-item">
				<img src="${root }/image/banner02.png" class="d-block w-100"
					alt="banner">
			</div>
			<div class="carousel-item">
				<img src="${root }/image/banner03.png" class="d-block w-100"
					alt="banner">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>



<div class="container " style="float: none; margin: 0 auto;">

	<div class="row mt-3" style="float: none; margin: 100 auto;">
		<div class="col" style="float: none; margin: 0 auto;">
			<a href="write" class="btn btn-outline-success button-write"
				data-bs-toggle="modal" data-bs-target="#exampleModal">글 작성하기</a>
			<!-- 검색창 -->
			<form action="list" method="get">
				<select name="type" class="input-box input-box">
					<option value="mbti_board_title">제목</option>
					<option value="mbti_board_content">내용</option>
					<option value="member_mbti">MBTI</option>
				</select> <input type="search" name="keyword" placeholder="검색어 입력" required
					class="input-box">

			</form>
		</div>
	</div>

	<!-- write modal  -->

	<!-- Modal -->
	<form action="write" method="post">
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">게시글 작성하기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row">
							<input type="text" name="mbtiBoardTitle" class="modal-form"
								placeholder="제목">
							<textarea name="mbtiBoardContent" class="modal-form" rows="4"></textarea>

						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-edit" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-outline-success">작성하기</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<div class="container mainPage">
			<c:forEach var="mbtiMemberListVO" items="${list }">

				<a
					href="detail?mbtiBoardNo=${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo}">

					<div class="mbti-board" id="mbti-board">
						<div class="row mt-2 main " style="float: none; margin: 0 auto;">
							<div class="card" style="width: 50rem;">
								<div class="card-body">
									<span><h5 class="card-title ">
											<i class="fa-solid fa-q me-2"></i>${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTitle }</h5></span>
									<span class="like-btn"><i class="fa-solid fa-heart fa-2x"  style="color:#f96666;"></i></span>
									<p class="card-text">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardContent }</p>

									<div class="col">
										<span><img src="${root }/image/mbti/강아지(ENFP).png"
											class="d-block" style="width: 3rem;" alt="profile"></span> <span
											class="interest me-1 ">${mbtiMemberListVO.memberDto.memberInterest1 }
										</span> <span class="interest me-1">${mbtiMemberListVO.memberDto.memberInterest2}</span>
										<span class="interest me-1 ">${mbtiMemberListVO.memberDto.memberInterest3 }</span>
									</div>

									<div class="col">

										<span> ${mbtiMemberListVO.memberDto.memberAnimal } </span> <span><i
											class="fa-solid fa-message"></i></span> <span>${mbtiMemberListVO.mbtiBoardDto.mbtiBoardReplyCount}</span>
									</div>
									<div class="col">
										<span class="me-2 time"><fmt:formatDate
												value="${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTime}"
												pattern="yyyy-MM-dd hh-mm" /></span>
									</div>
								</div>
							</div>

						</div>
					</div>



				</a>
			</c:forEach>

	</div>
</div>




<!-- 
	배포용 cdn (개발자 도구에서 vue가 안 보임)
	<script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script>
-->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@next"></script>
<script src="${root}/js/time.js"></script>

<script type="text/Javascript">
	var loading = false;
	var scrollPage = 1;

	$(document).ready(
			function() {
				surveyList(scrollPage);

				// Scroll
				$(window).scroll(
						function() {
							var scrollNow = $(window).scrollTop();

							if (scrollNow + $(window).height() + 100 >= $(
									'.mainPage').height()) {
								surveyList(scrollPage);
							}
							
						})

			})

	function surveyList(page) {

		if (!loading) {
			loading = true;
			$.ajax({
				url : "${pageContext.request.contextPath}/rest/mbtiBoard/",
				type : "get",
				data : {
					"p" : page,
				},
				dataType : "html",
				success : function(resp) {
					//resp는 목록이 담긴 JSON
					//JSON에는 디자인이 없고 데이터만 있다
					//게시판 마지막에 불러온 데이터를 모양 갖춰서 출력
					//템플릿에 저장된 구문을 불러와서 게시판 마지막에 추가
					var json = JSON.parse(resp);
					if(json.length == 0){
						$(window).off("scroll");
						return;
					}
					
					console.log("length = "+json.length);
					for (var i = 0; i < json.length; i++) {
						var template = $("#card-template").html();
						template = template.replace("{{mbtiBoardNo}}",
								json[i].mbtiBoardDto.mbtiBoardNo);
						template = template.replace("{{mbtiBoardTitle}}",
								json[i].mbtiBoardDto.mbtiBoardTitle);
						template = template.replace("{{mbtiBoardContent}}",
								json[i].mbtiBoardDto.mbtiBoardContent);
						template = template.replace("{{memberInterest1}}",
								json[i].memberDto.memberInterest1);
						template = template.replace("{{memberInterest2}}",
								json[i].memberDto.memberInterest2);
						template = template.replace("{{memberInterest3}}",
								json[i].memberDto.memberInterest3);
						template = template.replace("{{memberAnimal}}",
								json[i].memberDto.memberAnimal);
						template = template.replace("{{mbtiBoardReplyCount}}",
								json[i].mbtiBoardDto.mbtiBoardReplyCount);
						template = template.replace("{{mbtiBoardTime}}",
								json[i].mbtiBoardDto.mbtiBoardTime);

						$(".mainPage").append(template);
					}
					loading = false;
					scrollPage += 1;



				}
			})
		}
	}
</script>




<template id="card-template">
	<a href="detail?mbtiBoardNo={{mbtiBoardNo}}">
			<div class="container mbti-board" id="mbti-board">
				<div class="row mt-2 main " style="float: none; margin: 0 auto;">
					<div class="card" style="width: 50rem;">
					<div class="card-body">
						<span><h5 class="card-title ">
								<i class="fa-solid fa-q me-2"></i>{{mbtiBoardTitle}}
							</h5></span>

						<p class="card-text">{{mbtiBoardContent}}</p>

						<div class="col">
							<span><img src="${root}/image/mbti/강아지(ENFP).png"
								class="d-block" style="width: 3rem;" alt="profile"></span> <span
								class="interest me-1 ">{{memberInterest1}} </span> <span
								class="interest me-1">{{memberInterest2}}</span> <span
								class="interest me-1 ">{{memberInterest3}}</span>
						</div>

						<div class="col">

							<span> {{memberAnimal}} </span> <span><i
								class="fa-solid fa-message"></i></span> <span>{{mbtiBoardReplyCount}}</span>
						</div>
						<div class="col">
							<span class="me-2 time">{{mbtiBoardTime}}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</a>
</template>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>