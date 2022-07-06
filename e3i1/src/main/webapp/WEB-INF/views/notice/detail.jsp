<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
.point {
	font-size: 2.3em;
	font-weight: bold;
}

.noticehead {
	font-size: 1.1em;
	font-weight: bold;
}

.noticetitle {
	font-size: 1.0em;
/* 	font-weight: bold; */
}

.noticecontent {
	font-size: 0.9em;
}
.two {
	float: left;
	text-align: center;
	width: 40%;
}
</style>

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
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>

<div id="app" class="container">
	<div class="col-md-8 offset-md-2 mb-4 p-4 mt-4 text-dark bg-light rounded">
	<div class="row text-center mb-3">
			<h1 class="point">NOTICE</h1>
		</div>
		<div class="row">
			<table class="table table-border">
				<tr>
					<td class="left">
						<span class="noticehead">
							<c:if test="${noticeDto.noticeHead != null}">
						[${noticeDto.noticeHead}]
						</c:if>
						</span>
						<span class="noticetitle">
							&nbsp;${noticeDto.noticeTitle}
						</span>
					</td>
				</tr>

				<tr>
					<td class="left">${boardDto.boardWriter}</td>
				</tr>

				<tr height="250">
					<td valign="top" class="left noticecontent"><div>${noticeDto.noticeContent}</div>
					</td>
				</tr>

				<tr>
					<td style="float: right;">
					<a href="${pageContext.request.contextPath}/notice/edit?noticeNo=${noticeDto.noticeNo}"
						class="btn btn-edit">수정</a> <a
						href="${pageContext.request.contextPath}/notice/edit/${noticeDto.noticeNo}"
						class="btn btn-edit">수정</a> <a
						href="${pageContext.request.contextPath}/notice/delete/${noticeDto.noticeNo}"
						class="btn btn-edit">삭제</a> <a
						href="${pageContext.request.contextPath}/notice/list"
						class="btn btn-outline-success">목록</a></td>
				</tr>
			</table>
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
            boardNo:${noticeDto.noticeNo},
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