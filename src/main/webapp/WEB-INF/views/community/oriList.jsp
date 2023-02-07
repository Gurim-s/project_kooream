<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menu_list{
		float: left;
		height: 100%;
		width: 130px;
	}
	#main{
		margin-left: 130px;
	}
	.btn{
		float: right;
	}
	table{
		padding-left: 0px;
		width: 1000px;
	}
	#head{
		font-size: 25px;
	}
	button{
		border: none;
		background-color: #fff;	
		float: right;
	}
	#bp{
		height: 25px;
	}
	#full{
		width: 100%;
		height: 200px;
	}
	#thumbnail{
		float: left;
		width: 200px;
	}
	#sub{
		float: left;
		width: 60%;
	}
	#oriNickname{
		float: left;
		width: 150px;
		text-align: center;
	}
	#oriContent{
		font-size: 12px;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
	}
	#oriTitle{
		text-decoration: underline;
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span id="head">정품판별</span>
		
		<sec:authorize access="isAuthenticated()">
		<button>글쓰기</button>
		</sec:authorize>
	</div>
	<br/>
	<div id="main">
	<hr/>
	<br/>
	<div>
		<!-- <select name = "brandname">
			<option value="노스페이스">노스페이스</option>
			<option value="나이키">나이키</option>
			<option value="슈프림">슈프림</option>
			<option value="컨버스">컨버스</option>
		</select> -->
	</div>
	<div>
		<br/>
		<form action="/community/oriRegister" id="form">
 		<div>
 			<c:forEach var="vo" items="${list }">
				<div id="full">
					<div id="thumbnail">
						<c:if test="${vo.attachList.size() ne 0 }">
							<c:url var="imgSrc" value="/displayImage">
								<c:param name="fileName" value="${vo.attachList.get(0).uploadPath }/${vo.attachList.get(0).uuid }_${vo.attachList.get(0).fileName }"></c:param>
							</c:url>
							<img alt="제품 이미지" src="${imgSrc }" width="150px;" height="150px;">
						</c:if>
					</div>
					<div id="sub">
						<div id="barandName"><small>${vo.brandname }</small></div>
						<div id="oriTitle"><a class="get" href="${vo.orino }"><strong>${vo.orititle }</strong></a></div>
						<br/>
						<div id="oriContent"><a class="get" href="${vo.orino }">${vo.oricon }</a></div>
					</div>
					<div>
						<div id="oriNickname">${vo.oriname }</div>
					</div>
				</div>
			</c:forEach>
 		</div>
		</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		var form = $("#form");
		
		//게시글 작성 버튼 ---------------------------------------------
		$("button").click(function() {
			// 버튼 누르면 글쓰기로 이동
			form.attr("action", "/community/oriRegister");
			form.submit();
		})		
		
		
		//게시글 상세 보기 ---------------------------------------------
		$(".get").click(function(e) { //<a> 태그 클릭 시 페이지 이동이 되지 않게 막아둠
			e.preventDefault();
			form.attr("action", "/community/oriGet");
			
			form.append('<input type="hidden" name="orino" value="'+$(this).attr("href")+'">');
			form.submit();
			
			
		})
		
		
		// 게시글 무한 스크롤 -------------------------------------------
		var isEnd = false;
		
		$(function(){
	        $(window).scroll(function(){
	            var $window = $(this);
	            var scrollTop = $window.scrollTop();
	            var windowHeight = $window.height();
	            var documentHeight = $(document).height();
	            
	            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	            
	            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
	            if( scrollTop + windowHeight + 50 > documentHeight ){
	            	//alert("무한 스크롤");
	                fetchList();
	            }
	        })
	        fetchList();
	    })
		
	    var fetchList = function(){
	        if(isEnd == true){
	            return;
	        }
	        
	        // 방명록 리스트를 가져올 때 시작 번호
	        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
	        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
	        var startNo = $("#full").last().data("no") || 0;
	        $.ajax({
	            url:"/community/oriList?orino=" + startNo ,
	            type: "GET",
	            dataType: "json",
	            success: function(result){
	                // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
	                // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
	                let length = result.data.length;
	                if( length < 5 ){
	                    isEnd = true;
	                }
	                $.each(result.data, function(index, vo){
	                    renderList(false, vo);
	                })
	            }
	        });
	    }
	    
		var renderList = function(mode, vo){
	        // 리스트 html을 정의
	        var str = '';
	        
	        str += '<c:forEach var="'+ vo +'" items="' + ${list } + '">'
			str += '<div id="full" data-no="'+ ${vo.orino } +'">'
			str += '<div id="thumbnail">'
			str += '<c:if test="' + ${vo.attachList.size() ne 0 } + '">'
			str += '<c:url var="imgSrc" value="/displayImage">'
			str += '<c:param name="fileName" value="' + ${vo.attachList.get(0).uploadPath } + '/' + ${vo.attachList.get(0).uuid }+ '_' + ${vo.attachList.get(0).fileName } + '"></c:param>'
			str += '</c:url>'
			str += '<img alt="제품 이미지" src="' + ${imgSrc } + '" width="150px;" height="150px;">'
			str += '</c:if>'
			str += '</div>'
			str += '<div id="sub">'
			str += '<div id="barandName"><small>' + ${vo.brandname } + '</small></div>'
			str += '<div id="oriTitle"><a class="get" href="' + ${vo.orino } + '"><strong>' + ${vo.orititle } + '</strong></a></div>'
			str += '<br/>'
			str += '<div id="oriContent"><a class="get" href="' + ${vo.orino } + '">' + ${vo.oricon } + '</a></div>'
			str += '</div>'
			str += '<div>'
			str += '<div id="oriNickname">' + ${vo.oriname } + '</div>'
			str += '</div>'
			str += '</div>'
			str += '</c:forEach>'
	        	
	        	
	        	
	        	
	        
	        if( mode ){
	            $("#full").prepend(html);
	        }
	        else{
	            $("#full").append(html);
	        }
	    };
		
		
		
		
		
	})
	
</script>
</html>
<jsp:include page="../include/footer.jsp"/>