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
			<form action="find_pw" method="post">
			<div class="col-md-6 offset-md-3">
				<div class="row text-center mt-3 mb-5">
					<span class="point">비밀번호 찾기</span>
					
				<div class="row text-center mt-5">
					가입하신 이메일로
					비밀번호 재설정 메일이 발송되었습니다!
					비밀번호 변경 후 이용해주세요!
				</div>		
				
					<div class="row mb-2 mt-5">
						<a href="${pageContext.request.contextPath}" class="btn btn-textone" role=button>
						메인페이지로 돌아가기 </a>
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