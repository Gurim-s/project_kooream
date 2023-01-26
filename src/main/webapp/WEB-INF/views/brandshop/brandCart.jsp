<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>장바구니</h1>
	
	<hr/>
		   <div class="middle_content">
         <div class="middle_content_inner">
               <div>
                        <div class ="brand">
						</div>
               </div>
         </div>
      </div>
				<div>

				</div>
	
	
<script type="text/javascript">

	$(function() {		// 상품이미지 보여주기
 		$.ajax({
 			url:'/brandCart/brandCartList',
 			type: 'get',
 			dataType:"json",
 			contentType:"application/json",
 		})
 		.done(function(json) {
			var str='<ul id="container">';
			console.log(json);
			for(var i=0; i<json.length; i++) {
				str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'"><li class="product_list">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
						// brandshop(컨트롤러) 에서 /get을 탐  
				
				
				// 이미지 하나만 보여주기 
				
				
				if(json[i].attachList.length > 0) {
					var uploadPath = json[i].attachList[0].uploadPath;
					var uuid = json[i].attachList[0].uuid;
					var fileName = json[i].attachList[0].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
					str += '<div><img src="/brandfile/display?fileName='+ fileCallPath + '" /></div>';
				}

				str += '<div style="font-weight: bold; font-size: 18px; ">'+json[i].p_name_en+'</div>';
				str += '<div style="color: gray;">'+json[i].p_name_ko+'</div>';
				str += '<div style="font-weight: bold; font-size: 18px;">'+json[i].p_release_price+'원</div>';
				str += '<div style="font-weight: bold; font-size: 18px;">'+json[i].b_name+'</div>';
				str += '<br/>'
				
				
				str += '</li></a>';
			}
			
			str += '</ul>';
			$('.brand').append(str);
		});	
 	});

</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>