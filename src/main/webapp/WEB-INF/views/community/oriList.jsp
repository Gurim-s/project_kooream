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
		padding-left: 0px;
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
	#bp{
		height: 25px;
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
		<span>정품판별</span>
		<button>글쓰기</button>
	</div>
	<br/>
	<hr/>
	<br/>
	<div>
		<select name = "brandname">
			<option value="노스페이스">노스페이스</option>
			<option value="나이키">나이키</option>
			<option value="슈프림">슈프림</option>
			<option value="컨버스">컨버스</option>
		</select>
	</div>
	<div>
		<br/>
		<form action="/community/oriRegister" id="form">
			<table>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td rowspan="3">
							<c:if test="${vo.attachList.size() ne 0 }">
								<c:url var="imgSrc" value="/display">
									<c:param name="fileName" value="${vo.attachList.get(0).uploadPath }/${vo.attachList.get(0).uuid }_${vo.attachList.get(0).fileName }"></c:param>
								</c:url>
								<img alt="제품 이미지" src="${imgSrc }" width="150px;" height="150px;">
							</c:if>
						</td>
						<td>${vo.brandname }</td>
						<td rowspan="3">${vo.oriname }</td>
					</tr>
					<tr>
						<td><a class="get" href="${vo.orino }">${vo.orititle }</a></td>
					</tr>
					<tr>
						<td id="content"><a class="get" href="${vo.orino }">${vo.oricon }</a></td>
					</tr>
					<tr id="bp"><td></td></tr>
				</c:forEach>
			</table>
		</form>
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