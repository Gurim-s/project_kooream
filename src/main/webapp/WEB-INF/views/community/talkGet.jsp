<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	#head{
		font-size: 25px;
	}
	#talk-con{
		padding-top: 50px;
		height: 300px;
	}
	button{
		border-radius: 5px;
		border: none;	
		background-color: #BEBEBE;
		margin-left: 10px;
		padding: 3px;
		
	}
	#date{
    	float: right;
    }
    #title{
    	font-size: 20px;
    }
    .btn{
    	float: right;
    	width: 40px;
    }
    .date-view{
    	float: right;
    }
    #talkname{
    	width: 300px;
    }
   
</style>
</head>
<body>
	<ul id="menu_list">
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div id="main">
		<div>
			<span id="head"><strong>구림톡</strong></span>
			<div>
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal.member" var="mvo"/>
				<c:if test="${mvo.m_no eq vo.m_no }">
					<button class="btn" data-oper="talkupdate">수정</button>
					<button class="btn" data-oper="talkremove">삭제</button>
				</c:if>
			</sec:authorize>
				<button class="btn" data-oper="talklist">목록</button>
			</div>
		</div>
		<br/>
		<hr/>
		<br/>
		<form action="/community/talkUpdate" id="form">
			<div>
				<strong id="title">${vo.talktitle }</strong>
				<span id="date"><small>${vo.talkdate }</small></span>
			</div>
			<div>${vo.talkname }</div>
			<div id="talk-con-box">
				<div id="talk-con">${vo.talkcon }</div>
			</div>
			
			<div>
				<input type="hidden" name="pageNum" value="${pageNum }">
				<input type="hidden" name="amount" value="${amount }">
				<input type="hidden" name="talkno" value="${vo.talkno }">
			</div>
		</form>
		
		<!-- 댓글 출력 폼 -->
		<div class="replylist">
			<div data-replyno ="1"><span><strong>닉네임</strong></span>
				<button class="replyBtn" id="replyupdatebtn">수정</button>
				<button class="replyBtn" id="replyremovebtn">삭제</button>
				<div>
				<small class="date-view">날짜</small>
				</div>
			</div>
			<div style="font-size: 20px;">내용</div>
		</div>
		<div style="height: 75px;"></div>
		<!-- 댓글 입력 폼 -->
			<c:choose>
				<c:when test="${not empty mvo }">
					<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member" var="mvo"/>
					<div>
						<div>
						<strong>${mvo.m_nickname }</strong>
						<input type="hidden" name="replyname" value="${mvo.m_nickname }">
						<input type="hidden" name="m_no" value="${mvo.m_no}">
						</div>
						<br/>
						<div><textarea rows="5" cols="150%" name="replycon" id="replycon" style="resize: none;"></textarea></div>
						<div><button id="addReplyBtn">등록</button></div>
					</div>
					</sec:authorize>
				</c:when>
				<c:otherwise>로그인 후 댓글 작성이 가능합니다.</c:otherwise>
			</c:choose>
	</div>
</body>
<!-- reply Service 꼭 위에 써주기 (ajax와 연결하는 주소 있어야만 연결이 되어 함수를 불러옴) -->
<script type="text/javascript" src="/resources/js/page/community/reply.js"></script>
<script type="text/javascript" src="/resources/js/page/community/util.js"></script>
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
				if(confirm("해당 게시글을 삭제 하시면 정보가 사라집니다. 삭제 하시겠습니까?") == true){
					form.attr("action", "/community/talkRemove");
	 				form.submit();
				}else{
					return false;
				}
				
				
				
				// EL 오류인지 뭔지... list 안타고 계속 update로 타서 그냥 form 안에 값 다 넣어서 태워 보냄
