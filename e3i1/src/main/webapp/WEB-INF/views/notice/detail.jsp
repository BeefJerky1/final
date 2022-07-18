<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
.point {
	font-size: 1.5em;
	font-weight: 900;
	color: #3E4684;
}

.point2 {
	font-size: 3em;
	font-weight: 900;
	color: #3E4684;
}

.noticehead {
	font-size: 1.1em;
	font-weight: bold;
}

.noticetitle {
	font-size: 1.1em;
	font-weight: bold;
}

.noticecontent {
	font-size: 0.9em;
}

.two {
	float: left;
	text-align: center;
	width: 40%;
}

.btn {
	margin-right: 0.3em;
	margin-left: 0.3em;
}
</style>


<div id="app" class="container">
	<div class="col-md-8 offset-md-2 mb-3 mt-2">
		<div class="row text-center mb-3">
			<h1 class="point2">NOTICE</h1>
		</div>
	</div>
	<div class="col-md-8 offset-md-2 mb-3">
		<div class="text-center">
			<table class="table table-border" style="width:800px;">
				<tr>
					<td class="left"><span class="noticehead"> <c:if
								test="${detailVO.noticeHead != null}">
						[${detailVO.noticeHead}]
						</c:if>
					</span> <span class="noticetitle"> &nbsp;${detailVO.noticeTitle} </span>
					</td>
				</tr>

				<tr>
					<td class="left">${detailVO.memberNick}</td>
				</tr>

				<tr height="250">
					<td valign="top" class="left noticecontent"><div>
							<br>${detailVO.noticeContent}</div>
							<img src="${root}/attachment/download?attachNo=${detailVO.attachNo}"
						style="width: 800px; height: 600px;"/>
					</td>
				</tr>
				<tr>
					<td>
					
					</td>
				</tr>
			</table>
			<div class="mt-3 mb-4">
				<a href="${pageContext.request.contextPath}/notice/list"
					class="btn btn-edit">목록</a>
					
				<button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
					data-bs-target="#exampleModal">수정</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title point" id="exampleModalLabel">EDIT</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form action="edit" method="post" enctype="multipart/form-data">
									<div class="form-floating mb-3">
										<input type="hidden" name="noticeNo" value="${detailVO.noticeNo}"> 
										<input type="hidden" name="attachNo" value="${detailVO.attachNo}">
										<select name="noticeHead" class="form-select" id="floatingSelect">
											<option value="${detailVO.noticeHead}">${detailVO.noticeHead}</option>
											<option>이벤트</option>
											<option>공지</option>
											<option>긴급</option>
										</select> <label for="floatingSelect">말머리</label>
									</div>

									<div class="form-floating mb-3">
										<input type="text" class="form-control" name="noticeTitle"
											value="${detailVO.noticeTitle}" autocomplete="off" required>
										<label for="floatingInput">제목</label>
									</div>
									
									<div class="form-floating mb-3">
										<input type="file" accept="img/*" name="attachment">
									</div>

									<div class="form-floating mb-3">
										<textarea class="form-control" id="floatingTextarea"
											name="noticeContent" style="height: 350px">${detailVO.noticeContent}</textarea>

										<label for="floatingTextarea">내용</label>
									</div>
									<div class="col-md-8 offset-md-2 text-center">
										<a href="detail?noticeNo=${detailVO.noticeNo}"
											class="btn btn-edit" data-bs-dismiss="modal">취소</a>
										<button type="submit" class="btn btn-outline-success" @click="confirm">등록</button>
										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<a
					href="${pageContext.request.contextPath}/notice/delete/${detailVO.noticeNo}"
					class="btn btn-outline-success">삭제</a>
			</div>
		</div>
	</div>
</div>
<script src="https://unpkg.com/vue@next"></script>
<!-- <script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script> -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
//div[id=app]을 제어할 수 있는 Vue instance를 생성
const app = Vue.createApp({
    //data : 화면을 구현하는데 필요한 데이터를 작성한다.
    data(){
        return {
        	//서버에서 전달된 정보
            memberNo:"${login}",
            memberAdmin:"${auth}",
            boardNo:${detailVO.noticeNo},
        };
    },
    //computed : data를 기반으로 하여 실시간 계산이 필요한 경우 작성한다.
    // - 3줄보다 많다면 사용하지 않는 것을 권장한다(복잡한 계산 시 성능 저하가 발생)
    computed:{
        isAnonymous(){
        	return this.memberNo == "" || this.memberAdmin == "";
        },
        isMember(){
        	return this.memberNo != "" && this.memberAdmin != "";
        },
        isAdmin(){
        	return this.isMember && this.memberAdmin == "관리자";
        },
        
        boardContentIsEmpty(){
        	return this.boardContent.length == 0;
        },
    },
    //methods : 애플리케이션 내에서 언제든 호출 가능한 코드 집합이 필요한 경우 작성한다.
    methods:{
    	
    	confirm(){
    		console.log(${noticeDto.noticeNo});
    	},
        
    },
    //watch : 특정 data를 감시하여 연계 코드를 실행하기 위해 작성한다
    watch:{
        
    },
    created(){
    	
    },
});
app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>