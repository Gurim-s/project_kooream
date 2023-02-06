<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<style type="text/css">
	.menu_container {
		width: 130px;
		float: left;
	}
	#menu_list{
		margin-bottom: 100%;
		width: 130px;
	}
	#head{
		font-size: 25px;
	}
	button{
		text-align: left;
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
        padding: 40px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 2.5px;
    }
    .img-container {
    	width: 550px;
    }
    #modalClose{
    	text-align: right;
    }
    #date{
    	float: right;
    }
    #oriTitle{
    	font-size: 20px;
    }
    #oriDate{
    	float: right;
    	font-size: 13px;
    }
    table{
    	margin: auto;
    }
    td, #oriOk{
    	text-align: center;
    }
    div.main_content {
    	width: 70%;
    	float: left;
    }
    .img-container {
    	margin: 0px auto;
    }
    button{
    	border-radius: 5px;
		border: none;	
		background-color: #EAEAEA;
		margin-left: 10px;
		padding: 3px;
	}
	#decRadioCh{
		float: right;
	}
</style>

	<div class="menu_container">
		<ul id="menu_list">
			<li><a href="/community/oriList">정품판별</a></li>
			<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
		</ul>
	</div>
	<div class="main_content clearfix">
		<div>
			<span id="head">정품판별</span>
			<button data-oper="oriList">목록</button><button data-oper="oriUpdate">수정</button><button data-oper="oriRemove">삭제</button>
		</div>
		<br/>
		<hr/>
		<br/>
		<form action="/community/oriUpdate" id="form">
			<div>
				<span id ="oriTitle"><strong>${vo.orititle }</strong></span>
				<div id="oriDate"><span>${vo.oridate }</span></div>
			</div>
			<br/>
			<div>
				<span>${vo.oriname }</span>
			</div>
			<div style="height: 50px;"></div>
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
			<div style="height: 70px;"></div>
			<div>
				${vo.oricon }
			</div>
			<div style="height: 150px;"></div>
			<div>
				<table>
					<tr>
						<th style="width: 200px;"><a><img src="/resources/img/smiling_icon.png" class="ori_icon" id="dec_ok"></a></th>
						<th style="width: 200px;"><a><img src="/resources/img/worried_icon.png" class="ori_icon" id="dec_no"></a></th>
					</tr>
					<tr>
						<td>진품 같아요.</td>
						<td>가품 같아요.</td>
					</tr>
					<tr>
						<td id="oriOk">진품 갯수</td>
						<td id="oriNo">가품 갯수</td>
					</tr>
				</table>
			</div>
			<div style="height: 80px;"></div>
			<div><input type="hidden" name="orino" value="${vo.orino }"></div>
		</form>
		
		<!-- 정품판별 댓글 내용 출력 폼 -->
		 <div>
			<span style="font-size: 20px;"><strong>구리머들의 판정</strong></span>
			<div id="decRadioCh">
				<span><small><input type="radio" name="decCh" value="decList" id="ckList" class="oriDec" checked="checked">전체 보기</small></span>
				<span><small><input type="radio" name="decCh" value="decOk" id="ckOk" class="oriDec">진품 같아요.</small></span>
				<span><small><input type="radio" name="decCh" value="decNo" id="ckNo" class="oriDec">가품 같아요.</small></span>
			</div>
		</div>
		<br/>
		<br/>	
		<div class="replyList">
			<div>
				<div><strong>댓글쓴이</strong>
					<button id="replyupdatebtn">수정</button><button id="replyremovebtn">삭제</button>
				</div>
				<div><span>작성날짜</span></div>
			</div>
			<div>댓글 내용</div>
		</div>
		
		<!-- 판정 클릭시 뜨는 모달창 -->
		<div id="my_modal">
			<div>
			<input type="hidden" name="orireplyname" value="구리머">
			<strong>구리머</strong></div>
			<div style="height: 15px;"></div>
			<div id="title" data-orino="${vo.orino }">판별 내용</div>
			<div>
				<textarea id="oricon" rows="12" cols="28" name="oricon" placeholder="정품 혹은 가품이라 생각하는 이유를 적어주세요." style="resize: none;"></textarea>
			</div>
			<div>
				<button id="replyRegister" style="border: none">등록</button>
				<button id="replyUpdate" style="border: none">수정</button>
				<button id="replyReset" style="border: none">취소</button>
			</div>
		</div>
	</div>

	

