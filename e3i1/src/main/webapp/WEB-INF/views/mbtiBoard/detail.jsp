<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
a {
	text-decoration: none;
	color: #686666;
	font-size: 12px;
}

.card  !important {
	border-radius: 1px;
}

.button-write {
	margin-right: 0.4rem;
}

.modal-form  {
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
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>
<div class="container">
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



<div class="container">
	<div class="row mt-2">
		<div class="col-md-6">
			<div class="card " style="width: 60rem;">
				<div class="card-body">
					<h5 class="card-title">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTitle }</h5>
					<p class="card-text">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardContent }</p>

					<div class="col">
						<span>${mbtiMemberListVO.memberDto.memberInterest1 } </span> <span>${mbtiMemberListVO.memberDto.memberInterest2}</span>
						<span>${mbtiMemberListVO.memberDto.memberInterest3 }</span>
					</div>

					<div class="col">
						<span>${mbtiMemberListVO.memberDto.memberAnimal } </span> <span><i
							class="fa-solid fa-message"></i></span>
					</div>

					<div class="row mt-3">
						<div class="col mt-3 mr-3">
							<a href="write" class="btn btn-edit button-write"
								data-bs-toggle="modal" data-bs-target="#exampleModal">수정</a> <a
								href="delete?mbtiBoardNo=${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo}"
								class="btn btn-outline-success button-write">삭제</a>
						</div>
					</div>


					<!-- 게시글 수정 Modal -->
					<form action="edit" method="post">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">게시글 수정하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="row">
											<input type="text" name="mbtiBoardTitle" class="modal-form"
												placeholder="제목">
											<textarea name="mbtiBoardContent" class="modal-form" rows="4"></textarea>

										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-edit"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-outline-success">수정</button>
									</div>
								</div>
							</div>
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>

</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>