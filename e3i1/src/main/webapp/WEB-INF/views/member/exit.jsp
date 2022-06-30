<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
			<form action="exit" method="post">
				<div class="col-md-6 offset-md-3">
					<div class="row text-center mt-3 mb-5">
						<span class="point">회원탈퇴</span> 
						<p class="my-4">비밀번호를 입력하세요</p>
                        <div class="form-floating mb-3">
                            <input 
                            type="password" 
                            class="form-control" 
                            name="memberPw"
                            autocomplete="off"
                            placeholder="password"
                            required> 
                            <label for="floatingInput">Password</label>
                        </div>

                        <button type="submit" class="btn btn-outline-success my-2">탈퇴하기</button>
                    </div>
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>