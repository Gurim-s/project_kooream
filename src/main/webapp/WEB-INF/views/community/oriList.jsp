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
		height: 100%;
		width: 130px;
	}
	#main{
		margin-left: 150px;
	}
	.btn{
		float: right;
	}
	table{
		padding-left: 0px;
		width: 1000px;
	}
	#head{
		font-size: 25px;
	}
	button{
		border: none;
		background-color: #fff;	
		float: right;
	}
	#bp{
		height: 25px;
	}
	#full{
		width: 100%;
		height: 200px;
	}
	#thumbnail{
		float: left;
		width: 200px;
	}
	#sub{
		float: left;
		width: 60%;
	}
	#oriNickname{
		float: left;
		width: 150px;
		text-align: center;
	}
	#oriContent{
		font-size: 12px;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
	}
	#oriTitle{
		text-decoration: underline;
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div id="main">
		<div>
			<span id="head"><strong>정품판별</strong></span>
			<button>글쓰기</button>
		</div>
		<br/>
		<hr/>
		<br/>
		<div>
			<!-- <select name = "brandname">
				<option value="노스페이스">노스페이스</option>
				<option value="나이키">나이키</option>
				<option value="슈프림">슈프림</option>
				<option value="컨버스">컨버스</option>
			</select> -->
		</div>
		<div>
		<br/>
			<form action="/community/oriRegister" id="form">
			<c:forEach var="vo" items="${list }">
			<div id="full">
				<div id="thumbnail">
					<c:if test="${vo.attachList.size() ne 0 }">
						<c:url var="imgSrc" value="/display">
							<c:param name="fileName" value="${vo.attachList.get(0).uploadPath }/${vo.attachList.get(0).uuid }_${vo.attachList.get(0).fileName }"></c:param>
						</c:url>
						<img alt="제품 이미지" src="${imgSrc }" width="150px;" height="150px;">
					</c:if>
				</div>
				<div id="sub">
					<div id="barandName"><small>${vo.brandname }</small></div>
					<div id="oriTitle"><a class="get" href="${vo.orino }"><strong>${vo.orititle }</strong></a></div>
					<br/>
					<div id="oriContent"><a class="get" href="${vo.orino }">${vo.oricon }</a></div>
				</div>
				<div>
					<div id="oriNickname">${vo.oriname }</div>
				</div>
			</div>
			</c:forEach>
		</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		var form = $("#form");
		
		//게시글 작성 버튼 ---------------------------------------------
		$("button").click(function() {
			// 버튼 누르면 글쓰기로 이동
			form.attr("action", "/community/oriRegister");
			form.submit();
		})		
		
		
		//게시글 상세 보기 ---------------------------------------------
		$(".get").click(function(e) { //<a> 태그 클릭 시 페이지 이동이 되지 않게 막아둠
			e.preventDefault();
			form.attr("action", "/community/oriGet");
			
			form.append('<input type="hidden" name="orino" value="'+$(this).attr("href")+'">');
			form.submit();
			
			
		})
		
		
		
		
		
	})
	
</script>
</html>
<jsp:include page="../include/footer.jsp"/>