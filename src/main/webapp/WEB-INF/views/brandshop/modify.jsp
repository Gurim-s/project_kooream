<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.modify{
		margin-left:auto;
		margin-right:auto; 
		padding: 50px;
		width: 100%;
		height: 100%;
	}
	.modify td{
		height: 50px;
		width: 100px;
		font-size: 20px;
		font-weight: bold ;
	}
	.modify td input{
		width: 90%;
	}
</style>

</head>
<body>
	<h1>상품 수정</h1><br/>
	<div class="container">
		<form action="/brandshop/modify" method="post" id="operForm">
			<table class = "modify">

			<tr>
				<td>브랜드</td>
					<td class="form-inline">
						<select id="brand_select" name="b_no">
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
					<td><input id ="p_name" type="text" name="p_name_ko" value="${vo.p_name_ko}"></td>
				</tr>
			<tr>
				<td>상품명_영문</td>
				<td><input id = "p_en" type="text" name="p_name_en" value="${vo.p_name_en}"></td>
			</tr>
		<!-- 	<tr>		
				<td>상품분류</td>
				<td class="form-inline">
						<select id="Category1">
							<option value="">선택</option>
							<option value="top">1. 상의</option>
							<option value="bottom">2. 하의</option>
							<option value="shoes">3. 신발</option>
							<option value="acc">4. 패션잡화</option>
						</select>
							<select class="T_Category" name="">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
							<select class="B_Category" name="">
								<option value="46">46</option>
								<option value="48">48</option>
								<option value="50">50</option>
							</select>
							<select class="S_Category" name="">
								<option value="230">230</option>
								<option value="240">240</option>
								<option value="250">250</option>
								<option value="260">260</option>
							</select>

							<select class="A_Category" name="">
								<option value="FREE">FREE</option>
							</select> 

				</td>
			</tr> -->
			<tr>
				<td>모델번호</td>
				<td><input id ="pm_no" type="text" name="p_model_no" value="${vo.p_model_no}"></td>
			</tr>
			<tr>
				<td>판매금액</td>
				<td><input id = "p_price" type="number" name="p_release_price" value="${vo.p_release_price}"></td>
			</tr>

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
				<td>파일 첨부</td>
					<td><input type="file" name="uploadFile" multiple="multiple"></td>
				<td class="uploadResult">
				<ul></ul>
				</td>
			</tr>
<!-- 			<tr>
					<td class = "Brand_name"><input type="hidden" name ="p_brand" value=""></td>
			</tr> -->
			<tr>
				<td class="register_button">
					<button type="submit" data-oper="modify">수정완료</button>
					<!-- <button type="reset">취소</button> -->
					<button type ="submit" data-oper="list">목록으로</button>
					<button type="submit" data-oper="remove">삭제</button>
					<%-- <input type="hidden" name="pageNum" value="${cri.pageNum}"/> 	<!-- 값 던지기 -->
					<input type="hidden" name="amount" value="${cri.amount}"/>  --%>
					<input type="hidden" name="p_no" value="${vo.p_no }"/>
					<input type="hidden" name="b_no" value="${vo.b_no }"/>
				</td>
			</tr>		
	</table>
	</form>
	</div>
	
	<script type="text/javascript">

		
