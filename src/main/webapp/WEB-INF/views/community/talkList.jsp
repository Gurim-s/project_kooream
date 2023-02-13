<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menu_list{
		float: left;
		height: 100%;
		margin-bottom: 100%;
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
		width: 80%;
	}
	span{
		font-size: 25px;
	}
	button{
		margin-left: 800px;
		border: none;
		background-color: #fff;	
	}
	.pagination{
		text-align: center;
	}
	.paginate_button{
		display: inline-block;
	}
	
</style>
<script type="text/javascript">
	
	
</script>
</head>
<body>
	<ul id="menu_list">
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span><strong>구림톡</strong></span>
		<sec:authorize access="isAuthenticated()">
		<button>글쓰기</button>
		</sec:authorize>
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
			<!-- 페이징 처리 -->
			<div class="pull-right">
				<ul class ="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage-1 }">&lt;</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" step="1">
						<li class="paginate_button ${pageMaker.cri.pageNum==num ? 'active':'' }">
							<a href="${num }">${num }</a>
						</li>
					</c:forEach>
					<c:if test="${pagaMaker.next }">
						<li class="paginate_button">
							<a href="${pageMaker.endPage+1 }">&gt;</a>
						</li>
					</c:if>
				</ul>
			</div>
			<table>
				<tr>
					<td><input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"></td>
					<td><input type="hidden" name="amount" value="${pageMaker.cri.amount }"></td>
				</tr>
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
			
			// 페이징 처리를 위한 값을 담기 위해
			var str = '';
			str += '<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">';
			str += '<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">';
			
			form.html(str);
			form.submit();
			//location.href = '/community/talkRegister';
		});
		
		
		// 게시글 상세 보기 -------------------------------------
		$(".get").click(function(e) {	// (오류) 최신 하나의 글만 값을 가지고 갔는데 추측으론 id로 값을 줘서가 아닐까..? 아이디는 단 하나의 값만 가능하기 때문에...
			// <a> 클릭시 페이지 이동이 이루어지지 않게 하기 위해
			e.preventDefault();	// 기본으로 걸려 있는 talkno 경로로 이동 방지
			form.attr("action", "/community/talkGet");	// form의 action 속성을 바꿔줌
			
			var str = '';
			str += '<input type="hidden" name="pageNum" value="'+${pageMaker.cri.pageNum }+'">';
			str += '<input type="hidden" name="amount" value="'+${pageMaker.cri.amount }+'">';
			str += '<input type="hidden" name="talkno" value="'+$(this).attr("href")+'">';
			
			//form.append('<input type="hidden" name="talkno" value="'+$(this).attr("href")+'">');
			form.html(str);
			form.submit();
			
			
			//location.href='/community/talkGet?talkno='+${vo.talkno};
		});
		
		
		//페이징 -------------------------------------
		$(".paginate_button a").click(function(e) {
			e.preventDefault();
			form.attr("action","/community/talkList");
			form.find('input[name="pageNum"]').val($(this).attr("href"));
			form.submit();
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