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
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span>구림톡</span>
	</div>
	<br/>
	<hr/>
	<br/>
	<form action="/community/talkUpdate" method="post" id="form">
		
		<div>제목<input type="text" name="talktitle" value="${vo.talktitle }"></div>
		<div><input type="hidden" name="talkname" value="${vo.talkname }">${vo.talkname }</div>
		<div><textarea rows="15" cols="150%" name="talkcon" style="resize: none";>${vo.talkcon }</textarea></div>
		<div>
			<input type="hidden" name="talkno" value="${vo.talkno }">
			<button class="btn-insert" data-oper="talkupdate">수정 완료</button>
			<button class="btn-list" data-oper="talklist">목록</button>
		</div>
		<div>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
		</div>
	
	
	
	
		<%-- <table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="talktitle" value="${vo.talktitle }"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="hidden" name="talkname" value="${vo.talkname }">${vo.talkname }</td>
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
			<tr>
				<td><input type="hidden" name="pageNum" value="${cri.pageNum }"></td>
				<td><input type="hidden" name="amount" value="${cri.amount }"></td>
			</tr>
		</table> --%>
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
				if($("input[name=talktitle]").val() == ""){
					alert('수정할 제목을 입력 해주세요.')
					return false;
				}
				if($("textarea[name=talkcon]").val() == ""){
					alert('수정할 내용을 입력 해주세요.')
					return false;
				}
				
				form.submit();
			}
			
		})
		
		
	})
</script>

</html>

<jsp:include page="../include/footer.jsp"/>