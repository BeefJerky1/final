<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="find_email" method="post">
	<div class="container w400 m30">
	    <div class="row center">
	        <h1>이메일 찾기</h1>
	    </div>
	    <div class="row">
	        <label>이름</label>
	        <input type="text" name="memberName" class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>핸드폰번호</label><br>
	        <input type="tel" name="memberPhone" class="form-input input-round">
	    </div>
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">이메일 찾기</button>
	    </div>
	    <c:if test="${param.error != null}">
		<div class="row center">
			<h3 style="color:red;">일치하는 이메일이 없습니다</h3>
		</div>
		</c:if>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>