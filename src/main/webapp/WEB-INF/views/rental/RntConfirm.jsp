<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>



<div>
	<table>
		<c:forEach var="vo" items="${list}">
			<tr>
				<td>
					<img src="/display/${vo.img_url}">
				</td>
				<td>
					<div>${vo.p_name_ko }</div>
					<div>${vo.p_name_en }</div>
				</td>
				<td>
					예약금액
				</td>
				<td>
					<span>${vo.strt_r_date }</span>
					<span>-</span>
					<span>${vo.rtrn_r_date }</span>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>

</body>
<script>
	

</script>
<jsp:include page="../include/footer.jsp"/>