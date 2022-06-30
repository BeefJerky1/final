<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
</style>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 p-4 text-dark bg-light rounded">
			<div class="row text-center">
				<h2>회원 가입 완료</h2>
			</div>
			<div class="row"></div>
			<div class="col-md-6 offset-md-3">
				<div class="row text-center m-2">
					<a href="${pageContext.request.contextPath}"
						class="btn btn-primary">메인페이지</a>
				</div>
				<div class="row text-center m-2">
					<a href="login" class="btn btn-primary" role="button">로그인</a>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
        //div[id=app]을 제어할 수 있는 Vue instance를 생성
        const app = Vue.createApp({
            //data : 화면을 구현하는데 필요한 데이터를 작성한다.
            data(){
                return {
                    message:"welcome to vue js 3!!"
                };
            },
            //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
            // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
            computed:{
                
            },
            //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
            methods:{
                
            },
            //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
            watch:{
                
            },
        });
        app.mount("#app");
    </script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>