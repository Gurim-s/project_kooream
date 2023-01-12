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
	#content{
	
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div id="content">
		<form>
			<table>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
					<%-- <c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="4">게시물이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="vo" items="${list }">
								<tr>
									<td>${vo.b_idx }
									</td>
									<td>
									<a class="view" href="/chapter20_mvc_bbs/BBSController?cmd=view&b_idx=${vo.b_idx}">${vo.title }</a>
									<td>${vo.writer }</td>
									<td>${vo.reg_date }</td>
									<td>${vo.hit }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose> --%>
			</table>
		</form>
	</div>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>