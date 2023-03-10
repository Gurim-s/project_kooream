<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/js/page/rental/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/js/page/rental/slick-theme.css" />
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<style>
/*
	#prdtModBtn{
		float: right;
    	margin-top: -526px;
	}
	#removePrdtForm{
		float: right;
    	margin-top: -526px;
	}
	#prdtModBtn{
		margin-right: -70px;
	}
	*/
#prdtInfo {
	display: inline-block;
	float: right;
}

#infoBox {
	width: 574px;
	font-size: 20px;
	margin-top: -577px;
	border-left: 1px solid #ebebeb;
	padding: 40px;
	margin-right: 25px;
}

#p_name_ko {
	height: 56px;
	font-size: 16px;
	color: #808080db;
}

.rntPrice {
	margin-right: 39px;
	font-size: 13px;
	color: #7c7c7c;
}

#body {
	font-family: -apple-system, BlinkMacSystemFont, Roboto,
		AppleSDGothicNeo-Regular, NanumBarunGothic, NanumGothic, ëëęł ë,
		Segoe UI, Helveica, Arial, Malgun Gothic, Dotum, sans-serif;
	margin-left: 70px;
}

.buy {
	position: relative;
	border-radius: 10px;
	background-color: #41b979;
	border: 0;
	width: 220px;
	color: white;
	padding: 15px 5px 15px 5px;
	text-align: center;
}

.slick-dots {
	margin-bottom: 95px
}
#reviewContent input[type='text']{
	width: 710px;
    height: 50px;
}
#reviewContent{
	text-align: center;
}
#rAll{
	    margin-left: 153px;
    	margin-bottom: 10px;
}
#reviewDeleteBtn, #rpBtn{
	background-color: black;
		color: white;
		font-weight: 700;
    	min-width: 80px;
    	padding: 0 18px;
	    height: 37px;
	    border-radius: 5px;
	    font-size: 14px;
	    letter-spacing: -.14px;
}
#reviews{
	margin-left: 151px;
	border-collapse: collapse;
	margin-top: 39px;
}
#reviews tr{
	border-bottom: 1px solid gray;
}
#intrstRemoveBtn:active,#intrstBtn:active,#rsvtBtn:active,#prdtRemvBtn:active ,#prdtModBtn:active{
 		background-color: #5b9a78;
	}
	#rpBtn:active, #reviewDeleteBtn:active{
		background-color: rgba(34,34,34,.8);
	}
