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
			<table>
				<c:forEach  var="vo" items="${list }">
					<tr>
						<td><c:out value="${vo.codi_no }"/></td>
						<td><c:out value="${vo.m_no }"/></td>
						<td><c:out value="${vo.codimodel_name }"/></td>
						<td><c:out value="${vo.codi_title }"/></td>
						<td><c:out value="${vo.codi_content }"/></td>
						<td><c:out value="${vo.codi_cm }"/></td>
						<td><c:out value="${vo.codi_Kg }"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.codi_date }"/></td>
					</tr>
				</c:forEach>		
			</table>
		</div>
			
	</div>
</body>

<script type="text/javascript">

</script>


</html>
<jsp:include page="../include/footer.jsp"/>