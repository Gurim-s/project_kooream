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
	}
	.talkno{
		width: 50px;
		height: 30px;
		text-align: center;
	}
	.talktitle{
		width: 300px;
		text-align: center;
	}
	.talkname{
		width: 150px;
		text-align: center;
	}
	.btn{
		float: right;
	}
	table{
		padding-left: 150px;
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
	<div class="talktop">
		<span>구림톡</span>
		<form action="/community/talkRegister">
			<button class="regBtn">게시글 등록</button>
		</form>
		<hr/>
	</div>
	<div id="content">
		<form>
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td class="talkno">${vo.talkno }</td>
							<td class="talktitle">${vo.talktitle }</td>
							<td class="talkname">${vo.talkname }</td>
							<td class="talkdate">${vo.talkdate }</td>
						</tr>
					</c:forEach>
			</table>
		</form>
	</div>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>