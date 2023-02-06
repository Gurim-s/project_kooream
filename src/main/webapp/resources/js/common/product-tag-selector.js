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
		getProductTagsInput();
	}
	
	function getProductTagsInput() {
		const list = slider.getProductTagList();
		const result = list.map((tagList, i) => Array.from(tagList).map((tag, j) => _tagsToInput(tag, i, j)))
		.flat()
		.reduce((init, str) => init + str, '');
		
		return result;
	}
	
	function _tagsToInput(tag, i, j) {
		const p_no = tag.dataset.p_no;
		const offsetX = tag.style.left;
		const offsetY = tag.style.top;
		const result = (
			'<input type="hidden" name="productTagList['+i+']['+j+'].p_no" value="'+p_no+'"/>' +
			'<input type="hidden" name="productTagList['+i+']['+j+'].offsetX" value="'+offsetX+'"/>' +
			'<input type="hidden" name="productTagList['+i+']['+j+'].offsetY" value="'+offsetY+'"/>'
		);
		return result;
	}
	
	return {
		container: container,
		slider: slider,
		getProductTagsInput: getProductTagsInput,
	};
})();

export {productTagSelector};