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
	<form action="/community/talkUpdate" id="form">
		<table>
			<tr>
				<td>회원번호</td>
				<td>${vo.m_no }</td>
				<!-- <td><input type="hidden" name="m_no" value="m_no"></td> -->
			</tr>
			<tr>
				<!-- <td><input type="hidden" name="talkno" value="talkno"></td> -->
			</tr>
			<tr>
				<td>제목</td>
				<td>${vo.talktitle }</td>
				<!-- <td><input type="hidden" name="talktitle" value="talktitle"></td> -->
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${vo.talkname }</td>
				<!-- <td><input type="hidden" name="talkname" value="talkname"></td> -->
			</tr>
			<tr>
				<td colspan="2"><textarea rows="15" cols="30" readonly="readonly">${vo.talkcon }</textarea></td>
			</tr>
			<tr>
				<td><button class="btn-insert" data-oper="talkupdate">수정</button></td>
				<td><button class="btn-insert" data-oper="talkremove">삭제</button></td>
				<td><button class="btn-list" data-oper="talklist">목록</button></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	$(function() {
		 var form = $("#form");
		 
		 // 버튼 클릭시 해당 작업 수행
		 $("button").click(function(e) {
			e.preventDefault();
			
			var oper = $(this).data("oper");
			
			if(oper == 'talklist') {
				location.href = '/community/talkList'
			}else if(oper == 'talkupdate') {
				form.attr("action", "/community/talkUpdate");
				form.append('<input type="hidden" name="talkno" value="'+ ${vo.talkno } + '">');
				form.submit();
			}else if(oper == 'talkremove'){
				form.attr("action", "/community/talkRemove");
				form.append('<input type="hidden" name="talkno" value="'+ ${vo.talkno } + '">');
				form.submit();
			}
			
		})
	})
	
</script>



</html>

<jsp:include page="../include/footer.jsp"/>