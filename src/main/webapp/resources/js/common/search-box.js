/**
 * 
 */
import {productSearchService} from '../service/product-search-service.js';

const searchBox = () => (function() {
	const container = document.createElement('div');
	const searchInput = document.createElement('input');
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
			amount: 10,
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
		const str = '<a href="#" class="choose-product">'+product.p_name_ko+'</a>';
		
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