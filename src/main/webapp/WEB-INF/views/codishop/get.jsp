<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<style type="text/css">
	.wrapper{
		width: 800px;
	
	}
	
	.social_title{
		text-align: center;
	}
	
	.brand_keyword{
		display: inline-block;
	    padding: 8px 10px;
	    border: 1px solid #ebebeb;
	    border-radius: 12px;
	    font-size: 15px;
	}
	.codi_img{
	 	margin : auto;
		width: 600px;
		height: 800px;
	}
	.title>span {
		font-weight: bold;
		font-size: 30px;
	}
	.content>span{
		font-size : 20px;
	}
	.codi_img{
		text-align: center;
	}
	
	.codi_sample>span{
		font-weight: bold;
		font-size: 20px;
	
	}
	.date>span{
		font-size: 10px;
	}
	.codi_model>span{
		font-weight: bold;
		font-size: 20px;
	}
	/* 버튼 이미지  */
	.comment-inner-text {
    width: 100%;
    height: 100px;
    border: 0;
    background: #fff;
    padding: 0;
    -webkit-border-radius: 0;
    -webkit-appearance: none;
    vertical-align: top;
	}
	textarea {
	    writing-mode: horizontal-tb !important;
	    font-style: ;
	    font-variant-ligatures: ;
	    font-variant-caps: ;
	    font-variant-numeric: ;
	    font-variant-east-asian: ;
	    font-weight: ;
	    font-stretch: ;
	    font-size: ;
	    font-family: monospace;
	    text-rendering: auto;
	    color: fieldtext;
	    letter-spacing: normal;
	    word-spacing: normal;
	    line-height: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    appearance: auto;
	    -webkit-rtl-ordering: logical;
	    resize: auto;
	    cursor: text;
	    white-space: pre-wrap;
	    overflow-wrap: break-word;
	    background-color: field;
	    column-count: initial !important;
	    margin: 0em;
	    border-width: 1px;
	    border-style: solid;
	    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	    border-image: initial;
	    padding: 2px;
	}
	input{
		display: inline-block;
	    padding: 1em 2em;
	    border-radius: 0;
	  	color: #b2876f;
	    margin-top:2rem;
	    font-weight: bold;
	    font-size: 0.678rem;
	    letter-spacing: 2px;
	    text-transform: uppercase;
	    text-decoration: none;
		  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
		  background-position: 1% 50%;
		  background-size: 400% 300%;
		  border: 1px solid #b2876f;
		  @include transition;
	  
		  &:hover{
		    color: white;
		      color: #fff;
      	background-position: 99% 50%;
  		}
		
	}
	#goodsBtn{
		display: inline-block;
	    padding: 1em 2em;
	    border-radius: 0;
	  	color: #b2876f;
	    margin-top:2rem;
	    font-weight: bold;
	    font-size: 0.678rem;
	    letter-spacing: 2px;
	    text-transform: uppercase;
	    text-decoration: none;
		  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
		  background-position: 1% 50%;
		  background-size: 400% 300%;
		  border: 1px solid #b2876f;
		  @include transition;
	  
		  &:hover{
		    color: white;
		      color: #fff;
      	background-position: 99% 50%;
  		}
	}
	.update_btn{
		display: inline-block;
	    padding: 1em 2em;
	    border-radius: 0;
	  	color: #b2876f;
	    margin-top:2rem;
	    font-weight: bold;
	    font-size: 0.678rem;
	    letter-spacing: 2px;
	    text-transform: uppercase;
	    text-decoration: none;
		  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
		  background-position: 1% 50%;
		  background-size: 400% 300%;
		  border: 1px solid #b2876f;
		  @include transition;
	  
		  &:hover{
		    color: white;
		      color: #fff;
      	background-position: 99% 50%;
  		}
	}
	
	
	.remove_comment_go{
	 	padding : 0px;
		border: none;
		background-color: white;
		margin-right: 15px;
	
	}	
	
	.comment-header{
		width: 100%;
		height: 30px;
		background-color: #b2876f;
	
	}
	.comment-main{
		border: 1px solid #b2876f;
		/* height: 50px; */
		min-height: 50px;
	}
	.m_replyer{
		line-height: 30px;
		margin-left: 5px;
	}
	
	#List_img{
		width: 24px;
	}
	.c_reply_text{
		border: none;
	}
	.remove_btn{
		border: none;
		background-color: transparent;
		
	}
	.update_open{
		border: none;
		background-color: transparent;
	}
	.List_btn{
		background-color: transparent;
		border: none;
	}
	
	
	
