/**
 * 
 */
import {imgSlider} from '../common/img-slider.js';
import {searchBox} from '../common/search-box.js';
import {modal} from '../common/modal.js';

const productTagSelector = () => (function() {
	const container = document.createElement('div');
	let slider = imgSlider();
	const openSearchBtn = document.createElement('a');
	
	init();
	function init() {
		container.append(slider.container);
		slider.setOption({
			ratio: 1,
			ratioFix: true,
			tagEditMode: true,
		});
		container.append(openSearchBtn);
		openSearchBtn.href = '#';
		openSearchBtn.innerText = '상품검색';
		
		setEvent();
		setDefaultCss();
	}
	
	function setEvent() {
		openSearchBtn.addEventListener('click', openSearchModal);
	}
	
	function setDefaultCss() {
		
	}
	
	function openSearchModal(e) {
		e.preventDefault();
		const m = modal();
		const box = searchBox();
		box.init();
		box.publish({choose: chooseProduct});
		box.publish({choose: m.close});
		
		m.open({title: '상품검색'});
		m.append(box.container);
	}
	
	function chooseProduct(product) {
		slider.addProductTag(product);
	}
	
	return {
		container: container,
		slider: slider,
	};
})();

export {productTagSelector};