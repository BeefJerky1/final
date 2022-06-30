<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="saveEmailExist" value="${cookie.saveId != null}"></c:set>

<style>
.parent {
	width: 100%;
}

.two {
	float: left;
	text-align: center;
	width: 50%;
}

.point {
	font-size: 2.3em;
	font-weight: 900;
}

.btn.btn-textone {
	font-size: 0.9em;
	font-weight: 600;
	width: 100%;
}

.btn.btn-texttwo {
	font-weight: 600;
	text-decoration: none !important;
}
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
	<div class="row mt-4 p-2">
		<div class="col-md-8 offset-md-2 mb-5 p-2 text-dark bg-light rounded">
			<form action="login" method="post">
				<input type="hidden" name="referer" value="${referer}">
				<div class="row text-center mt-2 mb-4">
					<span class="point">로그인</span>
				</div>

				<div class="col-md-6 offset-md-3">
					<div class="form-floating mb-2 mx-1">
						<input type="text" class="form-control" name="memberEmail"
							placeholder="email@example.com"> <label
							for="floatingInput">Email address</label>
					</div>

					<div class="form-floating mb-2 mx-1">
						<input type="password" class="form-control" name="memberPw"
							placeholder="Password"> <label for="floatingPassword">Password</label>
					</div>

					<div class="row mt-2">
						<label> <c:choose>
								<c:when test="${saveEmailExist}">
								&nbsp;<input type="checkbox" name="remember" checked>
								</c:when>
								<c:otherwise>
								&nbsp;<input type="checkbox" name="remember">
								</c:otherwise>
							</c:choose> 이메일 저장
						</label>
					</div>
					<div class="row">
						<div class="row my-2 mx-1">
							<input type="submit" value="로그인" class="btn btn-outline-success">
						</div>
					</div>

					<div class="parent my-1">
						<div class="two btn btn-texttwo">
							<a href="find_email">이메일찾기</a>
						</div>
						<div class="two btn btn-texttwo">
							<a href="find_pw">비밀번호찾기</a>
						</div>
					</div>
					<div class="row mb-2 mt-1">
						<a href="join" class="btn btn-textone" role=button>아직 SISO의
							회원이 아니신가요?</a>
					</div>
					<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
					<c:if test="${param.error != null}">
						<div class="row text-center">
							<h6 style="color: red;">로그인 정보가 일치하지 않습니다</h6>
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