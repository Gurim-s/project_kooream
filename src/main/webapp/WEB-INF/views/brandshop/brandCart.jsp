<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	button{
		background-color:  black;
		width: 100px;
		color: white;
		height: 28px;
		border-radius: 5px;
	}

	.Btn{	/* 버튼  */
		float: right;
	}
	.imgbox{
		border-radius: 70%;
		
	}
	.p_infoa{
		left : 60px;
		position: relative;
	}
 	.p_image{
 		overflow: hidden;
        display: flex;
        align-items: center;
		justify-content: center;
       	left : 30px;
		position: relative; 
	}

	#total_sum{
		font-weight: bold;
		text-decoration: underline;
		text-decoration-thickness : 2px;
		font-size: 20px;
		float: right;
	}

</style>
</head>
<body>
	<h1>장바구니</h1><br/>
<!---------------------------------버튼----------------------------------------------------------- -->
	<ul>
		<li>
			<div class="allCheck">
				<input type="checkbox" id="allCheck" /><label for="allCheck"> 모두 선택</label>
			 <div class="Btn">
				<button type="button" class="selectDelete_btn">삭제</button> 
				<button type="button" id="product_buy">구매하기</button>
			</div> 
			</div>
			<br/><hr/><br/>
		</li>
	</ul>
<!---------------------------------장바구니 리스트-------------------------------------------------- -->
<form action="">
	<div class="middle_content">
		<div class="middle_content_inner">
			<div>
				<div class ="brand">
				</div>
            </div>
		</div>
	</div>
</form>
<!---------------------------------상품 합계----------------------------------------------------- -->
	<div>
		<p style="font-size: 18px;">합계</p><div  id="total_sum" ></div>
	</div>
    <br/><br/>

<!---------------------------------스크립트 시작----------------------------------------------------- -->	
<script type="text/javascript">


