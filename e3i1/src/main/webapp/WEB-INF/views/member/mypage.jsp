<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}
</style>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div id="app" class="container-fluid">
        <div class="row mt-4 p-2">
            <div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
                <div class="col-md-6 offset-md-3">
                    <div class="row text-center mt-3 mb-5">
                        <span class="point">회원정보</span>
                        
                        <div class=" mb-3 mt-1">
                            <a href="information" class="btn btn-outline-success" style="float:right;" role=button>수정</a>
                        </div>
                        
                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberName"
                            autocomplete="off"
                            value="${memberDto.memberName}"
                            required readonly> 
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
                            required readonly> 
                            <label for="floatingInput">Nickname</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberGender"
                            autocomplete="off"
                            value="${memberDto.memberGender}"
                            required readonly> 
                            <label for="floatingInput">Gender</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberPhone"
                            autocomplete="off"
                            value="${memberDto.memberPhone}"
                            required readonly> 
                            <label for="floatingInput">Phone</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberSnsId"
                            autocomplete="off"
                            value="${memberDto.memberSnsId}"
                            required readonly> 
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
                            readonly readonly> 
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
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberInterest1"
                            autocomplete="off"
                            value="${memberDto.memberInterest1}"
                            required
                            readonly> 
                            <label for="floatingInput">Interest1</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberInterest2"
                            autocomplete="off"
                            value="${memberDto.memberInterest2}"
                            required
                            readonly> 
                            <label for="floatingInput">Interest2</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberInterest3"
                            autocomplete="off"
                            value="${memberDto.memberInterest3}"
                            required
                            readonly> 
                            <label for="floatingInput">Interest3</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberPlace1"
                            autocomplete="off"
                            value="${memberDto.memberPlace1}"
                            required
                            readonly> 
                            <label for="floatingInput">Place1</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberPlace2"
                            autocomplete="off"
                            value="${memberDto.memberPlace2}"
                            required
                            readonly> 
                            <label for="floatingInput">Place2</label>
                        </div>

                        <div class="form-floating mb-3">
                            <input 
                            type="text" 
                            class="form-control" 
                            name="memberPlace3"
                            autocomplete="off"
                            value="${memberDto.memberPlace3}"
                            required
                            readonly> 
                            <label for="floatingInput">Place3</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>