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
			console.log(formObj);
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

    // 입력한 값을 태그로 생성한다.
    function addTag (value) {
        tag[counter] = value;
        counter++; // del-btn 의 고유 id 가 된다.
    }

    // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    // 서버에 제공
    $("#tag-form").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#rdTag").val(value); 

        $(this).submit();
    });

    $("#tag").on("keypress", function (e) {
        var self = $(this);

        //엔터나 스페이스바 눌렀을때 실행
        if (e.key === "Enter" || e.keyCode == 32) { // 키코드 32번 = 스페이스 

            var tagValue = '#'+self.val(); // 값 가져오기

            // 해시태그 값 없으면 실행X
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                });
                // 해시태그가 중복되었는지 확인
                if (result.length == 0) { 
					var tagstr = "";
					 
                    $("#tag-list").append("<li class='tag_name' name='tag_name'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });

    // 삭제 버튼 
    // 인덱스 검사 후 삭제
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });


}); // function end