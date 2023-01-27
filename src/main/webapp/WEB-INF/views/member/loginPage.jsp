<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>

<div>
	<form>
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
					<input type="text" name="m_pw">
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<button>로그인</button>
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
		$("#joinBtn").on("click", function(e){
			e.preventDefault();
			location.href="/member/joinPage";
		});
	});
</script>
<jsp:include page="../include/footer.jsp"/>