</style>
<jsp:include page="../include/header.jsp" />
<div id="body" style="margin-top: 70px;">
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="pri"/>
	</sec:authorize>
	<!-- ěí ě´ëŻ¸ě§-------------------------------------------------------- -->
	<div class="slick" style="width: 502px">
		<c:forEach var="image" items="${imageList }">
			<c:url value="/displayImage" var="url">
				<c:param name="fileName" value="${image.img_url }"/>
			</c:url>
			<div style="width: 700px">
				<img src="${url}"/>
			</div>
		</c:forEach>
	</div>
	<!-- ěí ěě¸ë´ěŠ-------------------------------------------------------- -->

	<div id="prdtInfo">
		<table id="infoBox">
			<tr>
				<td><span>${pvo.p_brand}</span></td>
				<td style="text-align: right;"><c:choose>
						<c:when test="${interestVO.cnt > 0}">
							<span class="interest">âĽ</span>
						</c:when>
						<c:otherwise>
							<span class="interest">âĄ</span>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<td colspan="2" style="max-width: 230px;">${pvo.p_name_en }</td>
			</tr>
			<tr>
				<td style="border-bottom: 1px solid #ebebeb; max-width: 230px;"
					colspan="2" id="p_name_ko">${pvo.p_name_ko }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 80px; text-align: right;">
					<div class="rntPrice">1ěź ę¸°ě¤ ëěŹę¸ěĄ</div>
					<div style="margin-right: 39px;">
						<fmt:formatNumber value="${pvo.r_price }" pattern="#,###,###ě"/>
					</div>
				</td>
			</tr>
			<tr>
				<td
					style="text-align: center; border-bottom: 1px solid #ebebeb; padding: 14px;">
					<sec:authorize access="hasRole('ROLE_USER')">
						<input class="buy" type="button" id="intrstRemoveBtn"
							value="ę´ěŹěíě­ě " />
						<input class="buy" type="button" id="intrstBtn" value="ę´ěŹěíěśę°" />
					</sec:authorize>
				</td>
				<td
					style="text-align: center; border-bottom: 1px solid #ebebeb; padding: 14px;">
					<sec:authorize access="hasRole('ROLE_USER')">
						<div>
							<input class="buy" id="rsvtBtn" type="button" value="ěíěě˝" />
						</div>
					</sec:authorize>
				</td>
			</tr>
			<tr style="font-size: 14px;">
				<td style="height: 85px; border-bottom: 1px solid #ebebeb;">
					<div style="font-weight: 500;">ëŞ¨ë¸ë˛í¸</div>
					<div>${pvo.p_model_no }</div>
				</td>
				<td style="border-bottom: 1px solid #ebebeb;">
					<div
						style="font-weight: 500; border-left: 1px solid #ebebeb; padding: 15px 30px 0px;">ěśěę°</div>
					<div style="border-left: 1px solid #ebebeb; padding: 0px 30px 15px;">
						<fmt:formatNumber value="${pvo.p_release_price }" pattern="#,###,###ě"/>
					</div>
				</td>
			</tr>
			<tr>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td style="text-align: center; padding: 14px;"><input
						id="prdtModBtn" class="buy" type="button" value="ěíěě " /></td>
					<td style="text-align: center; padding: 14px;">
						<form id="removePrdtForm" action="/rental/removeRntPrdt"
							method="post">
							<input class="buy" type="button" id="prdtRemvBtn" value="ěíě­ě " />
							<input type="hidden" name="p_no" value="${pvo.p_no }">
						</form>
					</td>
				</sec:authorize>
			</tr>
		</table>
	</div>
	<!-- íě¤í ëąëĄ-------------------------------------------------------- -->
	<sec:authorize access="isAuthenticated()">
		<form id="reviewForm"  method="post">
			<!--ëłě   -->
			<div id="rAll">
				<span id="1" data-rval="n">â</span> 
				<span id="2" data-rval="n">â</span>
				<span id="3" data-rval="n">â</span> 
				<span id="4" data-rval="n">â</span>
				<span id="5" data-rval="n">â</span>
			</div>

			<div id="reviewContent">
				<input type="text" placeholder="íě¤íě ë¨ę˛¨ěŁźě¸ě.(ěľë 30ě)" name="rp_content" maxlength="30" /> 
				<sec:authorize access="isAuthenticated()">
					<input type="button" id="rpBtn" value="íě¤í ëąëĄ" />
				</sec:authorize>
				<input type="hidden" name="p_no" value="${pvo.p_no }" /> 
				<input id="rst" type="hidden" name="rating" />
			</div>
		</form>
	</sec:authorize>






	<!-- íě¤í ëŚŹě¤í¸ ěśë Ľ--------------------------------------------------------------------------- -->
	<table class="table table-stripped" id="reviews">
		<thead>
			<tr>
				<th style=" height: 37px;">Rating</th>
				<!-- íě  -->
				<th style="width: 125px; text-align: center;">User</th>
				<th style="width: 469px;">Text</th>
				<th></th>
			</tr>
		</thead>
		<tbody id="reviewList">
		</tbody>
	</table>

</div>



