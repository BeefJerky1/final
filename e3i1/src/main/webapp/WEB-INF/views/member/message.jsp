<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.*"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="memberNo" value="${login}"></c:set>
<c:set var="memberAdmin" value="${auth}"></c:set>
<c:set var="isLogin" value="${memberNo != null}"></c:set>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
table {
	font-weight: 600 !Important;
}
.dd{
background-color:transparent !important;
color:transparent !important;
}
.modal-body{
overflow: overlay;
word-break:break-all;
}
.btn-primary{
background-color:#3E4684 !important;
border-color:#3E4684 !important;
}
.btn-primary:hover{
background-color:#2f3564 !important;
border-color:#2f3564 !important;
}
.point2 {
	font-size: 3em;
	font-weight: 900;
	color: #3E4684;
}
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
.title-text-cut {
  white-space:nowrap !important;  
  overflow:hidden !important; 
  text-overflow:ellipsis !important;
  display:block;
  width:250px;
}
.content-text-cut {
  white-space:nowrap !important;  
  overflow:hidden !important; 
  text-overflow:ellipsis !important;
  display:block;
  width:300px;
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

.tableInterest {
	background-color: #E9E9E9;
	color: #3E4684;
	border-radius: 5px;
	padding: 0.1em;
	font-size: 0.8em;
	font-weight: 600;
	width: 30px;
}

.tableInterest2 {
	background-color: #E9E9E9;
	color: #3E4684;
	font-size: 0.85em;
	font-weight: 600;
	width: 30px;
}

.tabletitle{
	font-size: 0.9em;
}

.nav-link {
	color: #3E4684;
	font-weight: 900;
}

i {
	color: #3E4684;
}

.boldfont2{
	font-size: 0.8em;
	font-weight: 900;
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
.smalllabel{
	font-size: 0.8em;
}
thead {
	padding : 1em 1em;
}
</style>
</head>
<body>
	<div id="app" class="container-fluid" style="width: 91%;">
		<div class="container-fluid">
			<div>
				<div class="row text-center">
					<img src="${root }/image/mymessage.png"
						style="width: 1700px; height: 240px;" />
				</div>
				
				<div class="row mt-4">
				<div class="col-md-3">
						<div class="col-md-3 profile" v-if="memberData!=null">
							<div class="profileimg text-center mt-3 mb-2">
								<div v-if="memberData.memberProfileDto.attachNo==0">
                         		<img  style="border-radius: 50%; width: 140px; height: 140px;" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+memberData.animalPhotoDto.attachNo"> 
                            </div>
                            <div v-else>
                         		<img  style="border-radius: 50%; width: 140px; height: 140px;" :src="'http://localhost:8080/e3i1/attachment/download?attachNo='+memberData.memberProfileDto.attachNo">                             
                    		</div>
							</div>
							<div class="ml-5 text-center mb-3">
								<span class="profileNick"><i class="fa-solid fa-user"></i>&nbsp;{{memberData.memberDto.memberNick}}</span> 
								<span class="profileMbti" style="margin-left: 0.5em;">{{memberData.memberDto.memberAnimal}}</span> 
							</div>
							<div class="text-center profileInterest my-1 mx-5">{{memberData.memberDto.memberInterest1}}</div> 
							<div class="text-center profileInterest my-1 mx-5">{{memberData.memberDto.memberInterest2}}</div> 
							<div class="text-center profileInterest my-1 mx-5">{{memberData.memberDto.memberInterest3}}</div> 

							<div class="row text-center">
							</div>
							<div class="row text-center">
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<ul class="nav nav-tabs tabtitle">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#recieved">받은메세지</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#sent">보낸메세지</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade show active" id="recieved">
							<table class="table table-hover text-center">
									<thead>
										<tr>
											<th></th>
											<th style="width: 10%;">보낸사람</th>
											<th style="width: 20%;">제목</th>
											<th style="width: 50%;">내용</th>
											<th style="width: 20%;">날짜</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(received , index) in messageR ">
											<td v-if="received.messageDto.messageReadcount==0"><span class="badge bg-warning  rounded-pill d-inline">new</span></td>
											<td v-else style="width:50px"><span class="badge bg-danger dd">new</span></td>
											<td>{{received.memberDto.memberNick}}</td>
											<td>
											 <span class="title-text-cut" >{{received.messageDto.messageTitle}}</span>
											</td>
											<td v-on:click="detail(index)" data-bs-toggle="modal" data-bs-target="#detail"><span class="content-text-cut" >{{received.messageDto.messageContent}}</span></td>
											<td>{{convertTime(received.messageDto.messageSendTime)}}</td>
										</tr>
									</tbody>
								</table>
								             <button type="button" v-on:click="appendMessageR()" :disabled="this.messageRDataFull==true" class="form-control btn-primary shadow " style="border-radius:1em !important">
        더보기 ({{showMessageR}}/{{totalMessageR}})
    </button>
							</div>
							<div class="tab-pane fade" id="sent">		
								<table class="table table-hover text-center">
									<thead>
										<tr>
											<th style="width: 10%;">받은사람</th>
											<th style="width: 15%;">제목</th>
											<th style="width: 40%;">내용</th>
											<th style="width: 20%;">날짜</th>
											<th style="width: 10%;">확인</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(sent , index) in messageS ">
											<td>{{sent.memberDto.memberNick}}</td>
											<td><span class="title-text-cut">{{sent.messageDto.messageTitle}}</span></td>
											<td  v-on:click="sentMessage(index)" data-bs-toggle="modal" data-bs-target="#sent123"><span class="content-text-cut">{{sent.messageDto.messageContent}}</span></td>
											<td>{{convertTime(sent.messageDto.messageSendTime)}}</td>
											<td v-if="sent.messageDto.messageReceiveTime==null">
												안읽음
											</td>
											<td v-else>
												읽음
											</td>
										</tr>
									</tbody>
								</table>
								<button type="button" v-on:click="appendMessageS()" :disabled="this.messageSDataFull==true" class="form-control btn-primary shadow " style="border-radius:1em !important">
        더보기 ({{showMessageS}}/{{totalMessageS}})
    </button>
							</div>
							<div class="tab-pane fade" id="new message">
							
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<!-- 보낸 메세지 읽기 -->
<div v-if="this.sentMessageDetail!=null">
<div class="modal fade" id="sent123" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">{{sentMessageDetail.memberDto.memberNick}}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
   		<span>제목:{{sentMessageDetail.messageDto.messageTitle}}</span>
      </div>
      <div class="modal-body">
      	내용:{{sentMessageDetail.messageDto.messageContent}}
      </div>
      <div class="modal-body">
      받은시간:{{convertTime(sentMessageDetail.messageDto.messageSendTime)}}
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
</div>
	<!-- 받은 메세지 읽기 -->
<div v-if="this.messageDetail!=null">
<div class="modal fade" id="detail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">{{messageDetail.memberDto.memberNick}}</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
   		제목:{{messageDetail.messageDto.messageTitle}}
      </div>
      <div class="modal-body">
      	내용:<span style=" word-break:break-all;">{{messageDetail.messageDto.messageContent}}</span>
      </div>
      <div class="modal-body">
      받은시간:{{convertTime(messageDetail.messageDto.messageSendTime)}}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" v-on:click="deleteMessage()">삭제</button>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#postModal">답장</button>
      </div>
    </div>
  </div>
</div>
</div>
 <!-- 메세지 모달 -->
    <div v-if="messageDetail!=null">
          <!--  글 작성 모달 -->
      <div class="modal fade" id="postModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 p-4 border-0 bg-light">
               <div class="modal-header d-flex align-items-center justify-content-start border-0 p-0 mb-3">
                  <a href="#" class="text-muted text-decoration-none material-icons" data-bs-dismiss="modal">arrow_back_ios_new</a>
                  <h5 class="modal-title text-muted ms-3 ln-0" id="staticBackdropLabel"><span class="material-icons md-32">account_circle</span></h5>
               </div>
               <!-- 닉네임 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <div class=" rounded-5 border-0 shadow-sm readonly" id="floatingTextarea1" style="height: 50px"><b>To:{{messageDetail.memberDto.memberNick}}</b></div>
                </div>
             </div>
               <!-- 제목 작성 -->
            <div class="modal-body p-0 mb-3">
                <div class="form-floating">
                   <input type="text" class="form-control rounded-5 border-0 shadow-sm" v-model="messageTitle"  id="floatingTextarea2" style="height: 50px" :maxLength="titleMax">
                   <label for="floatingTextarea2" class="h6 text-muted mb-0">제목을 작성하세요.</label>
                </div>
             </div>
             	<!-- 내용 작성 -->
               <div class="modal-body p-0 mb-3">
                  <div class="form-floating">
                     <textarea class="reviewC form-control rounded-5 border-0 shadow-sm" v-model="messageContent"placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px" :maxLength="contentMax"></textarea>
                     <label for="floatingTextarea2" class="h6 text-muted mb-0">내용을 작성하세요.</label>
                  </div>
               </div>

               <div class="modal-footer justify-content-start px-1 py-1 bg-white shadow-sm rounded-5">
                  <div class="rounded-4 m-0 px-3 py-2 d-flex align-items-center justify-content-between w-75">
                     <span class="leg">
                    	<span class="text-muted count2" >{{messageContent.length}}</span> 
                    	/
                    	<span class="text-muted total">{{contentMax}}</span> 
                     </span>
                  </div>
                  <div class="ms-auto m-0">
                  	<button type="button" v-on:click="sendMessage()" data-bs-dismiss="modal" class="writeButton btn btn-primary fw-bold px-3 py-2 fs-6 mb-0 d-flex align-items-center" style="border-radius : 1em; background-color: #514e85; border:none; font-size: 14px !important;">보내기</button>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.3/moment.min.js"></script>

<script>
const app = Vue.createApp({
data() {
	return {
		memberNo:"${memberNo}",
		//회원정보
		memberData:null,
		//받은 메세지 상세
		messageDetail:null,
		//보낸 메세지 상세
		sentMessageDetail:null,
		
		
		messageRAll:[], //전체 받은메세지
		messageR:[], //보여지는 받은메세지
        totalMessageR:0, //전체 받은메세지
        showMessageR:5, //보여주는 받은메세지 수
        messageRLeft:0,//남은 받은메세지 수
        messageRDataFull:false,
        
        messageSAll:[], //전체 보낸메세지
		messageS:[], //보여지는 보낸메세지
        totalMessageS:0, //전체 보낸메세지
        showMessageS:5, //보여주는 보낸메세지 수
        messageSLeft:0,//남은 보낸메세지 수
        messageSDataFull:false,
        
        //메세지 보내기
        messageTitle:"",
        messageContent:"",
        sendMessageResult:"",
        
        //삭제 결과
        deleteResult:"",
        
        //메세지 글자제한
        contentMax:300,
        titleMax:30,
	};
},
computed: {
	// 체크박스 갯수제한 3개를 걸 때 이부분에서 계산하면 될 듯 
	// - 알림창을 여기서 만들면 성능저하가 되기 때문에 계산된 값을 반환해서 메소드에서 알림을 띄워야 한다. 
},
methods: {
	member(){
		axios({
			url:"${pageContext.request.contextPath}/rest/clubboard/modal/"+this.memberNo,
			method:"get",
		}).then(resp=>{
			this.memberData = resp.data
		})
	},
	messageReceived(){
		const messageReceiver = this.memberNo
		axios({
			url:"${pageContext.request.contextPath}/rest/message/received/"+messageReceiver,
			method:"get",
		}).then(resp=>{
			let data = []
			for(var i = 0; i<this.showMessageR;i++){
				data.push(resp.data[i])
			}
			this.messageRAll = resp.data,
			this.messageR = data,
			this.totalMessageR = this.messageRAll.length
			
			if(this.totalMessageR < this.showMessageR){
				this.showMessageR = this.totalMessageR;
				this.messageR = this.messageRAll;
        		this.messageRDataFull=true;
			}else if(this.showMessageR==this.totalMessageR){
        		this.messageRDataFull=true;
			}else if(this.totalMessageR>this.showMessageR){ 
        		this.messageRDataFull=false; //버튼은 disable
			}
		})
	},
	 appendMessageR(){
    	//남은 게시글 수 확인
    	this.messageRLeft = this.totalMessageR- this.showMessageR;
    	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
    	if(this.messageRLeft < 5){
			this.showMessageR = this.totalMessageR;
			this.messageR = this.messageRAll;
			this.messageRLeft = this.totalMessageR- this.showMessageR;
        	this.messageReceived();
    	}else 
    	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
    	if(this.messageRLeft >= 5){
    		this.showMessageR +=5
    		this.messageRLeft = this.totalMessageR- this.showMessageR;
    	let data =[]
    	for(var i=0; i<this.showMessageR; i++){
    		data.push(this.messageRAll[i])
    	}
    	this.messageR = data
    	this.messageReceived();
    	//남은 게시글 수가 0개라면 버튼 클릭 X
    	}else if(this.messageRLeft==0){
    		this.messageRDataFull=true;
    		
    	}
    	
    },
	messageSent(){
		const messageWriter = this.memberNo
		axios({
			url:"${pageContext.request.contextPath}/rest/message/sent/"+messageWriter,
			method:"get",
		}).then(resp=>{
			let data = []
			for(var i = 0; i<this.showMessageS;i++){
				data.push(resp.data[i])
			}
			this.messageSAll = resp.data,
			this.messageS = data,
			this.totalMessageS = this.messageSAll.length
			
			if(this.totalMessageS < this.showMessageS){
				this.showMessageS = this.totalMessageS;
				this.messageS = this.messageSAll;
        		this.messageSDataFull=true;
			}else if(this.showMessageS==this.totalMessageS){
        		this.messageSDataFull=true;
			}else if(this.totalMessageS>this.showMessageS){ 
        		this.messageSDataFull=false; //버튼은 disable
			}
		})
	},
	appendMessageS(){
    	//남은 게시글 수 확인
    	this.messageSLeft = this.totalMessageS- this.showMessageS;
    	//게시글 수가 5개 이하라면 전체 게시글 수를 showboard에 넣는다.
    	if(this.messageSLeft < 5){
			this.showMessageS = this.totalMessageS;
			this.messageS = this.messageSAll;
			this.messageSLeft = this.totalMessageS- this.showMessageS;
        	this.messageSent();
    	}else 
    	//게시글 수가 5개 이상이면 showBoard +5에 데이터 추가
    	if(this.messageSLeft >= 5){
    		this.showMessageS +=5
    		this.messageSLeft = this.totalMessageS- this.showMessageS;
    	let data =[]
    	for(var i=0; i<this.showMessageS; i++){
    		data.push(this.messageSAll[i])
    	}
    	this.messageS = data
    	this.messageSent();
    	//남은 게시글 수가 0개라면 버튼 클릭 X
    	}else if(this.messageSLeft==0){
    		this.messageSDataFull==true;
    		
    	}
    	
    },
    //moment js
    convertTime(time){
    	return moment(time).format('LLL'); // 2022년 7월 4일 월요일 오후 9:46

    },
    detail(index){
    	const message = this.messageR[index];
    	axios({
    		url:"${pageContext.request.contextPath}/rest/message/detail/"+message.messageDto.messageNo,
    		method:"get",
    	}).then(resp=>{
    		this.messageDetail = resp.data
    		console.log(this.messageDetail)
    	})
    },
    sentMessage(index){
    	const message = this.messageS[index];
    	axios({
    		url:"${pageContext.request.contextPath}/rest/message/detailsent/"+message.messageDto.messageNo,
    		method:"get",
    	}).then(resp=>{
    		this.sentMessageDetail = resp.data
    		console.log(this.sentMessageDetail)
    	})
    },
    sendMessage(){
			const messageReceiver = this.messageDetail.messageDto.messageWriter
			if(this.messageContent=='' ||this.messageContent==null)return
			axios({
				url:"${pageContext.request.contextPath}/rest/message/send",
				method:"post",
				data:{
					messageWriter:this.memberNo,
					messageContent:this.messageContent,
					messageTitle:this.messageTitle,
					messageReceiver:messageReceiver
				},
			}).then(resp=>{
				this.sendMessageResult=resp.data;
				if(this.sendMessageResult==1){
					this.messageContent=""
					this.messageTitle=""
					window.alert("메세지 전송이 완료되었습니다.")
					this.messageReceived();
					this.messageSent();
				}else{
					window.alert("오류가 발생하였습니다. 나중에 다시 시도해주십시오.")
				}
			})
			
		},
		deleteMessage(){
			const messageNo = this.messageDetail.messageDto.messageNo
			console.log(messageNo)
			axios({
				url:"${pageContext.request.contextPath}/rest/message/delete/"+messageNo,
				method:"delete",
			}).then(resp=>{
				this.deleteResult = resp.data
				if(this.deleteResult==1){
					window.alert("삭제가 완료되었습니다.")
					this.messageReceived();
					this.messageSent();
				}else{
					window.alert("오류가 발생하였습니다. 나중에 다시 시도해주십시오.")
				}
			})
		},
		
},
created() {
	this.member();
	this.messageReceived();
	this.messageSent();
},
})
app.mount("#app");
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>