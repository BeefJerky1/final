<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<style>
a {
	text-decoration: none;
	color: #686666;
	font-size: 12px;
}

.card  !important {
	border-radius: 1px;
}

.button-write {
	margin-right: 0.4rem;
}

.modal-form  {
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
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

textarea {

    width: 80%;
    height: 6.25em;
    border: none;
    resize: none;
    border-radius: 24px;
    background-color: white;
    padding : 1rem 1rem;
    font-size: 15px;
    border: 1px solid #ced4da;
    
}

textarea:focus {
	outline: 1px solid #3E4684 !important;
}

.reply-content {
	 font-size: 15px;
	 font-weight:bold;
}

.interest {
    background-color: #E9E9E9;
}

</style>
<div class="container " style="float: none; margin:100 auto;">
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



<div class="container" id="app">
	<div class="row mt-2">
		<div class="col-md-6">
			<div class="card " style="width: 60rem;">
				<div class="card-body">
					<h5 class="card-title"><i class="fa-solid fa-q me-2"></i>${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTitle }</h5>
					<p class="card-text"  style="height:100px;">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardContent }</p>

					<div class="col mb-2 mt-2">
						<span><img src="${root }/image/mbti/강아지(ENFP).png" class="d-block" style="width: 4rem;" alt="profile"></span>
						<span class="interest me-1 mb-2 mt-2">${mbtiMemberListVO.memberDto.memberInterest1 } </span> <span class="interest me-1 mb-2 mt-2">${mbtiMemberListVO.memberDto.memberInterest2}</span>
						<span class="interest me-1 mb-2 mt-2">${mbtiMemberListVO.memberDto.memberInterest3 }</span>
					</div>

					<div class="col mb-2 mt-2">
						<span>${mbtiMemberListVO.memberDto.memberAnimal } </span>
						<span>(${mbtiMemberListVO.memberDto.memberMbti })</span> 
						<span><i class="fa-solid fa-message"></i></span>
					</div>

					<div class="row mt-3">
						<div class="col mt-3 mr-3">
							<a href="write" class="btn btn-edit button-write"
								data-bs-toggle="modal" data-bs-target="#exampleModal">수정</a> <a
								href="delete?mbtiBoardNo=${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo}"
								class="btn btn-outline-success button-write">삭제</a>
						</div>
					</div>


					<!-- 게시글 수정 Modal -->
					<form action="edit" method="post">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">게시글 수정하기</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="row">
											<input type="text" name="mbtiBoardTitle" class="modal-form"
												placeholder="제목">
											<textarea name="mbtiBoardContent" class="modal-form" rows="4"></textarea>

										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-edit"
											data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-outline-success">수정</button>
									</div>
								</div>
							</div>
						</div>
					</form>
					
					

				</div>
				
					<!-- 댓글 작성란 -->
					<div class="row" style="float: none; margin:100 auto;">
						<div class="col" style="float: none; margin:0 auto;">
							<span class="center"><textarea class="" v-model="mbtiReplyContent"></textarea></span>
							<span><button class="btn btn-outline-success" @click="addReply">작성하기</button></span>
							
						</div>
					</div>
					
					<!--  댓글 목록 -->
					<div class="container">
						<h5>${mbtiMemberListVO.mbtiBoardDto.mbtiBoardReplyCount}개의 댓글</h5>
					<div class="row" v-for="(reply, index) in mbtiBoardReplyList" v-bind:key="index">
						<div v-if="!reply.edit">
						<div class="col mt-2 mb-2 pb-2 pt-2">
						<span><img src="${root }/image/mbti/거북이(ISTP).png" class="me-2"  style="width: 2rem;" alt="profile"></span>
						<span class="me-2">{{reply.memberDto.memberAnimal}}</span>
						<span class="me-2 time">{{elapsedText(reply.mbtiBoardReplyDto.mbtiReplyTime)}}</span>
						<span class="me-2"><ion-icon name="create-outline" @click="changeEditMode(index);"></ion-icon></span>
						<span class="me-2"><ion-icon name="trash-outline" @click="deleteReply(index);"></ion-icon></span>
						</div>
						
						<div class="mt-2 mb-2 pb-2 pt-2 reply-body">
						<span class="reply-content">{{reply.mbtiBoardReplyDto.mbtiReplyContent}}</span>
						</div>
					</div>
						<!--  댓글 수정 -->
						<div class="right mt-2 mb-2 pb-2 pt-2 " v-else>
						<textarea class="reply-content fill" rows="5" placeholder="수정 댓글 작성" v-model="mbtiBoardReplyList[index].mbtiBoardReplyDto.mbtiReplyContent"></textarea>
						<button class="btn btn-outline-success" :disabled="isAnonymous" @click="editReply(index);">수정</button>
						</div>
						
					</div>
					</div>

			</div>
		</div>
	</div>
	

