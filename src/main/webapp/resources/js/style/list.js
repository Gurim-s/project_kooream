import {imgService} from '../service/image-service.js';
import {styleService} from '../service/style-service.js';

//var pageNum, amount;
var query = {}
var column = document.querySelectorAll('.list-column');
var more = document.querySelector('#more');
var register = document.querySelector('#register');

// 페이지 초기화
(function() {
//	pageNum = 1;
//	amount = 20;
	const searchParams = new URLSearchParams(location.search);
	const category = Array.from(searchParams)[0][1];
	const param = category == 'hot' || category == 'recent'
		? ''
		: Array.from(searchParams)[1][1];

	query = {
		pageNum: 1,
		amount: 20,
		category: category,
		query: param,
	}
	getList(query);
	
	register.addEventListener('click', function() {
		location.href = 'register';
	});
	
	more.addEventListener('click', function() {
		pageNum++;
		getList(query);
	});
})();

async function getList(query) {
	const styleList = await styleService.getList(query);
	styleList.forEach((style, i) => {
		column[i%4].append(item(style));
	});
}

function item(style) {
	const template = document.createElement('a');
	template.className = 'card-link';
	template.href = '/style/detail?category=hot&style_no='+style.style_no;  
	template.innerHTML =(
		'<div class="card">' +
			'<div class="img-container">' +
			'</div>' +
			'<div class="info">' +
				'<div class="user_info">' +
					'<div class="profile"><img src="/resources/img/codi_test.png" /></div>' +
					'<div class="user_id">김씨</div>'+
				'</div>' +
				'<div class="social_info">' +
					'<div class="like">' +
						'<img src="/resources/img/like.svg" alt="공감"/>' +
						'<span>'+ style.count_like +'</span>'+
					'</div>' + 
					'<div class="comment">' +
						'<img src="/resources/img/reply.svg" alt="댓글"/>' +
						'<span>'+ style.count_reply +'</span>'+
					'</div>' + 
				'</div>' +
				'<div class="clearfix"></div>' +
			'</div>' +
			'<div class="content">'+ style.style_content +'</div>' +
		'</div>'
	);
	
	const imgEl = imgService.getImageEl(style.style_image[0]);
	const imgContainer = template.querySelector('.img-container');
	imgContainer.append(imgEl);
	
	imgContainer.style.width = '100%';
	imgContainer.style.position = 'relative';
	imgContainer.style.paddingTop = (100 * style.ratio) + '%' ;
	imgContainer.style.overflow = 'hidden';
	imgContainer.style.borderRadius = '10px';
	imgContainer.style.marginBottom = '10px';
	
	imgEl.style.position = 'absolute';
	imgEl.style.top = imgEl.dataset.offsetY;
	imgEl.style.left = imgEl.dataset.offsetX;

	const countImg = document.createElement('div');
	if (style.style_image.length != 1) {
		countImg.innerHTML = style.style_image.length + '+';
		imgContainer.append(countImg);
		countImg.style.position = 'absolute';
		countImg.style.width = '28px';
		countImg.style.height = '16px';
		countImg.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
		countImg.style.borderRadius = '8px';
		countImg.style.fontSize = '13px';
		countImg.style.fontWeight = 'bold';
		countImg.style.color = 'white';
		countImg.style.top = '6px';
		countImg.style.right = '6px';
		countImg.style.textAlign = 'center';
		countImg.style.lineHeight = '16px';
	}
	 
	return template;
}