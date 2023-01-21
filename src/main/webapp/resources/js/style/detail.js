import {styleService} from '../service/style-service.js';
import {imgService} from '../service/image-service.js';
import {imgSlider} from '../common/img-slider.js';
import {modal} from '../common/modal.js';
import {replyViewer} from '../common/reply-viewer.js';

(async () => {
	const searchParams = new URLSearchParams(location.search);
	const [category, style_no] = Array.from(searchParams).map(x => x[1]);
	const column = document.querySelector('.list-column');
	
	let styleList = await styleService.get(category, style_no);
	styleList.forEach(x => column.append(template(x)));
})();

//style목록 template
var template = function(style) {
	var template = document.createElement('div'); 
	template.className = 'item';
	template.dataset.styleNo = style.style_no;
	template.innerHTML = (
		'<div class="item-header clearfix">' +
			'<div class="item-header-left">' +
				'<div class="profile-image">'+
					'<img class="profile" src="/resources/img/codi_test.png" />' +
				'</div>' +
				'<div class="user-regdate">' +
				 	'<div class="user-name">김씨</div>' +
					'<div class="regdate">'+ style.style_regDate +'</div>' +
				'</div>' +
			'</div>' +
			'<div class="item-header-right">' +
				'<a href="#" class="follow-btn" data-user-no="'+style.mno+'">팔로우</a>' +
				'<a href="#" class="update-btn">수정</a>' +
			'</div>' +
		'</div>' +
		'<div class="img-container"></div>' +
		'<div class="product-container">'+
		'</div>' +
		'<div class="reply-like-summary">'+
			'<a href="#" class="like-summary">' +
				'<img src="/resources/img/like.svg" alt="공감"/>' +
				'<span>'+ style.count_like +'</span>'+ 
			'</a>' +
			'<a href="#" class="reply-summary">' +
				'<img src="/resources/img/reply.svg" alt="댓글"/>' +
				'<span>'+ style.count_reply +'</span>'+ 
			'</a>' +
			'<div class="clearfix"></div>' +
		'</div>' + 
		'<div class="content">'+ style.style_content +'</div>' +
		'<div class="reply-container">'+
		'</div>'
	);
	
	//이미지 슬라이더 모듈 가져오기
	var imgContainer = template.querySelector('.img-container');
	var slider = imgSlider();
	imgContainer.append(slider.container);
	var imgSrcList = style.style_image.map(x => imgService.originPath(x));
	slider.addList(imgSrcList);
	
	/***********************************
	 * addEventListener
	 **********************************/
	template.querySelector('.like-summary')
		.addEventListener('click', (e) => {
			e.preventDefault();
			
			const m = modal();
			m.open({title: '공감 목록'});
			m.append('helloWorld');
	});
	
	template.querySelector('.reply-summary')
		.addEventListener('click', async (e) => {
			e.preventDefault();
			
			const style_no = e.target.closest('.item').dataset.styleNo;
			const m = modal();
			m.open({title: '댓글 목록', type: 'right'});
			
			const replyTemplate = replyViewer(style_no);
			replyTemplate.setOption({input: true, nestedReply: true});
			const replyList = await replyTemplate.get();
			m.append(replyList);
	});
	
	template.querySelector('.update-btn')
		.addEventListener('click', (e) => {
			e.preventDefault();
			
			location.href = '/style/update?style_no=' + style.style_no;
	});
	
	return template;
}