$(function(){	// list()함수 실행하기위한
	list();
});

	function list() {	// 상품이미지 보여주기
		$.ajax({
			url:'/brandCart/brandCartList',
			type: 'get',
 			dataType:"json",
 			contentType:"application/json",

 		})
 		.done(function (json) {	// success 대신 사용
 			
			var str='<div class="container">';
			
			console.log(json);	// f12누르면 나오는,, 정보가 json에 저장이 잘 되어있는지 확인
			
			if(json.length){	// json의 길이가 있으면
			
				for(var i=0; i<json.length; i++) {
					krPrice = json[i].p_release_price.toLocaleString('ko-KR');
					
							// brandshop(컨트롤러) 에서 /get을 탐  
/* 					str += '<input type="checkbox" class="chkbox"  data-cartno="'+json[i].cart_no+'" data-price="'+json[i].p_release_price+'" data-pno="'+json[i].p_no+'" data-ppsize="'+json[i].pp_size+'" /><br/><br/>' */
					str += '<input type="checkbox" class = "chkbox" name="p_noList" value="'+json[i].p_no+'" data-price="'+json[i].p_release_price+'" data-cartno = "'+json[i].cart_no+'"/><br/>'
					str += '<a href="/brandshop/get?p_no='+json[i].p_no+'&b_no='+json[i].b_no+'">';	// 페이지 이동하면서 p_no, b_no값 가지고 이동 
					str += '<div class = "imgbox">'
					// 이미지 하나만 보여주기 
					var uploadPath = json[i].uploadPath;
					var uuid = json[i].uuid;
					var fileName = json[i].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
						
					str += '<img class = "p_image" style = "width : 120px; margin = 10px; float: left;" src="/displayImage?fileName='+ fileCallPath + '" /><br/>';	// 이미지
					
					/*브랜드명, 영문명, 사이즈, 가격  mapper.xml에서 조인해서 가지고오고, Vo에 이름 만들면 가지고 올수있음 */
					
					str += '</div>';
					str += '<div class = "p_infosty">';
					str += '<div class="p_infoa" style="font-weight: bold; font-size: 16px;">'+json[i].b_name+'<img style= "width : 25px; " src =../resources/img/check.png/></div>';
					str += '<div class="p_infoa" style="font-weight: bold; font-size: 14px; ">'+json[i].p_NAME_EN+'</div><br/>';
					str += '<div class="p_infoa" style="font-weight: bold; font-size: 16px;">'+json[i].pp_size+'</div>';
					str += '</a>'
					str += '<div class="p_info" style="font-weight: bold; font-size: 18px; float:right;"  data-price = "'+json[i].p_release_price+'">'+krPrice+'원</div><br/>';
					str += '</div>'
					str += '</div>'
					/* str += '<button class = "remove_button" data-cartno="'+json[i].cart_no+'" >삭제</button>' */
					str += '<br/>'
					str += '<hr/>'
					str += '<br/>'
				}//------------- for 문 끝
			
				str += '</div>'
				str += '<br/>';
				$('.brand').html(str);	// 여기서 append를 사용하면 내용이 계속 쌓이는거고 새로가지고오지 못한다.. 그래서 html사용해야함,,,,,
		
		
	 		}else{
				str += '<p>장바구니에 상품이 없습니다.</p><br/><hr/>'
				str += '<br/>'
				$('.brand').html(str);
			
	 		}// ------- else 문 끝
		});// ---------done 끝
		
 	};// ------- list 함수 끝
 // --------------------------------------------------------------상품 합계 구하기

	$(document).on("click",".chkbox",function (){
		itemSum();
	}) ;
		function itemSum() {
			
			var sum = 0;
			var count = $(".chkbox").length;
			
			for (var i = 0; i < count; i++) {
				 if ($(".chkbox")[i].checked == true){	// 체크가 되어진 것만 값 가지고오기
					var obj = $(".chkbox")[i];
				 	console.log($(".chkbox")[i])
				 	// => class="chkbox" data-cartno=cart_no data-price=p_release_price 값 찍히는에 그중에서 
					sum += Number($(obj).attr("data-price"));	// data-price의 속성(attr)가지고와서 숫자로 변환하고(숫자로 변환하기전은 string) 더해줌 
				}
			}
		    $("#total_sum").html(sum.toLocaleString('ko-KR') + " 원");
		
		}	
	
//----------------------------------------------------------삭제 비동기(여러개삭제 만드니깐 안돼서 막아둠ㅠ)
/* 	$(document).on("click",".remove_button",function () {
		//e.preventDefault();
		var cartno = $(this).data("cartno");	// this가 버튼 눌린것(?) 이라는 뜻
		//var pno = $(this).data("pno");	// data-set
	 	$.ajax({
			url : "/brandCart/Cartdelete",
			type : "POST",
			/* datatype : "json" */
//			data : {cart_no:cartno},  
//			success : function(result){
//				if(result == 1) {          
//					alert("삭제 성공");
//					list();		// 성공시 list() 함수를 타야 새로고침 된다
//				} else {
//					alert("삭제 실패");
//				}
				
//			}// success 끝
//		});// 삭제 ajax 끝
//	}); // 삭제 함수 끝
	

//----------------------------------------------------------여러개 선택 삭제 비동기
	$(".selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
			if(confirm_val) {
	   			var checkArr = new Array();
	   
			$("input[class='chkbox']:checked").each(function(){
				checkArr.push($(this).attr("data-cartno"));
				
	   		});
	    
				$.ajax({
					url : "/brandCart/Cartdelete",
					type : "POST",
					data : { chArr : checkArr },
					success : function(result){
					    if(result==1){
						   	alert("선택한 항목이 삭제되었습니다.");
						   	list();
						   	$("#total_sum").html(0 + " 원");
						   	
					    }else{
					    	alert("선택한 항목 삭제 실패")
					    }
	   				}
	  			});
	 		}
	});


