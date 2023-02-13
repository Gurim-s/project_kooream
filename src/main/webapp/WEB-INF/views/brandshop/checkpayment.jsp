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
	table{
		width: 70%;
	}


</style>
</head>
<body>
	<h1>구매내역페이지 입니다</h1>
	<br/><br/>
	<table border="1">
		<tr>
			<td style="width: 150px;">상품</td>
			<td>주문날짜</td>
			<td>주소</td>
			<td>금액</td>
			<td>삭제</td>
		</tr>
		<tr>
			<td class ="brand"></td>
			<td class = "date"></td>
			<td class = "adress"></td>
			<td class = "price"></td>
			<td class = "del"></td>
		</tr>
	</table>

	
<script type="text/javascript">
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
		
		console.log(json);	// f12누르면 나오는,, 정보가 json에 저장이 잘 되어있는지 확인
		
		if(json.length){	// json의 길이가 있으면
			str_adress += '<div class="p_info" style="font-weight: bold; font-size: 15px; ">'+json[0].m_adress+'</div>';
			str_date += '<div class="p_info" style="font-weight: bold; font-size: 15px; ">'+displayTime(json[0].buy_date)+'</div>';
			str_del += '<button class = "remove_button" data-date="'+json[0].buy_date+'">삭제</button>';
			for(var i=0; i<json.length; i++) {
				/* krPrice = json[i].p_release_price.toLocaleString('ko-KR'); */
				

				str += '<div class = "imgbox">'
				// 이미지 하나만 보여주기 
				
				var uploadPath = json[i].uploadPath;
				var uuid = json[i].uuid;
				var fileName = json[i].fileName;
				var fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				str += '<img class = "p_image" style = "width : 70px; margin:10px; float: left;" src="/displayImage?fileName='+ fileCallPath + '" />';	// 이미지
				
				/*브랜드명, 영문명, 사이즈, 가격  mapper.xml에서 조인해서 가지고오고, Vo에 이름 만들면 가지고 올수있음 */
				str += '<div class="p_info" style="font-weight: bold; font-size: 15px; float:right;">'+json[i].p_name_ko+'</div><br/><br/>';
				str += '</div>';
				
				str += '</div>'
				

			}//------------- for 문 끝
		
			str += '</div>'

			$('.brand').html(str);	// 상품이미지
			$('.adress').html(str_adress);	// 주소
			$('.date').html(str_date);	// 날짜
			$('.del').html(str_del)
			//$('.date').append(str_date);	// 날짜
			
		};
		});
}

	$(document).on("click",".remove_button",function (e) {
	e.preventDefault();
	var date = $(this).data("date");	// this가 버튼 눌린것(?) 이라는 뜻
	console.log(buyno + "장바귄번호")
	
 	$.ajax({
		url : "/Payment/paymentdelete",
		type : "POST",
		datatype : "json", 
		data : {buy_date:date},  
		/* /*data : json, */
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
	



	




</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>