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


.card  !important{
	    border-radius: 1px;
}

</style>
    
    


		<div class="container">
			<div class="row mt-2" >
				<div class="col-md-6">
				<div class="card " style= "width:60rem;">
					<div class="card-body">
						<h5 class="card-title">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardTitle }</h5>
						<p class="card-text">${mbtiMemberListVO.mbtiBoardDto.mbtiBoardContent }</p>

						<div class="col">
							<span>${mbtiMemberListVO.memberDto.memberInterest1 } </span> <span>${mbtiMemberListVO.memberDto.memberInterest2}</span>
							<span>${mbtiMemberListVO.memberDto.memberInterest3 }</span>
						</div>

						<div class="col">
							<span>${mbtiMemberListVO.memberDto.memberAnimal } </span> <span><i
								class="fa-solid fa-message"></i></span>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
