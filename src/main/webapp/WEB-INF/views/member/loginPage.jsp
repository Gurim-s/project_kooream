<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<style>
	button{
		border: 0;
		width: 280px;
		height: 53px;
		border-radius: 7px;
		color: white;
		background-color: black; 
	}
	button:active {
 		background-color: rgba(34,34,34,.8);
	}
	#loginBox{
		width: 300px;
		margin: auto;
		margin-top: 104px;
		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
	}
	#loginUl li{
		padding: 10px;
	}
	input{
		border:0 solid black;
		width: 280px;
	}
	input:focus {outline:none;}
	.inputBox{
		border-bottom: 1px solid gray;
	}
	.btn{
		text-align: center;
	}
	.btn span{
		padding: 25px;
		font-size: 13px;
	}
	.spanId, button{
		font-weight: bold;
		font-size: 14px;
	}
	.btn button,.btn{
		cursor: pointer;
	}
	h1{
		margin-bottom: 35px;
	}
	
</style>
<div id="loginBox">
	<h1 style="text-align: center; ">Login</h2>
	<form id="myForm" method="post">
		<ul id="loginUl">
			<li class="title">
				<span class="spanId">아이디</span>
			</li>
			<li class="inputBox">	
				<input type="text" class="input" name="m_id"> <!-- 시큐리티에 m_id를 보내기위한 고정name -->
			</li>
			<li class="title">
				<span class="spanId">비밀번호</span>
			</li>
			<li class="inputBox">
				<input type="password" class="input" name="m_pw"> <!-- 시큐리티에 m_pw를 보내기위한 고정name -->
				<!-- 시큐리티 토큰 -->
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			</li>
			<li class="btn">
				<button id="loginBtn">로그인</button>
			</li>
			<li class="btn">
				<span id="joinBtn">회원가입</span>
				<span id="findInfoBtn">계정찾기</span>
			</li>
		</ul>
	</form>
</div>

<script  type="text/javascript">
	$(function(){
		// 로그인 실패시 문구 출력
		if("${LoginFailMessage}"){
			alert("${LoginFailMessage}")
		}
		// 회원가입 버튼 클릭이벤트
		$("#joinBtn").on("click", function(e){
			e.preventDefault();
			location.href="/member/joinPage";
		});
		
		// 로그인 버튼 클릭이벤트
		$("#loginBtn").on("click", function(e){
			e.preventDefault();
			var idxx=0;
			$('.input').each(function (index, item) {
			   if(!$(this).val()){
				   alert($(this).parent().prev().children("span").text() + "을(를) 입력하세요.");
				   idxx=1;
				   return false;
			   } 
			});
			if(idxx==0){
				$("#myForm").attr("action","/login");
				$("#myForm").submit();
			}
		});
		/*
		// 아이디찾기 버튼 클릭 이벤트-이메일
		$("#findIdBtn").on("click", function(e){
			e.preventDefault();
			$("#myForm").attr("action","/member/findId");
			$("#myForm").submit();
		});
		*/
		
		// 계정찾기 버튼 클릭 이벤트
		$("#findInfoBtn").on("click", function(e){
			e.preventDefault();
			location.href="/member/findInfoPage";
		});
		
	});
</script>
<jsp:include page="../include/footer.jsp"/>