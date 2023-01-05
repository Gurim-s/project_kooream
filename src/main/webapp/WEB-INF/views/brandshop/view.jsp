<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="/brandshop/register">등록</a>
	<table>
		<tr>
		<td>P_no</td>
		<td>B_No</td>
		<td>P_NAME_KO</td>
		<td>P_NAME_EN</td>
		<td>P_MODEL_NO</td>
		<td>P_RELEASE_PRICE</td>
		<td>P_CATEGORY</td>
		<td>P_CLASS</td>
		</tr>
		
		<c:forEach var="board" items="${list }">
				<tr>
			<td><c:out value="${board.p_no}"></c:out></td>
			<td><c:out value="${board.b_no}"></c:out></td>
			<td><c:out value="${board.p_name_ko}"></c:out></td>
			<td><c:out value="${board.p_name_en}"></c:out></td>
			<td><c:out value="${board.p_release_price}"></c:out></td>
			<td><c:out value="${board.p_category}"></c:out></td>
			<td><c:out value="${board.p_class}"></c:out></td>
			
			
			</tr>
		
		
		
		
		
		</c:forEach>
		
	
	
	
	</table>

		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>