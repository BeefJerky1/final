<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member.css">
<style>
.grayback{
	background-color: #E2E2E2;
	padding: 2px;
}
</style>


<div id="app" class="container-fluid">
	<form action="join" method="post">
		<div class="row mt-4 p-2">
			<div class="col-md-8 offset-md-2 ">
				<div class="row text-center">
					<span class="point">회원가입</span>
				</div>

				<div class="container w500 m30 page">
					<div class="col-md-6 offset-md-3">
						<div class="form-floating mt-5 mb-3">
							<input type="text" class="form-control" name="memberEmail" v-bind:class="emailClassObject" v-model="member.memberEmail" v-on:blur="idValidation"
								autocomplete="off" required> <label for="floatingInput">Email
								Address</label>
								<div class="valid-feedback"></div>
               				    <div class="invalid-feedback">이메일 형식이 올바르지 않습니다.</div>
						</div>

						<div class="form-floating mb-3">
							<input type="password" class="form-control" name="memberPw" v-bind:class="pwClassObject" v-model="member.memberPw" v-on:blur="pwValidation"
								autocomplete="off" v-bind:type="passwordInputType" required> <label for="floatingInput">Password</label>
								<div class="valid-feedback"></div>
               				    <div class="invalid-feedback">영문 대소문자/숫자/특수문자(!@#$%)를 반드시 포함한 8~16자로 작성하세요.</div>
						</div>
						
						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="memberName" v-bind:class="nameClassObject" v-model="member.memberName" v-on:blur="nameValidation"
								autocomplete="off" required> <label for="floatingInput">Name</label>
								<div class="valid-feedback"></div>
               				    <div class="invalid-feedback">이름은 한글 2~7자로 작성하세요.</div>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="memberNick" v-bind:class="nickClassObject" v-model="member.memberNick" v-on:blur="nickValidation"
								autocomplete="off" required> <label for="floatingInput">Nickname</label>
								<div class="valid-feedback"></div>
               				    <div class="invalid-feedback">닉네임은 한글/영문/숫자로 2~10자로 작성하세요.</div>
						</div>

						<div class="form-floating mb-3">
							<input type="text" class="form-control" name="memberPhone" v-bind:class="phoneClassObject" v-model="member.memberPhone" v-on:blur="phoneValidation"
								autocomplete="off" required> <label for="floatingInput">Phone
								Number ( ' - ' 제외)</label>
								<div class="valid-feedback"></div>
               				    <div class="invalid-feedback">핸드폰번호는 ' - ' 제외 11자리 숫자로 입력하세요.</div>
						</div>

						<div class="form-floating mb-3">
							<select name="memberGender" class="form-select" required
								id="floatingSelect">
								<option value=""></option>
								<option>남자</option>
								<option>여자</option>
							</select> <label for="floatingSelect">Gender</label>
						</div>

						<div class="form-floating mb-3">
							<input type="date" class="form-control" name="memberBirth"
								autocomplete="off" required> <label for="floatingInput">Bitrh</label>
						</div>

						<div class="mt-2 text-start">
							<label class="label1">관심 지역1</label>
							<div class="row">
								<div class="col">
									<select class="form-control rounded" @change="addCityList1" required
										v-model="address1No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List1"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace1" class="form-control rounded" required
										v-model="city1">
										<option value="">시/군/구</option>
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
									<select class="form-control rounded" @change="addCityList2"
										v-model="address2No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List2"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace2" class="form-control rounded"
										v-model="city2">
										<option value="">시/군/구</option>
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
									<select class="form-control rounded" @change="addCityList3"
										v-model="address3No">
										<option value="">시/도</option>
										<option v-for="(address1, index) in address1List3"
											v-bind:key="index" :value="address1.address1No">{{address1.province}}</option>
									</select>
								</div>
								<div class="col">
									<select name="memberPlace3" class="form-control rounded"
										v-model="city3">
										<option value="">시/군/구</option>
										<option v-for="(address2, index) in address2List3"
											v-bind:key="index" :value="address2.city">{{address2.city}}</option>
									</select>
								</div>
							</div>
						</div>

						<button type="button" class="btn btn-prev" style="display: none;">이전</button>
						<button type="button" class="btn btn-next mt-3"
							style="float: right;">다음</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 2번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 p-4 mb-2">
				<div class="col-md-8 offset-md-2">
				<div class="boldfontM text-center mb-1">
				<i class="fa-solid fa-quote-left"></i>&nbsp;MBTI 성향테스트를 진행하세요!&nbsp;<i class="fa-solid fa-quote-right"></i>
				</div>
					<c:forEach var="mbtiSurveyDto" items="${list}">
						<c:if test="${mbtiSurveyDto.surveyNo < 4}">
							<div class="text-center">
								<div class="row">
									<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
								</div>
								<div class="row my-2">
									<button type="button" value="E" class="btn btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
								</div>
								<div class="row mt-2 mb-4">
									<button type="button" value="I" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
								</div>
								<span class="answer" style="display: none;"></span>
								<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
							</div>
						</c:if>
					</c:forEach>
					<span class="answer-record1"></span>


					<button type="button" class="btn btn-prev mt-3"
						style="float: left;">이전</button>
					<button type="button" class="btn btn-next mt-3 ml-2"
						style="float: right;">다음</button>

				</div>
			</div>
		</div>

		<!-- 3번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4">
				<div class="col-md-8 offset-md-2">
					<c:forEach var="mbtiSurveyDto" items="${list}">
						<c:if
							test="${mbtiSurveyDto.surveyNo >= 4 && mbtiSurveyDto.surveyNo < 7}">
							<div class="text-center">
								<div class="row">
									<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
								</div>
								<div class="row my-2">
									<button type="button" value="N" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
								</div>
								<div class="row my-2 mb-4">
									<button type="button" value="S" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
								</div>
								<span class="answer" style="display: none;"></span>
								<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
							</div>
						</c:if>
					</c:forEach>
					<span class="answer-record2"></span>

					<button type="button" class="btn btn-prev mt-3"
						style="float: left;">이전</button>
					<button type="button" class="btn btn-next mt-3"
						style="float: right;">다음</button>
				</div>
			</div>
		</div>

		<!-- 4번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4">
				<div class="col-md-8 offset-md-2">
					<c:forEach var="mbtiSurveyDto" items="${list}">
						<c:if
							test="${mbtiSurveyDto.surveyNo >= 7 && mbtiSurveyDto.surveyNo < 10}">
							<div class="text-center">
								<div class="row">
									<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
								</div>
								<div class="row my-2">
									<button type="button" value="F" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
								</div>
								<div class="row my-2 mb-4">
									<button type="button" value="T" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
								</div>
								<span class="answer" style="display: none;"></span>
								<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
							</div>
						</c:if>
					</c:forEach>
					<span class="answer-record3"></span>

					<button type="button" class="btn btn-prev mt-3"
						style="float: left;">이전</button>
					<button type="button" class="btn btn-next mt-3"
						style="float: right;">다음</button>
				</div>
			</div>
		</div>

		<!-- 5번째 페이지 --> 
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4">
				<div class="col-md-8 offset-md-2">
					<c:forEach var="mbtiSurveyDto" items="${list}">
						<c:if test="${mbtiSurveyDto.surveyNo >= 10 && mbtiSurveyDto.surveyNo < 13}">
							<div class="text-center">
								<div class="row">
									<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
								</div>
								<div class="row my-2">
									<button type="button" value="J" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
								</div>
								<div class="row my-2 mb-4">
									<button type="button" value="P" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
								</div>
								<span class="answer" style="display: none;"></span>
								<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
							</div>
						</c:if>
					</c:forEach>
					<span class="answer-record4"></span>

					<button type="button" class="btn btn-prev mt-3"
						style="float: left;">이전</button>
					<button type="button" class="btn btn-next mt-3"
						style="float: right;">다음</button>
				</div>
			</div>
		</div>

		<!-- 6번째 페이지 -->
		<div class="container w500 m30 page mb-5" style="height:600px;">
			<div class="col-md-8 offset-md-2 mb-5 mt-3">
				<input type="hidden" name="memberMbti" ref="memberMbti">
				<div class="grayback text-center boldfont mb-3">
					<i class="fa-solid fa-tag"></i>&nbsp;관심태그 3가지를 설정하세요!
				</div>
				<div class="row row-cols-1 row-cols-md-3 g-10 my-2">
					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#인스타그래머')}" style="width: 15rem; border-radius: 30px;">
							<label for="cat1">
								<div class="card-body m-1">
									<h5 class="card-title text-center tagtitle"><label class="maincolor"># </label> 인스타그래머 
									<i class="fa-brands fa-instagram-square"></i>
									</h5>
									<input id="cat1" type="checkbox" value="\#인스타그래머" v-model="interest">
									<p class="card-text text-center tagtext">
										남는 건 사진 뿐!<br>내 모든 순간을 남기자!
									</p>
								</div>
							</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#액티비티매니아')}" style="width: 15rem; border-radius: 30px;">
							<label for="cat2">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 액티비티매니아
								<i class="fa-solid fa-person-running" class="coloricon"></i></h5>
								<input id="cat2" type="checkbox" value="\#액티비티매니아" v-model="interest">
								<p class="card-text text-center tagtext">
									나를 죽이지 못한 고통은<br>나를 더욱 강하게 만든다!
								</p>
							</div>
							</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#친구해요')}" style="width: 15rem; border-radius: 30px;">
							<label for="cat3">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 친구해요
								<i class="fa-solid fa-user-group"></i></h5>
								<input id="cat3" type="checkbox" value="\#친구해요" v-model="interest">
								<p class="card-text text-center tagtext">다들 모여!<br>사람 만나는 게 제일 좋아!</p>
							</div>
							</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#뇌색남녀')}" style="width: 15rem; border-radius: 30px;">
							<label for="cat4">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 뇌색남녀
								<i class="fa-solid fa-book"></i></h5>
								<input id="cat4" type="checkbox" value="\#뇌색남녀" v-model="interest">
								<p class="card-text text-center tagtext">
									지금 잠을 자면 꿈을 꾸지만<br>지금 공부하면 꿈을 이룰지도..?
								</p>
							</div>
							</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#텅장되자')}" style="width: 15rem; border-radius: 30px;">
						<label for="cat5">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 텅장되자
								<i class="fa-solid fa-cart-shopping"></i></h5>
								<input id="cat5" type="checkbox" value="\#텅장되자" v-model="interest">
								<p class="card-text text-center tagtext">
									사는재미 없으면<br>사는 재미라도!
								</p>
							</div>
						</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#킹스맨')}" style="width: 15rem; border-radius: 30px;">
						<label for="cat6">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 킹스맨
								<i class="fa-solid fa-clapperboard"></i></h5>
								<input id="cat6" type="checkbox" value="\#킹스맨" v-model="interest">
								<p class="card-text text-center tagtext">
									관람객 매너가<br>명작을 만든다!
								</p>
							</div>
						</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#집돌이집순이')}" style="width: 15rem; border-radius: 30px;">
						<label for="cat7">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 집돌이집순이
								<i class="fa-solid fa-house"></i></i></h5>
								<input id="cat7" type="checkbox" value="\#집돌이집순이" v-model="interest">
								<p class="card-text text-center tagtext">
									집에서 할 게<br>얼마나 많은데?!
								</p>
							</div>
						</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#금손모임')}" style="width: 15rem; border-radius: 30px;">
						<label for="cat8">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 금손모임
								<i class="fa-solid fa-hand-sparkles"></i></i></h5>
								<input id="cat8" type="checkbox" value="\#금손모임" v-model="interest">
								<p class="card-text text-center tagtext">똥손도 괜찮아요~<br>함께 만들어요!</p>
							</div>
						</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#자연인')}" style="width: 15rem; border-radius: 30px;">
						<label for="cat9">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 자연인
								<i class="fa-solid fa-mountain-sun"></i></h5>
								<input id="cat9" type="checkbox" value="\#자연인" v-model="interest">
								<p class="card-text text-center tagtext">
									산은 산이요~<br>물은 물이로다~
								</p>
							</div>
						</label>
						</div>
					</div>

					<div class="col">
						<div class="card my-2" :class="{'checked':isChecked('\#집사님')}" style="width: 15rem; border-radius: 30px;">
						<label for="cat10">
							<div class="card-body m-1">
								<h5 class="card-title text-center tagtitle"><span class="maincolor"># </span> 집사님
								<i class="fa-solid fa-paw"></i></h5>
								<input id="cat10" type="checkbox" value="\#집사님" v-model="interest">
								<p class="card-text text-center tagtext">
									저는 주인님을<br>모시고 있습니다!
								</p>
							</div>
						</label>
						</div>
					</div>
				</div>

				<button type="button" class="btn btn-prev mt-1" style="float: left;">이전</button>
				<button type="button" class="btn btn-next mt-1" @click="callAnimal"
					style="float: right;">다음</button>
			</div>
		</div>

		<!-- 7번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark">
				<input type="hidden" name="memberAnimal" :value="memberAnimal.mbtiAnimalDto.animal" v-if="memberAnimal.mbtiAnimalDto != null">
				<input type="hidden" name="memberInterest1" :value="interest[0]">
				<input type="hidden" name="memberInterest2" :value="interest[1]">
				<input type="hidden" name="memberInterest3" :value="interest[2]">
				<input type="hidden" name="attachNo" :value="memberAnimal.attachmentDto.attachNo" v-if="memberAnimal.attachmentDto != null">
				<div class="row">
				<div class="boldfontM text-center mb-4">
				<i class="fa-solid fa-quote-left"></i>&nbsp;MBTI 성향분석 완료!&nbsp;<i class="fa-solid fa-quote-right"></i>
				</div>
					<div v-if="memberAnimal != null">
						<div class="text-center">
							<img src="${pageContext.request.contextPath}/image/mbti/코끼리(INFP).png" v-if="memberAnimal.attachmentDto == null" style="width: 200px; height: 200px;">  
							<img :src="'${pageContext.request.contextPath}/attachment/download?attachNo='+memberAnimal.attachmentDto.attachNo" v-if="memberAnimal.attachmentDto != null" style="width: 200px; height: 200px;">
						</div>

						<div class="card-title text-center boldfontL mt-3 " style="color: #3E4684;" v-if="memberAnimal.mbtiAnimalDto != null">{{memberAnimal.mbtiAnimalDto.animal}}&nbsp;({{memberAnimal.mbtiAnimalDto.mbti}})</div> 
						<div class="card-title text-center boldfontM" v-if="memberAnimal.mbtiAnimalDto != null">{{memberAnimal.mbtiAnimalDto.mbtiSummary}}</div><br>
						<div class="text-center boldfontS"><i class="fa-solid fa-circle-exclamation"></i>&nbsp;자동으로 동물 프로필이 저장됩니다. 마이페이지에서 변경하세요!</div> 

					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-12 text-center mb-3">
						<button type="submit" class="btn btn-outline-success" style="width: 30%;">SISO 가입하기</button>
					</div>
				</div>
		
				<div class="row">
					<button type="button" class="btn btn-prev">이전</button>
					<button type="button" class="btn btn-next" style="display: none;">다음</button>
				</div>
			</div>
		</div>
</form>
</div>
<script src="https://unpkg.com/vue@next"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>
	$(function() {
		// 현재 페이지 
		var index = 0;

		// 처음 페이지를 제외하고 모두 숨김 처리
		move(index);

		// 각 mbti count 변수
		var count1 = 0;
		var count2 = 0;
		var count3 = 0;
		var count4 = 0;
		var count5 = 0;

		// mbti 결과 저장 변수
		var mbti1 = "";
		var mbti2 = "";
		var mbti3 = "";
		var mbti4 = "";

		// 다음 버튼을 누르면 다음 페이지가 나오도록 구현
		$(".btn-next").not(":last").click(function() {
			move(++index);

			if (index == 5) {
				$(".answer").each(function() {
					if ($(this).text() == 'E') {
						count1++;
					} else if ($(this).text() == 'N') {
						count2++;
					} else if ($(this).text() == 'F') {
						count3++;
					} else if ($(this).text() == 'P') {
						count4++;
					} else {
						count5++;
					}
				});

				// mbti 결과 도출
				if (count1 >= 2) {
					mbti1 = 'E';
				} else {
					mbti1 = 'I';
				}

				if (count2 >= 2) {
					mbti2 = 'N';
				} else {
					mbti2 = 'S';
				}

				if (count3 >= 2) {
					mbti3 = 'F';
				} else {
					mbti3 = 'T';
				}

				if (count4 >= 2) {
					mbti4 = 'P';
				} else {
					mbti4 = 'J';
				}
				// mbti결과값 input에 저장
				var forAnimal = $("input[name=memberMbti]").val(mbti1 + mbti2 + mbti3 + mbti4);
				
				// 확인용
				console.log($("input[name=memberMbti]").val());
			}
			// 확인용 
			/* console.log(count1);
			console.log(count2);
			console.log(count3);
			console.log(count4);
			console.log(count5); */

		});
		// 이전 버튼을 누르면 이전 페이지가 나오도록 구현
		$(".btn-prev").not(":first").click(function() {
			move(--index);
		});

		var mbti;

		// 질문버튼 클릭시 기능
		$(".btn-answer1").click(
				function() {
					// 선택된 값 저장
					mbti = $(this).val();
					$(this).parent("div").parent("div").find(".answer").text(
							mbti);

					// 색변경
					$(this).css("background-color", "#3E4684");
					$(this).css("border-color", "#3E4684");
					$(this).css("border-width", "0.25em");
					$(this).css("color", "white");
					$(this).parent("div").parent("div").find(".btn-answer2")
							.css("background-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer2")
							.css("color", "#3E4684");
					$(this).parent("div").parent("div").find(".btn-answer2")
					.css("border-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer2")
					.css("border-width", "0.25em");
				});
		$(".btn-answer2").click(
				function() {
					// 선택된 값 저장		
					mbti = $(this).val();
					$(this).parent("div").parent("div").find(".answer").text(
							mbti);

					// 색변경
					$(this).css("background-color", "#3E4684");
					$(this).css("border-color", "#3E4684");
					$(this).css("border-width", "0.25em");
					$(this).css("color", "white");
					$(this).parent("div").parent("div").find(".btn-answer1")
							.css("background-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer1")
							.css("color", "#3E4684");
					$(this).parent("div").parent("div").find(".btn-answer1")
					.css("border-color", "#F2F2F2");
					$(this).parent("div").parent("div").find(".btn-answer1")
					.css("border-width", "0.25em");
				});

		function move(index) {
			$(".page").hide();
			$(".page").eq(index).show();
		}
	});
	
// vue
// 지역 
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
		city1: "",		
		city2: "",		
		city3: "",		
		
		// mbti별 동물 
		memberAnimal: [],
		
		interest:[],
		
		//회원가입 정보
		member:{
            memberEmail:"",
            memberPw:"",
            memberNick:"",
           	memberName:"",
           	memberPhone:"",
           	memberPwAgain:"",
           	
            get memberEmailValid(){
                const regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
                return regex.test(this.memberEmail);
            },
            get memberPwValid(){
                const regex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%])[A-Za-z0-9!@#$%]{8,16}$/;
                return regex.test(this.memberPw);
            },
            get memberNickValid(){
                const regex = /^[a-zA-Z0-9가-힣]{2,10}$/;
                return regex.test(this.memberNick);
            },
            get memberNameValid(){
                const regex = /^[가-힣]{2,7}$/;
                return regex.test(this.memberName);
            },
            get memberPhoneValid(){
                const regex = /^[0-9]{11}$/;
                return regex.test(this.memberPhone);
            },
        },
        
        emailClassObject:{
            'is-valid':false,
            'is-invalid':false,
        },
        pwClassObject:{
            'is-valid':false,
            'is-invalid':false,
        },
        nickClassObject:{
            'is-valid':false,
            'is-invalid':false,
        },
        nameClassObject:{
            'is-valid':false,
            'is-invalid':false,
        },
        phoneClassObject:{
            'is-valid':false,
            'is-invalid':false,
        },
	};
},
computed: {
},
methods: {
	idValidation(){
        this.emailClassObject["is-valid"] = this.member.memberEmailValid;
        this.emailClassObject["is-invalid"] = !this.member.memberEmailValid;
    },
    pwValidation(){
        this.pwClassObject["is-valid"] = this.member.memberPwValid;
        this.pwClassObject["is-invalid"] = !this.member.memberPwValid;
    },
    nickValidation(){
        this.nickClassObject["is-valid"] = this.member.memberNickValid;
        this.nickClassObject["is-invalid"] = !this.member.memberNickValid;
    },
    nameValidation(){
        this.nameClassObject["is-valid"] = this.member.memberNameValid;
        this.nameClassObject["is-invalid"] = !this.member.memberNameValid;
    },
    phoneValidation(){
        this.phoneClassObject["is-valid"] = this.member.memberPhoneValid;
        this.phoneClassObject["is-invalid"] = !this.member.memberPhoneValid;
    },
    
	// checkbox 
	isChecked(value){
		// 체크박스 갯수제한
		if(this.interest.length > 3){
			this.interest?.shift();
		}
		return this.interest?.includes(value);
	},
	
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
			this.city1 = "";
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
			this.city2 = "";
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
			this.city3 = "";
			this.address2List3 = [];
			this.address2List3.push(...resp.data);
		})		
	},
	callAnimal(){
		// mbti별 동물
		const mbti = this.$refs.memberMbti;
		
		axios({
			url:"${pageContext.request.contextPath}/rest/category_n_address/animal/"+mbti.value,
			method:"get",
		}).then((resp) => {
			this.memberAnimal = resp.data;
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