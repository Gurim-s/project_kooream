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
	#head{
		font-size: 30px;
	}
	button{
		text-align: left;
	}
	#oriDate{
		text-align: right;
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span id="head">정품판별</span>
		<button data-oper="oriList">목록</button><button>수정</button>
	</div>
	<br/>
	<hr/>
	<br/>
	<form action="">
		<div>
			<span>${vo.oriname }</span>
			<span id="oriDate">${vo.oridate }</span>
		</div>
		<div>
			<c:if test="${vo.attachList.size() ne 0 }">
				<c:forEach var="vo" items="${list }">
					<c:url var="imgSrc" value="/display">
						<c:param name="fileName" value="${vo.attachList.uploadPath }/${vo.attachList.uuid }_${vo.attachList.fileName }"></c:param>
					</c:url>
					<img alt="이미지" src="${imgSrc }">
				</c:forEach>
			</c:if>
		</div>
		<div>
			${vo.oricon }
		</div>
		<div>
			<span><a>진품 같아요 이미지 예정</a></span><span><a>가품 같아요 이미지 예정</a></span>
		</div>
	</form>
	
	<!-- 정품판별 댓글 내용 출력 폼 -->
	<div>구리머들의 판정</div>
	
	
	
	
</body>

<script type="text/javascript">
	$(function() {
		//var form = $("#form");
		
		// 버튼 클릭 시 해당 작업 수행
		$("button").click(function(e) {
			e.preventDefault();
			
			var oper = $(this).data("oper");
			if(oper == 'oriList'){
				location.href='/community/oriList'
			}
			
			
			
		})
		
		
		
		
		
	})
</script>
</html>
<jsp:include page="../include/footer.jsp"/>