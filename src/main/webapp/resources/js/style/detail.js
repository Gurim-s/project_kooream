import {styleService} from '../service/style-service.js';
import {memberService} from '../service/member-service.js';
import {imgService} from '../service/image-service.js';
import {imgSlider} from '../common/img-slider.js';
//import {productSearchService} from '../service/product-search-service.js';
import {modal} from '../common/modal.js';
import {replyViewer} from '../common/reply-viewer.js';
import {showTime} from '../common/common.js';

//	let styleList = await styleService.get(category, style_no);
//	styleList.forEach(x => column.append(template(x)));
const member_no = document.querySelector('header input[name="pri_m_no"]').value;
//(async () => {
//	const searchParams = new URLSearchParams(location.search);
//	const [category, style_no] = Array.from(searchParams).map(x  => x[1]);
//	const column = document.querySelector('.list-column');
//	const style = await styleService.getOne(style_no);
//	column.append(template(style));
//})();

//style목록 template
var template = function(style) {
	var template = document.createElement('div'); 
	template.className = 'item';
	template.id = 'detail_'+style.style_no;
	template.dataset.styleNo = style.style_no;
	
	template.innerHTML = (
		'<div class="item-header clearfix">' +
			'<div class="item-header-left">' +
				'<div class="profile-image">'+
					'<img class="profile" src="'+imgService.thumbnailPath(style.profile_image)+'" />' +
				'</div>' +
				'<div class="user-regdate">' +
				 	'<div class="user-name">'+style.m_nickname+'</div>' +
					'<div class="regdate">'+ showTime(style.style_regdate) +'</div>' +
				'</div>' +
			'</div>' +
			'<div class="item-header-right">' +
				(style.m_no != member_no
					? '<a href="#" class="follow-btn" data-m_no="'+style.m_no+'">팔로우</a>'
					: '<a href="#" class="update-btn">수정</a><a href="#" class="remove-btn">삭제</a>') +
			'</div>' +
		'</div>' +
		'<div class="img-container"></div>' +
		'<div class="product-count"></div>' + 
		'<div class="product-container">'+
		'</div>' +
		'<div class="like-reply-summary clearfix">'+
			'<a href="#" class="like-summary">' +
				'<img src="/resources/img/like.svg" alt="공감"/>' +
				'<span>공감 '+ style.count_like +'개</span>'+ 
			'</a>' +
			'<a href="#" class="reply-summary">' +
				'<img src="/resources/img/reply.svg" alt="댓글"/>' +
				'<span>댓글 '+ style.count_reply +'개</span>'+ 
			'</a>' +
		'</div>' + 
		'<div class="content">'+ strToHashTag(style.style_content) +'</div>' +
		'<div class="reply-container">'+
		'</div>'
	);
	//이미지 슬라이더 모듈 가져오기
	var imgContainer = template.querySelector('.img-container');
	var slider = imgSlider({
		offset: true,
	});
	imgContainer.append(slider.container);
//	slider.add(imgService.originPath(style.mainImage));
	var imgSrcList = style.style_image.map(x => imgService.getImageEl(x));
	slider.addImgTagList(imgSrcList);
	
	// 상품 정보 가져오기
	const productContainer = template.querySelector('.product-container');
	setProductTags(style.productTagList, productContainer, slider);
	
	const productTagCount = style.productTagList?.flat()
	.map(x => x.p_no)
	.filter((x, i, arr) => arr.indexOf(x) === i)
	.length;
	
	template.querySelector('.product-count').innerHTML = '상품 태그 ' + (productTagCount == undefined? 0: productTagCount) + ' 개';
	
	/***********************************
	 * addEventListener
	 **********************************/
	const followBtn = template.querySelector('.follow-btn');
	if (followBtn != null) {
		followBtn.addEventListener('click', async (e) => {
			e.preventDefault();
			const target = e.target;
			const result = await memberService.followMember(target.dataset.m_no);
			
			result == 1 ? target.classList.add('followed')
						: target.classList.remove('followed');
		});
	}
	
	template.querySelector('.reply-summary')
	.addEventListener('click', async (e) => {
		e.preventDefault();
		if(member_no === 'anonymousUser') {
			location.href = '/style/reply/login';
			return;
		}
		
		const style_no = e.target.closest('.item').dataset.styleNo;
		const m = modal();
		m.open({title: '댓글', type: 'right'});
		
		const replyTemplate = replyViewer(style_no);
		replyTemplate.setOption({input: true, nestedReply: true});
		const replyList = await replyTemplate.get();
//		const updateTarget = e.target.querySelector('span');
		replyTemplate.publish({update: function(count) {
			const replyCount = template.querySelector('.reply-summary span');
			replyCount.innerHTML = '댓글 ' + count + '개';
		}});
		
		m.append(replyList);
	});
	
	template.querySelector('.like-summary')
	.addEventListener('click', async (e) => {
		e.preventDefault();
		const style_no = e.target.closest('.item').dataset.styleNo;
		const count = await styleService.like(style_no);
		
		const replyCount = template.querySelector('.like-summary span');
		replyCount.innerHTML = '공감 ' + count + '개';
	});
	
	template.querySelectorAll('.update-btn').forEach(
		x=> x.addEventListener('click', (e) => {
		e.preventDefault();
		
		location.href = '/style/update?style_no=' + style.style_no;
	}));
	
	template.querySelectorAll('.remove-btn').forEach(
		x=> x.addEventListener('click', (e) => {
		e.preventDefault();
		
		location.href = '/style/remove?style_no=' + style.style_no;
	}));
	
	return template;
}

//async function getProduct(x) {
//	x.product = await productSearchService.getProduct(x.p_no);
//	return x;
//}

function setProductTags(list, productContainer, slider) {
//	const productList = await Promise.all(list.flat().map(getProduct));
	if (list == null || list.length == 0) return;
	list.forEach(x => {
		slider.addProductTag(x);
	});

	list.forEach(x => {
		productContainer.append(productTagTemplate(x));
	});
}

function productTagTemplate(productTag) {
	const container = document.createElement('a');
	container.className = 'product-info';
	container.href = '../shop_introduce/'+productTag.p_no;
	const str = (
		'<div class="product-img">' +
				'<img src="'+imgService.originPath(productTag)+'" />' +
		'</div>' +
		'<div class="name-price">' +
			'<p class="name">'+productTag.p_name_ko+'</p>'+
			'<p class="price">'+productTag.p_release_price+'원</p>'+
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

export {template}