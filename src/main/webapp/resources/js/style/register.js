var tempInput, previewList, slider;
var dataTransfer = new DataTransfer();
var form = $('form')[0];

$(function() {
	tempInput = $('#tempImage')[0];
	previewList = $('.preview-list');
	slider = $('.preview-slider');
	var slideIndex = 0;
	
	//div 입력창 만드는 함수
	$('.editable').each(function(_, textDiv){
		if ($(textDiv).prop('tagName') == 'div') return;
		var textarea = $('textarea');
		$(textDiv).on('input', function({target}) {
			$(textarea).val(target.innerHTML);
		});
	    this.contentEditable = true;
	});
	
	// 슬라이드 넘기기 이벤트
	$('.preview-image-slider').on('click', 'button', (e) => {
		e.preventDefault();
		var left = slider.css('left');
		var x = parseInt(left.substr(0, left.length - 2));
		var width = 550;
		var end = -1 * (dataTransfer.items.length - 1) * width;
		var sign;
		
		if ($(e.target).attr('class') == 'prev-img') {
			if (x == 0) return;
			slideIndex--;
			sign = 1;
		}
		if ($(e.target).attr('class') == 'next-img') {
			if (x == end) return;
			slideIndex++;	
			sign = -1;
		}
		
		x += sign*width;
		slider.css('left', x+'px');
	});
	
	// 이미지 첨부 이벤트
	$(tempInput).on('change', function({target}) {
		var files = target.files;
		
		Array.from(files)
			.forEach(file => {
				var li = $('<li></li>');
				var removeBtn = $('<button></button>');
				var img = $('<img/>');
				
				//첨부 이미지 미리보기 추가
				img[0].src = URL.createObjectURL(file);
				$(li).append(img)
					 .append(removeBtn);
				$(previewList).prepend(li);
				
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
		
		uploadImageAjax(dataTransfer.files).done(result => {
			var str = ''
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
});

 