import {styleService} from '../service/style-service.js';
import {imgService} from '../service/image-service.js';
import {imgSlider} from '../common/img-slider.js';
import {productSearchService} from '../service/product-search-service.js';
import {modal} from '../common/modal.js';
import {replyViewer} from '../common/reply-viewer.js';
import {showTime} from '../common/common.js';

(async () => {
	const searchParams = new URLSearchParams(location.search);
	const [category, style_no] = Array.from(searchParams).map(x  => x[1]);
	const column = document.querySelector('.list-column');
	
//	let styleList = await styleService.get(category, style_no);
//	styleList.forEach(x => column.append(template(x)));
	const style = await styleService.getOne(style_no);
	column.append(template(style));
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
					'<div class="regdate">'+ showTime(style.style_regdate) +'</div>' +
				'</div>' +
			'</div>' +
			'<div class="item-header-right">' +
				'<a href="#" class="follow-btn" data-user-no="'+style.mno+'">팔로우</a>' +
				'<a href="#" class="update-btn">수정</a>' +
				'<a href="#" class="remove-btn">삭제</a>' +
			'</div>' +
		'</div>' +
		'<div class="img-container"></div>' +
		'<div class="product-count"></div>' + 
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
		'<div class="content">'+ strToHashTag(style.style_content) +'</div>' +
		'<div class="reply-container">'+
		'</div>'
	);
	
	//이미지 슬라이더 모듈 가져오기
	var imgContainer = template.querySelector('.img-container');
	var slider = imgSlider({
		ratio: style.ratio? style.ratio : 1,
		ratioFix: true,
		offset: true,
	});
	imgContainer.append(slider.container);
	var imgSrcList = style.style_image.map(x => imgService.getImageEl(x));
	slider.addImgTagList(imgSrcList);
	
	// 상품 정보 가져오기
	const productContainer = template.querySelector('.product-container');
	setProductTags(style.productTagList, productContainer, slider);
	console.log(style.productTagList.length);
	console.log(style);
//	const productTagList = await Promise.all(style.productTagList.flat().map(getProduct));
//	console.log(1);
	
	
	//.filter((x, i, arr) => arr.indexOf(x) === i)
	
//	template.querySelector('.product-count').innerHTML = '상품 태그 ' + productList.length + ' 개';
//	productList.forEach(async x => {
//		const product = await productTagTemplate(x);
//		productContainer.append(product);
//	});
	
	
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
		m.open({title: '댓글', type: 'right'});
		
		const replyTemplate = replyViewer(style_no);
		replyTemplate.setOption({input: true, nestedReply: true});
		const replyList = await replyTemplate.get();
//		const updateTarget = e.target.querySelector('span');
		
		m.append(replyList);
	});
	
	template.querySelector('.update-btn')
	.addEventListener('click', (e) => {
		e.preventDefault();
		
		location.href = '/style/update?style_no=' + style.style_no;
	});
	
	template.querySelector('.remove-btn')
	.addEventListener('click', (e) => {
		e.preventDefault();
		
		location.href = '/style/remove?style_no=' + style.style_no;
	});
	
	return template;
}

async function getProduct(x) {
	x.product = await productSearchService.getProduct(x.p_no);
	return x;
}

async function setProductTags(list, productContainer, slider) {
	const productList = await Promise.all(list.flat().map(getProduct));
	productList.forEach(x => {
		slider.addProductTag(x.product, x.offsetX, x.offsetY, x.idx);
	});
	productList.forEach(x => {
		productContainer.append(productTagTemplate(x));
	});
	
}

function productTagTemplate(productTag) {
	const container = document.createElement('a');
	container.className = 'product-info';
	container.href = '../shop_introduce/'+productTag.p_no;
	
	const product = productTag.product;
	const str = (
		'<div class="product-img">' +
				'<img src="'+imgService.originPath(product.attachList[0])+'" />' +
		'</div>' +
		'<div class="name-price">' +
			'<p class="name">'+product.p_name_en+'</p>'+
			'<p class="price">'+product.p_release_price+'원</p>'+
		'</div>'
	);
	container.innerHTML += str;
	
	container.style.display = 'inline-block';
	container.style.width = '100px';
	container.style.margin = '5px 0px 10px 5px';
	
	const productImg = container.querySelector('.product-img img');
	productImg.style.width = '100px';
	productImg.style.height = '100px';
	productImg.style.borderRadius = '10px';
	
	const name = container.querySelector('.name');
	name.style.fontSize = '15px';
	name.style.width = '100px';
	name.style.height = '20px';
	name.style.overflow = 'hidden';
	
	const price = container.querySelector('.price');
	price.style.fontSize = '15px';
	price.style.fontWeight = 'bold';
	price.style.width = '100px';
	
	return container;
}

function strToHashTag(text) {
	const type = /#[^\s^#]+/g;
	const strToA = str => '<a href="/style/list?category=tag&hashtag='+str.substring(1)+'" style="color:#3022ff;">'+str+'</a>';
	
	return text.replace(type, strToA);
}
