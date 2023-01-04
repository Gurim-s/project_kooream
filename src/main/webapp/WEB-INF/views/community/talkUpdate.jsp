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
		height: 500px;
		width: 130px;
	}
	span{
		font-size: 30px;
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li>정품판별</li>
		<li><a href="/community/talkList">구림톡</a></li>
	</ul>
	<div>
		<span>구림톡</span>
	</div>
	<br/>
	<hr/>
	<br/>
	<form action="/community/talkUpdate" method="post" id="form">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="talktitle" value="${vo.talktitle }"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="talkname" value="${vo.talkname }"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="15" cols="30" name="talkcon">${vo.talkcon }</textarea></td>
			</tr>
			<tr>
				
				<td>
				<input type="hidden" name="talkno" value="${vo.talkno }">
				<button class="btn-insert" data-oper="talkupdate">수정 완료</button>
				</td>
				<td><button class="btn-list" data-oper="talklist">목록</button></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	$(function () {
		
		var form = $("#form");
		var oper = $(this).data("oper");
		
		$("button").click(function(e) {
			e.preventDefault();	// 버튼 기본 이벤트 막기
			
			if(oper == 'talklist'){
				form.attr("action", "/community/talkList");
				form.submit();
			}else{
				form.submit();
			}
			
		})
		
		
	})
</script>

</html>

<jsp:include page="../include/footer.jsp"/>