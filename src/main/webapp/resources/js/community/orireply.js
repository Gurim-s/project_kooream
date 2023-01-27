console.log("Original Reply Module......");

var replyService = (function(){

	function add(reply, callback){
		console.log("Original reply insert.....");
		
		$.ajax({
			type:'post',
			url : '/oriReplies/new',
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
		var orino = param.orino;
		
		$.ajax({
			type:'get',
			url : '/oriReplies/pages/' + orino + '.json',
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
	
	
	
	function remove(orireplyno, callback, error){
		$.ajax({
			type:'delete',
			url : '/oriReplies/' + orireplyno,
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
		console.log("update reply..." + reply.orireplyno);
		
		$.ajax({
			type:'put',
			url : '/oriReplies/' + orireply.orireplyno,
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
	
	
	
	function get(orireplyno, callback, error){
		console.log("get reply..." + orireplyno);
		
		$.ajax({
			type:'get',
			url : '/oriReplies/' + orireplyno + '.json',
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
	
	function countOriOk(param, callback, error){
		
		var orino = param.no
		console.log("get ori OK reply...." + orino);
		console.log(orino);
		$.ajax({
			type:'get',
			url:'/oriReplies/' + orino +'.json',
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
	} // --------------------------- function countOriOk end

	function countOriNo(param, callback, error){
		
		var orino = param.no
		console.log("get ori NO reply...." + orino);
		
		$.ajax({
			type:'get',
			url:'/oriReplies/oriCountNo/' + orino + '.json',
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
	} // --------------------------- function countOriNo end
	
	function okList(param, callback, error){
		var orino = param.no;
		console.log(orino);
		$.ajax({
			type:'get',
			url : '/oriReplies/okList/' + orino + '.json',
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
	} // --------------------------- function okList end
	
	function noList(param, callback, error){
		var orino = param.no;
		
		$.ajax({
			type:'get',
			url : '/oriReplies/noList/' + orino + '.json',
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
	} // --------------------------- function noList end
	
	
	return {
			add:add,
			getList:getList,
			remove:remove,
			update:update,
			get:get,
			countOriOk:countOriOk,
			countOriNo:countOriNo,
			okList:okList,
			noList:noList
			};

})();