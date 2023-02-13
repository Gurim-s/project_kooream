<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.p_image{
		width : 70px; 
		margin:10px; 
		float: left;
  	}

	table{
		width: 78%;
		border-collapse:collapse;
		text-align: center;
		border-top: 1px solid #444444;
	}

	th {
		background-color: black;
		color: white;
		height: 35px;
	}

</style>
</head>
<body>
	<h1>구매내역페이지 입니다</h1>
	<br/><br/>
	<table border="1">
		<tr class = "tabletop">
			<th style="width: 450px;">상품</th>
			<th>주문날짜</th>
			<th>주소</th>
			<th>총 금액</th>

		</tr>
		<tr>
			<td class ="brand"></td>
			<td class = "date"></td>
			<td class = "adress"></td>
			<td class = "price"></td>

		</tr>
	</table>
<!---------------------------------스크립트 시작----------------------------------------------------- -->	
<script type="text/javascript">

//-----------------------------------------시간 /  날짜 관련 스크립트---------------------------------------
function displayTime(timeValue){
	var today = new Date();
	var gap = today.getTime() - timeValue;
	var dateObj = new Date(timeValue);
	var str = "";
	
	if(gap < (1000 * 60 * 60 * 24)){
		var hh = dateObj.getHours();
		var mi = dateObj.getMinutes();
		var ss = dateObj.getSeconds();
		return [(hh>9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
	}else{
		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
		var dd = dateObj.getDate();
		return [yy, '/', (mm > 9 ? '' : '0')+mm, '/', (dd > 9 ? '' : '0') + dd].join('');
	}
}
//-----------------------------------------상품 리스트 보여주기---------------------------------------
$(function () {
	list();
});
	function list() {	// 상품이미지 보여주기
		$.ajax({
			url:'/Payment/paymentList',
			type: 'get',
				dataType:"json",
				contentType:"application/json",
	
			})
			.done(function (json) {	// success 대신 사용
				
			var str='<div class="container">';
			var str_adress = '';
			var str_date = '';
			var str_del = '';
			var str_price = '';
			console.log(json);	// f12누르면 나오는,, 정보가 json에 저장이 잘 되어있는지 확인
			
			if(json.length){	// json의 길이가 있으면
				str_adress += '<div class="p_info" style= "font-size: 15px; ">'+json[0].m_adress+'</div>';	// 주소
				str_date += '<div class="p_info" style="font-size: 15px; ">'+displayTime(json[0].buy_date)+'</div>';	// 구매날짜
				var price = 0;
				var sum = 0;
				/* str_del += '<button class = "remove_button" data-date="'+json[0].buy_date+'">삭제</button>'; */
				for(var i=0; i<json.length; i++) {
					/* krPrice = json[i].p_release_price.toLocaleString('ko-KR'); */
					
					str += '<div class = "imgbox">'
					
					var uploadPath = json[i].uploadPath;
					var uuid = json[i].uuid;
					var fileName = json[i].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
					price += json[i].pay_price ;
					
					str_price += '<div>'+price+'</div>';
					str += '<div><img class = "p_image"src="/displayImage?fileName='+ fileCallPath + '" /></div><br/><br/>';	// 이미지
					str += '<div class="p_info" style="font-size: 13px;">'+json[i].p_name_ko+'</div><br/><br/>';	// 상품 이름
					str += '</div>';	//	imgbox 끝
					
	
				}//------------- for 문 끝
			
				str += '</div>'
				sum = price;
				
				$('.brand').html(str);	// 상품이미지
				$('.adress').html(str_adress);	// 주소
				$('.date').html(str_date);	// 날짜
				$('.price').html(sum.toLocaleString('ko-KR')+ "원");	// 총 금액
				
			};	// if문 끝
			});	// done 끝
	}

//-------------------------------------------------------------삭제 만든건데 안쓰기로,,!--------------------
/* 
	$(document).on("click",".remove_button",function (e) {
	e.preventDefault();
	var date = $(this).data("date");	// this가 버튼 눌린것(?) 이라는 뜻
	console.log(buyno + "장바귄번호")
	
 	$.ajax({
		url : "/Payment/paymentdelete",
		type : "POST",
		datatype : "json", 
		data : {buy_date:date},  
		success : function(result){
			if(result == 1) {          
				alert("삭제 성공");
				list();		// 성공시 list() 함수를 타야 새로고침 된다
			} else {
				alert("삭제 실패");
			}
			
		}// success 끝
	});// 삭제 ajax 끝
}); // 삭제 함수 끝
	
 */




	




</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>