//----------------------------------------------------------여러개 선택 삭제 비동기
/* 
	
	$(".selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
		var deletecount = $(".chkbox").length;
		if(confirm_val) {
			for(var i = 0; i<deletecount; i++){
				if ($(".chkbox")[i].checked == true){	// 체크가 되어진 것만 값 가지고오기
					var obj2 = $(".chkbox")[i];
					var cartnolist = Number($(obj2).attr("data-cartno"));
					console.log(cartnolist);
				}
			} 
		$.ajax({
		    url : "/brandCart/Cartdelete",
		    type : "post",
		    data : { cart_no : cartnolist },
		    success : function(result){
		    	if(result==1){
			    	alert("선택한 항목이 삭제되었습니다.");
			     	list();
		    	}else{
		    		alert("선택한 항목 삭제 실패")
		    	}

			}
		});
			
	 }
	 }); */


//------------------------------------- 체크박스 선택하면 모두 체크박스 선택
 	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk) {
			$(".chkbox").prop("checked", true);
			itemSum();
		} else {
			$(".chkbox").prop("checked", false);
			itemSum();
		}
	}); 
//-------------------------------------- 개별체크박스 선택하면 체크박스 해제		
	$(".chBox").click(function(){		
		$("#allCheck").prop("checked", false);
	});

<!-- ------------------------------------------ 구매하기  ---------------------------------------------------- -->	
$("#product_buy").click(function (e) {
	e.preventDefault();
	
	var chkboxlength = $("input[name='p_noList']:checked").val()
	console.log(chkboxlength);
	
		if (chkboxlength == null){
			alert("상품 선택 후 구매해주세요");
			return;
		}else{
			var confirm_val = confirm("구매하시겠습니까? 확인누르시면 구매창으로 이동합니다");
				if(confirm_val){
				var form = $('form')[0];	// 맨첫번째 	
				form.action = '/Payment/payment';
				form.submit();	
				}
		}
});
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/* 	$("#product_buy").click(function (e) {
		e.preventDefault();
		
		var form = $('form')[0];		
		form.action = '/Payment/payment';
		form.submit();
	});
	
	$("").click(function (e) {
		e.preventDefault();
		
		if("input[class='chkbox']:checked" == false){ //alert 창안떠 ㅠ씨앙
			alert("상품 선택 후 구매해주세요");
			return;
		}else{
			var confirm_val = confirm("구매하시겠습니까? 확인누르시면 구매창으로 이동합니다");
				if(confirm_val){
					
					var count = $(".chkbox").length;
					
					for (var i = 0; i < count; i++) {
						 if ($(".chkbox")[i].checked == true){ */	// 체크가 되어진 것만 값 가지고오기
							// var payArr = new Array();
							 
							//var obj = $(".chkbox")[i];
						 	//console.log($(".chkbox")[i]);
						 	// => class="chkbox" data-cartno=cart_no data-price=p_release_price 값 찍히는에 그중에서 
							// var pno = (Number($(obj).attr("data-pno"))); 
							 //var ppsize = ($(obj).attr("data-ppsize"))  ;	// data-price의 속성(attr)가지고와서 숫자로 변환하고(숫자로 변환하기전은 string) 더해줌 
							//var price = (Number($(obj).attr("data-price")));
							 /*  payArr.push($(obj).attr("data-ppsize")); */
							// console.log(pno);
						 
							// location.href = "/Payment/payment" //  location.href 기본적으로 getMapping
							 
							/*  $.ajax({
									url : "/Payment/addpayment",
									type : "POST",
									data : {p_no:pno,sum_price :price,  pp_size:ppsize},
									dataType : 'json',
									success : function (result) {
										location.href = "/Payment/payment" //  location.href 기본적으로 getMapping
									},
									error : function () {
										alert("구매하기 실패")
										
									}
							 });
						};
					
					}	
				}
		}
	});
 */



</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>