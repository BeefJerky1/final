<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.point {
	font-size: 2.3em;
	font-weight: 900;
}
.btn.btn-next{
	border-color: #3E4684;
    background-color: #3E4684;
    color: white;
}
.btn.btn-next:hover{
	border-color: #3E4684;
    background-color: #3E4684;
    color: white;
}
.btn.btn-prev{
	border-color: #3E4684;
    background-color: #3E4684;
    color: white;
}
.btn.btn-prev:hover{
	border-color: #3E4684;
    background-color: #3E4684;
    color: white;
}
.btn.btn-answer1{
	border-color: #F2F2F2;
	border-width: 0.25em;
    background-color: #F2F2F2;
    color: #3E4684;
}
.btn.btn-answer1:hover{
	border-color: #3E4684;
	border-width: 0.25em;
    background-color: #F2F2F2;
    color: #3E4684;
}
.btn.btn-answer2{
	border-color: #F2F2F2;
	border-width: 0.25em;
    background-color: #F2F2F2;
    color: #3E4684;
}
.btn.btn-answer2:hover{
	border-color: #3E4684;
	border-width: 0.25em;
    background-color: #F2F2F2;
    color: #3E4684;
}
.title{
	font-weight: 900;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
		var mbti3 = null;
		var mbti4 = null;

		// 다음 버튼을 누르면 다음 페이지가 나오도록 구현
		$(".btn-next").not(":last").click(function() {
			move(++index);

			if (index == 5) {
				$(".answer").each(function() {
					console.log($(this).text());

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
				$("input[name=memberMbti]").val(mbti1 + mbti2 + mbti3 + mbti4);
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
			console.log(index);
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
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<div id="app" class="container-fluid">
	<form action="join" method="post">
		<div class="row mt-4 p-2">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
				<div class="row text-center">
					<span class="point">회원가입</span>
				</div>

				<div class="container w500 m30 page">
				<div class="col-md-6 offset-md-3">
					<div class="form-floating mt-5 mb-3 mt-4">
						<input type="text" class="form-control" name="memberEmail"
							autocomplete="off" required> <label for="floatingInput">Email
							Address</label>
					</div>

					<div class="form-floating mb-3">
						<input type="password" class="form-control" name="memberPw"
							autocomplete="off" required> <label for="floatingInput">Password</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="memberName"
							autocomplete="off" required> <label for="floatingInput">Name</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="memberNick"
							autocomplete="off" required> <label for="floatingInput">Nickname</label>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" name="memberPhone"
							autocomplete="off" required> <label for="floatingInput">Phone
							Number ( ' - ' 제외)</label>
					</div>

					<div class="form-floating mb-3">
						<select name="memberGender" class="form-select" id="floatingSelect">
							<option value=""></option>
							<option>남자</option>
							<option>여자</option>
						</select> <label for="floatingSelect">Gender</label>
					</div>

					<div class="form-floating mb-3">
						<input type="date" class="form-control" name="memberBirth"
							autocomplete="off" required> <label for="floatingInput">Bitrh</label>
					</div>

					<div class="form-floating mb-3">
						<select name="memberInterest1" class="form-select" id="floatingSelect">
							<option value=""></option>
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
							<option value=""></option>
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
							<option value=""></option>
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
							<option value=""></option>
							<option>서울시 강남구</option>
							<option>서울시 영등포구</option>
							<option>서울시 강동구</option>
						</select> <label for="floatingSelect">Place1</label>
					</div>

					<div class="form-floating mb-3">
						<select name="memberPlace2" class="form-select" id="floatingSelect">
							<option value=""></option>
							<option>서울시 강남구</option>
							<option>서울시 영등포구</option>
							<option>서울시 강동구</option>
						</select> <label for="floatingSelect">Place2</label>
					</div>

					<div class="form-floating mb-3">
						<select name="memberPlace3" class="form-select" id="floatingSelect">
							<option value=""></option>
							<option>서울시 강남구</option>
							<option>서울시 영등포구</option>
							<option>서울시 강동구</option>
						</select> <label for="floatingSelect">Place3</label>
					</div>

					<div class="row center">
						<button type="button" class="btn btn-prev" style="display:none;">이전</button>
						<button type="button" class="btn btn-next mt-1">다음</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 2번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
			<div class="col-md-8 offset-md-2">
				<c:forEach var="mbtiSurveyDto" items="${list}">
					<c:if test="${mbtiSurveyDto.surveyNo < 4}">
						<div class="row text-center">
							<div class="row">
								<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
							</div>
							<div class="row my-2">
								<button type="button" value="E" class="btn btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
							</div>
							<div class="row mt-2 mb-4">
								<button type="button" value="I" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
							</div>
							<span class="answer" style="display:none;"></span>
							<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
						</div>
					</c:if>
				</c:forEach>
				<span class="answer-record1"></span>

				<div class="row center">
					<button type="button" class="btn btn-prev">이전</button>
					<button type="button" class="btn btn-next mt-1">다음</button>
				</div>
				</div>
			</div>
		</div>

		<!-- 3번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
			<div class="col-md-8 offset-md-2">
				<c:forEach var="mbtiSurveyDto" items="${list}">
					<c:if
						test="${mbtiSurveyDto.surveyNo >= 4 && mbtiSurveyDto.surveyNo < 7}">
						<div class="row text-center">
							<div class="row">
								<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.&nbsp;${mbtiSurveyDto.surveyQuestion}</span>
							</div>
							<div class="row my-2">
								<button type="button" value="N" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
							</div>
							<div class="row my-2 mb-4">
								<button type="button" value="S" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
							</div>
							<span class="answer" style="display:none;"></span>
							<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
						</div>
					</c:if>
				</c:forEach>
				<span class="answer-record2"></span>

				<div class="row text-center">
					<button type="button" class="btn btn-prev">이전</button>
					<button type="button" class="btn btn-next mt-1">다음</button>
				</div>
				</div>
			</div>
		</div>

		<!-- 4번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
			<div class="col-md-8 offset-md-2">
				<c:forEach var="mbtiSurveyDto" items="${list}">
					<c:if
						test="${mbtiSurveyDto.surveyNo >= 7 && mbtiSurveyDto.surveyNo < 10}">
						<div class="row text-center">
							<div class="row">
								<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
							</div>
							<div class="row my-2">
								<button type="button" value="F" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
							</div>
							<div class="row my-2 mb-4">
								<button type="button" value="T" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
							</div>
							<span class="answer" style="display:none;"></span>
							<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
						</div>
					</c:if>
				</c:forEach>
				<span class="answer-record3"></span>

				<div class="row text-center">
					<button type="button" class="btn btn-prev">이전</button>
					<button type="button" class="btn btn-next mt-1">다음</button>
				</div>
				</div>
			</div>
		</div>

		<!-- 5번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
			<div class="col-md-8 offset-md-2">
				<c:forEach var="mbtiSurveyDto" items="${list}">
					<c:if test="${mbtiSurveyDto.surveyNo >= 10}">
						<div class="row text-center">
							<div class="row">
								<span class="title my-3">Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
							</div>
							<div class="row my-2">
								<button type="button" value="P" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
							</div>
							<div class="row my-2 mb-4">
								<button type="button" value="J" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
							</div>
							<span class="answer" style="display:none;"></span>
							<!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
						</div>
					</c:if>
				</c:forEach>
				<span class="answer-record4"></span>

				<div class="row text-center">
					<button type="button" class="btn btn-prev">이전</button>
					<button type="button" class="btn btn-next mt-1">다음</button>
				</div>
				</div>
			</div>
		</div>

		<!-- 6번째 페이지 -->
		<div class="container w500 m30 page">
			<div class="col-md-8 offset-md-2 mb-5 p-4 text-dark bg-light rounded">
				<input type="hidden" name="memberMbti">
				<div class="row">
					<button type="submit" class="btn btn-primary fill">가입하기</button>
				</div>

				<div class="row center">
					<button type="button" class="btn btn-prev" style="display:none;">이전</button>
					<button type="button" class="btn btn-next" style="display:none;">다음</button>
				</div>
			</div>
		</div>
	</form>
</div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
