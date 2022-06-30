<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<form action="information" method="post">
				<div class="col-md-6 offset-md-3">
					<div class="row text-center mt-3 mb-5">
                                <div class="row text-center mb-3">
                                    <span class="point">회원정보 수정</span>
                                  </div>

                                  <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberName"
                                    autocomplete="off"
                                    value="${memberDto.memberName}"
                                    required> 
                                    <label for="floatingInput">Name</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberEmail"
                                    autocomplete="off"
                                    value="${memberDto.memberEmail}"
                                    required
                                    readonly> 
                                    <label for="floatingInput">Email</label>
                                </div>
                                
								<div class="form-floating mb-3">
                                    <input 
                                    type="password" 
                                    class="form-control" 
                                    name="memberPw"
                                    autocomplete="off"
                                    value="${memberDto.memberPw}"
                                    required
                                    readonly> 
                                    <label for="floatingInput">Password</label>
                                </div>
                                
                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberNick"
                                    autocomplete="off"
                                    value="${memberDto.memberNick}"
                                    required> 
                                    <label for="floatingInput">Nickname</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <select name="memberGender" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberGender}">${memberDto.memberGender}</option>
                                        <option>남자</option>
                                        <option>여자</option>
                                    </select> <label for="floatingSelect">Gender</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberPhone"
                                    autocomplete="off"
                                    value="${memberDto.memberPhone}"
                                    required> 
                                    <label for="floatingInput">Phone</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberSnsId"
                                    autocomplete="off"
                                    value="${memberDto.memberSnsId}"
                                    required> 
                                    <label for="floatingInput">SNS Id</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberMbti"
                                    autocomplete="off"
                                    value="${memberDto.memberMbti}"
                                    required
                                    readonly> 
                                    <label for="floatingInput">MBTI</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input 
                                    type="text" 
                                    class="form-control" 
                                    name="memberAnimal"
                                    autocomplete="off"
                                    value="${memberDto.memberAnimal}"
                                    required
                                    readonly> 
                                    <label for="floatingInput">MBTI Animal</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <select name="memberInterest1" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberInterest1}">${memberDto.memberInterest1}</option>
                                        <option>#액티비티매니아</option>
                                        <option>#인스타그래머</option>
                                        <option>#금손모임</option>
                                        <option>#친구해요</option>
                                        <option>#뇌섹남녀</option>
                                        <option>#텅장되자</option>
                                        <option>#킹스맨</option>
                                        <option>#자연인</option>
                                        <option>#집사님</option>
                                        <option>#집돌이집순이</option>
                                    </select> <label for="floatingSelect">Interest1</label>
                                </div>
            
                                <div class="form-floating mb-3">
                                    <select name="memberInterest2" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberInterest2}">${memberDto.memberInterest2}</option>
                                        <option>#액티비티매니아</option>
                                        <option>#인스타그래머</option>
                                        <option>#금손모임</option>
                                        <option>#친구해요</option>
                                        <option>#뇌섹남녀</option>
                                        <option>#텅장되자</option>
                                        <option>#킹스맨</option>
                                        <option>#자연인</option>
                                        <option>#집사님</option>
                                        <option>#집돌이집순이</option>
                                    </select> <label for="floatingSelect">Interest2</label>
                                </div>
            
                                <div class="form-floating mb-3">
                                    <select name="memberInterest3" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberInterest3}">${memberDto.memberInterest3}</option>
                                        <option>#액티비티매니아</option>
                                        <option>#인스타그래머</option>
                                        <option>#금손모임</option>
                                        <option>#친구해요</option>
                                        <option>#뇌섹남녀</option>
                                        <option>#텅장되자</option>
                                        <option>#킹스맨</option>
                                        <option>#자연인</option>
                                        <option>#집사님</option>
                                        <option>#집돌이집순이</option>
                                    </select> <label for="floatingSelect">Interest3</label>
                                </div>
            
                                <div class="form-floating mb-3">
                                    <select name="memberPlace1" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberPlace1}">${memberDto.memberPlace1}</option>
                                        <option>서울시 강남구</option>
                                        <option>서울시 영등포구</option>
                                        <option>서울시 강동구</option>
                                    </select> <label for="floatingSelect">Place1</label>
                                </div>
            
                                <div class="form-floating mb-3">
                                    <select name="memberPlace2" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberPlace3}">${memberDto.memberPlace2}</option>
                                        <option>서울시 강남구</option>
                                        <option>서울시 영등포구</option>
                                        <option>서울시 강동구</option>
                                    </select> <label for="floatingSelect">Place2</label>
                                </div>
            
                                <div class="form-floating mb-3">
                                    <select name="memberPlace3" class="form-select" id="floatingSelect">
                                        <option value="${memberDto.memberPlace3}">${memberDto.memberPlace3}</option>
                                        <option>서울시 강남구</option>
                                        <option>서울시 영등포구</option>
                                        <option>서울시 강동구</option>
                                    </select> <label for="floatingSelect">Place3</label>
                                </div>
                           
                                    <button type="submit" class="btn btn-outline-success">정보 수정</button>
                                            
                                <c:if test="${param.error != null}">
                                <div class="row center">
                                    <h3 style="color:red;">비밀번호가 일치하지 않습니다</h3>		
                                </div>	    
                                </c:if>
                            </div>             
				</div>
			</form>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>