<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menu_list{
		float: left;
		height: 500px;
		width: 130px;
	}
	.talkno{
		width: 50px;
		height: 30px;
		text-align: center;
	}
	.talktitle{
		width: 450px;	
		text-align: center;
	}
	.talkname{
		width: 150px;
		text-align: center;
	}
	.talkdate{
		text-align: center;
	}
	.btn{
		float: right;
	}
	table{
		padding-left: 150px;
		width: 1000px;
	}
	hr{
		width: 1000px;
	}
	span{
		font-size: 30px;
	}
	button{
		margin-left: 800px;
		
	}
</style>
<script type="text/javascript">
	
	
</script>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li>정품판별</li>
		<li><a href="/community/talkList">구림톡</a></li>
	</ul>
	<div>
		<span>구림톡</span>
		<button>글쓰기</button>
	</div>
	<br/>
	<hr/>
	<br/>
	<div id="content">
		<form action="/community/talkGet" id="form">
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="talkno"><c:out value="${vo.talkno }"></c:out></td>
							<td class="talktitle">
								<a class="get" href="${vo.talkno }">
								<c:out value="${vo.talktitle }"></c:out> </a></td>
							<td class="talkname">
							<c:out value="${vo.talkname }"></c:out> 
							</td>
							<td class="talkdate">
							<c:out value="${vo.talkdate }"></c:out></td>
						</tr>
					</c:forEach>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		var form = $("#form");
		
		// 게시글 작성 -------------------------------------
		$("button").click(function() {
			form.attr("action", "/community/talkRegister");
			form.submit();
			//location.href = '/community/talkRegister';
		});
		
		
		// 게시글 상세 보기 -------------------------------------
		$(".get").click(function(e) {	// (오류) 최신 하나의 글만 값을 가지고 갔는데 추측으론 id로 값을 줘서가 아닐까..? 아이디는 단 하나의 값만 가능하기 때문에...
			// <a> 클릭시 페이지 이동이 이루어지지 않게 하기 위해
			e.preventDefault();	// 기본으로 걸려 있는 talkno 경로로 이동 방지
			form.attr("action", "/community/talkGet");	// form의 action 속성을 바꿔줌
			
			var str = '';
			str += '<input type="hidden" name="talkno" value="'+$(this).attr("href")+'">';
			
			//form.append('<input type="hidden" name="talkno" value="'+$(this).attr("href")+'">');
			form.html(str);
			form.submit();
			
			
			//location.href='/community/talkGet?talkno='+${vo.talkno};
		});
		
		
	});
	
	// 수정, 삭제 결과 확인 창 코드
	var result = '<c:out value="${result}"/>';
	
	/* rttr인 result값 (컨트롤러에서 if) 이 빈 값이 아니면(int로 리턴 받기 때문에 성공 했으면 빈값이 아닐 것)
	메소드를 실행하게 한다. */
	
	if(reuslt != ''){
		checkResult(result);
	}
	// 위에 if에서 함수를 탄다고 했고 null이 아니라면 아래 함수를 탈 것 
	function checkResult(result) {
		if(result === 'success'){
			alert("처리가 완료 되었습니다.");
		}
	}
	
	
</script>
</html>
<jsp:include page="../include/footer.jsp"/>