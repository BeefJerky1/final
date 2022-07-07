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
			<form action="information" method="post" enctype="multipart/form-data">
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
            
                           <div class="mt-2 text-start">
							<label class="label1">관심 지역1</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList1" v-model="address1No"> 
										<option value="" selected>시/도</option>
										<option v-for="(address1, index) in address1List1"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace1" class="form-control rounded" v-model="city1">
										<option value="${memberDto.memberPlace1}">${memberDto.memberPlace1}</option>
										<option v-for="(address2, index) in address2List1"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-2 text-start">
							<label class="label1">관심 지역2</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList2" v-model="address2No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List2"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace2" class="form-control rounded" v-model="city2">
										<option value="${memberDto.memberPlace2 }">${memberDto.memberPlace2 }</option>
										<option v-for="(address2, index) in address2List2"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
						</div>
						<div class="mt-2 text-start">
							<label class="label1">관심 지역3</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList3" v-model="address3No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List3"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace3" class="form-control rounded" v-model="city3">
										<option value="${memberDto.memberPlace3 }">${memberDto.memberPlace3}</option>
										<option v-for="(address2, index) in address2List3"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
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

<script>
const app = Vue.createApp({
data() {
	return {
		// 지역 목록용
		address1List1: [],
		address2List1: [],
		
		address1List2: [],
		address2List2: [],
		
		address1List3: [],
		address2List3: [],
				
		// 시/도 번호
		address1No : "",
		address2No : "",
		address3No : "",
		// 시/군/구 값
		city1: "${memberDto.memberPlace1}",		
		city2: "${memberDto.memberPlace2}",		
		city3: "${memberDto.memberPlace3}",		
		
	};
},
computed: {
	// 체크박스 갯수제한 3개를 걸 때 이부분에서 계산하면 될 듯 
	// - 알림창을 여기서 만들면 성능저하가 되기 때문에 계산된 값을 반환해서 메소드에서 알림을 띄워야 한다. 
},
methods: {
	// 시/군/구 추가
	addCityList1(){
		if(this.address1No == ""){
			this.address2List1 = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address1No,
			method:"get",
		}).then((resp) => {
			this.city1 = "${memberDto.memberPlace1}";
			this.address2List1 = [];
			this.address2List1.push(...resp.data);
		})		
	},
	
	addCityList2(){
		if(this.address2No == ""){
			this.address2List2 = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address2No,
			method:"get",
		}).then((resp) => {
			this.city2 = "${memberDto.memberPlace2}";
			this.address2List2 = [];
			this.address2List2.push(...resp.data);
		})		
	},
	
	addCityList3(){
		if(this.address3No == ""){
			this.address2List3 = [];
			return;
		}
		// 시/군/구
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address2/"+this.address3No,
			method:"get",
		}).then((resp) => {
			this.city3 = "${memberDto.memberPlace3}";
			this.address2List3 = [];
			this.address2List3.push(...resp.data);
		})		
	},
},
created() {
	// 시/도 
	axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/address1",
			method:"get",
		}).then((resp) => {
			this.address1List1.push(...resp.data);
			this.address1List2.push(...resp.data);
			this.address1List3.push(...resp.data);
		})	
	},
});
app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>