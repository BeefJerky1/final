<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.tagtitle {
	font-weight: 900;
	font-size: 1.0em;
}

.tagtext {
	font-weight: 900;
	font-size: 0.85em;
}

.card {
	border-width: 0.3em;
}

.card:hover {
	border-color: #3E4684;
	border-width: 0.3em;
}

.maincolor {
	color: #3E4684;
	font-weight: 900;
	font-size: 1.0em;
}

.profile {
	border: 2.5px solid #3E4684;
	/* 	border: 4px solid #E9E9E9; */
	border-radius: 30px;
	padding: 2%;
	width: 100%;
	height: 450px;
	box-shadow: rgb(0 0 0/ 1%) 0px 19px 38px, rgb(0 0 0/ 22%) 0px 15px 12px;
}

.profileNick {
	font-size: 1.0em;
	font-weight: 900;
}

.profileMbti {
	background-color: #3E4684;
	color: white;
	border-radius: 5px;
	font-size: 0.7em;
	font-weight: 300;
}

.profileInterest {
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 15px;
	font-size: 0.8em;
	font-weight: 600;
}

.nav-link {
	color: #3E4684;
	font-weight: 900;
}

i {
	color: #3E4684;
}

.titlefont {
	font-size: 1.2em;
}

.boldfont {
	font-weight: 900;
}

.pluscount {
	width: 40px;
	height: 40px;
	margin-bottom: 5px;
}
</style>
</head>
<body>
	<div id="app" class="container-fluid">
		<div class="container-fluid">
			<div class="col-md-10 offset-md-1">
				<div class="row text-center">
					<img src="${root }/image/mypagedummy.png"
						style="width: 1300px; height: 220px;" />
				</div>

				<div class="row mt-4">
					<div class="col-md-3">
						<div class="col-md-3 profile">
							<div class="profileimg text-center mt-3 mb-2">
								<img src="${root }/image/mbti/거북이(ISTP).png"
									style="border-radius: 50%; width: 140px; height: 140px;" />
							</div>
							<div class="ml-5 text-center mb-3">
								<span class="profileNick"><i class="fa-solid fa-user"></i>&nbsp;${memberDto.memberNick}</span>
								<span class="profileMbti" style="margin-left: 0.5em;">${memberDto.memberAnimal}</span>
							</div>
							<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest1}</div>
							<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest2}</div>
							<div class="text-center profileInterest my-1 mx-5">${memberDto.memberInterest3}</div>

							<div class="row text-center">
								<a href="#">
									<button class="btn btn-outline-success m-1 mt-3" type="submit">관심분야
										변경하기</button>
								</a>
							</div>
							<div class="row text-center">
								<a href="#">
									<button class="btn btn-outline-success m-1 " type="submit">MBTI검사
										다시하기</button>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<ul class="nav nav-tabs tabtitle">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#club">내 소모임</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#buy">회원 증가권 구매</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#info">개인정보 수정</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#pw">비밀번호 변경</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#exit">회원탈퇴</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="club">
								<p>
								<div class="titlefont boldfont mx-1">
									운영중 소모임&nbsp;<i class="fa-solid fa-circle-info"></i>
								</div>
								<table class="table">
									<thead>
										<tr>
											<th>Firstname</th>
											<th>Lastname</th>
											<th>Email</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>John</td>
											<td>Doe</td>
											<td>john@example.com</td>
										</tr>
									</tbody>

								</table>
								<div class="titlefont boldfont mt-5 mx-1">
									가입한 소모임&nbsp;<i class="fa-solid fa-circle-info"></i>
								</div>
								<table class="table">
									<thead>
										<tr>
											<th>Firstname</th>
											<th>Lastname</th>
											<th>Email</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>John</td>
											<td>Doe</td>
											<td>john@example.com</td>
										</tr>
										<tr>
											<td>Mary</td>
											<td>Moe</td>
											<td>mary@example.com</td>
										</tr>
										<tr>
											<td>July</td>
											<td>Dooley</td>
											<td>july@example.com</td>
										</tr>
									</tbody>

								</table>
								</p>
							</div>
							<div class="tab-pane fade" id="buy">
								<p>
								<div class="titlefont boldfont mx-1">
									구매하기&nbsp;<i class="fa-solid fa-circle-info"></i>
								</div>
								<div class="row row-cols-1 row-cols-md-4 g-10 my-2">
									<div class="col">
										<div class="card my-2"
											style="width: 11rem; border-radius: 30px;">
											<div class="card-body m-1">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>10명</span>
												</h5>
												<p class="card-text text-center tagtext">
													<i class="fa-solid fa-won-sign"></i>10000
												</p>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card my-2"
											style="width: 11rem; border-radius: 30px;">
											<div class="card-body m-1">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>30명</span>
												</h5>
												<p class="card-text text-center tagtext boldfont">
													<i class="fa-solid fa-won-sign"></i>25000
												</p>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card my-2"
											style="width: 11rem; border-radius: 30px;">
											<div class="card-body m-1">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>50명</span>
												</h5>
												<p class="card-text text-center tagtext">
													<i class="fa-solid fa-won-sign"></i>35000
												</p>
											</div>
										</div>
									</div>
									<div class="col">
										<div class="card my-2"
											style="width: 11rem; border-radius: 30px;">
											<div class="card-body m-1">
												<h5 class="card-title text-center tagtitle">
													<div class="text-center">
														<img src="${root}/image/crowd.png" class="pluscount">
													</div>
													<span class="maincolor"><i class="fa-solid fa-plus"></i>100명</span>
												</h5>
												<p class="card-text text-center tagtext">
													<i class="fa-solid fa-won-sign"></i>60000
												</p>
											</div>
										</div>
									</div>
								</div>
								<div class="row" style="float: right;">
									<button type="submit" class="btn btn-outline-success">구매</button>
								</div>
								<div class="row titlefont boldfont mt-5 mx-1">구매 및 사용내역</div>
								<table class="table">
									<thead>
										<tr>
											<th>Firstname</th>
											<th>Lastname</th>
											<th>Email</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>John</td>
											<td>Doe</td>
											<td>john@example.com</td>
										</tr>
										<tr>
											<td>Mary</td>
											<td>Moe</td>
											<td>mary@example.com</td>
										</tr>
										<tr>
											<td>July</td>
											<td>Dooley</td>
											<td>july@example.com</td>
										</tr>
									</tbody>

								</table>
							</div>
							
							
							<div class="tab-pane fade" id="info">
								<p>
								<form action="information" method="post"
									enctype="multipart/form-data">
									<div class="col-md-6 offset-md-3">
										<div class="row text-center mt-3 mb-5">
										
										<div class="input-group input-group-sm mb-3">
										  <span class="input-group-text px-3" id="inputGroup-sizing-sm">Name</span>
										  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
										  name="memberName" autocomplete="off" value="${memberDto.memberName}" required>
										</div>
										
										<div class="input-group input-group-sm mb-3">
										  <span class="input-group-text" id="inputGroup-sizing-sm">Nickname</span>
										  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
										  name="memberNick" autocomplete="off" value="${memberDto.memberNick}" required>
										</div>
										
										<div class="input-group input-group-sm mb-3">
										  <span class="input-group-text px-3" id="inputGroup-sizing-sm">Phone</span>
										  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
										  name="memberPhone" autocomplete="off" value="${memberDto.memberPhone}" placeholder="'-' 제외 입력" required>
										</div>
										
										<div class="input-group input-group-sm mb-3">
										  <span class="input-group-text" id="inputGroup-sizing-sm">Instagram Id</span>
										  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"
										  name="memberSnsId" autocomplete="off" value="${memberDto.memberSnsId}" required>
										</div>
										
