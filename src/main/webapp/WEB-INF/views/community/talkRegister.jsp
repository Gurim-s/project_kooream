<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li>정품판별</li>
		<li><a href="/community/talkList">구림톡</a></li>
	</ul>
	<form action="">
		회원번호<input type="number" name="m_no">
		닉네임<input type="text" name="talkname">
		내용<textarea rows="15" cols="10"/></textarea>
		제목<input type="text" name="talktitle">
	</form>
	<button>등록</button>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>