<script type="text/javascript" src='/resources/js/page/rental/slick.min.js'></script>
<script type="text/javascript">
	
	var $ = jQuery.noConflict();	// jěżźëŚŹ ěśŠë ë§ę¸° ěí´ě ě ě´ě¤
	// -------------------------------------------------------------------------------------onload start
	$(function(){
		// íě´ě§ ëĄëě cntę° 0ëł´ë¤ í´ę˛˝ě°(ę´ěŹěí ěśę°ę° ëě´ěëę˛˝ě°) ę´ěŹěíě­ě  ë˛íźěźëĄ ëł´ě´ę˛
		if("${interestVO.cnt}"> 0){
			$("#intrstBtn").hide();
		}else{
			$("#intrstRemoveBtn").hide();
		}
		
		// ëę¸ ëśëŹě¤ę¸°
		getReview();
		
		
		
		// ěí ěě  ë˛íź í´ëŚ­ ě´ë˛¤í¸----------------------------------------------------------
		$("#prdtModBtn").on("click", function(){
			location.href="/rental/updateRntPrdtPage?p_no=${pvo.p_no}";
		});
		
		// ěŹě§ ěŹëźě´ë í¨ęłź ěŁźę¸°ěí ěľě
		$('.slick').slick({
			  dots: true, //íě´ě§ ë¤ëšę˛ě´ě
			  arrows:true, // next, prev ě´ë ë˛íź
			  autoplay:true, // ěë ëęš ěŹëś
			  infinite: false, //ë°ëłľě¤ě 
			  speed: 300, //ěŹëźě´ë ěë
			  autoplaySpeed : 10000,   // ěë ëęšě ěŹëźě´ë ěę°
			  pauseOnHover : true,// ë§ě°ě¤ hoverě ěŹëźě´ë ëŠěś¤
			  vertical : false,  // ě¸ëĄ ë°ŠíĽ ěŹëźě´ë ěľě
			  prevArrow : "<button type='button' class='slick-prev' value=â>Previous</button>",        
			  nextArrow : "<button type='button' class='slick-next'value=â>Next</button>", //íě´í ěť¤ě¤í
			  slidesToShow: 1, //ëł´ěŹě§ ěŹëźě´ë ě
			  slidesToScroll: 1, //ëę˛¨ě§ ěŹëźě´ë ě
			  responsive: [ // -> ë°ěí ěľě
			    {
			      breakpoint: 480,// ë°ěí ~ 480
			      settings: {
			        slidesToShow: 1,
			        slidesToScroll: 1
			      }
			    }
			 ]
		});
		
		// ěí ě­ě  ë˛íź í´ëŚ­ ě´ë˛¤í¸--------------------------------------------
		$("#prdtRemvBtn").on("click", function(){
			if(confirm("ěíě ě­ě íěę˛ ěľëęš?")){
				$("#removePrdtForm").submit();
			}else{
				return;
			}
		});
		
		// ëłě  ě íě ěěš ----------------------------------------------------
		$("#rAll").on("click", function(){
			var idx = event.target.id;
			var str = '';
			/* event.target : í´ëŚ­ě´ ë ěě , event.type : ě´ë˛¤í¸ íěě ěë ¤ě¤(ex)click, keyboard, mouse ëąëą) */
			if(event.target.tagName=='SPAN'){
				for(var i=0; i<5; i++){
					if(i<idx){
						str += '<span id='+(i+1)+'>â&nbsp;</span>';
					}else{
						str += '<span id='+(i+1)+'>â&nbsp;</span>';
					}
				}
				$("#rst").val(idx);
				$("#rAll").html(str);
			
			}
		});
		
		// ëę¸ ě íŠěą ę˛ěŹ-------------------------------------------------------------------
		$("#rpBtn").on("click", function(){

			var rst = $("#rst").val();
			var rp_content = $("input[name='rp_content']").val();
			
			if(rst == '' || rst == 0){
				alert("ëłě ě ě íí´ěŁźě¸ě.");
				return;
			}
			if(rp_content.length < 10){
				alert("10ě ě´ě ěë Ľí´ěŁźě¸ě.");
				return;
			}
			
			$.ajax({
				type : "POST",            
		         url : "/rental/ajax/rgstReview",      
		         data : $("#reviewForm").serialize(), 
		         success : function(result){
		        	 if(result>0){
			        	 getReview();
		        	 }else{
						console.log("ëę¸ ëąëĄ ě¤í¨");        		 
		        	 }
		         }			
			});
		});
		// ěíěě˝ ë˛íź í´ëŚ­ ě´ë˛¤í¸------------------------------------------------------------
		$("#rsvtBtn").on("click", function(){
			location.href="/rsvt/rsvtPage?p_no=${pvo.p_no}";
		});
		
		// ę´ěŹ ěí ë˛íź í´ëŚ­ ě´ë˛¤í¸-----------------------------------------------------------
		$("#intrstBtn").on("click", function(){
			interestAjax('insert');
		});
		
		
		// ę´ěŹ ěí ě­ě  ë˛íź í´ëŚ­ ě´ë˛¤í¸-----------------------------------------------------------
		$("#intrstRemoveBtn").on("click", function(){
			interestAjax('remove');	
		});
		
		
		
		
		
		
		
	});
	// -------------------------------------------------------------------------------------onload end
	
	function interestAjax(type){
		var url = '';
		if(type == 'insert'){
			url = "/rental/insertInterest";
		}else{
			url = "/rental/removeInterest";
		}
		
		$.ajax({
            type : "POST",            
            url : url,      
            data : {p_no: "${pvo.p_no}"},
            dataType : 'json',
            success : function(result){
				if(result>0){
					if(type == 'insert'){
						$(".interest").html("âĽ");
						$("#intrstBtn").hide();
						$("#intrstRemoveBtn").show();
					}else{
						$(".interest").html("âĄ");
						$("#intrstRemoveBtn").hide();
						$("#intrstBtn").show();
					}
				}else{
					alert("ę´ěŹ ěí " + (type == 'insert' ? 'ěśę°' : 'ě­ě ') + "ëĽź ě¤í¨íěěľëë¤.")
				}
            }
        });
	}
	
	// ëę¸ ëśëŹě¤ë ajax---------------------------------------------------
	function getReview(){
		
		$.ajax({
			 type : "POST",            
	         url : "/rental/ajax/getReview",      
	         data : {p_no: "${pvo.p_no}"},
	         dataType : 'json',
	         success : function(reviewList){
		        
	        	 var str='';
	        	 if(reviewList.length){
		        	 for(var i=0; i<reviewList.length; i++){
		        		
		        		str += '<tr>';
		        		str += '<td style=" height: 37px;">';
		        		for(var j=0; j<5; j++){
		        			if(reviewList[i].rating>j){				// reviewList[i] -> objectííëĄ ë§ę¸ë°ě´í°ëĽź ë¤ęł ěě ăŁëŤă
				        		str += '<span>â&nbsp;</span>';
		        			}else{
				        		str += '<span>â&nbsp;</span>';
		        			}
		        		}
		        		str += '</td>';
		        		str += '<td>'+reviewList[i].m_nickname+'</td>';
		        		str += '<td>';
		        		str += '<span>'+reviewList[i].rp_content+'</span>'; 
		        		str += '</td>';
		        		str += '<td>';
		        		if("${pri.m_no}"==reviewList[i].m_no || "${pri.authList[0].auth}"=='ROLE_ADMIN'){
			        		str += '<input type="button" id="reviewDeleteBtn" onclick="goRemoveReview('+reviewList[i].rp_idx+','+reviewList[i].p_no+')" value="ě­ě ">';
		        		}
		        		str += '</td>';
		        		str += '</tr>';
		        		 
		        	 }
	        	 }else{
	        		 str = '<tr><td colspan="4" style=" height: 37px;">ëę¸ě´ ěěľëë¤.</td></tr>';
	        	 }
		         $("#reviewList").html(str);
	         }
		}); 
		
		
	}
	
	// ëę¸ ě­ě íë í¨ě-------------------------------------------------------
	
	function goRemoveReview(rp_idx,p_no){
		
		var f = document.createElement('form');
		var obj1;
		obj1 = document.createElement('input');
		obj1.setAttribute('type', 'hidden');
		obj1.setAttribute('name', "rp_idx");
		obj1.setAttribute('value', rp_idx);
		
		var obj2;
		obj2 = document.createElement('input');
		obj2.setAttribute('type', 'hidden');
		obj2.setAttribute('name', "p_no");
		obj2.setAttribute('value', p_no);
		
		f.appendChild(obj1);
		f.appendChild(obj2);
		f.setAttribute('method', 'post');
		//f.setAttribute('action', '/rental/removeReview');
		document.body.appendChild(f);
		
		$.ajax({
			type : "POST",            
	         url : "/rental/ajax/removeReview",      
	         data : $(f).serialize(), // createElementë jěżźëŚŹ ëŹ¸ë˛ě´ ěëëŻëĄ serializeěŹěŠě ěí´ fëĽź jěżźëŚŹëĄ ë°ężě¤ěźí¨
	         success : function(result){
	        	 if(result>0){
		        	 getReview();
	        	 }else{
					console.log("ëę¸ ě­ě  ě¤í¨");        		 
	        	 }
	         }			
		});
		
		
	}
	
	
	



</script>

<jsp:include page="../include/footer.jsp" />