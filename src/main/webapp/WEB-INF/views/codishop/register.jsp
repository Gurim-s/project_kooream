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
		<form action="/codishop/register" method="post" role="form">
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
			<!-- 		<div class="codi-image">
						<input type="file" name="uploadFile" multiple="multiple" accept="image/jpeg, image/gif, image/png">
					</div>
			 -->		
					
				<div class="img-test">
				 <input type="file" class="real-upload" accept="image/*" required multiple>
				  <div class="upload">Upload</div>
				  <div class="image_box">
					  <ul class="image-preview"></ul>
				  </div>
				</div>		
					
					
					<div class="uploadResult">
						<ul></ul>
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
		// 이미지 클릭시 제거 
		 $(".photo").click(function () {
        	$(this).remove();
    	});
		
		
		// 폼 오브젝트 만들기
		var formObj = $("form[role='form']");
		console.log(formObj[0]);
		
		
		// -----버튼 클릭 스크립트
		$("button").on("click", function(e) {
			e.preventDefault(); // 이벤트 막기
			
			var oper = $(this).data("oper"); // 버튼 가지고 있는 data-oper 속성
			
			if(oper == 'list'){
				location.href = '/codishop/list';
			}else if(oper == 'reset'){
				formObj[0].reset();
				return;
			}else{
				console.log("submit clicked");
				var str = '';
				
				$(".uploadResult ul li").each(function(i, obj) {
					var jobj = $(obj);
					console.dir(jobj);
					str+='<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'">';
					str+='<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'">';
					str+='<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'">';
					
				
				
				});
				formObj.append(str);
				formObj.submit();
			}
		}); // button click end 
		
		
		 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");   //확장자를 포함하지 못하도록 
         var maxSize = 20971520; //20MB
		
         //파일 화거장자& 사이즈 체크
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
         } // checkExtension end
			
		$("input[type='file']").change(function() {
			var formData = new FormData(); // 스크립트로 Form택스 생성
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);
			
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'post',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadFile(result);
					
				} // success end
			}); // ajax end
		}); // ("input[type='file']") end
		
		// 업로드 후 파일 화면에 보여주기 
		/* var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr) {
			var str = '';
			
			for(var i=0; i<uploadResultArr.length; i++){
				var obj = uploadResultArr[i];
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/"
														+ obj.uuid+"/"
														+ obj.fileName);
				
				 str +='<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-filename="'+obj.fileName+'">';
	             str +='<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
	             str +='<span data-file="'+fileCallPath+'"> X </span>';
	             str +='</li>';
			} // for end	
           
			uploadResult.html(str);
             
		} // showUploadFile end
		
		uploadResult.on("click","span", function(){
            var targetFile = $(this).data("file");
            var targetLi = $(this).closest("li");   //파일 x를눌렀을경우 이름까지 삭제되도록함.
            
            $.ajax({
               url:"/deleteFile",
               data : {fileName: targetFile},
               type:"post",
               dataType : "text",
               success : function(result){
                  //alert(result);
                  targetLi.remove();   //파일 x를눌렀을경우 이름까지 삭제.
               }
            });
            
         });// end uploadresult
 */
	
	
		function getImageFiles(e) {
	      const uploadFiles = [];
	      const files = e.currentTarget.files;
	      const imagePreview = document.querySelector('.image-preview');
	      const docFrag = new DocumentFragment();

	      if ([...files].length >= 7) {
	        alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
	        return;
	      }

	      // 파일 타입 검사
	      [...files].forEach(file => {
	        if (!file.type.match("image/.*")) {
	          alert('이미지 파일만 업로드가 가능합니다.');
	          return
	        }

	        // 파일 갯수 검사
	        if ([...files].length < 7) {
	          uploadFiles.push(file);
	          const reader = new FileReader();
	          reader.onload = (e) => {
	            const preview = createElement(e, file);
	            imagePreview.appendChild(preview);
	          };
	          reader.readAsDataURL(file);
	        }
	      });
	    }

	    function createElement(e, file) {
	      const li = document.createElement('li');
	      li.style.display = 'block';
	      const img = document.createElement('img');
	      img.setAttribute('src', e.target.result);
	      img.setAttribute('class', 'photo');
	      img.setAttribute('data-file', file.name);
	      li.appendChild(img);

	      return li;
	    }

	    const realUpload = document.querySelector('.real-upload');
	    const upload = document.querySelector('.upload');

	    upload.addEventListener('click', () => realUpload.click());

	    realUpload.addEventListener('change', getImageFiles);
	
	}); // function end
</script>

<style>

.image_box{
	width: 100%;
	height: 200px;
}
ul li {
    float: left;
    list-style: none;
    margin: 5px 10px;
}


li img{
  	list-style: none;
  	width: 100px;
  	height: 100px;
}

.div img {
	padding: 5px;
  	width: 100px;
 	height: 100px;
}

.real-upload {
  	display: none;
}

.upload {
  	width: 100px;
  	height: 40px;
  	line-height: 40px;
  	text-align:center;
  	display: block;
  	border: 1px solid #ebebeb;
}

.image-preview {
  	width: 399px;
  	background-color: aquamarine;
  	/* display: flex; */
  	gap: 20px;
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