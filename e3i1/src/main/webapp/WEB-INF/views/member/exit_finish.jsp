<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
</style>


<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
	<div class="col-md-8 offset-md-2">
		<div class="text-center">
			<img src="${pageContext.request.contextPath}/image/exit.png"
				style="width: 800px; height: 600px;">
		</div>
		<div class="row mb-5 mt-5">
			<a href="${pageContext.request.contextPath}"
				class="btn btn-outline-success" role=button> 메인페이지로 돌아가기 </a>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>