<script type="text/javascript" src="/resources/js/community/orireply.js"></script>
<script type="module" src="/resources/js/community/oriGet.js"></script>
<script type="text/javascript" src="/resources/js/community/util.js"></script>
<script type="text/javascript">

	$(function() {
		var orinoValue = '${vo.orino}';
		var m_no = '1';
		var form = $("#form");
		
		// 버튼 클릭 시 해당 작업 수행
		$("button").click(function(e) {
			e.preventDefault();
			
			var oper = $(this).data("oper");
			if(oper == 'oriList'){
				location.href='/community/oriList'
			}else if(oper =='oriUpdate'){
				form.attr("actiron", "/community/oriUpdate");
				form.submit();
			}else if(oper == 'oriRemove'){
				form.attr("action", "/community/oriRemove");
				form.submit();
			}
		
		});
		
		// 진품 댓글 갯수 함수 호출
		countOk();
		// 가품 댓글 갯수 함수 호출
		countNo();
		
		var oriOk = $("#oriOk");
		var oriNo = $("#oriNo");
		// 가품, 진품 댓글 갯수 스크립트 ---------------------------- start
		
		//진품 댓글 갯수
		function countOk() {
			
			replyService.countOriOk({no:orinoValue},
				function(result) {
					console.log(result);
					var str = '';
					
					str += '<td id="oriOk">'+ result +'</td>'
					
					oriOk.html(str);
				}
			)
		}
		
		//가품 댓글 갯수
		function countNo() {
			
			replyService.countOriNo({no:orinoValue},
				function(result) {
					console.log(result);
					var str = '';
					
					str += '<td id="oriNo">'+ result +'</td>'
					
					oriNo.html(str);
				}
			)
		}
		
		
		
		// 정품, 가품 댓글 라디오 체크 관련
		$('.oriDec').click(function(){
			var chOk = $('#ckOk').is(':checked');
			var chNo = $('#ckNo').is(':checked');
			var ckList = $('#ckList').is(':checked');
				
			if(chOk){
				replyService.okList({no:orinoValue},
					function(result) {
						console.log(result);
						var str = '';
								
						if(result == null){
							// 댓글이 없으면
							replyList.html("");
							return;
						}else{
							// 댓글이 있으면
							for(var i=0; i<result.length; i++){
								str += '<div><strong>'+ result[i].orireplyname +'</strong>'
								str += '<button id="replyupdatebtn" data-replyno ="'+result[i].orireplyno+'">수정</button><button id="replyremovebtn" data-replyno ="'+result[i].orireplyno	+'">삭제</button></div>' 
								str += '<div>'+ result[i].orireplycon+'<span><small id="date">'+ displayTime(result[i].orireplydate) +'</small></span></div>'
								str += '<br/>'
							}
							replyList.html(str);
						} //--------------------------------- 댓글 유무 확인 end
					} //------------------------------------ 댓글 유무 확인 함수 end
				)
			}else if (chNo){
				replyService.noList({no:orinoValue},
					function(result) {
						console.log(result);
						var str='';
						
						if(result == null){
							// 댓글이 없으면
							replyList.html("");
							return;
						}else{
							// 댓글이 있으면
							for(var i=0; i<result.length; i++){
								str += '<div><strong>'+ result[i].orireplyname +'</strong>'
								str += '<button id="replyupdatebtn" data-replyno ="'+result[i].orireplyno+'">수정</button><button id="replyremovebtn" data-replyno ="'+result[i].orireplyno	+'">삭제</button></div>' 
								str += '<div>'+ result[i].orireplycon+'<span><small id="date">'+ displayTime(result[i].orireplydate) +'</small></span></div>'
								str += '<br/>'
							};
							replyList.html(str);
						}//--------------------------------- 댓글 유무 확인 end
					} //------------------------------------- 댓글 유무 확인 함수 end
				)
			}else if (ckList){
				showList();
			}; // -------------------------------------------- chList if문 end
					
		}); // ---------------------------------------------- 댓글 셀렉트 버튼 클릭시 end
		
		
		
			
		
		
		
		// 모달창 관련 스크립트 ----------------------------------- start
		var my_modal = $("#my_modal")
		var modalInputReply = $("#oricon")
		var modalInputReplyer = my_modal.find("input[name='orireplyname']");
		var modalupdatebtn = $("#replyUpdate");
		var modalregisterbtn = $("#replyRegister");
		
		// 정품 같아요 클릭
		$("#dec_ok").click(function(e) {
			e.preventDefault();
			var oridec = "oriOk";
			
			// 모달창 열기
			modalInputReply.val('');	// 댓글 내용 창 비우기
			modalupdatebtn.hide();
			my_modal.show();
			
			// 모달창 등록
			$("#replyRegister").click(function() {
				
				if( $("textarea[name=oricon]").val() == ""){
					alert('내용을 적어 주세요.');
					return;
				}
		
				// 정품 댓글 달기
				replyService.add(
						{orino:orinoValue, m_no:m_no, orireplyname:modalInputReplyer.val(), orireplycon:modalInputReply.val(), oridecision:oridec},
						
						function(result) {
							countOk();
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
			modalupdatebtn.hide();
			my_modal.show();
			
			// 모달창 등록
			$("#replyRegister").click(function() {
			
				if( $("textarea[name=oricon]").val() == ""){
					alert('내용을 적어 주세요.');
					return;
				}
				// 가품 댓글 달기
				replyService.add(
						{orino:orinoValue, m_no:m_no, orireplyname:modalInputReplyer.val(), orireplycon:modalInputReply.val(), oridecision:oridec},
						
						function(result) {
							countNo();
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
								str += '<div><strong>'+ result[i].orireplyname +'</strong>'
								
								alert(result[i].oridecision)
								
								if(result[i].oridecision == 'oriOk'){
									str += '<span style="color: red;">진품</span>';
								}else if(result[i].oridecision = oriNo){
									str += '<span style="color: blue;">가품</span>';
								}
								
								str += '<button id="replyupdatebtn" data-replyno ="'+result[i].orireplyno+'">수정</button><button id="replyremovebtn" data-replyno ="'+result[i].orireplyno	+'">삭제</button></div>' 
								str += '<div style="height:5px;"></div>'
								str += '<div><small>'+ result[i].orireplycon+'</small><span><small id="date">'+ displayTime(result[i].orireplydate) +'</small></span></div>'
								str += '<br/>'
							}
							replyList.html(str);
						}
					}
				);
			
			// 댓글 삭제
			$(".replyList").on("click", "#replyremovebtn", function() {
				orireplyno = $(this).data("replyno");
				console.log(orireplyno);
				replyService.remove(orireplyno, function(result) {
				
					if(result === 'success'){
						alert("댓글 삭제 완료")
						countNo();
						countOk();
						showList();
					}
				})
				
			}); // -------------------------------댓글 삭제 end
			
			
			// 댓글 수정 관련 스크립트
			$(".replyList").on("click", "#replyupdatebtn", function() {
				orireplyno = $(this).data("replyno");
				//alert(orireplyno);
				
				// 댓글 수정을 위해 댓글 내용 조회하기
				replyService.get(orireplyno, function(result) {
					console.log(orireplyno)
					console.log(result);
					
					modalInputReply.val(result.orireplycon);
					modalInputReplyer.val(result.orireplyname);
					
					modalInputReplyer.attr("readonly","readonly");
					
					modalregisterbtn.hide();
					modalupdatebtn.show();
					my_modal.show();
					
				})
				
				// 댓글 수정하기
				$(modalupdatebtn).click(function() {
					
					replyService.update(
						{orireplyno : orireplyno, orireplycon:modalInputReply.val()},
						function(result) {
							alert("댓글 수정 완료");
							my_modal.hide();
							showList();
						}
					)
					
					
				}); // 댓글 수정하기 end
				
			}) //-------------------------------댓글 수정 관련 스크립트 end
			
			
			
			
			
		};
		
		
		
		
		
		
		
		
	});
</script>
<jsp:include page="../include/footer.jsp"/>