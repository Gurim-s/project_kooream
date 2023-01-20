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
	<div></div><a class = "cartList" href="/brandCart/brandCart">장바구니</a></div>
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

			
			
			
			
			// <a> 클릭 시 페이지 이동이 이루어지지 않게 하기 위해
 			//e.preventDefault();	// 기본 href 경로 이동 방지
		//	actionForm.attr("action", "/branshop/get");
			  /* var str=''; */ 	// up& 되지 않도록 하는 방법
			   	
		         /* str += '<input type="hidden" name="p_no" value="'+$(this).attr("href")+'">'; */
		       //  actionForm.html(str);
		          
			//actionForm.append('<input type="hidden" name="bno" value="'+$(this).attr("href")+'">'); // this 내 자신	// url에 밑에 3개 다 보이게 하기위해서는 append 사용
			//actionForm.html('<input type="hidden" name="bno" value="'+$(this).attr("href")+'">');	// html로 하면 url에서 pageNum, amount, bno를 다 날린다 
		/* 	actionForm.submit(); */
	
	
	
	
	/*    $(".brand").click(function(e) {
    	e.preventDefault();
    	actionForm.attr("action", "/brandshop/get");
       
    	var str='';
    	str += '<input type="hidden" name="p_no" value="'+$(this).attr("href")+'">';
        actionForm.html(str);         
       
        actionForm.submit();
       
       });  */
    
 //상품 클릭 이벤트 end------------------------------------------------------------------------------   
 // 상품 이미지 리스트에 보여주기--------------------------------------------------------

 
 	$(function() {		// 상품이미지 보여주기
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
				//상품 이미지 태그 추가	// 이건 이미지 여러개 보여줄때 사용
// 				for(var j=0; j<json[i].attachList.length; j++) {
// 					var uploadPath = json[i].attachList[j].uploadPath;
// 					var uuid = json[i].attachList[j].uuid;
// 					var fileName = json[i].attachList[j].fileName;
// 					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
// 					str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';
// 				}
				/* str += '<div>{vo2.b_name}</div>' */
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
   	var result = '<c:out value="${result}"/>';
	// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때(데이터 변경) 알림 메소드 실행
	if(result != ''){
		checkResult(result);
	}
	// 뒤로 가기 할 때 문제가 될 수 있으므로,
	// history 객체를 조작({정보를 담은 객체}, 뒤로 가기 버튼 문자열 형태의 제목, 바꿀 url)
	history.replaceState({}, null, null);
	function checkResult(result){
		if(result === '' || history.state){	// 뒤로가기 방지
			return;
		}
		if(result === 'success'){	// 수정 및 삭제
			alert("처리가 완료되었습니다.");
			return;
		}
		if(result === 'ok'){	// 삽입
			alert("게시글이 등록되었습니다.");
		}
	}
 
 
 
 </script>

		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>