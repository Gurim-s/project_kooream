import {imgSlider} from '../common/img-slider.js';

var slider = imgSlider();
var imgContainer = document.querySelector('#imgSlider');
var imgList = document.querySelectorAll('ul.slides>li>img');
imgContainer.append(slider.container);
slider.addImgTagList(imgList);