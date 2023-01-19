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
		<button>목록</button><button>수정</button>
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
		
	</div>
	</form>
	
</body>
</html>
<jsp:include page="../include/footer.jsp"/>