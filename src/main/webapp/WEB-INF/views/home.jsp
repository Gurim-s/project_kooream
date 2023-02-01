<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="include/header.jsp"/>
	<form action="/member/mainPage" method="get" id="startForm">
		
	</form>
	<script type="text/javascript">
		document.getElementById("startForm").submit();
	</script>
<jsp:include page="include/footer.jsp"/>