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
			<form action="reset" method="post">
				<div class="col-md-6 offset-md-3">
					<div class="row text-center mt-3 mb-5">
						<span class="point">비밀번호 재설정</span> 
                        <p class="mt-5">사용하실 비밀번호를 입력하세요</p>
						<input type="hidden" name="cert" value="${cert}"> 
						<input type="hidden" name="memberEmail" value="${param.memberEmail}"> 
						
                        <div class="form-floating mb-3">
                            <input 
                            type="password" 
                            class="form-control" 
                            name="memberPw"
                            autocomplete="off"
                            required> 
                            <label for="floatingInput">Password</label>
                        </div>
                        <button type="submit" class="btn btn-primary">변경하기</button>
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