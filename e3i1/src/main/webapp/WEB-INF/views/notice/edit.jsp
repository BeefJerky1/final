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
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>