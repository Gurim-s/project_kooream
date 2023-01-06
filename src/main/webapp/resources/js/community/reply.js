console.log("Reply Module......");

var replyService = (function(){

	function add(reply, callback){
		console.log("reply.....");
		
		$.ajax({
			type:'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	} // --------------------------- function add end



	function getList(param, callback, error){
		var bno = param.bno;
		
		$.ajax({
			type:'get',
			url : '/replies/pages/' + bno + '/1.json',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	} // --------------------------- function getList end
	
	
	
	function remove(rno, callback, error){
		$.ajax({
			type:'delete',
			url : '/replies/' + rno,
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});		
	} // --------------------------- function remove end
	
	function update(reply, callback, error){
		console.log("update reply..." + reply.rno);
		
		$.ajax({
			type:'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
		
	} // --------------------------- function update end
	
	
	
	function get(rno, callback, error){
		console.log("get reply..." + rno);
		
		$.ajax({
			type:'get',
			url : '/replies/' + rno + '.json',
			success:function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
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