/**
 * 이미지 슬라이더 모듈 사용 가이드 입니다.

	1. html에 모듈 스크립트 추가 해주기
	img-slider를 추가해줄 .JSP 파일에서 script를 모듈로 추가 해줍니다.
	type 부분의 text/javascript를 module로 바꾸어 줍니다.
	import, export 문법을 사용하기 위해서는 script의 type이 module이어야 합니다.
	
	ex) 
		<script type="module" src="{모듈을 import해줄 js파일}"></script>
		
	2. 임포트 하기
	js파일의 상단에서 img-slider 모듈을 불러옵니다.
	이클립스에서 자동완성할 떄 확장자가 자동완성이 되지 않습니다. 반드시 .js를 추가해주세요.
	
	ex)
		import {img-slider} from '../common/img-slider.js'
	
	3. 이미지 슬라이더 추가
	이미지 슬라이더를 추가할 html 태그가 필요합니다.
	예시에서는 jsp파일에 <div class="img-container"></div>를 원하는 위치에 생성해 두었습니다.
	
	ex)
		// 이미지 슬라이더를 넣어줄 태그 선택
		var imgContainer = document.querySelector('.img-container')
		// 이미지 슬라이더 객체 생성
		var slider = imgSlider(); 
		// 선택한 태그에 이미지 슬라이더 삽입
		imgContainer.append(slider.container);
		// 이미지 슬라이더에 이미지 추가
		slider.addList(이미지 소스를 담은 배열)
		
		
	*********
	imgSlider 객체의 public field 및 method 목록
	- container: 생성한 imgSlider의 html입니다.
	- void add(String imgSrc): 슬라이더에 이미지태그를 추가 합니다.
								img태그의 src를 문자열의 형태를 매개변수로 전달해줍니다. 
	- void addList(String[] imgSrcList): 슬라이더에 이미지태그를 여러장 추가합니다.
										img 태그의 src를 문자열의 형태로 배열에 담아 매개변수로 전달해줍니다.
	- void remove(int idx): 슬라이더의 이미지태그를 삭제합니다.
							삭제할 이미지의 인덱스를 매개변수로 전달해줍니다.
							인덱스는 0부터 시작합니다.
	- void slideImg(??? v) : ***필요한 경우 이벤트에 걸어서 사용하세요***
								슬라이더를 움직입니다.
			매개변수 목록 
			- 'prev' : 이전 이미지로 슬라이드 합니다.
			- 'next' : 다음 이미지로 슬라이드 합니다.
			- 숫자 : 해당 idx로 이동합니다.
	*********
 */

