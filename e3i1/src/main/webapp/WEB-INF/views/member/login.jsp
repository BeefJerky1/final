<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="saveEmailExist" value="${cookie.saveId != null}"></c:set>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="login" method="post">
	<input type="hidden" name="referer" value="${referer}">

    <div class="container w400 m30">
        <div class="row center">
            <h1>로그인</h1>
        </div>
        <div class="row">
            <label>이메일</label>
    		<input type="text" name="memberEmail" required class="form-input fill input-round" value="${cookie.saveId.value}">
        </div>
        <div class="row">
            <label>비밀번호</label>
            <input type="password" name="memberPw" required class="form-input fill input-round">
        </div>
        <div class="row">
        	<label>
        		<c:choose>
        			<c:when test="${saveEmailExist}">
		        		<input type="checkbox" name="remember" checked>
        			</c:when>
        			<c:otherwise>
        				<input type="checkbox" name="remember">
        			</c:otherwise>
        		</c:choose>
        		이메일 저장
        	</label>
        </div>
        <div class="row">
            <input type="submit" value="로그인" class="btn btn-primary fill">
        </div>
        <div class="row center">
            <a href="find_email" class="link">이메일찾기</a>
        </div>
        <div class="row center">
            <a href="find_pw" class="link">비밀번호찾기</a>
        </div>
        <div class="row center">
            <a href="join" class="link">회원가입</a>
        </div>
		<%-- 에러 표시가 있는 경우 메세지를 출력 --%>
		<c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">로그인 정보가 일치하지 않습니다</h3>	
		</div>
		</c:if>
    </div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>