// 사이즈 선택-----------------------------------------------------------------

	/* $('#Category1').change(function () {
		var result =$('#Category1 option:selected').val();
		if(result == 'top'){
			$('.T_Category').show();
			$('.T_Category').attr('name','p_size');	// name='p_size' 가 들어간다
			$('.B_Category').hide();
			$('.S_Category').hide();
			$('.A_Category').hide();
			
		}else if(result == 'bottom'){
			$('.B_Category').show();
			$('.B_Category').attr('name','p_size');
			$('.T_Category').hide();
			$('.S_Category').hide();
			$('.A_Category').hide();
		}else if(result == 'shoes'){
			$('.S_Category').show();
			$('.S_Category').attr('name','p_size');
			$('.T_Category').hide();
			$('.B_Category').hide();
			$('.A_Category').hide();
		}else{
			$('.A_Category').show();
			$('.A_Category').attr('name','p_size');
			$('.T_Category').hide();
			$('.B_Category').hide();
			$('.S_Category').hide();	
		};
	});//사이즈 선택 끝-----------------------------------------------------------	
 */

	$(function(){
		var operForm = $("#operForm");
		var p_noValue = '${vo.p_no}';
		var bno = '${vo.b_no}';
		$("button").on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			if(operation == 'remove'){
				operForm.attr("action", "/brandshop/remove");
			}else if(operation == 'list'){
				operForm.attr("action", "/brandshop/view?b_no=" + bno);
				operForm.attr("method", "get");
				
			} else{
				var brand_select = $("#brand_select").val();
	     	    var p_name = $("#p_name").val();
	     	    var p_en = $("#p_en").val();
	     	    var pm_no = $("#pm_no").val();
	     	    var p_price = $("#p_price").val();
	     	    var Category2 = $(".Category2").val();
			
	     	   if(brand_select.length == 0){
	     	        alert("브랜드를 체크해 주세요"); 
	     	        $("#brand_select").focus();
	     	        return ;
	     	    }
	     	    
	     	    if(p_name.length == 0){
	     	        alert("상품(한글) 이름을 입력해 주세요"); 
	     	        $("#p_name").focus();
	     	        return;
	     	    }
	     	 
	     	    if(p_en.length == 0){
	     	        alert("상품(영문) 이름을 입력해주세요");
	     	        $("#p_en").focus();
	     	        return;
	     	    }

	     	    if(pm_no.length == 0){
	     	        alert("상품 모델번호를 입력해주세요");
	     	        $("#pm_no").focus();
	     	        return;
	     	    }
	     	    
	     	    if(p_price.length == 0){
	     	        alert("상품 금액을 입력해주세요");
	     	        $("#p_price").focus();
	     	        return;
	     	    }
	     	    
	     	    if(Category2.length == 0){
	     	        alert("카테고리를 선택해주세요");
	     	        $("#Category2").focus();
	     	        return;
	     	    }
			}
			
				
				//var pageNumTag = $("input[name=pageNum]").clone();
				//var amountTag = $("input[name=amount]").clone();
				
					// 내부 비워주기	

				//operForm.append(pageNumTag);
				//operForm.append(amountTag);
		
			
			operForm.submit();
		});
		
		$.ajax({
			url : '/brandshop/getAttachList',
			type : 'GET',
			data : {p_no:p_noValue},
			contentType : 'application/json; charset=utf-8',
			success : function (arr) {				// 리스트로 넘어옴
				console.log(arr);
			
		           var str = '';	// 태그들을 한번에 동적으로 실행
		            
		            for(var i=0; i<arr.length; i++){	// 리스트 갯수만큼 li를 만들어서 동적으로 넣는다	// 게시글 상세보기하면 파일첨부 리스트 보임
		               var obj = arr[i];
		               
		               var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +		// 인코딩
		                                             obj.uuid + "_" + 
		                                             obj.fileName);
		               
		               //console.log(fileCallPath);
		               
		              str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-filename="'+obj.fileName+'">';// vo값을 던질 수 있게 수정
		              // str += '<a href="/download?fileName='+fileCallPath+'">';	// 다운로드에 매개변수 던지는 중
		              str += '<br/>'
		              str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
		              // str += '<div><img src="/brandfile/display?fileName='+ fileCallPath + '" /></div>'; 리스트형태 + 이미지 보여줌
		              // str += '</a>';
		              /* str += '<span data-file="'+fileCallPath+'"> X </span>'; */   //X파일 하나 만들어서 파일 삭제할 수 있게 하자
		              str += '</li>';
		            }
		           	
		           $(".uploadResult ul").html(str);	
			
			}
	
		});
		
		var uploadResult = $(".uploadResult ul");
        uploadResult.on("click","span", function(){
            var targetFile = $(this).data("file");
            var targetLi = $(this).closest("li");   //부모태그인 li 갖고오기	//li 지우는 용	??? 
            
            $.ajax({
               url:"/brandfile/deleteFile",		// Controller에서 deleteFile 찾는다
               data : {fileName: targetFile},
               type:"post",
               dataType : "text",
               success : function(result){
                  //alert(result);
                  targetLi.remove();
               }
            });
            
         });   
	
	});		


</script>

</body>
</html>
<jsp:include page="../include/footer.jsp"/>