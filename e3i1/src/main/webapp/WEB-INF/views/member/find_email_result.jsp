<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
.point{
    font-size: 2.3em;
    font-weight: bold;
}

.email1{
	font-size: 0.9em;
	font-weight: 600;
}

.email2{
	font-size: 1.3em;
	font-weight: 900;
}

</style>
<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5">
			<div class="row text-center mt-2 mb-5">
				<span class="point">이메일 찾기</span>
			</div>
			<div class="col-md-8 offset-md-2 my-4">
				<div class="text-center email1">
					회원님의 이메일은 &nbsp;&nbsp; 
					<span class="email2">${findUserEmail}</span>
					&nbsp;&nbsp; 입니다.
				</div>

				<div class="col-md-6 offset-md-3 mt-5">
					<div class="row text-center mb-2">
						<a href="login" class="btn btn-edit" role="button">로그인 하러가기</a>
					</div>
					<div class="row text-center mb-2 mt-1">
						<a href="find_pw" class="btn btn-outline-success" role="button">비밀번호
							찾기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>