console.log("Reply Module.... " );

var CodiReplyService = (function(){
	
	function add(reply, callback){
		console.log("reply................");
		$.ajax({
		type : 'post',
		url : '/codi/replies/new',
		data : JSON.stringify(reply),
	    	contentType : "application/json; charset=urf-8",
	    	success: function(result, status, xhr) {  
	        		if(callback){
	        		callback(result);
	        }
    	},
    	 	error: function(xhr, status, er) {
	        if(error){
	        	error(er);
        	}
   		}
	}); // ajsx ---- end
	} // function add ------ end


   		function getList(param, callback, error){
   			var codi_no = param.codi_no;
   			console.log(codi_no);
   			var page = param.page || 1;
			$.ajax({
				type : 'get',
		    	url : '/codi/replies/pages/'+codi_no+'/1.json',
		    	success: function(result, status, xhr) {  
		        	if(callback){
		        		callback(result);
		        }
		    	},
			    error: function(xhr, status, er) {
		       	 	if(error){
		        		error(er);
	        		} // if --- end
	   			} // error: function --- end
			});
   		} // function getList ---- end
   		
   		function remove(codi_c_no, callback, error){
   			$.ajax({
				type : 'delete',
		    	url : '/codi/replies/'+codi_c_no,
		    	success: function(result, status, xhr) {  
		        	if(callback){
		        		callback(result);
		        	}	// if(callback) -- end
		    	}, // function(result, status, xhr) -- end
			    error: function(xhr, status, er) {
		       	 	if(error){
		        		error(er);
	        		} // if --- end
	   			} // error: function --- end
			}); // ajax-- end
   		
   		} // function remove ------ end
   		
   		
   		function update(reply, callback, error){
   			console.log("update reply...." + reply.codi_c_no);
   			console.log("update reply...." + reply.reply);
   			
   				$.ajax({
			type : 'put',
	    	url : '/codi/replies/'+reply.codi_c_no,	// 입력받은 codi_c_no번호로 가야되기 때문에 
	    	data : JSON.stringify(reply),
	    	contentType : "application/json; charset=urf-8",
	    	success: function(result, status, xhr) {  
	        		if(callback){
	        		callback(result);
	        	}
    		},
	    	error: function(xhr, status, er) {
	       
	        if(error){
	        	error(er);
        		}
   			} 
   			
		});  // ajax ---- end
   		
   		
   		} //function update() ---- end
   		
   		function get(codi_c_no, callback, error){
   			console.log("reply............"+ codi_c_no);
			
   			$.ajax({
				type : 'get',
		    	url : '/codi/replies/'+codi_c_no +'.json' ,
		    	success: function(result, status, xhr) {  
		        	if(callback){
		        		callback(result);
		        }	// if(callback) -- end
		    	}, // function(result, status, xhr) -- end
			    error: function(xhr, status, er) {
		       	 	if(error){
		        		error(er);
	        		} // if --- end
	   			} // error: function --- end
			}); // ajax-- end
   		
   		} // funcition get --- end
   		
   		
   		

 		return{ add:add,
 				getList : getList,
 				remove : remove,
 				update : update,
 				get : get
 				};
})();