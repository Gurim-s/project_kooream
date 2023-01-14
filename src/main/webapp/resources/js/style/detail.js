import {styleService} from '../service/style-service.js';
import {imgService} from '../service/image-service.js';
import {imgSlider} from '../common/img-slider.js';
import {modal} from '../common/modal.js';

(async () => {
	/*
	 * 페이지 로드
	 **/
	const searchParams = new URLSearchParams(location.search);
	const [category, style_no] = Array.from(searchParams).map(x => x[1]);
	const column = document.querySelector('.list-column');
	
	let styleList = await styleService.get(category, style_no);
	styleList.forEach(x => column.append(itemTemplate(x)));

})();

var itemTemplate = function(style) {
	var str = (
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
				'<button class="follow-btn" data-user-no="'+style.m_no+'">팔로우</button>' +
				'<button class="update">수정</button>' +
			'</div>' +
		'</div>' +
		'<div class="img-container"></div>' +
		'<div class="summary">' +
			'<div class="comment-like">'+
				'<div class="like">' +
					'<img src="/resources/img/like.svg" alt="공감"/>' +
					'<span>'+ style.count_like +'</span>'+ 
				'</div>' +
				'<div class="comment">' +
					'<img src="/resources/img/comment.svg" alt="댓글"/>' +
					'<span>'+ style.count_comment +'</span>'+ 
				'</div>' +
				'<div class="clearfix"></div>' +
			'</div>' + 
		'</div>' + 
		'<div class="content"></div>'
	);
	
	var item = document.createElement('div'); 
	item.className = 'item';
	item.innerHTML += str;
	
	//이미지 슬라이더 모듈 가져오기
	var imgContainer = item.querySelector('.img-container');
	var slider = imgSlider();
	imgContainer.append(slider.container);
	var imgSrcList = style.style_image.map(x => imgService.originPath(x));
	slider.addList(imgSrcList);
	
	item.querySelector('.like')
	.addEventListener('click', () => {
		let m = modal();
		m.open({title: '공감 목록'});
	});
	
	item.querySelector('.comment')
	.addEventListener('click', () => {
		let m = modal();
		m.open({title: '댓글 목록', type: 'right'});
	});
	
	return item;
}