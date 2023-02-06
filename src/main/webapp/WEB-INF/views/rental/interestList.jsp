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
</style>
<div style="padding-top: 125px;">
	<h2>관심상품</h2>
	<table style="border-top: 2px solid #444444;">
		<c:choose>
			<c:when test="${fn:length(list) == 0 }">
				조회된 데이터가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>
							<ul class="prdtInfo">
								<li>
									<a href="/rental/viewRntPrdt?p_no=${vo.p_no }">
										<!-- url 경로 만들기 -->
										<c:url value="/displayImage" var="url">
											<c:param name="fileName" value="${vo.img_url }"/>
										</c:url>
										<!-- 만든 경로로 이미지 불러오기. 실질적으로 이미지 보여주는 부분 -->
										<div style="width: 130px">
											<img src="${url}"/>
										</div>
									</a>
								</li>
								<li style="width: 400px; vertical-align: 26px;">
									<div>${vo.p_name_ko }</div>
									<div>${vo.p_name_en }</div>
								</li>
								<li style="width: 80px; vertical-align: 58px;">
									<div>${vo.r_price }</div>
								</li>
								<li style="vertical-align: 59px;">
									<button id="removeBtn" onclick="removeBtn(${vo.p_no})">관심상품삭제</button>
								</li>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<script  type="text/javascript">
	function removeBtn(p_no){
		location.href="/rental/removeInterest?p_no="+p_no;
	};
</script>

<jsp:include page="../include/footer.jsp"/>