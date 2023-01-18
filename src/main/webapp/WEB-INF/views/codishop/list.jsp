<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <link rel="stylesheet" href="/resources/css/codi/codi.css" /> -->
<jsp:include page="../include/header.jsp"/>

<body class="cordishop">
	
	<div class="codi_box">

		<div class="social_title">
			<h1>Codi Shop</h1>
		</div>
		<br/>
		<div class="container social">
			<div class="keyword_brand">
				<a href="#" class="brand_keyword">#Nike</a>
				<a href="#" class="brand_keyword">#adidas</a>
				<a href="#" class="brand_keyword">#new balance</a>
				<a href="#" class="brand_keyword">#nerdy</a>
				<a href="#" class="brand_keyword">#THE NORTH FACE</a>
				<a href="#" class="brand_keyword">#KOOREAM STANDARD</a>
			</div>
		</div>
		<div class="codi_search">
			<div class="search_btn">
				<input type="text" class="form-control"	placeholder="검색어 입력" name="searchText" maxlength="100">
				<a  href="#" class="btn_search">검색</a>
			</div>
		</div>
		<div class="codi_insert">
			<div class="insert_btn">
				<a  href="/codishop/register" class="btn_search">코디 등록</a>
			</div>
			<hr/>
		</div>
		
		<div id="codi-list" class="clearfix">
			<div class="list-column" id="first">
			</div>
			<div class="list-column" id="second">
			</div>
			<div class="list-column" id="third">
			</div>
			<div class="list-column" id="force">
			</div>
		</div>
		<div class="More_btn">
			<a  href="#" class="btn_More">더보기(MORE)</a>
		</div>
		
	</div>
</body>

<script type="text/javascript">

var pageNum, amount;
var column = $('.list-column');

$(function() {
	pageNum = 1;
	amount = 20;
	getList(pageNum, amount);
});


function getList(pageNum, amount) {
	$.ajax({
		url: "list",
		data: JSON.stringify({
			pageNum: pageNum,
			amount: amount,
		}),
		type: 'post',
		dataType:"json",
		contentType:"application/json",
	})	// $.ajax.... end 
	.done(function(json) {
		console.log(JSON.stringify(json));
		$.each(json, function(idx, codi) {
			 
			// 1개의 코디 중 제일 큰 곳
			var card_box = $('<a href="/codishop/get?codi_no='+ codi.codi_no + '"><div></div></a>');		//card_box div 태그 생성
			$(card_box).attr('class', 'codi_card');  // card_box class 넣어주기
			
			var img_box = $('<div></div>');		//img_box div 태그 생성
			$(img_box).attr('class', 'codi_img_box');	// img_box class 넣어주기
			
			var text_box = $('<div></div>');		//text_box div 태그 생성
			$(text_box).attr('class', 'codi_text');	// text_box 클래스 생성
			
			var img_tag = $('<img></img>');	// img_tag div 태그 생성 
			$(img_tag).attr('class', 'codi_img');
			console.log(codi);
			var fileCallPath = encodeURIComponent(codi.attachList[0].uploadPath + "/"
					+ codi.attachList[0].uuid + "_"
					+ codi.attachList[0].fileName);
			$(img_tag).attr('src', '/codidisplay?fileName='+fileCallPath);
			
			var text_Line1 = $('<div></div>');
			$(text_Line1).append('<h3>' + codi.codi_title + '</h3>');
			var text_Line2 = $('<div></div>');
			$(text_Line2).append(' Model: ' + codi.codimodel_name+' ');
			$(text_Line2).append(' Body: ' + codi.codi_cm);
			$(text_Line2).append('/ ' +codi.codi_kg);
			var text_Line3 = $('<div></div>');
			$(text_Line3).text(new Intl.DateTimeFormat('kr').format(new Date(codi.codi_date)));
			
			
			$(img_box).append(img_tag);	 // 이미지 박스에 이미지 태그 넣어주기 
			$(card_box).append(img_box);	// 카드 박스에 이미지 박스 넣어주기 
			
			$(card_box).append(text_box);	// 카드 박스에 택스트 박스 넣어주기 
			$(text_box).append(text_Line1);	  
			$(text_box).append(text_Line2);	 
			$(text_box).append(text_Line3);	 
			
			$(column[idx % 4]).append(card_box);	// 생성한 div를 column에 추가 -> 이 작업을 해야 view에 나옴
			
		}); // function(idx, codi) ... end
	});	// .done ... end
}	// function getList ... .end



</script>
<style type="text/css">
	.codi_box{
		width: 1200px;
	
	}
	.social_title{
		text-align: center;
	}
	.keyword_brand{
		text-align: center;
	}
	.brand_keyword{
		display: inline-block;
	    padding: 8px 10px;
	    border: 1px solid #ebebeb;
	    border-radius: 12px;
	    font-size: 15px;
	}
	.search_btn{
		text-align: right;
	}
	.insert_btn{
		text-align: right;
	}
	.More_btn{
		text-align: center;
	}
	
	.btn_search{
		display: inline-block;
	    padding: 1em 2em;
	    border-radius: 0;
	  	color: #b2876f;
	    margin-top:2rem;
	    font-weight: bold;
	    font-size: 0.678rem;
	    letter-spacing: 2px;
	    text-transform: uppercase;
	    text-decoration: none;
		  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
		  background-position: 1% 50%;
		  background-size: 400% 300%;
		  border: 1px solid #b2876f;
		  @include transition;
	  
		  &:hover{
		    color: white;
		      color: #fff;
      	background-position: 99% 50%;
  		}
		
	}
	 .btn_More{
	 	display: inline-block;
	    padding: 1em 2em;
	    border-radius: 0;
	  	color: #b2876f;
	    margin-top:2rem;
	    font-weight: bold;
	    font-size: 0.678rem;
	    letter-spacing: 2px;
	    text-transform: uppercase;
	    text-decoration: none;
		  background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
		  background-position: 1% 50%;
		  background-size: 400% 300%;
		  border: 1px solid #b2876f;
		  @include transition;
	  
		  &:hover{
		    color: white;
		      color: #fff;
      	background-position: 50% 50%;
  		}
	 }
	
	
	.form-control{
		border: none;
		padding: 1em 2em;
		border: 1px solid #b2876f;
	}
	.codi-table{
		margin: auto;
		width: 80%;
	}
	.codi-table td{
		padding : 10px;
	}
	.codi-img {
		width: 275px;
		height: 350px;
	}
	#codi-list {
	width: 100%;
	margin: 10px auto;
	display: flex;
	}
	#first {
	    /* border: 1px solid red; */
	    flex:1;
	    width:22%;
	    box-sizing: border-box;
	}
	
	#second{
	    /* border: 1px solid green; */
	    flex:1;
	    margin-left: 1%;
	    width:22%;
	    box-sizing: border-box;
	}
	
	#third{
	    /* border: 1px solid blue; */
	    flex:1;
	    margin-left: 1%;
	    width:22%;
	    box-sizing: border-box;
	}
	
	#force{
	    /* border: 1px solid blue; */
	    flex:1;
		margin-left: 1%;
	    width:22%;
	    box-sizing: border-box;
	}
	.list-column{
		padding-top: 5px;
	}
	.codi_img{
		width: 275px;
		height: 350px;
	}
	.codi_img_box{
		width: 275px;
		height: 350px;
	}
</style>

</html>
<jsp:include page="../include/footer.jsp"/>