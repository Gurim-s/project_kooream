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
				<div id="tag_List">
								
				</div>
			</div>
		</div>
		<div class="codi_search">
			<div class="search_btn">
				<select name="searchType" id="searchType">
					<option value="codi_title">제목</option>
					<option value="codi_content">내용</option>
					<option value="titcont">제목+내용</option>
					<option value="codimodel_name">모델명</option>
				</select>
				<input type="text" id="searchName"  name="searchName" placeholder="검색어 입력">
				<button id="searchBtn" class="btn_search search-btn">검색</button>
			</div>
		</div>
		<br/>
		
		
		<div class="codi_insert">
			<div class="insert_btn">
				<a href="/codishop/register" class="btn_search">코디 등록</a>
			</div>
			<br/>
			<hr/>
			<br/>
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
			<a href="#" id="load" class="btn_More">더보기(MORE)</a>
		</div>
		
	</div>
</body>

<script type="module" src="/resources/js/codi/list.js"></script>
<style type="text/css">
	

	.tag_a{
		color: blue;
		font-weight: bolder;
	}
	
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