<!-- 										<div class="input-group"> -->
<!-- 										  <div class="input-group-text"> -->
<%-- 										    <input class="form-check-input" type="radio" value="${memberDto.memberGender}" aria-label="Radio button for following text input"> --%>
<!-- 										  </div> -->
<!-- 										  <input type="text" class="form-control" aria-label="Text input with radio button"> -->
<!-- 										</div> -->
										
<!-- 											<div class="form-floating mb-3"> -->
<!-- 												<select name="memberGender" class="form-select" -->
<!-- 													id="floatingSelect"> -->
<%-- 													<option value="${memberDto.memberGender}">${memberDto.memberGender}</option> --%>
<!-- 													<option>남자</option> -->
<!-- 													<option>여자</option> -->
<!-- 												</select> <label for="floatingSelect">Gender</label> -->
<!-- 											</div> -->

<!-- 											<div class="form-floating mb-3"> -->
<!-- 												<input type="text" class="form-control" name="memberPhone" -->
<%-- 													autocomplete="off" value="${memberDto.memberPhone}" --%>
<!-- 													required> <label for="floatingInput">Phone</label> -->
<!-- 											</div> -->

<!-- 											<div class="form-floating mb-3"> -->
<!-- 												<input type="text" class="form-control" name="memberSnsId" -->
<%-- 													autocomplete="off" value="${memberDto.memberSnsId}" --%>
<!-- 													required> <label for="floatingInput">SNS Id</label> -->
<!-- 											</div> -->

											<div class="mt-2 text-start">
												<label class="label1">관심 지역1</label>
												<div class="row">
													<div class="col">
														<select class="form-control rounded"
															@change="addCityList1" v-model="address1No">
															<option value="" selected>시/도</option>
															<option v-for="(address1, index) in address1List1"
																v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
														</select>
													</div>
													<div class="col">
														<select name="memberPlace1" class="form-control rounded"
															v-model="city1">
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
														<select class="form-control rounded"
															@change="addCityList2" v-model="address2No">
															<option value="">시/도</option>
															<option v-for="(address1, index) in address1List2"
																v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
														</select>
													</div>
													<div class="col">
														<select name="memberPlace2" class="form-control rounded"
															v-model="city2">
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
														<select class="form-control rounded"
															@change="addCityList3" v-model="address3No">
															<option value="">시/도</option>
															<option v-for="(address1, index) in address1List3"
																v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
														</select>
													</div>
													<div class="col">
														<select name="memberPlace3" class="form-control rounded"
															v-model="city3">
															<option value="${memberDto.memberPlace3 }">${memberDto.memberPlace3}</option>
															<option v-for="(address2, index) in address2List3"
																v-bind:key="index" :value="address2.city">{{address2.city}}</option>
														</select>
													</div>
												</div>
											</div>
											<button type="submit" class="btn btn-outline-success mt-4">수정하기</button>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="pw">
								<p>
								<form action="password" method="post">
									<div class="col-md-6 offset-md-3">
										<div class="row text-center mt-3 mb-5">
											<div class="form-floating mb-3 mt-4">
												<input type="password" class="form-control" name="currentPw"
													autocomplete="off" required> <label
													for="floatingInput">기존 비밀번호</label>
											</div>

											<div class="form-floating mb-3">
												<input type="password" class="form-control" name="changePw"
													autocomplete="off" required> <label
													for="floatingInput">변경할 비밀번호</label>
											</div>
											<button type="submit" class="btn btn-outline-success">변경하기</button>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane fade" id="exit">
								<p>
								<form action="exit" method="post">
									<div class="col-md-6 offset-md-3">
										<div class="row text-center mt-3 mb-5">
											<p class="my-4">비밀번호를 입력하세요</p>
											<div class="form-floating mb-3">
												<input type="password" class="form-control" name="memberPw"
													autocomplete="off" placeholder="password" required>
												<label for="floatingInput">Password</label>
											</div>

											<button type="submit" class="btn btn-outline-success my-2">탈퇴하기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>
