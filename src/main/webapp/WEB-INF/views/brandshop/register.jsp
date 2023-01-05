<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품등록</h1>
	<div class="container">
		<form action="/brandshop/register"method="post">
			<table>
			<tr>
				<td>이미지 등록</td>
					<td><input type="file" name="uploadFile" multiple="multiple"></td>
			<td class="uploadResult">
				<ul></ul>
			</td>
			</tr>
			<tr>
				<td>브랜드</td>
					<td class="form-inline">
						<select class="BrandCategory1" name="b_no">
							<option value="51">LE17SEPTEMBRE</option>
							<option value="52">Polar Skate Co.</option>
							<option value="53">Punch Drunk Parties</option>
							<option value="54">THE IDENTITY PROJECT</option>
							<option value="55">The Museum Visitor</option>
						</select>
					</td>
				</tr>	
				<tr>
					<td>상품명_한글</td>
					<td><input type="text" name="p_name_ko"></td>
				</tr>
			<tr>
				<td>상품명_영문</td>
				<td><input type="text" name="p_name_en"></td>
			</tr>
			<tr>		
				<td>상품분류</td>
				<td class="form-inline">
						<select class="Category1" name="p_size">
							<%-- <c:if test="${ productList eq top}"></c:if> 상의면  비동기 방식????!!?!?!--%>
							<option value="top">1. 상의</option>
							<option value="botton">2. 하의</option>
							<option value="shoes">3. 신발</option>
							<option value="acc">4. 패션잡화</option>
						</select>
						<c:if test="${ p_size eq top}"></c:if> 상의면
							<select class="Category1" id="Top_Size">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
							<c:if test="${ p_size eq botton }"></c:if> 
							<select class="Category1" id="botton_Size">
								<option value="46">46</option>
								<option value="48">48</option>
								<option value="50">50</option>
							</select>
							<c:if test="${ p_size eq shoes }"></c:if>
							<select class="Category1" id="Shoes_Size">
								<option value="230">230</option>
								<option value="240">240</option>
								<option value="250">250</option>
								<option value="260">260</option>
							</select>
							<c:if test="${ p_size eq acc }"></c:if>
							<select class="Category1" id="productList">
								<option value="acc_FREE">FREE</option>
							</select> 

				</td>
				</tr>
				<tr>
					<td>모델번호</td>
					<td><input type="text" name="p_model_no"></td>
				</tr>
			  <tr>
				<td>판매금액</td>
				<td><input type="number" name="p_release_price"></td>
				</tr>
<!-- 			<tr>
				<td>상세이미지</td>
				<td><input type="file" name="Brand_productImages"></td>
			</tr> -->
			<tr>
				<td>카테고리 설정</td>
					<td>
					<select class="Category2" name="p_category">
						<option value="brand_clothes">의류</option>
						<option value="brand_shoes">신발</option>
						<option value="brand_acc">패션잡화</option>
					</select></td>
			</tr>
			<tr>
				<td class="col-sm-offset-2 col-sm-10">
					<button data-oper="submit">등록</button>
					<button data-oper="reset">취소</button>
					<button data-oper="list">목록으로</button>
					<input type="hidden" name="pageNum" value="${cri.pageNum}"/> 	<!-- 값 던지기 -->
					<input type="hidden" name="amount" value="${cri.amount}"/> 
				</td>
			</tr>		
	</table>	
	</form>
	</div>

		<script type="text/javascript">
		  //-------------------------버튼 클릭 스크립트-----------------------------------
		// 업로드 전 제약
		   $(function(){
			      var formObj = $("form");
			      
			      $("button").click(function(e){   
			         e.preventDefault();   // 기본 이벤트 삭제==기능정지
			         
			         //위 3가지 버튼 중 하나 클릭하면 그거에 맞는 데이터가 들어옴
			         var oper = $(this).data("oper");   //data-oper가 remove, list해서 ..
			         
			         if(oper == 'list'){
			            location.href='/board/list?pageNum='+pageNum+'&amount='+amount;
			         }else if(oper == 'reset'){
			            formObj[0].reset();
			         }else{
			            // 게시글 등록
			            
			            console.log("submit clicked");
			            
			            var str = '';
			            
			            //upload 안에 li들을 갖고 for문 돌릴거임
			            $(".uploadResult ul li").each(function(i, obj){
			               var jobj = $(obj);   //특정 요소 변수에 담음
			               str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'" >';
			               str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'" >';
			               str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'" >';
			            });   
			               
			            formObj.append(str);
			            formObj.submit();
			         }   
			         
			      });
			   
			      
			      
			   });
	// 업로드 전 제약
		$(function () {
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");		// 확장자 (정규식) 업로드할수없는 파일
			var maxSize = 5242880;	//5MB
			
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				} 
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}				
				return true;				
			}// end checkExtension();	함수가 끝나는 곳 표시한것
		
	

	// 업로드
		$("input[type='file']").change(function(){
			var formData = new FormData();	// 스크립트에서 Form태그 생성
	        var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;			// 0번에 있는 파일	f12누르면 fileList
			console.log(files);
			
			for(var i=0; i<files.length; i++){
					
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
	            url : '/brandfile/uploadAjaxAction',
	            processData : false,            // 쓰임새는 없지만 필요해서 작성 //현재상황에서는 안쓰지만 필수데이터 false를 해야 전송이 된다
	            contentType : false,            // 쓰임새는 없지만 필요해서 작성
	            data : formData,
	            type : 'post',
	            dataType : 'json',				// json타입으로 업로드
	            success : function(result){
	            	console.log(result);		// 우리가 업로드한 파일을 담고 리턴해준다(?)
	              	showUploadFile(result);
	            }
	         });
		});	// click 함수 end
		
		// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
		var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr) {
			
			var str='';	// 태그들을 한번에 동적으로 실행
			
			for(var i=0; i<uploadResultArr.length; i++){	// 리스트 갯수만큼 li를 만들어서 동적으로 넣는다
				var obj = uploadResultArr[i];
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +		// 인코딩
														obj.uuid + "_" +
														obj.fileName);
			
			
				
				str += '<li>';
				str += '<a href="/download?fileName='+fileCallPath+'">';	// 다운로드에 매개변수 던지는 중
				str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
				str += '</a>';
				str += '<span data-file="'+ fileCallPath+'"> X </span>';		// x표시 만들어서 삭제할수 있게 만든것
				str += '</li>';
			
			}
			
			uploadResult.html(str);
		}// end showUploadFile();
		
		uploadResult.on("click", "span", function () {
			var targetFile = $(this).data("file");
			
			$.ajax({
				url:"/deleteFile",		// Controller에서 deleteFile 찾는다
				data : {fileName:targetFile},
				type : "post",
				dataType : "text",
				success : function (result) {
					alert(result);
					
				}
			
			
			});
		});
		
	});

	</script>
	
		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>