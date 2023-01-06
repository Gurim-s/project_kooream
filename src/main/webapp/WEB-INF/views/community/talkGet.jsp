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
	<form action="/community/talkUpdate" id="form">
		<table>
			<tr>
				<td>회원번호</td>
				<td>${vo.m_no }</td>
				<!-- <td><input type="hidden" name="m_no" value="m_no"></td> -->
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
			<tr>
				<td><input type="hidden" name="pageNum" value="${pageNum }"></td>
				<td><input type="hidden" name="amount" value="${amount }"></td>
				<td><input type="hidden" name="talkno" value="${vo.talkno }"></td>
			</tr>
		</table>
	</form>
	
	<!-- 댓글 출력 폼 -->
	<table class="replylist">
		<tr>
			<th id="replyname">닉네임</th>
			<td id="replydate">작성날짜</td>
		</tr>
		<tr>
			<td id="replycontent">댓글 내용</td>
		</tr>
	</table>
	
	
	<!-- 댓글 입력 폼 -->
	<table>
		<tr>
			<td>닉네임</td>
		</tr>
		<tr>
			<td>
				<textarea rows="5" cols="50"></textarea>
			</td>
			<td><button id="addReplyBtn">등록</button></td>
		</tr>
	</table>
	
	
</body>


<script type="text/javascript">
	$(function() {
		 var form = $("#form");
		 
		 
		 // 게시글 관련 내용 ------------------------------------start
		 // 버튼 클릭시 해당 작업 수행
		 $("button").click(function(e) 
			e.preventDefault();
			
			var oper = $(this).data("oper"); 
			if(oper == 'talklist') {
				form.attr("action","/community/talkList");
				form.submit();
				//location.href = '/community/talkList?pageNum='+ pageNum +'&amount='+ amount;
				
			}else if(oper == 'talkupdate') {
				form.attr("action", "/community/talkUpdate");
				
				// EL 오류인지 뭔지... list 안타고 계속 update로 타서 그냥 form 안에 값 다 넣어서 태워 보냄
// 				var str = '';
// 				str += '<input type="hidden" name="pageNum" value="'+ pageNum +'">';
// 				str += '<input type="hidden" name="amount" value="'+ amount +'">';
// 				str += '<input type="hidden" name="talkno" value="'+ talkno +'">';
				form.submit();
				
			}else if(oper == 'talkremove'){
				form.attr("action", "/community/talkRemove");
				
				// EL 오류인지 뭔지... list 안타고 계속 update로 타서 그냥 form 안에 값 다 넣어서 태워 보냄
// 				var str = '';
// 				str += '<input type="hidden" name="pageNum" value="'+ pageNum +'">';
// 				str += '<input type="hidden" name="amount" value="'+ amount +'">';
// 				str += '<input type="hidden" name="talkno" value="'+ talkno '">';
 				form.submit();
			}
			
		);
	})
	// 게시글 관련 내용 ------------------------------------end
	
	
	
	
	
	var talkno = '${vo.talkno }';
	// 댓글 작성
	$("#addReplyBtn").click(function() {
		//alert("댓글 등록 함수");
		replyService.add(
			{reply:replycontent, replyer:replyname, bno:talkno},
				function(result) {
					showList();
				}
		);
	});
	
	
	
	//댓글 리스트 화면 출력 (ajax 작성 함수 사용) ------------------------------------start
	/* var replylist = $(".replylist"); */
	
	// 댓글 불러오는 함수 불러오기
	/* showList(); */
	
	// 댓글 리스트 함수
	/* function showList() {
		replyService.getList({bno:bnoValue, page:1},
			function(result) {
				var str = '';
				
				if(result == null || result.length==0){
					// 댓글이 없으면
					replylist.html("");
					return;
				}else{
					// 댓글이 있으면
					for(var i=0; i<result.length; i++){
						str += '<li class = "left clearfix" data-rno ="' + result[i].rno + '">';
						str += '<div>';
						str += '<div class = "header">';
						str += '<strong class = "primary-front">'+result[i].replyer+'</strong>';
						str += '<small class = "pull-right text-muted">'+displayTime(result[i].replydate)+'</small>'
						str += '</div>';
						str += '<p>'+result[i].reply+'</p>'
						str += '</div>';
						str += '</li>';
					}
					replylist.html(str);
				}
			}
		);
	} */
	
	
	
	
	
	
</script>



</html>

<jsp:include page="../include/footer.jsp"/>