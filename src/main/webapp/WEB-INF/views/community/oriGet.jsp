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
	.ori_icon{
		width: 70px;
	}
	#my_modal {
		position: fixed;
		top: 50%;
		left: 50%;
		-webkit-transform: translate(-50%, -50%);
		-moz-transform: translate(-50%, -50%);
		-ms-transform: translate(-50%, -50%);
		-o-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
        display: none;
        width: 300px;
        height: 350px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }
    .img-container {
    	width: 550px;
    }
    #modalClose{
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
		<button data-oper="oriList">목록</button><button>수정</button>
	</div>
	<br/>
	<hr/>
	<br/>
	<form action="">
		<div>
			<span>${vo.orititle }</span>
			<span id="oriDate">${vo.oridate }</span>
		</div>
		<div>
			<span>${vo.oriname }</span>
		</div>
		<div>
			<div class="img-container"></div>
			<%-- <c:if test="${vo.attachList.size() ne 0 }">
				<c:forEach var="ivo" items="${list }">
					<c:url var="imgSrc" value="/display">
						<c:param name="fileName" value="${ivo.uploadPath }/${ivo.uuid }_${ivo.fileName }"></c:param>
					</c:url>
					<img alt="이미지" src="${imgSrc }">
				</c:forEach>
			</c:if> --%>
		</div>
		<div>
			${vo.oricon }
		</div>
		<div>
			<span><a><img src="/resources/img/smiling_icon.png" class="ori_icon" id="dec_ok"></a></span>
			<span><a><img src="/resources/img/worried_icon.png" class="ori_icon" id="dec_no"></a></span>
		</div>
		<div>
			<span>진품같아요.</span><span>가품같아요.</span>
		</div>
		<div>
			<span>진품같아요.</span><span>가품같아요.</span>
		</div>
	</form>
	
	<!-- 정품판별 댓글 내용 출력 폼 -->
	<div><strong>구리머들의 판정</strong></div>
	<div class="replyList">
		<div>
			<span>댓글쓴이</span><span>작성날짜</span>
		</div>
		<div>댓글 내용</div>
	</div>
	
	<!-- 판정 클릭시 뜨는 모달창 -->
	<div id="my_modal">
		<div><input name="orireplyname" value="replyer">
		</div>
		<div id="title" data-orino="${vo.orino }">판별 내용</div>
		<div>
			<textarea id="oricon" rows="10" cols="25" placeholder="정품 혹은 가품이라 생각하는 이유를 적어주세요." style="resize: none;"></textarea>
		</div>
		<div>
			<button id="replyRegister">등록</button>
			<button id="replyReset">취소</button>
		</div>
	</div>

	
</body>

<script type="text/javascript" src="/resources/js/community/orireply.js"></script>
<script type="module" src="/resources/js/community/oriGet.js"></script>
<script type="text/javascript">
	$(function() {
		//var form = $("#form");
		
		// 버튼 클릭 시 해당 작업 수행
		$("button").click(function(e) {
			e.preventDefault();
			
			var oper = $(this).data("oper");
			if(oper == 'oriList'){
				location.href='/community/oriList'
			}
		
			
		})
		
		// 가품, 진품 댓글 갯수 스크립트 ---------------------------- start
		
		
		
		
		
		
		// 모달창 관련 스크립트 ----------------------------------- start
		var my_modal = $("#my_modal")
		var modalInputReply = $("#oricon")
		var modalInputReplyer = my_modal.find("input[name='orireplyname']");
		var orinoValue = '${vo.orino}';
		var m_no = '1';
		
		// 정품 같아요 클릭
		$("#dec_ok").click(function(e) {
			e.preventDefault();
			var oridec = "oriOk";
			
			// 모달창 열기
			modalInputReply.val('');	// 댓글 내용 창 비우기
			my_modal.show();
			
			// 모달창 등록
			$("#replyRegister").click(function() {
				// 댓글 달기
				replyService.add(
						{orino:orinoValue, m_no:m_no, orireplyname:modalInputReplyer.val(), orireplycon:modalInputReply.val(), oridecision:oridec},
						
						function(result) {
							showList();
							my_modal.hide();
						}
					);
			});
		
		});
		
		// 가품 같아요 클릭
		$("#dec_no").click(function(e) {
			e.preventDefault();
			var oridec = "oriNo";
			
			// 모달창 열기
			modalInputReply.val('');	// 댓글 내용 창 비우기
			my_modal.show();
			
			// 모달창 등록
			$("#replyRegister").click(function() {
			
				// 댓글 달기
				replyService.add(
						{no:orinoValue, m_no:m_no, orireplyname:modalInputReplyer.val(), orireplycon:modalInputReply.val(), oridecision:oridec},
						
						function(result) {
							showList();
							my_modal.hide();
						}
					);
			});
			
		});
		
		// 모달창 닫기(취소 버튼)
		$("#replyReset").click(function() {
			my_modal.hide();
		});
		
		var replyList = $(".replyList");
		
		// 댓글 리스트 함수
		showList();
		
		function showList() {
			replyService.getList({orino:orinoValue},
					function(result) {
						var str = '';
						
						if(result == null || result.length==0){
							// 댓글이 없으면
							replyList.html("");
							return;
						}else{
							// 댓글이 있으면
							for(var i=0; i<result.length; i++){
								str += '<div><span>'+ result[i].orireplyname +'</span><span>'+ result[i].orireplydate +'</span></div>'
								str += '<div>'+ result[i].orireplycon+'</div>'
							}
							replyList.html(str);
						}
					}
				);
			
			
		}
		
			
		
		
	});
</script>
</html>
<jsp:include page="../include/footer.jsp"/>