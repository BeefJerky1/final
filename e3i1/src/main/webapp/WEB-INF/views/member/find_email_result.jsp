<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.point{
    font-size: 2.3em;
    font-weight: bold;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5 p-5 text-dark bg-light rounded">
                    <div class="row text-center mb-5">
                        <span class="point">이메일 찾기</span>
                    </div>
                    <div class="row text-center mb-5">
                        <h6>회원님의 이메일은 &nbsp;&nbsp; <b style="font-size:3vw;"> ${findUserEmail} </b> &nbsp;&nbsp; 입니다.</h6>
                    </div>

                    <div class="col-md-6 offset-md-3">
                        <div class="row text-center mb-2 mt-1">
                            <a href="findPw" class="btn btn-primary" role="button">비밀번호 찾기</a>
                        </div> 
                        
                        <div class="row text-center mb-5">
                            <a href="login" class="btn btn-primary" role="button">로그인 하러가기</a>
                        </div> 
                    </div>
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