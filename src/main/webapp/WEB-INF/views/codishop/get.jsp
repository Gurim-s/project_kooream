<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<style type="text/css">
	.wrapper{
		width: 800px;
	
	}
	
	.social_title{
		text-align: center;
	}
	.keyword_brand{
	}
	.brand_keyword{
		display: inline-block;
	    padding: 8px 10px;
	    border: 1px solid #ebebeb;
	    border-radius: 12px;
	    font-size: 15px;
	}
	.codi_img{
	 	margin : auto;
		width: 600px;
		height: 800px;
	}

	
	/* div{
		border: 1px solid black;
	} */
	
	
	.title>span {
		font-weight: bold;
		font-size: 30px;
	}
	.content>span{
		font-size : 20px;
	}
	.codi_img{
		text-align: center;
	}
	
	.codi_sample>span{
		font-weight: bold;
		font-size: 20px;
	
	}
	.date>span{
		font-size: 10px;
	}
	.codi_model>span{
		font-weight: bold;
		font-size: 20px;
	}
	
	
	/* 버튼 이미지  */
	.comment-inner-text {
    width: 100%;
    height: 100px;
    border: 0;
    background: #fff;
    padding: 0;
    -webkit-border-radius: 0;
    -webkit-appearance: none;
    vertical-align: top;
	}
	textarea {
	    writing-mode: horizontal-tb !important;
	    font-style: ;
	    font-variant-ligatures: ;
	    font-variant-caps: ;
	    font-variant-numeric: ;
	    font-variant-east-asian: ;
	    font-weight: ;
	    font-stretch: ;
	    font-size: ;
	    font-family: monospace;
	    text-rendering: auto;
	    color: fieldtext;
	    letter-spacing: normal;
	    word-spacing: normal;
	    line-height: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    appearance: auto;
	    -webkit-rtl-ordering: logical;
	    resize: auto;
	    cursor: text;
	    white-space: pre-wrap;
	    overflow-wrap: break-word;
	    background-color: field;
	    column-count: initial !important;
	    margin: 0em;
	    border-width: 1px;
	    border-style: solid;
	    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
	    border-image: initial;
	    padding: 2px;
	}
	input{
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
		
</style>
<body class="cordi_get">
	<div class="codi_box">

		<div class="social_title">
			<h1>Codi Shop</h1>
		</div>
		<br/>
		
		<br/><hr/><br/>
		
		<div class="codi_info">
			<div class="title">
				<span class="codi_title">${board.codi_title }</span>
			</div>
			
			<div class="date">
				<span>${board.codi_date } </span>
			</div>
			
			<div class="codi_img">
				<img style="width: 100%; height: 100%;" alt="test-img" src="/resources/img/codi_test.png">
			</div>
			
			<div class="model_info">
			<div class="codi_model"><span>모델 정보</span></div>
			<span>${board.codimodel_name }</span>
			<span>${board.codi_cm } </span>
			<span>${board.codi_kg } </span>
			</div>
			
			<div class="content">
				<span>${board.codi_content } </span>
			</div>
			
			<div class="product">
				<div class="codi_sample"><span>모델 착용 상품</span></div>
				<span>${board.m_no } </span>
			</div>
		
			<div class="container social">
				<div class="keyword_brand">
					<a href="#" class="brand_keyword">#겨울</a>
					<a href="#" class="brand_keyword">#adidas</a>
					<a href="#" class="brand_keyword">#new balance</a>
					<a href="#" class="brand_keyword">#nerdy</a>
					<a href="#" class="brand_keyword">#THE NORTH FACE</a>
					<a href="#" class="brand_keyword">#KOOREAM STANDARD</a>
				</div>
			</div>
		</div>			
		<br/>
		<hr/>
		<br/>
		<div class="comment">
			<div class="comment_textarea">
				<textarea class="comment-inner-text" name="content" tabindex="1" placeholder="댓글 입력해 주세요."></textarea>			
			</div>
			<div class="comment_btn">
			<input type="button" class="submit-content" value="등록" tabindex="2" style="float: right;">
			<span class="btn_hide" style="display:none"></span>
			<input type="button" class="submit_hide" value="취소" style="float: right;">
			</div>
		</div>
		
	</div> <!-- codi_box .....end -->
<br/><br/><br/><br/><br/><br/>



</body>
<script type="text/javascript">





</script>
<jsp:include page="../include/footer.jsp"/>