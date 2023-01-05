<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <link rel="stylesheet" href="/resources/css/codi/codi.css" /> -->
<jsp:include page="../include/header.jsp"/>
<style>
	.codi_box{
		width: 1200px;
	
	}
	.social_title{
		text-align: center;
	}
	.keyword_bind{
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

</style>
<body class="cordishop">
	
	<div class="codi_box">

		<div class="social_title">
			<h1>Codi Shop</h1>
		</div>
		<br/>
		<div class="container social">
			<div class="keyword_bind">
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
		</div>
		<div class="main-codi">
			<table class="codi-table">
				<colgroup>
					<col width="20%"/>
					<col width="20%"/>
					<col width="20%"/>
					<col width="20%"/>
				</colgroup>
				<tbody>
				<c:set var="i" value="0" />
				<c:set var="j" value="4" />
					<c:forEach  var="vo" items="${list }" varStatus="status">
					<c:if test="${i%j == 0 }">
					</tr><tr>
					</c:if>
						<td>					
							<img class="codi-img" src="<c:url value='/resources/img/codi_test.png'/>" alt="codi-img"><br>
							<span style="font-weight: bold; font-size: large;"><c:out value="${vo.codi_title }"/></span><br>
							<span style="color: gray; font-size: small;"> 모델 : <c:out value="${vo.codimodel_name }"/></span><br>
							<span><c:out value="${vo.codi_cm }"/> | <c:out value="${vo.codi_kg }"/></span><br>
							<span> <fmt:formatDate pattern="yyyy-MM-dd" value="${vo.codi_date }"/></span>
						</td>
				 	<c:if test="${i%j == j-1 }">
					<tr>
					</c:if>
	    			<c:set var="i" value="${i+1 }" />
					</c:forEach>
							
				</tbody>
			</table>
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
})


function getList(pageNum, amount) {
	$.ajax({
		url: "list/hot",
		data: JSON.stringify({
			pageNum: pageNum,
			amount: amount,
		}),
		type: 'post',
		dataType:"json",
		contentType:"application/json",
	})
	.done(function(json) {
		$.each(json, function(idx, style) {
			$(column[idx % 4]).append(JSON.stringify(style));
		});
	});	
}


var rno =""; 
$(function(){
	
	// 화면 이동 스크립트 ----------------------------------------Start
	var operForm = $("#operForm");
	$("#boardModBtn").click(function() {
		operForm.append('<input type="hidden" name="bno" value="'+${vo.bno }+'">');
		operForm.submit();	
	});

	$("#listMoveBtn").click(function() {
		operForm.attr("action","/board/list");
		operForm.submit();
	});
	// 화면 이동 스크립트 ----------------------------------------End
	
	var bnoValue = '${vo.bno}';
	var replyUL = $(".chat");
 	
	
	// 첨부 파일 스크립트 ----------------------------------------start
		$.ajax({
		url:'/board/list',
		type:'get',
		data : {bno:bnoValue},
		contentType:'application/json; charset=utf-8',
		success : function(arr) {
			console.log(arr);
			 
			var str = '';
	            
            for(var i=0; i<arr.length; i++){
               var obj = arr[i];
               
               var fileCallPath = encodeURIComponent(obj.uploadPath + "/"
            		   									+ obj.uuid + "_" 
            		   									+ obj.fileName);
               
               str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-filename="'+obj.fileName+'">';
               str += '<a href="/download?fileName='+fileCallPath+'">';
               str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
               str += '</a>'
               // str += '<span data-file="'+fileCallPath+'"> X </span>';
               str += '</li>';
            }
	            
	           $(".uploadResult ul").html(str);
			
		}
	});
</script>


</html>
<jsp:include page="../include/footer.jsp"/>