<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
	<style type="text/css">
	.top-h1 {
		text-align: center;
		
	}
	.top-h2{
		text-align: center;
	}
	.Main_image{
		text-align: center;
	}
	
		
	
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="top-h1"><h1>KOOREAMS</h1></div>
	<br/>
	<div class="top-h2"><h2>KOOREAM의 브랜드를 카테고리별로 확인하세요.</h2></div>
	<br/>
	<br/>
	<div class="Main_image">
		<a href="/brandshop/view?b_no=51"><img class = "m_image" id = "51" src="../resources/img/LE17SEPTEMBRE_51.jpg"/></a>	
	</div>
	<br/>
	<br/>
		<div class="Main_image">
		<a href="/brandshop/view?b_no=52"><img class = "m_image" id = "52" src="../resources/img/Polar Skate Co._52.jpg" /></a>	
	</div>
	<br/>
	<br/>
		<div class="Main_image">
		<a href="/brandshop/view?b_no=53"><img class = "m_image" id = "53" src="../resources/img/Punch Drunk Parties_53.png"/></a>	
	</div>
	<br/>
	<br/>
		<div class="Main_image">
		<a href="/brandshop/view?b_no=54"><img class = "m_image" id = "54" src="../resources/img/THE IDENTITY PROJECT_54.jpg"/></a>	
	</div>
	<br/>
	<br/>
		<div class="Main_image">
		<a href="/brandshop/view?b_no=55"><img class = "m_image" id = "55" src="../resources/img/The Museum Visitor_55.jpg"/></a>	
	</div>
	<br/>
	<br/>

<script type="text/javascript">
/* 	$("").click(function (e) {
		e.preventDefault();

		var click_id =  $(this).find("img").attr("id");
		
		location.href="/brandshop/view?b_no=" + click_id; 		
		
	}) */


</script>
	

</body>
</html>
<jsp:include page="../include/footer.jsp"/>