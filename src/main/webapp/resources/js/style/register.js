import {imgSlider} from '../common/img-slider.js';
var tempInput, previewList, slider;
var dataTransfer = new DataTransfer();
var form = document.querySelector('form');

(function() {
	tempInput = $('#tempImage')[0];
	previewList = $('.preview-list');
	
	//div 입력창 만드는 함수
//	$('.editable').each(function(_, textDiv){
//		if ($(textDiv).prop('tagName') == 'div') return;
//		
//		var html = $('textarea[name="style_content"]');
//		var text = $('textarea[name="style_text_content"]');
//		$(textDiv).on('input', function({target, data}) {
//			console.log(data);
//			if (data == '#') alert('#을 누르셨습니다.');
//			$(html).val(target.innerHTML);
//			$(text).val(target.innerText);
//		});
//	    this.contentEditable = true;
//	});
	
	var imgContainer = document.querySelector('.img-container');
	var slider = imgSlider(imgContainer);
	
	// 이미지 첨부 이벤트
	$(tempInput).on('change', function({target}) {
		var files = target.files;
		
		Array.from(files)
		.forEach(file => {
			var li = $('<li></li>');
			var removeBtn = $('<button></button>');
			var img = $('<img/>');
			
			//첨부 이미지 미리보기 추가
			var src = URL.createObjectURL(file);
			img[0].src = URL.createObjectURL(file);
			$(li).append(img)
				 .append(removeBtn);
			slider.add(src);
			$(previewList).append(li);
			
			//파일 추가
			dataTransfer.items.add(file);
		});
	});

	//미리보기 지우기 버튼 이벤트
	$(previewList).on('click', 'li button', (e) => {
		e.preventDefault();
		var idx = $(e.target).closest('li').index();
		
		// 이미지 미리보기 삭제
		$(previewList).each((_, target) => {
			$(target).find('li').eq(idx).remove();
		});
		 
		// 파일 비워주기
		var newFiles = new DataTransfer();
		Array.from(dataTransfer.files)
		.filter((_, i) => i !== idx)
		.forEach(file => newFiles.items.add(file));
		dataTransfer = newFiles;
	});
	
	$('button[type="submit"]').on('click', (e) => {
		e.preventDefault();
		var form = $('form');
		
		uploadImageAjax(dataTransfer.files)
		.done(result => {
			var str = '';
			Array.from(result)
			.forEach((image, i) => {
				str += '<input type="hidden" name="style_image['+i+'].fileName" value="'+image.fileName+'">';
				str += '<input type="hidden" name="style_image['+i+'].uuid" value="'+image.uuid+'">';
				str += '<input type="hidden" name="style_image['+i+'].uploadPath" value="'+image.uploadPath+'">';
			});
				
			form.append(str);
			form.submit();
		});
	});
	
	//upload image ajax
	function uploadImageAjax(files) {
		var formData = new FormData();
		Array.from(files)
		.forEach((file) => {
			formData.append("uploadFile", file);			
		});
		
		return $.ajax({
					url: '/uploadStyleImage',
					processData: false,
					contentType: false,
					data: formData,
					type: 'post',
					dataType: 'json',
				});
	}
})();

 