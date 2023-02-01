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
</style>
<div>
	<table>
		<c:choose>
			<c:when test="${fn:length(list) == 0 }">
				조회된 데이터가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>
							<img src="/display/${vo.img_url }">
						</td>
						<td>
							<div>${vo.p_name_ko }</div>
							<div>${vo.p_name_en }</div>
						</td>
						<td>
							<div>${vo.r_price }</div>
						</td>
						<td>
							<button id="removeBtn" onclick="removeBtn(${vo.p_no})">관심상품삭제</button>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
<script type="text/javascript" src='/resources/js/rental/slick.min.js'></script>
<script  type="text/javascript">
	function removeBtn(p_no){
		location.href="/rental/removeInterest?p_no="+p_no;
	};
</script>

<jsp:include page="../include/footer.jsp"/>