<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.register{
		float: right;
	
	}
	.class-data{
		display: flex;	
	}




</style>
</head>
<body>
	<a class="register" href="/brandshop/register">등록</a>

	   <div class="middle_content">
         <div class="middle_content_inner">
            <c:forEach var="product" items="${list}">
               <div>
               <ul class="class-data">   
                     <li data-cno="${product.p_no}">
                        <div>
                        <img width="100px" src="<c:url value='/resources/img/kooream.png'/>"><br/>
                        <c:out value="${product.p_name_ko }"></c:out> <br/>
                        <c:out value="${product.p_name_en }"></c:out> <br/>
                        <c:out value="${product.p_release_price }" ></c:out><br/>
                     </div>
                  </li>
               </ul>   
               </div>
            </c:forEach>
            
         </div>
      </div>
      
      
	
	

	<script type="text/javascript">
	//상품 클릭 이벤트----------------------------------------------------------------------------------
    var p_no;
    $("ul").on("click", "li", function() {
       
       cno = $(this).data("p_no"); 
       alert(p_no);
       location.href="/branshop/get?p_no=" + p_no;            
       
       
       
       });

    
 //상품 클릭 이벤트 end------------------------------------------------------------------------------   
	
	</script>

		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>