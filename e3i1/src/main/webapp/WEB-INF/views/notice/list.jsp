<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<style>
.point {
	font-size: 2.3em;
	font-weight: 900;
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
.noticetitle{
	font-size: 1.2em;
	font-weight: 900;
}

.noticehead{
	font-size: 0.9em;
	font-weight: 900;
}

/* .card {
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(50%,-50%);

} */
</style>

<div class="container w950 m30">

	<div class="container ">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="${root }/image/banner01.png" class="d-block w-100"
						alt="banner">
				</div>
				<div class="carousel-item">
					<img src="${root }/image/banner02.png" class="d-block w-100"
						alt="banner">
				</div>
				<div class="carousel-item">
					<img src="${root }/image/banner03.png" class="d-block w-100"
						alt="banner">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>

	<div class="container " style="float: none; margin: 0 auto;">
		<div class=" mb-3 mt-1 ">
			<a href="write" class="btn btn-outline-success" style="float: right;"
				role=button>글쓰기</a>
		</div>
		<!-- 검색창 -->
		<form action="list" method="get">
			<select name="type" class="input-box input-box">
				<option value="notice_title">제목</option>
				<option value="notice_content">내용</option>
			</select> <input type="search" name="keyword" placeholder="검색어 입력" required
				class="input-box">

		</form>
	</div>

	<div class="mb-4 p-4 mt-4 text-dark bg-light rounded">
		<div class="row">
			<span class="point mb-2">NOTICE</span>
			<table class="table table-border">
				<thead>
					<tr>
						<th class="text-center">말머리</th>
						<th class="text-center" width="80%">제목</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="noticeDto" items="${list}">
						<tr>
							<td> <span class="noticehead"> [${noticeDto.noticeHead}] </span></td>
							<td class="left">
							<a href="detail?noticeNo=${noticeDto.noticeNo}">
								<span class="noticetitle">${noticeDto.noticeTitle}</span></a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>



<div class="text-center mb-4">

	<c:if test="${p > 1}">
		<c:choose>
			<c:when test="${search}">
				<a href="list?p=1&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?p=1&s=${s}">&laquo;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:if test="${startBlock > 1}">
		<c:choose>
			<c:when test="${search}">
				<a
					href="list?p=${startBlock-1}&s=${s}&type=${type}&keyword=${keyword}">&laquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?p=${startBlock-1}&s=${s}">&laquo;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

	<!-- 숫자 링크 영역 -->
	<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
		<c:choose>
			<c:when test="${search}">
				<c:choose>
					<c:when test="${i == p}">
						<a class="active"
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
						<a class="active" href="list?p=${i}&s=${s}">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="list?p=${i}&s=${s}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<!-- 다음 버튼 영역 -->
	<c:if test="${endBlock < lastPage}">
		<c:choose>
			<c:when test="${search}">
				<a
					href="list?p=${endBlock+1}&s=${s}&type=${type}&keyword=${keyword}">&gt;</a>
			</c:when>
			<c:otherwise>
				<a href="list?p=${endBlock+1}&s=${s}">&gt;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

	<c:if test="${p < lastPage}">
		<c:choose>
			<c:when test="${search}">
				<a href="list?p=${lastPage}&s=${s}&type=${type}&keyword=${keyword}">&raquo;</a>
			</c:when>
			<c:otherwise>
				<a href="list?p=${lastPage}&s=${s}">&raquo;</a>
			</c:otherwise>
		</c:choose>
	</c:if>

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