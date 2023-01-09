console.log("Reply Module......");

var replyService = (function(){

	function add(reply, callback){
		console.log("reply insert.....");
		
		$.ajax({
			type:'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(er){
					error(er);
				}
			}
		});
	} // --------------------------- function add end



	function getList(param, callback, error){
		var talkno = param.no;
		
		$.ajax({
			type:'get',
			url : '/replies/pages/' + talkno + '.json',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(er){
					error(er);
				}
			}
		});
	} // --------------------------- function getList end
	
	
	
	function remove(rno, callback, error){
		$.ajax({
			type:'delete',
			url : '/replies/' + talkreplyno,
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(er){
					error(er);
				}
			}
		});		
	} // --------------------------- function remove end
	
	function update(reply, callback, error){
		console.log("update reply..." + reply.talkreplyno);
		
		$.ajax({
			type:'put',
			url : '/replies/' + reply.talkreplyno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(er){
					error(er);
				}
			}
		});
		
	} // --------------------------- function update end
	
	
	
	function get(rno, callback, error){
		console.log("get reply..." + talkreplyno);
		
		$.ajax({
			type:'get',
			url : '/replies/' + talkreplyno + '.json',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(er){
					error(er);
				}
			}
		});
		
	}

	
	
	
	
	
	return {
			add:add,
			getList:getList,
			remove:remove,
			update:update,
			get:get
			};

})();