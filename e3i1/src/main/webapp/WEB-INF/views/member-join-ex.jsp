<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
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
		$(".btn-next").not(":last").click(function(){
			move(++index);
			
			if(index == 5){
				$(".answer").each(function(){
					console.log($(this).text());
					
					if($(this).text() == 'E'){
						count1++;
					}
					else if($(this).text() == 'N'){
						count2++;
					}
					else if($(this).text() == 'F'){
						count3++;
					}
					else if($(this).text() == 'P'){
						count4++;
					}
					else{
						count5++;
					}
				});
				
				// mbti 결과 도출
				if(count1 >= 2){
					mbti1 = 'E';
				}
				else{
					mbti1 = 'I';
				}
				
				if(count2 >= 2){
					mbti2 = 'N';
				}
				else{
					mbti2 = 'S';
				}
				
				if(count3 >= 2){
					mbti3 = 'F';
				}
				else{
					mbti3 = 'T';
				}
				
				if(count4 >= 2){
					mbti4 = 'P';
				}
				else{
					mbti4 = 'J';
				}
				// mbti결과값 input에 저장
				$("input[name=memberMbti]").val(mbti1+mbti2+mbti3+mbti4);
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
		$(".btn-prev").not(":first").click(function(){
			move(--index);
			console.log(index);
		});
		
		var mbti;
		
		// 질문버튼 클릭시 기능
		$(".btn-answer1").click(function(){
			// 선택된 값 저장
			mbti = $(this).val();
			$(this).parent("div").parent("div").find(".answer").text(mbti);
			
			// 색변경
			$(this).css("background-color", "lightblue");
			$(this).css("color", "white");
			$(this).parent("div").parent("div").find(".btn-answer2").css("background-color", "white");
			$(this).parent("div").parent("div").find(".btn-answer2").css("color","gray");
		});
		$(".btn-answer2").click(function(){
			// 선택된 값 저장		
			mbti = $(this).val();
			$(this).parent("div").parent("div").find(".answer").text(mbti);
			
			// 색변경
			$(this).css("background-color", "lightblue");
			$(this).css("color", "white");
			$(this).parent("div").parent("div").find(".btn-answer1").css("background-color", "white");
			$(this).parent("div").parent("div").find(".btn-answer1").css("color","gray");
		});
		
		
		function move(index){
			$(".page").hide();
			$(".page").eq(index).show();
		}
	});
</script>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>    

    <div class="container w500">
      <div class="row center">
        <h1>회원가입</h1>
      </div>
      
      <form action="join" method="post">
      <div class="container w500 m30 page">
        <div class="row">
          <label>아이디</label>
          <input
            type="text"
            name="memberId"
            placeholder="영어소문자, 숫자 8~20자"
            autocomplete="off"
            required
            class="form-input fill"
          />
        </div>

        <div class="row">
          <label>비밀번호</label>
          <input
            type="password"
            name="memberPassword"
            autocomplete="off"
            placeholder="영어,숫자,특수문자 8~16자리"
            required
            class="form-input fill"
          />
        </div>

        <div class="row">
          <label>전화번호</label>
          <input
            type="tel"
            name="memberPhone"
            autocomplete="off"
            placeholder="- 제외하고 입력"
            required
            class="form-input fill"
          />
        </div>
        
        <div class="row">
          <label>이메일</label>
          <input type="email" name="memberEmail" autocomplete="off" required class="form-input fill">
        </div>
        
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
      
      <!-- 2번째 페이지 -->
      <div class="container w500 m30 page">
      	<c:forEach var="mbtiSurveyDto" items="${list}">
	      	<c:if test="${mbtiSurveyDto.surveyNo < 4}">
		      	<div class="row center m50">
		      		<div class="row m30">
			      		<span>Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="E" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="I" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
			      	</div>
			      	<span class="answer"></span> <!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
		      	</div>
	      	</c:if>
      	</c:forEach>
		<span class="answer-record1"></span>
      	
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
      
      <!-- 3번째 페이지 -->
      <div class="container w500 m30 page">
      	<c:forEach var="mbtiSurveyDto" items="${list}">
	      	<c:if test="${mbtiSurveyDto.surveyNo >= 4 && mbtiSurveyDto.surveyNo < 7}">
		      	<div class="row center m50">
		      		<div class="row m30">
			      		<span>Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="N" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="S" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
			      	</div>
			      	<span class="answer"></span> <!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
		      	</div>
	      	</c:if>
      	</c:forEach>
		<span class="answer-record2"></span>
      	
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
      
      <!-- 4번째 페이지 -->
      <div class="container w500 m30 page">
      	<c:forEach var="mbtiSurveyDto" items="${list}">
	      	<c:if test="${mbtiSurveyDto.surveyNo >= 7 && mbtiSurveyDto.surveyNo < 10}">
		      	<div class="row center m50">
		      		<div class="row m30">
			      		<span>Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="F" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="T" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
			      	</div>
			      	<span class="answer"></span> <!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
		      	</div>
	      	</c:if>
      	</c:forEach>
		<span class="answer-record3"></span>
      	
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
      
      <!-- 5번째 페이지 -->
      <div class="container w500 m30 page">
      	<c:forEach var="mbtiSurveyDto" items="${list}">
	      	<c:if test="${mbtiSurveyDto.surveyNo >= 10}">
		      	<div class="row center m50">
		      		<div class="row m30">
			      		<span>Q${mbtiSurveyDto.surveyNo}.${mbtiSurveyDto.surveyQuestion}</span>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="P" class="btn fill btn-answer1">${mbtiSurveyDto.surveyAnswer1}</button>
			      	</div>
			      	<div class="row">
			      		<button type="button" value="J" class="btn fill btn-answer2">${mbtiSurveyDto.surveyAnswer2}</button>
			      	</div>
			      	<span class="answer"></span> <!-- span.text()로 값을 적힌 값을 쓸 수 있을 듯 -->
		      	</div>
	      	</c:if>
      	</c:forEach>
		<span class="answer-record4"></span>
      	
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
      </div>
       
       <!-- 6번째 페이지 -->
       <div class="container w500 m30 page">
       	<input type="hidden" name="memberMbti">
        <div class="row">
          <button type="submit" class="btn btn-primary fill">가입하기</button>
        </div>
        
        <div class="row center">
	       	<button type="button" class="btn btn-prev">이전</button>
	       	<button type="button" class="btn btn-next">다음</button>
        </div>
       </div>
        
      </form>
    </div>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>   