</div>
  <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <script src="${root}/js/time.js"></script>
<!-- 
	배포용 cdn (개발자 도구에서 vue가 안 보임)
	<script src="https://unpkg.com/vue@next/dist/vue.global.prod.js"></script>
 -->
<script>
	const app = Vue.createApp({
		
		data(){
			return {
				// 게시글 번호
				mbtiBoardNo:${mbtiMemberListVO.mbtiBoardDto.mbtiBoardNo },
				
				// 댓글 입력 정보
				mbtiReplyContent:"",
				
				// 댓글 목록
				mbtiBoardReplyList:[],

			};
		},
		computed:{
			
		
		},
		methods:{
			// 댓글 추가
			addReply(){
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/",
	        		method:"post",
	        		data:{
	        			mbtiBoardNo:this.mbtiBoardNo,
	        			mbtiReplyContent:this.mbtiReplyContent
	        		},
	        	})
	        	.then(resp=>{
	        		
	        		//완성 시 코드
	        		window.alert("댓글 등록 완료!");
	        		this.mbtiBoardReplyContent = "";
	        		this.loadReply();
	        	});
	        },
	        
	        // 댓글 불러오기
			  loadReply(){
                
		        	axios({
		        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/"+this.mbtiBoardNo,
		        		method:"get",
		        	})
		        	.then(resp=>{
		        		this.mbtiBoardReplyList = resp.data;
		        	});
			},

			// 댓글 삭제
			  deleteReply(index){
	        	const choice = window.confirm("정말 삭제하시겠습니까?");
	        	if(!choice) return;
	        	
	        	const reply = this.mbtiBoardReplyList[index];
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/"+reply.mbtiBoardReplyDto.replyNo,
	        		method:"delete",
	        	})
	        	.then(resp=>{
	        		this.loadReply();
	        	});
	        },
	        
            elapsedText(date) {
            	return dateformat.elapsedText(new Date(date));
            },
            
	        changeEditMode(index){
	        	this.mbtiBoardReplyList[index].edit = true;
	        },
	        changeDisplayMode(index){
	        	this.mbtiBoardReplyList[index].edit = false;	
	        },
	        
	        editReply(index){
	        	const reply = this.mbtiBoardReplyList[index];
	        	if(reply.mbtiBoardReplyDto.mbtiReplyContent.length == 0) return;
	        	
	        	axios({
	        		url:"${pageContext.request.contextPath}/rest/mbtiBoardReply/",
	        		method:"put",
	        		data:{
	        			replyNo:reply.mbtiBoardReplyDto.replyNo,
	        			mbtiReplyContent:reply.mbtiBoardReplyDto.mbtiReplyContent
	        		},
	        	})
	        	.then(resp=>{
	        		window.alert("수정 완료!");
	        		this.loadReply();
	        	});
	        },
			
			
		
		},
		    
		created(){
			this.loadReply();		
		},
	});
	app.mount("#app");

	</script>
  
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>