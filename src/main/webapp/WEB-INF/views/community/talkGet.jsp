<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<td>닉네임</td>
			<td data-replyno ="1">댓글번호</td>
			<td><button class="replyBtn" id="replyupdatebtn">수정</button></td>
			<td><button class="replyBtn" id="replyupdatebtn">삭제</button></td>
			<td>작성날짜</td>
		</tr>
		<tr>
			<td>댓글 내용</td>
		</tr>
	</table>
	
	
	
	<!-- 댓글 입력 폼 -->
	<table>
		<tr>
			<td>닉네임 : <input type="text" name="replyname" id="replyname"></td>
			<td>회원 번호 : <input type="text" name="m_no" id="m_no"></td>
		</tr>
		<tr>
			<td>
				<textarea rows="5" cols="50" name="replycon" id="replycon"></textarea>
			</td>
			<td><button id="addReplyBtn">등록</button></td>
		</tr>
	</table>
	
</body>
<!-- reply Service 꼭 위에 써주기 (ajax와 연결하는 주소 있어야만 연결이 되어 함수를 불러옴) -->
<script type="text/javascript" src="/resources/js/community/reply.js"></script>
<script type="text/javascript">
	$(function() {
		var form = $("#form");
		 
		 
		 // 게시글 관련 내용 ------------------------------------start
		 // 버튼 클릭시 해당 작업 수행
		 $("button").click(function(e) {
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
			
		});
		 
		 
		var talkno = '${vo.talkno }';
		var replycon = $("#replycon");
		var replyname = $("#replyname");
		var m_no = $("#m_no");
		
	 	// 댓글 등록
	 	// 댓글 등록하려는 게시글 번호 확인
	 	console.log(talkno);
		// 댓글 등록 함수 불러오기
	 	$("#addReplyBtn").click(function() {
	 		alert("댓글 등록 버튼");	
			replyService.add(
				{talkreplycon:replycon.val(), talkreplyname:replyname.val(), talkno:talkno, m_no:m_no.val()},
					function(result) {
						showList();
				}
			);
		});
		 	
			
			
		//댓글 리스트 출력
		var replylist = $(".replylist");
			
		// 댓글 불러오는 함수 불러오기
		showList();
			
		// 댓글 리스트 함수 (shoewList 함수에 담아서 등록 시에나 필요할 떄 함수 호출 가능)
		function showList() {
			
			replyService.getList({no:talkno},
				function(result) {
					// 함수를 타고 값을 가져오는지 확인 콘솔
					console.log(result);
					var str = '';
					
					if(result == null || result.length==0){
						// 댓글이 없으면
						replylist.html("");
						return;
					}else{
						// 댓글이 있으면
						for(var i=0; i<result.length; i++){
							str += '<tr>';
							str += '<td>'+ result[i].talkreplyname +'</td>';
							str += '<td data-replyno ="'+result[i].talkreplyno+ '">'+result[i].talkreplyno+'</td>';
							str += '<td><button class="replyBtn" id="replyupdatebtn">수정</button></td>';
							str += '<td><button class="replyBtn" id="replyremovebtn">삭제</button></td>';
							str += '<td>'+result[i].talkreplydate+'</td>';
							str += '</tr>';
							str += '<tr>';
							str += '<td>'+ result[i].talkreplycon +'</td>';
							str += '</tr>';
						}
						replylist.html(str);
						
						// 댓글 번호
						//var talkreplyno = $(".replyno").attr("value");
						/* $(".replylist").click(function(e) {
							
						}) */
						
						var talkreplyno;
						$(".replyBtn").on("click", function() {
							talkreplyno = $(this).data("replyno");
							replyService.get(talkreplyno, function(result) {
								console.log(result);
							});
						});
					
						
						// 댓글 삭제
						 $("#replyremovebtn").click(function() {
							
							alert(talkreplyno);
							replyService.remove(talkreplyno, function(result) {
									
								if(result ==='success'){
									alert("댓글 삭제 완료")
									showList();
								}
							})
						});
						
						
						
						// 댓글 수정
						
						 /* $(".replyupdatebtn").click(function() {
							alert(talkreplyno);
							console.log(talkreplyno);
							replyService.update(
									{talkreplyno : talkreplyno, talkreplycon:talkreplycon.val()},
							)
						});  */
						
						
						
					}
				}
			);
		} 
		 
		 
		 
		 
		 
	});
	
	// 게시글 관련 내용 ------------------------------------end
	
	
	// 댓글 관련 내용 ------------------------------------start
	
	
 	/* var talkno = '${vo.talkno }';
	var replycon = $("#replycon");
	var replyname = $("#replyname");
	var m_no = $("#m_no");
 	 
 	// 댓글 등록
 	// 댓글 등록하려는 게시글 번호 확인
 	console.log(talkno);
 	// 댓글 등록 함수 불러오기
 	$("#addReplyBtn").click(function() {
 		alert("댓글 등록 버튼");	
		replyService.add(
			{talkreplycon:replycon.val(), talkreplyname:replyname.val(), talkno:talkno, m_no:m_no.val()},
				function(result) {
					showList();
			}
		);
	});
 	
 	// 댓글 수정 하기
	$(".replyupdatebtn").click(function() {
		alert("댓글 수정 버튼");
	})
	
	
	//댓글 리스트 출력
	var replylist = $(".replylist");
	
	// 댓글 불러오는 함수 불러오기
	showList();
	
	// 댓글 리스트 함수 (shoewList 함수에 담아서 등록 시에나 필요할 떄 함수 호출 가능)
	function showList() {
		
		replyService.getList({no:talkno},
			function(result) {
				// 함수를 타고 값을 가져오는지 확인 콘솔
				console.log(result);
				 var str = '';
				
				if(result == null || result.length==0){
					// 댓글이 없으면
					replylist.html("");
					return;
				}else{
					// 댓글이 있으면
					for(var i=0; i<result.length; i++){
						str += '<tr>';
						str += '<td>'+ result[i].talkreplyname +'</td>';
						str += '<td><button class="replyupdatebtn" data-oper="replyupdate">수정</button></td>';
						str += '<td><button class="replyremovebtn" data-oper="replyremove">삭제</button></td>';
						str += '<td>'+result[i].talkreplydate+'</td>';
						str += '</tr>';
						str += '<tr>';
						str += '<td>'+ result[i].talkreplycon +'</td>';
						str += '</tr>';
					}
					replylist.html(str);
				}
			}
		);
	} */
	
	
	
			
	
	
	
	
	
</script>



</html>

<jsp:include page="../include/footer.jsp"/>