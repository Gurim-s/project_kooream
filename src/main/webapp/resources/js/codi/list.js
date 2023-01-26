
var pageNum;
var amount;
var column = $('.list-column');

$(function() {
	pageNum = 1;
	amount = 12;
	getList(pageNum, amount);
 	
	$('#load').on('click', function(e) {
		e.preventDefault();
		pageNum++;
		getList(pageNum, amount);
	});
	
	
});


function getList(pageNum, amount) {
	$.ajax({
		url: "list",
		data: JSON.stringify({
			pageNum: pageNum,
			amount: amount
		}),
		type: 'post',
		dataType:"json",
		contentType:"application/json",
	})	// $.ajax.... end 
	.done(function(json) {
		$.each(json, function(idx, codi) {
			// 1개의 코디 중 제일 큰 곳
			var card_box = $('<a href="/codishop/get?codi_no='+ codi.codi_no + '"><div></div></a>');		//card_box div 태그 생성
			$(card_box).attr('class', 'codi_card');  // card_box class 넣어주기
			
			var img_box = $('<div></div>');		//img_box div 태그 생성
			$(img_box).attr('class', 'codi_img_box');	// img_box class 넣어주기
			
			var text_box = $('<div></div>');		//text_box div 태그 생성
			$(text_box).attr('class', 'codi_text');	// text_box 클래스 생성
			
			var img_tag = $('<img></img>');	// img_tag div 태그 생성 
			$(img_tag).attr('class', 'codi_img');
			var fileCallPath = encodeURIComponent(codi.attachList[0].uploadPath + "/"
													+ codi.attachList[0].uuid + "_"
													+ codi.attachList[0].fileName);
			$(img_tag).attr('src', '/codidisplay?fileName='+fileCallPath);
			
			
			
			
			var text_Line1 = $('<div></div>');
			$(text_Line1).append('<h3>' + codi.codi_title + '</h3>');
			
			var text_Line2 = $('<div></div>');
			$(text_Line2).append(' Model: ' + codi.codimodel_name+' ');
			$(text_Line2).append(' Body: ' + codi.codi_cm);
			$(text_Line2).append('/ ' +codi.codi_kg);
			
			var text_Line3 = $('<div></div>');
			$(text_Line3).text(new Intl.DateTimeFormat('kr').format(new Date(codi.codi_date)));
			
			var tags = '';
			for(var i=0; i<codi.codiTagList.length; i++){
				tags += '<a href="#" class="tag_a">'+codi.codiTagList[i].tag_name+'</a>'	
			};
			
			var text_Line4 = $('<div></div>');
			$(text_Line4).append(tags);
			
			$(img_box).append(img_tag);	 // 이미지 박스에 이미지 태그 넣어주기 
			$(card_box).append(img_box);	// 카드 박스에 이미지 박스 넣어주기 
			
			$(card_box).append(text_box);	// 카드 박스에 택스트 박스 넣어주기 
			$(text_box).append(text_Line1);	  
			$(text_box).append(text_Line2);	 
			$(text_box).append(text_Line3);	 
			$(text_box).append(text_Line4);	 
			
			$(column[idx % 4]).append(card_box);	// 생성한 div를 column에 추가 -> 이 작업을 해야 view에 나옴
			
		}); // function(idx, codi) ... end
	});	// .done ... end
};	// function getList ... .end