// 				var str = '';
// 				str += '<input type="hidden" name="pageNum" value="'+ pageNum +'">';
// 				str += '<input type="hidden" name="amount" value="'+ amount +'">';
// 				str += '<input type="hidden" name="talkno" value="'+ talkno '">';
			}
			
		}); // 게시글 관련 내용 ------------------------------------end
		 
		
		
		
		// 댓글 관련 내용 ------------------------------------start
		var talkno = '${vo.talkno }';
		var replycon = $("#replycon");
		var replyname = $("input[name=replyname]").val()
		var m_no = $("input[name=m_no]").val()
		console.log("멤버 번호" + m_no);
		
	 	// 댓글 등록
	 	// 댓글 등록하려는 게시글 번호 확인
	 	console.log(talkno);
		// 댓글 등록 함수 불러오기
	 	$("#addReplyBtn").click(function() {
	 		
	 		
	 		// 댓글 내용 검사
	 		if($("textarea[name=replycon]").val() == ""){
				alert('댓글 내용을 적어주세요.');
				return;
			}
	 		
			replyService.add(
				{talkreplycon:replycon.val(), talkreplyname:replyname, talkno:talkno, m_no:m_no},
					function(result) {
						showList();
						$("textarea[name=replycon]").val('');
						$("input[name=replyname]").val('');
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
							str += '<div data-replyno ="1"><span><strong>'+ result[i].talkreplyname +'</strong></span>'
							str += '<sec:authorize access="isAuthenticated()">'
							str += '<sec:authentication property="principal.member" var="mvo"/>'
							
							if(result[i].m_no == ${mvo.m_no}){
								str += '<button class="replyupdatebtn" data-replyno ="'+result[i].talkreplyno+'">수정</button>'
								str += '<button class="replyremovebtn" data-replyno ="'+result[i].talkreplyno+'">삭제</button>'
							}
							
							str += '</sec:authorize>'
							str += '<div>'
							str += '<small class="date-view">'+displayTime(result[i].talkreplydate)+'</small>'
							str += '</div>'
							str += '<div style="height: 10px;"></div>'
							str += '</div>'
							str += '<div style="font-size: 14px;">'+ result[i].talkreplycon +'</div>'
							str += '<br/>'
							
						}
						replylist.html(str);
						
						
						var talkreplyno;
						
						// 댓글 삭제
						$(".replylist").on("click", ".replyremovebtn", function() {
							//var confirm = confirm("댓글을 삭제 하시겠습니까?");
							
							if(confirm("해당 댓글을 삭제 하시겠습니까?") == true) {
								talkreplyno = $(this).data("replyno");
								console.log(talkreplyno);  
								replyService.remove(talkreplyno, function(result) {
									
									if(result ==='success'){
										alert("댓글이 삭제 되었습니다.")
										showList();
									}
								});
							}else{
								return false;
							}
							
						});
					
							
						
						// 댓글 수정
						$('.replyupdatebtn').on('click', function(e) {
							var talkreplyno = $(e.target).data("replyno");
							var test = $(e.target).closest('div');
							var test2 = $(test).next('div').remove();
							
							var str = '';
							replyService.get(talkreplyno, function(result){
								console.log(result);
								
								str += '<div data-replyno ="1"><span><strong>'+ result.talkreplyname +'</strong></span>'
								str += '<button class="replyupdate-ok" data-replybtn ="'+result.talkreplyno+ '">수정 완료</button>'
								str += '<button class="replyreset" data-replybtn ="'+result.talkreplyno+ '">취소</button>'
								str += '<div>'
								str += '<small class="date-view">'+displayTime(result.talkreplydate)+'</small>'
								str += '</div>'
								str += '<div style="height: 10px;"></div>'
								str += '</div>'
								str += '<div><textarea rows="5" cols="150%" id="replyconupdate" name="replycon" style="resize: none;">'+ result.talkreplycon +'</textarea></div>'
								str += '<br/>'
								
							
								test.html(str);
								
								
								// 댓글 수정 취소 버튼
								$(".replyreset").click(function() {
									showList();
								});
								
								var replyconupdate = $('#replyconupdate');
								// 댓글 수정
								$(".replyupdate-ok").on("click", function() {
									
									if($("textarea[name=replycon]").val() == ""){
										alert('수정할 내용을 입력 해주세요.')
										return;
									}
									
									replyService.update(
									{talkreplyno : talkreplyno, talkreplycon:replyconupdate.val()},
									function(result) {
										if(result === 'success'){
											alert("댓글 수정이 완료 되었습니다.");
											
											showList();
										}
									});
								}); // 댓글 수정 비동기 ------------------------------------end
								
							});
							
							
						}); // 댓글 수정 관련 ----------------------------------------------end
						
						
					}
				}
			);
		} 
		 
		 
	});
		
</script>



</html>

<jsp:include page="../include/footer.jsp"/>