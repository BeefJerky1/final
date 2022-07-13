<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}
</style>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5">
			<form action="find_pw" method="post">
			<div class="col-md-6 offset-md-3">
				<div class="row text-center mt-2 mb-4">
					<span class="point">비밀번호 찾기</span>
				</div>
				<div class="form-floating mb-3 mt-4 mx-1">
					<input type="text" class="form-control" name="memberName"
						placeholder="이름"> <label for="floatingInput">이름</label>
				</div>
				
				<div class="form-floating mb-4 mx-1">
					<input type="text" class="form-control" name="memberPhone"
						placeholder="핸드폰번호"> <label for="floatingInput">
						전화번호
						( ' - ' 제외)</label>
				</div>

				<div class="row my-2 mx-1">
					<button type="submit" class="btn btn-outline-success">비밀번호 찾기</button>
				</div>
				<c:if test="${param.error != null}">
					<div class="row text-center mt-4">
						<h6 style="color: red;">입력 정보와 일치하는 이메일이 없습니다</h6>
					</div>
				</c:if>
			</div>
			</form>
		</div>
	</div>
</div>
<script>
        const app = Vue.createApp({
            data(){
                return {
                	
                };
            },
            computed:{
                
            },
            methods:{
                
            },
            watch:{
                
            },
        });
        app.mount("#app");
 </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>