</style>
<body class="cordi_get">
	<div class="codi_box">

		<div class="social_title">
			<h1>Codi Shop</h1>
		</div>
		<br/>
		
		<br/><hr/><br/>
		
		<div class="codi_info">
			<div class="title">
				<span class="codi_title">${board.codi_title }</span>
			</div>
			
			<div class="date">
				<span>${board.codi_date } </span>
			</div>
			
			<div class="codi_img">
				<img style="width: 100%; height: 100%;" alt="test-img" src="/resources/img/codi_test.png">
			</div>
			
			<div class="model_info">
			<div class="codi_model"><span>모델 정보</span></div>
			<span>${board.codimodel_name }</span>
			<span>${board.codi_cm } </span>
			<span>${board.codi_kg } </span>
			</div>
			
			<div class="content">
				<span>${board.codi_content } </span>
			</div>
			
			<div class="product">
				<div class="codi_sample"><span>모델 착용 상품</span></div>
				<span>${board.m_no } </span>
			</div>
		
			<div class="container social">
				<div class="keyword_brand">
					<a href="#" class="brand_keyword">#겨울</a>
					<a href="#" class="brand_keyword">#adidas</a>
					<a href="#" class="brand_keyword">#new balance</a>
					<a href="#" class="brand_keyword">#nerdy</a>
					<a href="#" class="brand_keyword">#THE NORTH FACE</a>
					<a href="#" class="brand_keyword">#KOOREAM STANDARD</a>
				</div>
			</div>
			
			<div >
				<input type="button" value="목록" id="List_go">
				<input type="button" value="수정" id="modify_go">
				<input type="button" value="삭제" id="remove_go">
			</div>
				
				
				
				
		</div>			
		<br/>
		<hr/>
		<br/>
		<div class="comment">
			<div class="comment_textarea">
        		<!-- <button id="goodsHideBtn">댓글 취소</button> -->
				<textarea class="comment-inner-text" id="replytext" name="content" tabindex="1" placeholder="댓글 입력해 주세요."></textarea>			
			</div>
			<div class="comment_btn">
				<input type="button" class="submit-content" id="btnReply" value="등록" tabindex="2" style="float: right;">
				<button id="goodsBtn" style="float: right;">입력</button>
				<span class="btn_hide" style="display:none"></span>
				<!-- <input type="button" class="submit_hide" value="취소" style="float: right;"> -->
			</div>
			
			<br><br><br><br><br>
			
			<div class = "panel-body">
				<ul class = "chat">
					<!-- start reply -->
					<li class = "left clearfix" data-rno = '12'>
						<div>
							<div class = "header">
								<strong class = "primary-font"></strong>
								<small class = "pull-right text-muted">2018-01-01 13:13</small>								
							</div>
							<p>Good job!</p>
						</div>
					</li>
					<!-- end reply -->
				</ul>
				<!-- ./ end ul -->
			</div> <!-- panel-body -->
			
		</div>
		
	</div> <!-- codi_box .....end -->
<br/><br/><br/><br/><br/><br/>



