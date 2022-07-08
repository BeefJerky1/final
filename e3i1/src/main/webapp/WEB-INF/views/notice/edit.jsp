<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}

.two {
	float: left;
	text-align: center;
	width: 40%;
}
</style>

<form action="edit" method="post" enctype="multipart/form-data">
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
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div
		class="col-md-8 offset-md-2 mb-4 p-4 mt-4 text-dark bg-light rounded">
		<div class="row text-center mb-3">
			<h1 class="point">NOTICE</h1>

		</div>
		<div class="form-floating mb-3">
		<input type="hidden" name="noticeNo" value="${noticeDto.noticeNo}">
			<select name="noticeHead" class="form-select" id="floatingSelect">
				<option value="${noticeDto.noticeHead}">${noticeDto.noticeHead}</option>
				<option>이벤트</option>
				<option>공지</option>
				<option>긴급</option>
			</select> <label for="floatingSelect">말머리</label>
		</div>

		<div class="form-floating mb-3">
			<input type="text" class="form-control" name="noticeTitle" value="${noticeDto.noticeTitle}"
				autocomplete="off" required> <label for="floatingInput">제목</label>
		</div>

		<div class="form-floating mb-3">
			<textarea class="form-control" id="floatingTextarea"
				name="noticeContent" style="height: 400px">${noticeDto.noticeContent}</textarea>

			<label for="floatingTextarea">내용</label>
		</div>
		<div class="row col-md-8 offset-md-2 text-center">
			<a href="detail?noticeNo=${noticeDto.noticeNo}" class="btn btn-edit two m-3">취소</a>
			<button type="submit" class="btn btn-outline-success two m-3">등록</button>
		</div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>