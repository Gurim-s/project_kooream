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
					<input type="text" name="m_id">
				</td>
			</tr>
			<tr>
				<td>
					<span>비밀번호</span>
				</td>
				<td colspan="2">
					<input type="password" name="m_pw">
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
		// 회원가입 버튼 클릭이벤트
		$("#joinBtn").on("click", function(e){
			e.preventDefault();
			location.href="/member/joinPage";
		});
		
		// 로그인 버튼 클릭이벤트
		$("#loginBtn").on("click", function(e){
			e.preventDefault();
			console.log("---")
			$("#myForm").attr("action","/member/login");
			$("#myForm").submit();
		});
	});
</script>
<jsp:include page="../include/footer.jsp"/>