<!--         <div class="row mt-4 p-2"> -->
<!--             <div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded"> -->
<!--                 <div class="col-md-6 offset-md-3"> -->
<!--                     <div class="row text-center mt-3 mb-5"> -->
<!--                         <span class="point">회원정보</span> -->

<!--                         <div class=" mb-3 mt-1"> -->
<!--                             <a href="information" class="btn btn-outline-success" style="float:right;" role=button>수정</a> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberName" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberName}" --%>
<!--                             required readonly>  -->
<!--                             <label for="floatingInput">Name</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberEmail" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberEmail}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Email</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="password"  -->
<!--                             class="form-control"  -->
<!--                             name="memberPw" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberPw}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Password</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberNick" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberNick}" --%>
<!--                             required readonly>  -->
<!--                             <label for="floatingInput">Nickname</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberGender" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberGender}" --%>
<!--                             required readonly>  -->
<!--                             <label for="floatingInput">Gender</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberPhone" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberPhone}" --%>
<!--                             required readonly>  -->
<!--                             <label for="floatingInput">Phone</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberSnsId" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberSnsId}" --%>
<!--                             required readonly>  -->
<!--                             <label for="floatingInput">SNS Id</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberMbti" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberMbti}" --%>
<!--                             required -->
<!--                             readonly readonly>  -->
<!--                             <label for="floatingInput">MBTI</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberAnimal" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberAnimal}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">MBTI Animal</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberInterest1" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberInterest1}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Interest1</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberInterest2" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberInterest2}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Interest2</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberInterest3" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberInterest3}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Interest3</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberPlace1" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberPlace1}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Place1</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberPlace2" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberPlace2}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Place2</label> -->
<!--                         </div> -->

<!--                         <div class="form-floating mb-3"> -->
<!--                             <input  -->
<!--                             type="text"  -->
<!--                             class="form-control"  -->
<!--                             name="memberPlace3" -->
<!--                             autocomplete="off" -->
<%--                             value="${memberDto.memberPlace3}" --%>
<!--                             required -->
<!--                             readonly>  -->
<!--                             <label for="floatingInput">Place3</label> -->
<!--                         </div> -->

<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->

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