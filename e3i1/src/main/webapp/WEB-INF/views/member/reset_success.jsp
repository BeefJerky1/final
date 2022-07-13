<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}
.resetpw {
	font-size: 0.9em;
	font-weight: 900;
}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5 p-4">
			<form action="find_pw" method="post">
			<div class="col-md-6 offset-md-3">
				<div class="row text-center mt-3 mb-5">
					<span class="point">비밀번호 재설정</span>
					
				<div class="text-center resetpw mt-5">
					회원님의 비밀번호가 성공적으로 재설정 되었습니다.<br>
					변경된 비밀번호로 다시 로그인하고 SISO를 이용하세요!
				</div>		
				
					<div class="mb-2 mt-5">
						<a href="${pageContext.request.contextPath}/member/login" class="btn btn-outline-success" role=button>
						로그인 하러가기 </a>
					</div>
							
				</div>
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