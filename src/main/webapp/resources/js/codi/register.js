import {imgFileUploader} from '../common/img-file-uploader.js';

$(function() {
	var uploaderContainer = $('.uploadDiv');
	var uploader = imgFileUploader;
	$(uploaderContainer).append(uploader.container);
	uploader.setURL('/codi-uploadAjaxAction');
	uploader.setSaveName('attachList');
	
	var operForm = $('#operForm');
	var formObj = $("form[role='form']");
	
	$(".btn.btn_all button").on("click", async function(e) {
		e.preventDefault();
		
		var oper = $(this).data("oper");
		
		if(oper == 'list'){
			location.href = '/codishop/list';
		}else if(oper == 'reset'){
			formObj[0].reset(); // 내용 비워주기 
			return;
		}else{
			console.log("submit_ok");
			var result = await uploader.uploadImageAjax();
			var div = $('<div></div>');
			div.append(result);
			formObj.append(div);
//			$('.uploadResult ul li').each(function(i, obj){
//				var jobj = $(obj);
//				console.dir(jobj);
//				str+='<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'">';
//				str+='<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'">';
//				str+='<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'">';
//			});
			
			
			
			
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
			 if($('#tag-list').children('li').length == 0) {
				codi_register.tag.focus();
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
			 if(codi_register.codi_kg.value == "" ) {
				codi_register.codi_kg.focus();
		      	alert("몸무계를 입력해 주십시오.");
		      	return false;
			  };
	/*업로더 수정 이후에 다시 작업*/
//			 var fileCheck = uploader.countFiles > 0;
//			console.log(uploader.countFiles);
//			 if(!fileCheck){
//			        alert("파일을 첨부해 주세요");
//			        return false;
//		    }
			  
//			console.log(str);
//			formObj.append(str);

			
			var tagList = $('.tag_name');
			console.log(tagList);
			console.log(tagList[0].children[0]);
			console.log(tagList.length);
			var tags = '';
			for(var i=0; i<tagList.length; i++){
				tags += '<input type="hidden" name="codiTagList['+i+'].tag_name" value="'+tagList[i].children[0].innerText+'" />';
				tags += '<input type="hidden" name="codiTagList['+i+'].tag_cnt" value="0" />';
				console.log(tagList[i].children[0].innerText);
			};
			formObj.append(tags);
			console.log(formObj);
			formObj.submit();			
		};
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

//    $("input[type='file']").change(function() {
//    	var formData = new FormData();
//    	var inputFile = $("input[name='uploadFile']")
//    	console.log(inputFile[0]);
//    	var files = inputFile[0].files
//    	
//		for(var i=0; i<files.length; i++){
//			if(!checkExtension(files[i].name, files[i].size)){
//				return false;
//			}
//			formData.append("uploadFile", files[i]);
//		}
//   	 	$.ajax({
//    		url : '/codi-uploadAjaxAction',
//    		processData : false,
//    		contentType : false,
//    		data : formData,
//    		type : 'post',
//    		dataType : 'json',
//    		success : function(result){
//    			console.log(result);
//    			showUploadFile(result);
//    		}
//    	});
//	}); //$("input[type='file']").change end
//
//	// 파일 업로드 후 보여주기 
//	var uploadResult = $(".uploadResult ul");
//	function showUploadFile(uploadResultArr){
//		str = '';
//		
//		for(var i=0; i<uploadResultArr.length; i++){
//			var obj = uploadResultArr[i];
//			
//			var fileCallPath = encodeURIComponent(obj.uploadPath + "/"
//												+ obj.uuid + "_"
//												+ obj.fileName);
//			
//			str +='<li data-path="'+obj.uploadPath+'"data-uuid="'+obj.uuid+'"data-filename="'+obj.fileName+'">';
//			str +='<img src="/resources/img/attach.png" style="width:15px"/>' + obj.fileName;
//			str +='<span data-file="'+fileCallPath+'">X</span>';
//			str +='</li>'
//			
//		}
//		uploadResult.html(str);
//	} // showUploadFile end
//	
//	uploadResult.on("click","span",function(){
//		var targetFile = $(this).data("file");
//		var targetLi = $(this).closest("li");	
//		
//		$.ajax({
//			url : "/deleteFile",
//			data : {fileName:targetFile},
//			type : "post",
//			dataType : "text",
//			success : function(result) {
//				targetLi.remove(); // 파일 삭제 
//				
//			} // function end
//		}); // $.ajax end
//	}); // uploadResult end


// 해시태그 
	var tag = {};
    var counter = 0;

	function addTag (value) {
        tag[counter] = value;
        counter++; // del-btn 의 고유 id 가 된다.
    }



	$("#tag").on("keypress", function(e){
		var self = $(this);
		var formData = new FormData();
		var inputTag = $("input[name='tag_name']");
		console.log(inputTag);
		console.log(self.val());
		console.log(self);
		
		if(e.keyCode === 13 || e.keyCode == 32){ // 13엔터 32스페이스 눌렀을시 
			var tagValue = self.val();
			var tagStr= '';
			
			if(tagValue !== ""){ // tagValue의 내용이 있을 경우
			 	console.log(counter);
				console.log(tagValue);
				tagStr += '<li class="tag_name" name="tag_name">'
				tagStr += '<span class="tag_text">'+tagValue+'</span>';
				tagStr += '<span class="del_tag" idx="'+counter+'">X</span>';
				tagStr += '</li>';
				
				addTag(tagValue);
				
				$("#tag-list").append(tagStr);
				
				self.val("");
				
			}else{
				alert("값이 없습니다.");
			}
		
			
			e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
			
			
		}
		
	});
	
	// 삭제 버튼 클릭시 지우기 
	$(document).on("click",".del_tag", function(e){
		var index = $(this).attr("idx");
		tag[index] = '';
		$(this).parent().remove();
		console.log($(this).siblings('.tag_hidden'));
//		$(this).siblings('.tag_hidden').remove();
	});










}); // function end