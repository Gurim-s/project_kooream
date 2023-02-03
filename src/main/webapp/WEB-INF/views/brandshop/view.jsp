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
	.cartList{
		float : right;
	}
	.container{
		display: flex;	/* 상품 한 줄 정렬 */
		flex-direction: row; /* 가로방향으로 배치*/
		flex-wrap: wrap;	/* 페이지 넘어가지않고 밑으로 내리기 */
		gap : 8px;	/* 상품 간격 지정 */
		

	}
	.product{
		display : inline-flex;
		
	}
	.container img{
		width : 200px;	/* 상품이미지 사이즈 */
	}
	#box{
		float: left;
		width: 200px;
	}
	.sub{
		display: none;
	}
	.imgbox{
		width: 200px;
		position: relative;
	}
	.title_image{
		z-index: 1;
		position: relative;
		
	}
	.logo_image{
		z-index : 2;
		position: relative;
		bottom : 80px;
		left: 550px;
	
	}

	.title{		/*이미지*/
		width: 100%;
		height : 400px;
		

	}
	.logo{
		width: 150px;
		height: 150px;

	}
	.p_info{
		width: 200px;
	}
	.logo_name {
		left: 550px;
	}



</style>
</head>
<body>
<!-- ------------------------장바구니, 등록 버튼-------------------- -->
	
	<div><a class = "cartList" href="/brandCart/brandCart">장바구니</a><a class="register">등록</a></div>
	<br/><br/><br/>
<!-- ------------------------메인이미지, 로고이미지 -------------------- -->	
<div class = "img box">
<div class="title_image"></div>
<div class="logo_image"></div>
<div class = "logo_name"></div>

</div>
<!-- ------------------체크박스 카테고리 시작------------------------ -->
 <div id = "box">
	<ul>
		<li class = "menu">
			<p>카테고리</p>
				<ul class = "sub">
					<li><input type ="checkbox" class = "brand_category" name = "brand_category" value = "brand_clothes">  의류</li>
					<li><input type ="checkbox" class = "brand_category" name = "brand_category" value = "brand_shoes">  신발</li>
					<li><input type ="checkbox" class = "brand_category" name = "brand_category" value = "brand_acc">  패션잡화</li>
				</ul>
		</li>
		
		<li class = "menu">
			<p>금액</p>
				<ul class = "sub" >
					<li><input type ="checkbox" name = "brand_price" class = "brand_price" value = "50000">  5만원 이하</li>
					<li><input type ="checkbox" name = "brand_price" class = "brand_price" value = "100000">  10만원 이하</li>
					<li><input type ="checkbox" name = "brand_price" class = "brand_price" value = "150000">  15만원 이하</li>
					<li><input type ="checkbox" name = "brand_price" class = "brand_price" value = "200000">  20만원 이하</li>
				</ul>
		</li>

	</ul>
</div> 
<!-- ------------------체크박스 카테고리 끝------------------------ -->	




<!-- -----------------------상품리스트 시작--------------------------->
	   <div class="middle_content">
         <div class="middle_content_inner">
               <div>
                        <div class ="brand">
						</div>
               </div>
         </div>
      </div>
<!-- -----------------------상품리스트 끝--------------------------->
<!-- -----------------------스크립트 시작--------------------------->
<script type="text/javascript">
	var test = '${list}';
	//console.log(test);
	

	
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

//-------------------------------------상품 메인/로고 이미지 시작-------------------------------------------------------
	var b_no = ${b_no};
		for(i=51; i<=55; i++) {
			if(b_no == i){
				$(".title_image").append("<img class = 'title' src='../resources/img/"+ i +"_title.png/'>");
			
			}
		}
		for(i=51; i<=55; i++) {
			if(b_no == i){
				$(".logo_image").append("<img class = 'logo' src='../resources/img/"+ i +"_logo.png'>");
			}
		}
		
		if(b_no == 51){
			$(".logo_name").append('<div class = "logoname" style="font-weight: bold; font-size: 15px; ">LE17SEPTEMBRE</div>')
		}

//--------------------------------------------수정 페이지 이동--------------------------------------------------
	$(".register").click(function (e) {
		e.preventDefault();
		
		var b_no = "${b_no}";
		location.href = '/brandshop/register?b_no=' + b_no;
		
	})

//--------------------------------------------옆에 카테고리 클릭시 내려오는거------------------------------------------
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 p 태그를 클릭했을때
        $(".menu>p").click(function(){
            var submenu = $(this).next("ul");
 
            // submenu 가 화면상에 보일때는 위로 접고 아니면 아래로 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
            }else{
                submenu.slideDown();
            }
        });
    });


