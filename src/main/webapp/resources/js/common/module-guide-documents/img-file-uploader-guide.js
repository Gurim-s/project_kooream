/**
 *  이미지 파일 업로더 사용 가이드입니다.
	
1. html에 모듈 스크립트를 주가 해줍니다.
img-file-uploader를 추가해줄 .JSP 파일에서 script를 모듈로 추가 해줍니다.
type 부분의 text/javascript를 module로 바꾸어 줍니다.
import, export 문법을 사용하기 위해서는 script의 type이 module이어야 합니다.

ex) 
	<script type="module" src="{모듈을 import해줄 js파일}"></script>

2. 임포트 하기
js파일의 상단에서 img-file-uploader모듈을 불러옵니다.
이클립스에서 자동완성할 떄 확장자가 자동완성이 되지 않습니다. 반드시 .js를 추가해주세요.

ex)
	import {imgFileUploder} from '../common/img-file-uploader.js'
	

3. 이미지 파일 업로더 추가
이미지 파일 업로더를 추가할 html 태그가 필요합니다.
예시에서는 jsp파일에 <div class="uploader-container"></div>를 원하는 위치에 생성해 두었습니다.

ex)
	const uploader = imgFileUploader;		// imgFileUploader 객체를 불러옵니다.
	uploader.setURL('/uploadStyleImage');	// upload 컨트롤러의 url을 세팅합니다.
	uploader.setSaveName('attachList');		// 컨트롤러로 보내줄 vo의 첨부파일 필드 이름을 입력해줍니다.
	document.querySelector('.uploader-container').append(uploader.container);
											//imgFileUploader를 jsp 혹은 html에 추가합니다.
	
4. 파일 전송 이벤트 작성
	form안에서 submit 이벤트에서 객체의 메소드 uploadImageAjax를 호출하면 파일을 전송하고
	db에 저장할 파일 경로를 input[type="hidden"]의 형태로 리턴받습니다.
	리턴받은 input을 form에 추가 해주고 form.submit()을 수행해 줍니다.
	***async 및 await 문법이 eclipse에서 인식하지 못해 문법오류라고 뜰 수 있습니다.

ex)
	**** jQuery ********
	$('a#submit').on('click', async (e) => {
		e.preventDefault();
		var form = $(e.target).closest('form');
		
		var result = await imgFileUploader.uploadImageAjax();
		var div = $('<div></div>');
		$(div).append = result;
		
		form.append(div);
		form.submit();
	});
	
	
	**** javascript **** 
	document.querySelector('a#submit')
	.addEventListener('click', async (e) => {
		e.preventDefault();
		var form = e.target.closest('form');
		
		// 이미지 파일 비동기 업로드하고, 업로드 정보를 받아온다.
		var result = await imgFileUploader.uploadImageAjax();
		var div = document.createElement('div');
		div.innerHTML = result;
		
		form.append(div);
		form.submit();
	});
	
	
*********
imgFileUploader 객체의 public field 및 method 목록
- container: imgFileUploader의 html입니다.
- String uploadImageAjax(): 파일을 세팅한 url로 업로드하고,
							결과를 input[type="hidden"] 형태의 문자열로 반환합니다. 
- int countFiles(): 업로더에 추가된 파일의 개수를 반환합니다.
- void setURL(String url): 업로더의 url필드에 값을 입력합니다.
							파일을 업로드할 controller의 url값을 넣어주세요.
- void option({...}) : 파일 업로더의 옵션을 지정합니다.
					추후 업데이트 하겠습니다.
*********
 */