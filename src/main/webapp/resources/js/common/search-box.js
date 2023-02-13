/**
 * 
 */
import {productSearchService} from '../service/product-search-service.js';
import {imgService} from '../service/image-service.js';
const searchBox = () => (function() {
	const container = document.createElement('div');
	container.id = 'searchBox';
	const searchInput = document.createElement('input');
	searchInput.placeholder = '상품명으로 검색';
	const resultList = document.createElement('ul');
	const publisher = [];
	
	function init() {
		container.append(searchInput);
		container.append(resultList);
		
		setEvent();
		setDefaultCss();
	}
	
	function setEvent() {
		searchInput.addEventListener('input', searchAjax);
	}
	
	function setDefaultCss() {
		
	}
	/* ========================
	 * Method
	 * ========================*/
	function publish(target) {
		publisher.push(target);
	}
	
	async function searchAjax(e) {
		const keyword = e.target.value;
		resultList.innerHTML = '';
		if (keyword == '') return;

		const result = await productSearchService.searchProduct({
			keyword: keyword,
			pageNum: 1,
			amount: 20,
		});
		
		setProductList(result);
	}
	
	function setProductList(result) {
		result.forEach(x => {
			const li = productListTemplate(x);
			resultList.append(li);
		});
	}
	
	function productListTemplate(product) {
		const li = document.createElement('li');
		li.dataset.p_no = product.p_no;
		const str = ''+
			'<a href="#" class="choose-product">'+
				'<div class="searched-product-container">' +
					'<div class="product-image">'+
						'<img src="'+imgService.thumbnailPath(product, 'xs')+'"/>'+
					'</div>'+
					'<div class="product-name">'+
						'<span class="p-name-ko">'+product.p_name_ko +'</span>'+
						'<span class="p-name-en">'+product.p_name_en +'</span>'+
					'</div>' +
				'</div>'+
			'</a>';
		
		li.innerHTML = str;
		li.querySelector('li a').addEventListener('click', (e) => chooseProduct(e, product));
		return li;
	}
	
	function chooseProduct(e, product) {
		e.preventDefault();
		
		publisher.forEach(x => x.choose(product));
	}  
	
	return {
		container: container,
		publish: publish,
		init: init,
		
	};
})();

export {searchBox};