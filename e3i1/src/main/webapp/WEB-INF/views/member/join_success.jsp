<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css">
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.point {
	font-size: 2.3em;
	font-weight: 900;
}

.btn.btn-textone {
	font-size: 0.9em;
	font-weight: 900;
	width: 100%;
}

.btn.btn-texttwo {
	font-size: 0.8em;
	font-weight: 500;
	text-decoration: none !important;
}
</style>

<div id="app" class="container-fluid">
		<div class="col-md-8 offset-md-2 text-dark">
			<div class="text-center">
			<img src="${pageContext.request.contextPath}/image/welcome.png" style="width: 600px; height: 600px;">  
			</div>
			<div class="col-md-6 offset-md-3">
				<div class="row text-center m-2">
					<a href="login" class="btn btn-outline-success" role="button">로그인</a>
				</div>
				<div class="row text-center m-2">
					<a href="${pageContext.request.contextPath}"
						class="btn btn-edit">메인페이지로 이동</a>
				</div>
			</div>
		</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>