// 상품 이미지 리스트에 보여주기--------------------------------------------------------
 	$(function() {
 		list();
 	});	
 	
 	function list() {// 상품이미지 보여주기
		
 		var bno = '${b_no}';
 		//console.log(bno + "123454654654645");
 		
 		$.ajax({
 			url:'/brandshop/getList',
 			type: 'get',
 			data : {b_no:bno},	// 
 			dataType:"json",
 			contentType:"application/json",
 		})
 		.done(function(json) {
			var str='<div class="container">';
			console.log(json);
			for(var i=0; i<json.length; i++) {
				str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
					// brandshop(컨트롤러) 에서 /get을 탐  
				
				
				// 이미지 하나만 보여주기 
				
				
				if(json[i].attachList.length > 0) {
					var uploadPath = json[i].attachList[0].uploadPath;
					var uuid = json[i].attachList[0].uuid;
					var fileName = json[i].attachList[0].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
					str += '<div class = "product">'
					str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';	// 이미지
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
				str += '<div style="font-weight: bold; font-size: 15px; data-name ="'+json[i].b_name+'"">'+json[i].b_name+'<img style= "width : 25px; " src =../resources/img/check.png/></div>';
				str += '<div class = "p_info" style="font-weight: bold; font-size: 15px; ">'+json[i].p_name_en+'</div>';
				str += '<div class = "p_info" style="color: gray; font-size: 15px;">'+json[i].p_name_ko+'</div>';
				str += '<div style="font-weight: bold; font-size: 15px;">'+json[i].p_release_price+'원</div>';
				
				str += '</a>'
				str += '</div>'
				str += '<br/>'

			}
			
			str += '</div>'
			str += '<br/>';
			$('.brand').html(str);	// 원래 $('.brand').append(str);
		});

 	};
 	
   	var result = '<c:out value="${result}"/>';
	// rttr 객체를 통해 받아온 값이 빈 값이 아닐 때(데이터 변경) 알림 메소드 실행
	if(result != ''){
		checkResult(result);
	}

	
// --------------------alert 창 띄우기--------------------------------------------------------
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
//--------------------------체크박스 비동기 시작---------------------------------------------------------
// --------------------카테고리(의류)--------------------------------------------------------

 	$(".brand_category").click(function () {
 		var val = $("input[name='brand_category']:checked").val()
 		console.log(b_no);
 		console.log(val);
 		if(val!=null){
	 		$.ajax({
	 			url : "/select/getList",
	 			type : "get",
	 			data : {b_no:b_no,p_category:val},
	 			dataType:"json",
				contentType:"application/json",
	 		})
	 		.done(function(json) {
	 			
				var str='<div class="container">';
				console.log(json);
				for(var i=0; i<json.length; i++) {
					str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
						// brandshop(컨트롤러) 에서 /get을 탐  
					
					// 이미지 하나만 보여주기 
					
					if(json[i].attachList.length > 0) {
						var uploadPath = json[i].attachList[0].uploadPath;
						var uuid = json[i].attachList[0].uuid;
						var fileName = json[i].attachList[0].fileName;
						var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
						str += '<div class = "product">'
						str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';	// 이미지
					}
	
					str += '<div style="font-weight: bold; font-size: 15px; data-name ="'+json[i].b_name+'"">'+json[i].b_name+'<img style= "width : 25px; " src =../resources/img/check.png/></div>';
					str += '<div class = "p_info" style="font-weight: bold; font-size: 15px; ">'+json[i].p_name_en+'</div>';
					str += '<div class = "p_info" style="color: gray; font-size: 15px;">'+json[i].p_name_ko+'</div>';
					str += '<div style="font-weight: bold; font-size: 15px;">'+json[i].p_release_price+'원</div>';
					str += '</a>'
					str += '</div>'
					str += '<br/>'
	
				}
				
				str += '</div>'
				str += '<br/>';
				$('.brand').html(str);
			});
 		}
 		else if(val==null){
 			list();	
 		}
 	});
// --------------------카테고리(금액)--------------------------------------------------------

 	$(".brand_price").click(function () {
 		var val2 = $("input[name='brand_price']:checked").val()
 		console.log(b_no);
 		console.log(val2);
 		
 		if(val2!=null){
	 		$.ajax({
	 			url : "/select/pricegetList",
	 			type : "get",
	 			data : {b_no:b_no,p_release_price:val2},
	 			dataType:"json",
				contentType:"application/json",
	 		})
	 		.done(function(json) {
	 			
				var str='<div class="container">';
				console.log(json);
				for(var i=0; i<json.length; i++) {
					str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
						// brandshop(컨트롤러) 에서 /get을 탐  
					
					// 이미지 하나만 보여주기 
					
					if(json[i].attachList.length > 0) {
						var uploadPath = json[i].attachList[0].uploadPath;
						var uuid = json[i].attachList[0].uuid;
						var fileName = json[i].attachList[0].fileName;
						var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
						str += '<div class = "product">'
						str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';	// 이미지
					}
	
					str += '<div style="font-weight: bold; font-size: 15px; data-name ="'+json[i].b_name+'"">'+json[i].b_name+'<img style= "width : 25px; " src =../resources/img/check.png/></div>';
					str += '<div class = "p_info" style="font-weight: bold; font-size: 15px; ">'+json[i].p_name_en+'</div>';
					str += '<div class = "p_info" style="color: gray; font-size: 15px;">'+json[i].p_name_ko+'</div>';
					str += '<div style="font-weight: bold; font-size: 15px;" >'+json[i].p_release_price+'원</div>';
					str += '</a>'
					str += '</div>'
					str += '<br/>'
	
				}
				
				str += '</div>'
				str += '<br/>';
				$('.brand').html(str);
			});
 		}
 		else if(val2==null){
 			list();	
 		}
 	}) 		
 
// --------------------숫자에 , 붙이기 --------------------------------------------------------
 		
 		
 		
 		
			

 
 </script>

		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>