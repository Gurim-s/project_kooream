<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.register{
		float: right;
	
	}
	#container{
		display :inline-flex;
		/* flex-direction: row; */
		/* justify-content:space-between; */
/* flex-wrap:wrap; */
		width: 1000px;
		gap : 8px;
		

	}
	/*  style="display: inline-flex;  */
	.prduct_list{
		width : 50px;
	}





</style>
</head>
<body>
	<div>
	<br/><a class="register" href="/brandshop/register">등록</a></div><br/><br/>
	

	   <div class="middle_content">
         <div class="middle_content_inner">
               <div>
                        <div class ="brand">
						</div>
               </div>
         </div>
      </div>


	<script type="text/javascript">
	var test = '${list}';
	console.log(test);
	
	//상품 클릭 이벤트----------------------------------------------------------------------------------
/*     //var p_no;
    $("ul").on("click", "li", function(e) {
    	e.preventDefault();
    	actionForm.attr("")
       
       cno = $(this).data("p_no"); 
       alert(p_no);
       location.href="/branshop/get?p_no=" + p_no;            
       
       
       
       }); */
    
 //상품 클릭 이벤트 end------------------------------------------------------------------------------   
 // 상품 이미지 리스트에 보여주기--------------------------------------------------------
/*  	$(document).ready(function () {
 		(function () {
 			var p_no = '<c:out value="${product.p_no}"/>';
			console.log(1)
			$.getJSON("/brandfile/getAttachList", {p_no : p_no}, function (arr) {
				console.log(arr);
			});
			
		})();
		
	}); */
 
 	$(function() {
 		$.ajax({
 			url:'/brandshop/getList',
 			type: 'get',
 			dataType:"json",
 			contentType:"application/json",
 		})
 		.done(function(json) {
			var str='<ul id="container">';
			console.log(json);
			for(var i=0; i<json.length; i++) {
				str += '<div class="product_list">'; 
				// 이미지 하나만 보여주기 
				
				
				if(json[i].attachList.length > 0) {
					var uploadPath = json[i].attachList[0].uploadPath;
					var uuid = json[i].attachList[0].uuid;
					var fileName = json[i].attachList[0].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
					str += '<div ><img src="/brandfile/display?fileName='+ fileCallPath + '" /></div>';
				}
				//상품 이미지 태그 추가	// 이건 이미지 여러개 보여줄때 사용
// 				for(var j=0; j<json[i].attachList.length; j++) {
// 					var uploadPath = json[i].attachList[j].uploadPath;
// 					var uuid = json[i].attachList[j].uuid;
// 					var fileName = json[i].attachList[j].fileName;
// 					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
// 					str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';
// 				}
				str += '<div style="font-weight: bold; font-size: 18px; ">'+json[i].p_name_en+'</div>';
				str += '<div style="color: gray;">'+json[i].p_name_ko+'</div>';
				str += '<div style="font-weight: bold; font-size: 18px;">'+json[i].p_release_price+'원</div>';
				str += '<br/>'
				str += '<div>'+json[i].p_brand+'</div>';
				
				str += '</div>';
			}
			str += '</ul>';
			$('.brand').append(str);
		});	
 	});
 
 
 
 
 </script>

		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>