</body>
<script type="text/javascript" src="/resources/js/codi/codiReply.js"></script>
<script type="text/javascript" src="/resources/js/codi/util.js"></script>
<script type="text/javascript">
	// 화면 이동 스크립트 --- start
	$("#List_go").click(function() {
		location.href = "/codishop/list";
		submit();
		
	});
	$("#modify_go").click(function() {
		location.href = "/codishop/modify";
		submit();
	});
	
	$("#remove_go").click(function() {
		location.href = "/codishop/remove?codi_no=${board.codi_no}";
		submit();
	});
	
	var codi_c_no = "";
	
	// 화면 이동 스크립트 --- end
	var replyUL = $(".chat");
	var codi_noValue = '${board.codi_no}';
	
	
	// 댓글 달기 버튼 이벤트
	$("#btnReply").hide();
	$("#replytext").hide();
	$("#goodsBtn").on("click", function(){
		var thisText = $(this).text();
		if(thisText=='입력'){
			$("#replytext").val("");
			$("#replytext").show();
			$("#btnReply").show();
			$(this).text("취소");
		}else{
			$("#replytext").hide();
			$("#btnReply").hide();
			$(this).text("입력");
		}
	});
	
	
	
	
	
	
	/* $('#goodsShowBtn').click(function() {
	    $("#replytext").show();
	    $("#goodsHideBtn").show();
	    $("#btnReply").show();
	})
	$('#goodsHideBtn').click(function() {
		$("#goodsShowBtn").show();
	    $("#replytext").hide();
	    $("#btnReply").hide();
	}) */
	
	
	// 댓글 리스트 화면에 출력 함수 ---- start 
	function showList() {
		CodiReplyService.getList({codi_no:codi_noValue, page:1},
			function(result) {
				str = '';
				console.log(result);
					
				if(result == null || result.length == 0){
					replyUL.html("");
					console.log("댓글 없음");
					return;
				}else{
					console.log(result);
					
					for(var i=0; i<result.length; i++){
						str += '<li class="left clearfix" data-rno = "' + result[i].codi_no+'">';
	 						str += '<div>';
		 						str += '<div class="comment-header">';
 									str += '<strong class="m_replyer">'+result[i].replyer+'</strong>';
 									str += '<small class="reply_date">'+displayTime(result[i].replyDate)+'</small>';
		 							str += '<button class="List_btn" data-opened="closed" style="float: right; "><img id="List_img" class="List_img" src="/resources/img/List_icon.png" alt="목록열림"></button>';
		 							str += '<button class="remove_btn" onclick="remove_btn('+ result[i].codi_c_no +')" style="float: right; ">삭제</button>';
		 							str += '<button class="update_open" data-textopen="close" onclick="update_open('+ result[i].codi_c_no +')" style="float: right; ">수정</button>';
 								str += '</div>';
 							str += '</div>';
 							str += '<div class="comment-main">';
								str += '<pre class="c_reply">'+result[i].reply+'</pre>';
								str += '<textarea rows="5" cols="100" name="contents" id="c_reply_text" class="c_reply_text">'+result[i].reply+'</textarea>';
								str += '<button class="update_btn" onclick="update_btn('+ result[i].codi_c_no +')" style="float: right; ">수정</button>';
 							str += '</div>';
 						str += '</li>';
					}
					replyUL.html(str);
					
					
					$(".update_btn").hide();
					$(".c_reply_text").hide();
					$(".remove_btn").hide();
					$(".update_open").hide();
					console.log($(".List_btn")[0]);
					
					$(".List_btn").on("click", function(e){
						var target = $(e.target).closest('button');
						var remove_btn = $(target).closest('div').find(".remove_btn");
						var update_open = $(target).closest('div').find(".update_open");
						console.log($(target).data('opened'));
						if($(target).data('opened') == "closed"){
							$(remove_btn).show();
							$(update_open).show();
							$(target).data('opened', 'opened');
						}else{
							$(remove_btn).hide();
							$(update_open).hide();
							$(target).data('opened', 'closed');
						}
					}); // List_btn ....end
					
			 	
					// 수정 버튼 클릭 이벤트 
					
					$(".update_open").on("click", function(e){
						var target = $(e.target).closest('button');
						var update_btn = $(target).closest('div').find("");
						var gomain = $(e.target).closest('li').find('.comment-main');
					
						console.log($(target).data('textopen'));
						if($(target).data('textopen')=='close'){
							console.log(gomain);
							$(update_btn).show();
							$(gomain).find('.c_reply').hide();
							$(gomain).find('.c_reply_text').show();
							$(gomain).find('.update_btn').show();
							
						}else{
							
						}
					}); // update_open .... end 
					
					
					
				}
			}
		);
	}// showList ... end
		
		
		

	
	$(function(){

		console.log(codi_noValue);
		
		
		showList();
		
 		
			
		// 댓글 등록 ... start
	
		$("#btnReply").click(function() {
			CodiReplyService.add({
				reply : $("#replytext").val(),
				replyer : "임시 작성자",
				codi_no : codi_noValue
			}, function(result) {
				showList();
				$("#replytext").val("");
			})
		});
	});
		// 댓글 등록 ... end
	$(".remove_btn").hide();
	$(".update_btn").hide();
		
	
	// 댓글 List Btn............start
	$(".List_btn").on("click", function(){
		console.log($(this).alt);
		var thisAlt = $(this).alt();
		if(thisAlt=='목록열림'){
			$(".replytext").val("");
			$(".remove_btn").show();
			$(".update_btn").show();
			$(this).alt("목록닫힘");
		}else{
			$(".remove_btn").hide();
			$(".update_btn").hide();
			$(this).alt("목록열림");
		}
	});
	// 댓글 List Btn............end
	
	// 댓글 수정 start
	function update_btn(c_no){
		var vo = {};
		console.log(c_no);
		var second = $('#c_reply_text');
		
		console.log(second);
		
		// 현재 눌려진 자신 = 수정 버튼 = this
		/* vo.codi_c_no = codi_c_no;
		vo.reply = $("#replytext").val();
		console.log(vo);
		
		CodiReplyService.update(vo, function(result){
			alert(result);
			showList();
		});
 */	};

	// 댓글 수정 end
	

		// 댓글 삭제 start
	function remove_btn(c_no) {
		CodiReplyService.remove(c_no, function(result){
			alert(result);
			showList();
		});
	};

	// 댓글 삭제 end
	
	
	
	
	
</script>
<jsp:include page="../include/footer.jsp"/>