<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>

<style>
	img{
		width: 125px;
	}
	.prdtInfo > li{
		display: inline-block
	}
	button{
		background-color: black;
		color: white;
		font-weight: 700;
    	min-width: 80px;
    	padding: 0 13px;
	    height: 32px;
	    border-radius: 5px;
	    font-size: 14px;
	    letter-spacing: -.14px;
	}
	button:active{
		background-color: rgba(34,34,34,.8);
	}
</style>
<div style="padding-top: 125px;">
	<h2>예약상품</h2>
	<table style="border-top: 2px solid #444444;">
		<c:choose>
			<c:when test="${fn:length(list) == 0 }"> <!-- fn -> funcion : jstl 내부함수 -->
				조회된 데이터가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>
							<ul class="prdtInfo">
								<li>
									<!-- url 경로 만들기 -->
									<c:url value="/displayImage" var="url">
										<c:param name="fileName" value="${vo.img_url }"/>
									</c:url>
									<!-- 만든 경로로 이미지 불러오기. 실질적으로 이미지 보여주는 부분 -->
									<div style="width: 130px">
										<img src="${url}"/>
									</div>
								</li>
								<li style="width: 400px; vertical-align: 26px;">
									<div>${vo.p_name_ko }</div>		
									<div>${vo.p_name_en }</div>
								</li>
								<li style="width: 80px; vertical-align: 58px;">
									<!-- ${vo.total_price } -->
								</li>
								<li style="vertical-align: 52px;">
									<span>${vo.strt_r_date }</span>
									<span>-</span><br/>
									&nbsp;<span>${vo.rtrn_r_date }</span>
								</li>
								<li style="vertical-align: 59px;">
									<form id="removeForm" action="/rsvt/removeRsvt" method="post">
										<button id="removeBtn">예약내역삭제</button>
										<input type="hidden" name="r_no" value="${vo.r_no }">
									</form>
								</li>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>

</body>
<script>
$(function(){
	// 예약내역삭제 버튼 클릭이벤트
	$("#removeBtn").on("click", function(e){
		e.preventDefault();
		
		$("#removeForm").submit();
	});
});

</script>
<jsp:include page="../include/footer.jsp"/>