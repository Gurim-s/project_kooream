<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<div>
	<form id="myForm" method="post">
		<table>
			<tr>
				<td>
					<span>아이디</span>
				</td>
				<td colspan="2">
					<input type="text" class="input" name="m_id"> <!-- 시큐리티에 m_id를 보내기위한 고정name -->
				</td>
			</tr>
			<tr>
				<td>
					<span>비밀번호</span>
				</td>
				<td colspan="2">
					<input type="password" class="input" name="m_pw"> <!-- 시큐리티에 m_pw를 보내기위한 고정name -->
					<!-- 시큐리티 토큰 -->
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button id="loginBtn">로그인</button>
				</td>
			</tr>
			<tr>
				<td>
					<button id="joinBtn">회원가입</button>
				</td>
				<td>
					<button>아이디찾기</button>
				</td>
				<td>
					<button>비밀번호찾기</button>
				</td>
			</tr>
		
		</table>
	</form>
</div>

<script type="text/javascript" src='/resources/js/rental/slick.min.js'></script>
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
	});
</script>
<jsp:include page="../include/footer.jsp"/>