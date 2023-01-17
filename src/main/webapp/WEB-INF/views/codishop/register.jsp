<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/codi/codi.css" />
<jsp:include page="../include/header.jsp"/>


	<div class="codi_box">
		<div class="social_title">
			<h1 style="text-align: center;">코디 등록</h1>
		</div> <!--social_title..........end  -->
		<hr/>
		<br/><br/><br/>
		<form name="codi_register" action="/codishop/register" method="post" role="form">
			<div class="insert_codi">
				<div class="row">
					<span class="title_content">코디제목</span>
					<input type="text" name="codi_title" id="textForm">
				</div>
				<div class="row">
					<span class="title_content">코디소개</span>
					<input type="text" name="codi_content" id="textForm">
				</div>
				
				<div class="row">
					<span class="title_content">해시태그</span>
					<input type="text" name="hashTags" id="textForm">
				</div>
				
				<div class="row">
					<span class="title_content">상품태그</span>
					<input type="text" name="m_no" id="textForm">
				</div>
				
				<div class="row">
					<span class="title_content">모델정보</span>
					<span class="model_info">이름: </span>
						<input type="text" name="codimodel_name" id="textForm2">
						
					<span class="model_info">키 :  </span>
						<input type="number" name="codi_cm" id="textForm2">
						
					<span class="model_info">무게 : </span>
						<input type="number" name="codi_Kg" id="textForm2">
				</div>
				<div class="row">
					<div><span class="title_content">사진 등록</span></div>
				 <div class="panel-body">
		            <div class="form-group uploadDiv">
		               <input type="file" name="uploadFile" multiple="multiple">
		            </div>
		            <div class="uploadResult">
		               <ul></ul>
		            </div>
			         </div>
				</div>	<!-- row.... end -->
			</div> <!--  insert_codi.... end -->
			<hr/>
			<br/><br/><br/>
			<div class="btn btn_all">
				<button class="btn1" data-oper="list">목록으로 가기</button>
				<button class="btn1" data-oper="register">코디 등록</button>
				<button class="btn1" data-oper="reset">취소</button>
			</div> <!-- btn btn_all......... end -->
		</form>
		
	</div> <!-- codi_box ........... end -->
<script type="text/javascript">
	$(function() {
		
		var operForm = $('#operForm');
		var formObj = $("form[role='form']");
		
		$("button").on("click", function(e) {
			e.preventDefault();
			
			var oper = $(this).data("oper");
			
			if(oper == 'list'){
				location.href = '/codishop/list';
			}else if(oper == 'reset'){
				formObj[0].reset(); // 내용 비워주기 
				return;
			}else{
				console.log("submit_ok");
				var str = '';
				
				$('.uploadResult ul li').each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					str+='<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'">';
					str+='<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'">';
					str+='<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'">';
					
				});
				
				 if(codi_register.codi_title.value == "" ) {
					codi_register.codi_title.focus();
			        alert("제목을 입력해 주십시오.");
			        return false;
				    };
				 if(codi_register.codi_content.value == "" ) {
					codi_register.codi_content.focus();
			      	alert("내용을 입력해 주십시오.");
			      	return false;
				  };
				 if(codi_register.hashTags.value == "" ) {
					codi_register.hashTags.focus();
			      	alert("해시태그을 입력해 주십시오.");
			      	return false;
				  };
				 if(codi_register.m_no.value == "" ) {
					codi_register.m_no.focus();
			      	alert("상품 태그을 입력해 주십시오.");
			      	return false;
				  };
				 if(codi_register.codimodel_name.value == "" ) {
					codi_register.codimodel_name.focus();
			      	alert("모델 명을 입력해 주십시오.");
			      	return false;
				  };
				 if(codi_register.codi_cm.value == "" ) {
					codi_register.codi_cm.focus();
			      	alert("키를 입력해 주십시오.");
			      	return false;
				  };
				 if(codi_register.codi_Kg.value == "" ) {
					codi_register.codi_Kg.focus();
			      	alert("몸무계를 입력해 주십시오.");
			      	return false;
				  };
				  
				console.log(str);
				formObj.append(str);
				formObj.submit();			
				
				
			}
		}); //btn click event end
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");   //확장자를 포함하지 못하도록 
    var maxSize = 5242880; //5MB
    
    //파일 확장자와 파일사이즈 체크
    function checkExtension(fileName, fileSize){
       if(fileSize >= maxSize){
          alert("파일 사이즈 초과");
          return false;
       }
       if(regex.test(fileName)){
          alert("해당 종류의 파일은 업로드 할 수 없습니다.");
          return false;
       }            
       return true;
    }   // end checkExtension();
    
	    $("input[type='file']").change(function() {
	    	var formData = new FormData();
	    	var inputFile = $("input[name='uploadFile']")
	    	console.log(inputFile[0]);
	    	var files = inputFile[0].files
	    	
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
    	
	    	
	   	 	$.ajax({
	    		url : '/codi-uploadAjaxAction',
	    		processData : false,
	    		contentType : false,
	    		data : formData,
	    		type : 'post',
	    		dataType : 'json',
	    		success : function(result){
	    			console.log(result);
	    			//showUploadFile(result);
	    		}
	    	
	    	});
	    	
	    	
	   	 	
	   	 	
	   	 	
	   	 	
    
    	}); //$("input[type='file']").change end
	
	
	
	
	}); // function end
</script>

<style>
/* 이미지 업로드 테스트 */
#att_zone{
	width: 505px;
	min-height:150px;
	padding:10px;
	border:1px dotted #00f;
}
#att_zone:empty:before{
	content : attr(data-placeholder);
	color : #999;
	font-size:.9em;
}



/* 테스트 */
#textForm{
	  width: 70%;
	  border:none;
	  border-bottom : 3px solid #ebebeb;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	  text-align: center;
	  
}
#textForm2{
	  width: 18%;
	  border:none;
	  border-bottom : 3px solid #ebebeb;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	  text-align: center;
	  
}
.title_content{
    display: flex;
    align-items: center;
    width: 100px;
    height: 40px;
    font-weight: bold;
}
.row {
	width : 50%;
    display: flex;
    padding: 10px 0;
    margin: auto;
}
.btn1{
 	position:relative;
	left:5%;
	border-radius: 15px;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width:10%;
	height:40px;
	background-color : #ebebeb;
	background-position: left;
	background-size: 200%;
	color:black;
	font-weight: bold;
	border:none;
	cursor:pointer;
	transition: 0.4s;
	display:inline;
}
.model_info{
	font-size : large;
	font-weight: bold;
}



</style>

<jsp:include page="../include/footer.jsp"/>