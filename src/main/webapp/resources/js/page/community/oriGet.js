/**
 * 
 */
import {imgSlider} from '../../component/img-slider.js';
import {imgService} from '../../service/image-service.js';

var orino = $('#title').data('orino');

$.ajax({
	type : 'get',
	url : '/community/getImages/' +orino ,
	success: function(result) {
		console.log(result);
		//이미지 슬라이더 모듈 가져오기
		var imgContainer = $('.img-container'); // 1. 이미지 슬라이더를 넣을 공간 선택
		var slider = imgSlider();				// 2. 모듈(함수) 불러오기 ** 슬라이더 생성
		imgContainer.append(slider.container);	// 3. 생성한 슬라이더를 1번에서 선택한 공간에 넣어주기

		var imgSrcList = [];
		for(var i=0; i<result.length; i++) {
			imgSrcList.push(imgService.originPath(result[i]));
		}
		slider.addList(imgSrcList);
		console.log(imgSrcList);
	},
 	error: function(xhr, status, er) {
    	error(er);
	}
});