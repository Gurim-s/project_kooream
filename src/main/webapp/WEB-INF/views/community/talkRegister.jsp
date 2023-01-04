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
	<form action="/community/talkRegister" method="post" role="form">
		<table>
			<tr>
				<td>회원번호</td>
				<td><input type="number" name="m_no"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="talktitle"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="talkname"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="15" cols="30" name="talkcon"></textarea></td>
			</tr>
			<tr>
				<td><button class="btn-insert" data-oper="talkregister">등록</button></td>
				<td><button class="btn-list" data-oper="talklist">목록</button></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	$(function() {
		var form = $("form");
		
		$("button").click(function(e) {
			e.preventDefault();	// 버튼에 걸린 기본 이벤트 삭제
		
			var oper = $(this).data("oper");	//해당 버튼의 data가 oper인 것
			
			if(oper == 'talkregister'){	//게시글 등록
				form.submit();	// 해당 form 데이터 보내기
			}else if( oper == 'talklist'){
				location.href = '/community/talkList'
			}
		})
	})
	
</script>

</html>

<jsp:include page="../include/footer.jsp"/>