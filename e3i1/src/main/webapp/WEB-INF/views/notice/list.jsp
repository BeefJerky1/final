<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

a {
	text-decoration: none;
	color: #686666;
	font-size: 12px;
}

.mbti-board:hover {
	transform: scale(1.02);
	color: #686666;
	font-size: 12px;
}

.modal-form {
	display: block;
	width: 100%;
	padding: 0.375rem 0.75rem;
	margin: 0.3rem 0.1rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 1rem !important;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.input-box {
	width: auto;
	height: 40px;
	border-radius: 24px;
	background-color: white;
	padding-left: 40px;
	padding-right: 40px;
	font-size: 15px;
	border: 1px solid #ced4da;
}

.input-box:focus {
	outline: 1px solid #3E4684 !important;
}

.interest {
	background-color: #E9E9E9;
}

.noticetitle {
	font-size: 1.2em;
	font-weight: 900;
	padding-top: 5px;
	padding-bottom: 4px;
}

.noticetitle:hover {
	color: #3E4684;
	font-size: 1.2em;
	font-weight: 900;
	padding-top: 5px;
	padding-bottom: 4px;
}

.noticehead {
	font-size: 0.9em;
	font-weight: 900;
	color: #3E4684;
	padding-top: 5px;
	padding-bottom: 4px;
	margin-left: 2em;
}

.nav-link {
	color: #3E4684;
	font-size: 1.0em;
}

.nav-link.active {
	font-weight: 900;
}

.active2 {
	font-size: 1em;
	color: white;
	background-color: #3E4684;
	padding-right: 11px;
	padding-left: 11px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.active2:hover {
	font-size: 1em;
	color: white;
	background-color: #3E4684;
	padding-right: 11px;
	padding-left: 11px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.active3 {
	font-size: 1em;
	color: #3E4684;
	border-color: #3E4684;
	padding-right: 11px;
	padding-left: 11px;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-right: 11px;
}

.active3:hover {
	font-size: 1em;
	color: #3E4684;
	border-color: #3E4684;
	padding-right: 11px;
	padding-left: 11px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.active4 {
	font-size: 1.3em;
	color: #3E4684;
}
</style>

<div class="container w950 m30">
	<div class="text-center mt-2 point2">
		NOTICE
	</div>
	<ul class="nav justify-content-center mt-2 mb-3">
		<li class="nav-item"><a class="nav-link active"
			aria-current="page" href="${root}/notice/list">전체</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="${root}/notice/list?type=notice_head&keyword=%EA%B3%B5%EC%A7%80">공지</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="${root}/notice/list?type=notice_head&keyword=%EC%9D%B4%EB%B2%A4%ED%8A%B8">이벤트</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="${root}/notice/list?type=notice_head&keyword=%EA%B8%B4%EA%B8%89">긴급</a></li>
	</ul>

	<div class="container text-center">
		<button type="button" class="btn btn-outline-success"
			data-bs-toggle="modal" data-bs-target="#exampleModal">글쓰기</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title point" id="exampleModalLabel">NOTICE</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="write" method="post">
							<div class="form-floating mb-3">
								<select name="noticeHead" class="form-select"
									id="floatingSelect">
									<option value=""></option>
									<option>이벤트</option>
									<option>공지</option>
									<option>긴급</option>
								</select> <label for="floatingSelect">말머리</label>
							</div>

							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="noticeTitle"
									autocomplete="off" required> <label for="floatingInput">제목</label>
							</div>

							<div class="form-floating mb-3">
								<textarea class="form-control" id="floatingTextarea"
									name="noticeContent" style="height: 250px"></textarea>

								<label for="floatingTextarea">내용</label>
							</div>
							<div class="col-md-8 offset-md-2 text-center">
								<a href="list" class="btn btn-edit two m-3"
									data-bs-dismiss="modal">취소</a>
								<button type="submit" class="btn btn-outline-success two m-3">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container" style="width: 70%;">
	<div class="row mt-3">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width: 20%;"></th>
					<th style="width: 50%;"></th>
					<th style="width: 30%;"></th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="noticeDto" items="${list}">
					<tr>
						<td><div class="noticehead my-5">[${noticeDto.noticeHead}]</div></td>
						<td><a href="detail?noticeNo=${noticeDto.noticeNo}"><div
									class="noticetitle text-center my-5">${noticeDto.noticeTitle}</div></a></td>
						<td><a href="detail?noticeNo=${noticeDto.noticeNo}"><img
								src="${root }/image/LOGO.png"
								style="width: 200px; height: 130px; float: right; padding: 10px; margin-right: 2.5em;" /></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>

<div class="text-center mt-3 mb-4">

	<c:if test="${p > 1}">
		<c:choose>
			<c:when test="${search}">
				<a class="active4"
					href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a class="active4" href="list?p=1&s=${s}">&laquo;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:if test="${startBlock > 1}">
		<c:choose>
			<c:when test="${search}">
				<a class="active4"
					href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a class="active4" href="list?p=${startBlock-1}&s=${s}">&laquo;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

	<!-- 숫자 링크 영역 -->
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
		<c:choose>
			<c:when test="${search}">
				<c:choose>
					<c:when test="${i == p}">
						<a class="active2"
							href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="list?p=${i}&s=${s}&type=${type}&keyword=${keyword}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${i == p}">
						<a class="active2" href="list?p=${i}&s=${s}">${i}</a>
					</c:when>
					<c:otherwise>
						<a class="active3" href="list?p=${i}&s=${s}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- 다음 버튼 영역 -->
	<c:if test="${endBlock < lastPage}">
		<c:choose>
			<c:when test="${search}">
				<a class="active4"
					href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
			</c:when>
			<c:otherwise>
				<a class="active4" href="list?p=${endBlock+1}&s=${s}">&gt;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:if test="${p < lastPage}">
		<c:choose>
			<c:when test="${search}">
				<a class="active4"
					href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a class="active4" href="list?p=${lastPage}&s=${s}">&raquo;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

</div>

<!-- 검색창 -->
<div class="text-center mt-3 mb-5">
	<form action="list" method="get">
		<select name="type" class="input-box input-box">
			<option value="notice_title">제목</option>
			<option value="notice_content">내용</option>
		</select> <input type="search" name="keyword" required class="input-box">
</div>

</form>

</div>


<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="https://unpkg.com/vue@next"></script>
<script src="${root}/js/time.js"></script>
<script>
	const app = Vue.createApp({
		
		data(){
			return {

			};
		},
		computed:{
			
		
		},
		methods:{
			
			},
		
		created(){
		
			// 2. axios를 이용하는 방법
			// axios({옵션}).then(성공).catch(에러);
			// .then(function(resp){ 에서 this를 사용하기 위해 애로우 펑션 사용 
			// .then((resp)=>{})
			// method : get, post, put, delete 등 Mapping의 종류
		
		},
	});
	app.mount("#app");
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>