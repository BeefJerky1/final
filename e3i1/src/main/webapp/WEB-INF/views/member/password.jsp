<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
			<form action="password" method="post">
				<div class="col-md-6 offset-md-3">
					<div class="row text-center mt-3 mb-5">
						<span class="point">비밀번호 재설정</span> 
					
						<div class="form-floating mb-3 mt-4">
                            <input 
                            type="password" 
                            class="form-control" 
                            name="currentPw"
                            autocomplete="off"
                            required> 
                            <label for="floatingInput">기존 비밀번호</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="password" 
                            class="form-control" 
                            name="changePw"
                            autocomplete="off"
                            required> 
                            <label for="floatingInput">변경할 비밀번호</label>
                        </div>

                        <button type="submit" class="btn btn-primary">변경하기</button>
                    </div>
				</div>
			</form>
		</div>
	</div>
</div>



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>