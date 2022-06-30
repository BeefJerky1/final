<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}

.btn.btn-textone {
	font-size: 0.9em;
	font-weight: 600;
	width: 100%;
}
</style>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
			<div class="col-md-6 offset-md-3">
				<div class="row text-center mt-3 mb-5">
					<span class="point">탈퇴완료</span>
					<p class="mt-4 mb-2">이용해주셔서 감사합니다</p>
				</div>
				<div class="row mb-2 mt-5">
						<a href="${pageContext.request.contextPath}" class="btn btn-textone" role=button>
						메인페이지로 돌아가기 </a>
					</div>
			</div>
		</div>
	</div>
</div>
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>