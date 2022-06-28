<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<form action="join" method="post">
	<div class="container w450 m30">
	    <div class="row center">
	        <h1>회원가입</h1>
	    </div>
	    <div class="row">
	        <label>이메일</label>
	        <input type="text" name="memberEmail" required class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>비밀번호</label>
	        <input type="password" name="memberPw"class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>비밀번호 확인</label>
	        <input type="password" name="memberPw2"class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>이름</label>
	            <input type="text" name="memberName" class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>닉네임</label>
	            <input type="text" name="memberNick" class="form-input fill input-round">
	    </div>
	    <div class="row">
	        <label>생년월일</label>
	        <input type="date" name="memberBirth" class="form-input input-round">
	    </div>
	    
	    <div class="row">
	        <label>성별</label>
	        <select name="memberGender" class="form-input input-round">
	    		<option value="">선택</option>
	    		<option>남자</option>
	    		<option>여자</option>
	    	</select>
	    </div>
	    
	    <div class="row">
	        <button type="submit" class="btn btn-primary fill">회원가입</button>
	    </div>
	</div>
</form>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>