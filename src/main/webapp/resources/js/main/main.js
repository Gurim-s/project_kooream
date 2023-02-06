/**
 * 
 */
import {styleService} from '../service/style-service.js';

var pageNum =1;
var amount = 4;
var column = $('.list-column');

(function() {
	setSlide();
	getCodiList(pageNum,amount);
	getStyleList(pageNum,amount);
	
	
})();

function setSlide() {
	const slideUl = document.querySelector('ul.slides');
	const slideLi = document.querySelectorAll('.slides li'); //모든 슬라이드들
	let currentIdx = 0; //현재 슬라이드 index
	const slideCount = slideLi.length; // 슬라이드 개수
	const prev = document.querySelector('.prev'); //이전 버튼
	const next = document.querySelector('.next'); //다음 버튼
	
	slideUl.style.width = (slideCount * 100)+ '%';
	slideLi.forEach(li => li.style.width = (100 / slideCount) + '%');
	
	function moveSlide(num) {
		slideUl.style.left = -num * 100 + '%';
		currentIdx = num;
	}
	prev.addEventListener('click', function () {
		/*첫 번째 슬라이드로 표시 됐을때는 
		이전 버튼 눌러도 아무런 반응 없게 하기 위해 
		currentIdx !==0일때만 moveSlide 함수 불러옴 */
		if (currentIdx !== 0) moveSlide(currentIdx - 1);
	});
	next.addEventListener('click', function () {
		/* 마지막 슬라이드로 표시 됐을때는 
		다음 버튼 눌러도 아무런 반응 없게 하기 위해
		currentIdx !==slideCount - 1 일때만 
		moveSlide 함수 불러옴 */
		if (currentIdx !== slideCount - 1) {
		    moveSlide(currentIdx + 1);
		}
	});
}

function getCodiList(pageNum, amount){
	$.ajax({	
		url: "../codishop/list",
		data: JSON.stringify({
			pageNum: pageNum,
			amount: amount
		}),
		type: "post",
		dataType:"json",
		contentType:"application/json",
	})
	.done(function(json) {
		//console.log(json);
		$.each(json, function(idx, codi) {
		// 1개의 정보 
		var card_box = $('<a href="../codishop/get?codi_no='+codi.codi_no+ '"><div></div></a>');			
		$(card_box).attr('class','codi_card'); // class 부여
		// 설명란
		var text_box = $('<div></div>');
		$(text_box).attr('class', 'codi_text');
		// 이미지 박스
		var img_box = $('<div></div>');	
		$(img_box).attr('class', 'codi_img_box');
		
		var img_tag = $('<img></img>');	// img_tag div 태그 생성 
		$(img_tag).attr('class', 'codi_img');
		var fileCallPath = encodeURIComponent(codi.attachList[0].uploadPath + "/"
												+ codi.attachList[0].uuid + "_"
												+ codi.attachList[0].fileName);
		$(img_tag).attr('src', '/displayImage?fileName='+fileCallPath);
		$(img_box).append(img_tag);	 // 이미지 박스에 이미지 태그 넣어주기 
		$(card_box).append(img_box);
		var textLine1 = $('<div></div>');
		$(textLine1).append('<h4>'+codi.codi_title+'</h4>')
		$(text_box).append(textLine1);	 
		$(card_box).append(text_box);
		$(column[idx % 4]).append(card_box);
		}); //each 
	});  // .done ... end
};// getList() end
async function getStyleList(pageNum, amount){
	var query = {
		pageNum: 1,
		amount: 4,
		category: 'hot'
	}
	var styleList = await styleService.getList(query);
	console.log(styleList);
	console.log(styleList[0].style_no);
}
