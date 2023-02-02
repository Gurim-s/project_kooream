
var pageNum = 1;
var amount = 12;
var column = $('.list-column');
let h_tag = '';


$(function() {
	pageNum = 1;
	amount = 12;
	h_tag = '';
		
	getList(pageNum, amount);
 	
	$('#load').on('click', function(e) {
		e.preventDefault();
		pageNum++;
		getList(pageNum, amount);
	});
	
	$('#searchBtn').on('click',function(e){
		e.preventDefault();
		$('#first').empty();
		$('#second').empty();
		$('#third').empty();
		$('#force').empty();
		getList(pageNum, amount);
	});
	
	$('.searchTagName').on('click',function(e){
		e.preventDefault();
		alert("클릭함");
		$('#first').empty();
		$('#second').empty();
		$('#third').empty();
		$('#force').empty();
		getList(pageNum, amount);
		
	});
});
/*url 값 가져오기에서 원하는 값 끄내오기*/
function getParameterByName(name) {
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
  results = regex.exec(location.search);
  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}



function getList(pageNum, amount) {
	// 리스트 초기화
	var patId = getParameterByName('searchTagName');

	$.ajax({	
		url: "list",
		data: JSON.stringify({
			pageNum: pageNum,
			amount: amount,
			searchType : $('#searchType').val(),
			searchName : $('#searchName').val(),
			searchTagName : patId
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
			$(img_tag).attr('src', '/displayImage?fileName='+fileCallPath);
			
			
			
			

			var text_Line1 = $('<div></div>');
			$(text_Line1).append('<h3>' + codi.m_no + '</h3>');
			var text_Line2 = $('<div></div>');
			$(text_Line2).append('<h3>' + codi.codi_title + '</h3>');
			
			var text_Line3 = $('<div></div>');
			$(text_Line3).append(' Model: ' + codi.codimodel_name+' ');
			$(text_Line3).append(' Body: ' + codi.codi_cm);
			$(text_Line3).append('/ ' +codi.codi_kg);
			
//			var tags = '';
//			for(var i=0; i<codi.codiTagList.length; i++){
//				// 새로운 화면으로 이동 (tags.jsp)
////				tags += '<a href="/codishop/tags?tag_name='+codi.codiTagList[i].tag_name+'">#'+ codi.codiTagList[i].tag_name+'</a>';
////				tags += '<a href="#" name="searchTagName" id="searchTagName">#'+ codi.codiTagList[i].tag_name+'</a>';
//				tags += '<a href="/codishop/list?tag_name='+codi.codiTagList[i].tag_name+'" name="searchTagName" class="searchTagName">#'+ codi.codiTagList[i].tag_name+'</a>';
//			};
//			$(text_Line4).append(tags);
			
			var text_Line4 = $('<div></div>');
			$(text_Line4).text(new Intl.DateTimeFormat('kr').format(new Date(codi.codi_date)));
			
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




