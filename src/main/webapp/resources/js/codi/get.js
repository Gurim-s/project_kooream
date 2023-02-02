import {imgSlider} from '../common/img-slider.js'; // 이미지 슬라이더 모듈 가져오기
import {imgService} from '../service/image-service.js';

var codi_no = $('.codi_box').data('codi-no');
$(function() {
	console.log(codi_no);
	
	$.ajax({
		type : 'get',
		url : '/codishop/getImages/'+codi_no ,
    	success: function(result) {
    		console.log(result);
// 	    		var image = $('#uploadReslut');
	    		
    		//이미지 슬라이더 모듈 가져오기
    		var imgContainer = document.querySelector('#uploadReslut'); // 1. 이미지 슬라이더를 넣을 공간 선택
    		var slider = imgSlider();									// 2. 모듈(함수) 불러오기 ** 슬라이더 생성
    		imgContainer.append(slider.container);						// 3. 생성한 슬라이더를 1번에서 선택한 공간에 넣어주기

    		var imgSrcList = [];
    		for(var i=0; i<result.length; i++) {
// 	    			var fileCallPath = encodeURIComponent(result[i].uploadPath + "/"
// 	    					+ result[i].uuid + "_"
// 	    					+ result[i].fileName);
    			imgSrcList.push(imgService.originPath(result[i]));
    		}
//    		console.log(imgSrcList);
// 	    		var imgSrcList = style.style_image.map(x => imgService.originPath(x));
	    		//	result[i]
	    		
    		slider.addList(imgSrcList);
	    		
	    		
	    		
// 	    		$(image).append(str);
    	},
	 	error: function(xhr, status, er) {
        	error(er);
		}
	});
	
	$.ajax({
		type: 'get',
		url : '/codishop/getTag/'+codi_no ,
		success : function(result){
			console.log(result);
			var tag = $('#uploadTag');
			console.log(tag);
			
			var str = '';
		for(var i=0; i<result.length; i++){
			var tag = result[i];
			console.log(tag.tag_name);
			
			str += '<a href="#" class="brand_keyword">'+tag.tag_name+'</a>'		
			}
			
			 $("#uploadTag").html(str);
		}
	});
});

// 화면 이동 스크립트 --- start
$("#List_go").click(function() {
	location.href = "/codishop/list";
	submit();
	
});
$("#modify_go").click(function() {
	location.href = "/codishop/modify?codi_no="+codi_no;
	submit();
});

$("#remove_go").click(function() {
	location.href = "/codishop/remove?codi_no="+codi_no;
	submit();
});

var codi_c_no = "";

// 화면 이동 스크립트 --- end
var replyUL = $(".chat");
var codi_noValue = codi_no;


// 댓글 달기 버튼 이벤트
$("#btnReply").hide();
$("#replytext").hide();
$("#goodsBtn").on("click", function(){
	var thisText = $(this).text();
	if(thisText=='댓글 입력'){
		$("#replytext").val("");
		$("#replytext").show();
		$("#btnReply").show();
		$(this).text("취소");
	}else{
		$("#replytext").hide();
		$("#btnReply").hide();
		$(this).text("댓글 입력");
	}
});
	
// 댓글 리스트 화면에 출력 함수 ---- start 
function showList() {
	CodiReplyService.getList({codi_no:codi_noValue, page:1},
		function(result) {
			var str = '';
				
			if(result == null || result.length == 0){
				replyUL.html("");
				console.log("댓글 없음");
				return;
			}else{
				for(var i=0; i<result.length; i++){
					str += '<li class="left clearfix" data-rno = "' + result[i].codi_no+'" data-cno="'+result[i].codi_c_no+'">';
 						str += '<div>';
	 						str += '<div class="comment-header">';
								str += '<strong class="m_replyer">'+result[i].replyer+'</strong>';
								str += '<small class="reply_date">'+displayTime(result[i].replyDate)+'</small>';
	 							str += '<button class="List_btn" data-opened="closed" style="float: right; "><img id="List_img" class="List_img" src="/resources/img/List_icon.png" alt="목록열림"></button>';
	 							str += '<button class="remove_btn" onclick="remove_btn('+ result[i].codi_c_no +')" style="float: right; ">삭제</button>';
	 							str += '<button class="update_open" data-textopen="close" style="float: right; ">수정</button>';
							str += '</div>';
						str += '</div>';
						str += '<div class="comment-main">';
							str += '<pre class="c_reply">'+result[i].reply+'</pre>';
							str += '<textarea rows="5" cols="100" name="contents" id="c_reply_text" class="c_reply_text">'+result[i].reply+'</textarea>';
							str += '<button class="update_btn" style="float: right; ">수정</button>';
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
//					console.log($(target).data('opened'));
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
				
//					console.log($(target).data('textopen'));
					if($(target).data('textopen')=='close'){
						console.log(gomain);
						$(update_btn).show();
						$(gomain).find('.c_reply').hide();
						$(gomain).find('.c_reply_text').show();
						$(gomain).find('.update_btn').show();
						
					}else{
						
					}
				}); // update_open .... end 
				
				$('.update_btn').on('click', function(e) {
					var gomain = $(e.target).closest('li').find('.comment-main');
					console.log('.c_reply_text');
					var cno = $(e.target).closest('li').data('cno');
					var vo = {};
					var second = $('#c_reply_text');
					vo.codi_c_no = cno;
					vo.reply = second.val();
					CodiReplyService.update(vo, function(result){
						alert(result);
						showList();
					});
				});
				$('.remove_btn').on('click', function(e) {
					var cno = $(e.target).closest('li').data('cno'); 
					CodiReplyService.remove(cno, function(result){
						alert(result);
						showList();
					});
				});
				
			}
		}
	);
}// showList ... end
$(function(){
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
	// 댓글 삭제 end

