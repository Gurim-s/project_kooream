<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../include/header.jsp"/>

	<style type="text/css">
	/* section calendar */
	
	.sec_cal {
	    width: 575px;
	    margin: 0 auto;
	    font-family: "NotoSansR";
	}
	
	.sec_cal .cal_nav {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    font-weight: 700;
	    font-size: 48px;
	    line-height: 78px;
	}
	
	.sec_cal .cal_nav .year-month {
	    width: 300px;
	    text-align: center;
	    line-height: 1;
	}
	
	.sec_cal .cal_nav .nav {
	    display: flex;
	    border: 1px solid #333333;
	    border-radius: 5px;
	}
	
	.sec_cal .cal_nav .go-prev,
	.sec_cal .cal_nav .go-next {
	    display: block;
	    width: 50px;
	    height: 78px;
	    font-size: 0;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.sec_cal .cal_nav .go-prev::before,
	.sec_cal .cal_nav .go-next::before {
	    content: "";
	    display: block;
	    width: 20px;
	    height: 20px;
	    border: 3px solid #000;
	    border-width: 3px 3px 0 0;
	    transition: border 0.1s;
	}
	
	.sec_cal .cal_nav .go-prev:hover::before,
	.sec_cal .cal_nav .go-next:hover::before {
	    border-color: #ed2a61;
	}
	
	.sec_cal .cal_nav .go-prev::before {
	    transform: rotate(-135deg);
	}
	
	.sec_cal .cal_nav .go-next::before {
	    transform: rotate(45deg);
	}
	
	.sec_cal .cal_wrap {
	    padding-top: 40px;
	    position: relative;
	    margin: 0 auto;
	}
	
	.sec_cal .cal_wrap .days {
	    display: flex;
	    margin-bottom: 20px;
	    padding-bottom: 20px;
	    border-bottom: 1px solid #ddd;
	}
	
	.sec_cal .cal_wrap::after {
	    top: 368px;
	}
	
	.sec_cal .cal_wrap .day {
	    display:flex;
	    align-items: center;
	    justify-content: center;
	    width: calc(100% / 7);
	    text-align: left;
	    color: black;
	    font-size: 12px;
	    text-align: center;
	    border-radius:5px
	}
	
	.current.today {background: rgb(242 242 242);}
	
	.sec_cal .cal_wrap .dates {
	    display: flex;
	    flex-flow: wrap;
	    height: 290px;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n ) {
	    color: #3c6ffa;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n+1) {
	    color: #ed2a61;
	}
	
	.sec_cal .cal_wrap .day.disable {
	    color: #ddd;
	}
	
	.gray{
		background-color: gray;
	}
	.selectionDay{
		background-color: rgb(242 242 242);
	}
	
	.rnt{
		background-color: #030001ba;
		color: white !important;
	}
	input[type=button],.choose{
		cursor: pointer;
	}
	/* .dontClick{
		pointer-events : none;
	} */
	a[class='go-prev']:hover{
		background-color: white;
	}
	#payBtn{
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
	#rntInfo div{
		font-size: 19px;
		font-family: -apple-system, BlinkMacSystemFont, Roboto,
		AppleSDGothicNeo-Regular, NanumBarunGothic, NanumGothic, ????????????,
		Segoe UI, Helveica, Arial, Malgun Gothic, Dotum, sans-serif;
		font-weight: bold;
    	padding: 7px;
    	
	}
	#rntInfo{
		width: 550px;
  	    float: right;
  	    margin-top: 26px;
	}
	
  	  
	#stDayView,#edDayView{
		display: inline-block;
		width: 250px;
		border-bottom: 1px solid gray;
	}
	#payBtn:active{
		background-color: rgba(34,34,34,.8);
	}
</style>

</head>
<body>
<div class="sec_cal">
  <div class="cal_nav">
    <a href="javascript:;" class="nav-btn go-prev">prev</a>
    <div class="year-month"></div>	<!-- ?????? ??? ?????? -->
    <a href="javascript:;" class="nav-btn go-next">next</a>
  </div>
  <div class="cal_wrap">
    <div class="days">
    	<div class="day" style="display: none;"></div>
        <div class="day">MON</div>
        <div class="day">TUE</div>
        <div class="day">WED</div>
        <div class="day">THU</div>
        <div class="day">FRI</div>
        <div class="day">SAT</div>
        <div class="day">SUN</div>
    </div>
    <div class="dates">  <!-- ?????? ?????? (1~31) -->
    	
    </div>
  </div>
</div>
<div id="rntInfo">
	<div id="stDayView">??????????????? : <span id="stDayValue"></span></div>
	<div id="edDayView">??????????????? : <span id="edDayValue"></span></div>
	<div style="text-align: right;">
		???????????? : <span id="rntPrice"><fmt:formatNumber value="${pVO.r_price}" pattern="###,###,###"/></span>???
	</div>
	<form id="myForm" action="/Payment/goRnt_paymentPage" style="text-align: right;">
		<input type="hidden" name="strt_r_date">
		<input type="hidden" name="rtrn_r_date">
		<input type="hidden" name="p_no" value="${p_no }">
		<input type="hidden" name="total_price"><!-- ??? ???????????? -->
		<input type="button" id="payBtn" value="????????????">
	</form>
</div>

</body>
<script type="text/javascript">
$(document).ready(function() {
	var list='';
	
	calendarInit();
    
	// ???????????? ?????? ???????????????
	$("#payBtn").on("click",function(){
		if($("input[name='strt_r_date']").val() && $("input[name='rtrn_r_date']").val()){
			$("#myForm").submit();
		}else{
			alert("?????? ?????? ????????? ??????????????????.");
			return; 
		}
	});
	
	
	
});
/*
    ?????? ????????? ??? ??? ????????? ?????? ?????? 

    ?????? ???(????????? : ?????? ??????)
    ?????? ???????????? ????????? ??????
    ?????? ???????????? ????????? ??????
*/
// ??????????????? ?????? ??????
var totalPrice = "${pVO.r_price}"*1

function calendarInit() {
	
    // ?????? ?????? ????????????
    var date = new Date(); // ?????? ??????(?????? ??????) ????????????
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct ????????? ??????
    var kstGap = 9 * 60 * 60 * 1000; // ?????? kst ???????????? ?????????
    var today = new Date(utc + kstGap); // ?????? ???????????? date ?????? ?????????(??????)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate()); 
    // ???????????? ???????????? ?????? ??????
    
    var currentYear = thisMonth.getFullYear(); // ???????????? ???????????? ???
    var currentMonth = thisMonth.getMonth(); // ???????????? ???????????? ???
    var currentDate = thisMonth.getDate(); // ???????????? ???????????? ???

    // kst ?????? ????????????
    // console.log(thisMonth);

    // ????????? ?????????
    renderCalender(thisMonth);

    function renderCalender(thisMonth) { //-------------------------------------------renderCalender start

        // ???????????? ?????? ????????? ??????
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();	// (0~11)
        currentDate = thisMonth.getDate();		// (1~31)

        // ?????? ?????? ????????? ??? ????????? ?????? ?????????
        var startDay = new Date(currentYear, currentMonth, 0);	// ????????? ???????????????(ex)2022??? 12??? 31??? ?????????)
        // var startDay = new Date(currentYear, currentMonth, 1); ->  ????????? ????????? ??????(ex)2023??? 1??? 1??? ?????????)
        var prevDate = startDay.getDate();	// ???
        var prevDay = startDay.getDay();	// ??????

        // ?????? ?????? ???????????? ????????? ?????? ?????????
        var endDay = new Date(currentYear, currentMonth + 1, 0); // (ex)1??? 31??? ?????????)
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);	// ??????(0~6) : (???~???)
		// ?????? : 31 6 31 2
        
        
        // ?????? ???,??? ??????
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));
        
        // ????????? html ?????? ??????. ??????(1~31) ??????
        calendar = document.querySelector('.dates');
        
        calendar.innerHTML = '<span class=startTag></span>';
        
        var lastMonth = startDay.getMonth();
        var lastYear = startDay.getFullYear();
        var lastDay = prevDate - prevDay + 1;
        
        var myDate = new Date(lastYear, lastMonth, lastDay);
        console.log(myDate);
		// ???????????? ?????? ????????? ?????? ????????? ??????-----------------------------
        if(currentMonth == today.getMonth()){
        	$(".go-prev").addClass("dontClick");
        }else{
        	$(".go-prev").removeClass("dontClick");
        }
        // ????????? ???????????? ??????
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {	// i = 26; 6??? ??????(26~31)
        	if(myDate.toJSON().substring(0,10) > today.toJSON().substring(0,10)){
	        	myDate.setDate(myDate.getDate()+1);
	        	calendar.innerHTML = calendar.innerHTML + '<div class="day choose color prev disable" value="'+myDate.toJSON().substring(0,10)+'">' + i + '</div>';
 				       	
        	}else{
        		calendar.innerHTML = calendar.innerHTML + '<div class="day color prev disable">' + i + '</div>';
        	}
        }
        // ?????????
        var date = new Date(thisMonth)
        var originMonth = today.getMonth();
        if(currentMonth == originMonth){
        	date = today;
        }
        for (var i = 1; i <= nextDate; i++) {
        	if(i<today.getDate() && currentMonth == originMonth){ // currentMonth: ???????????? ????????? ???-1, originMonth: ?????? ???-1
        		calendar.innerHTML = calendar.innerHTML + '<div class="day color prev disable">' + i + '</div>';	// ????????? ?????? ????????????
        	}else{
        		
	        	calendar.innerHTML = calendar.innerHTML + '<div class="day choose color current" value="'+ date.toJSON().substring(0,10) +'">' + i + '</div>';
	        	// thisMonth.toJSON().substring(0,10) : 2022-10-11??? Date?????? ???????????? ?????????. ?????????????????? >,<????????? ???????????????
	        	date.setDate(date.getDate()+1);
        	}
        	
        }

        // ?????????
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
        	
            calendar.innerHTML = calendar.innerHTML + '<div class="day choose color next disable" value="'+ date.toJSON().substring(0,10) +'">' + i + '</div>';
            date.setDate(date.getDate()+1); 
        }
        
        // ?????? ?????? ???????????? ??????????????? ajax. ?????? ??????????????? ???????????? ????????? ajax??? ??????
        $.ajax({
        	   type : "POST",            
               url : "/rsvt/ajax/getRsvt",      
               data : {p_no:"${p_no}"}, 
               dataType : 'json',
               success : function(result){
               		 list = result; // list ??????????????? result ??????
            	   var stVal = '';
            	   var edVal = '';
            	   for(var i=0; i<result.length; i++){
  					 	stVal = result[i].strt_r_date;
  					 	edVal = result[i].rtrn_r_date;
            		   
                 		$("div[value="+stVal+"]").addClass("rnt");
                 	 	$("div[value="+edVal+"]").addClass("rnt");
                 		
                 	 	var stagIdx = $("div[value="+stVal+"]");
                 	 	var etagIdx = $("div[value="+edVal+"]");
                 		
                 	 	if($("div[value="+stVal+"]").length){
	                 	 	while(!(stagIdx.next().hasClass("rnt")) && stagIdx.next().length){
	                 			stagIdx.next().addClass("rnt");
	                 			stagIdx = stagIdx.next();
	                 		}
                 		}else{
                 			while(!(etagIdx.prev().hasClass("rnt")) && etagIdx.prev().length){
	                 			etagIdx.prev().addClass("rnt");
	                 			etagIdx = etagIdx.prev();
                 			}
                 		}
            	   }
               }
        });
        
        
        
        
        
        
        calendar.innerHTML += '<span class=endTag></span>';
        
        
        // ????????? ?????? ???????????? ??????????????? ??????????????? ????????? ????????? ??????????????? ?????? ??????
        var startVal = $("input[name='strt_r_date']").val();
        var endVal = $("input[name='rtrn_r_date']").val();
        // ???????????? ?????? ??? ???(value)??? ?????? div??? ?????????
        if($("div[value='"+ startVal +"']").length){
        	$("div[value='"+ startVal +"']").addClass("gray");
        }
     	// ????????? ?????? ??? ???(value)??? ?????? div??? ?????????
        if($("div[value='"+ endVal +"']").length){
        	$("div[value='"+ endVal +"']").addClass("gray");
        }
     	// ?????? ?????? ???????????? start??? ???????????? ?????? ?????? ???????????? ???????????? ????????? ?????? ????????? ????????? ??????????????? ???????????????
        if($("div[value='"+ startVal +"']").length && endVal){
        	// start??? end ?????? ??????????????? ?????????
    		var idx = $("div[value=" + startVal + "]");
    		var wCnt = 0;
    		
    		// idx ??????????????? gray???????????? ?????? j?????? ????????? ?????? idx ??????????????? ?????????
        	while(!idx.next().hasClass("gray") && idx.next().length){ // j??????????????? ?????????????????? ???????????? ???????????? ????????? ??????. ????????? length??? ?????? ????????? ??????
				if(wCnt==31){
					alert("31??? ????????? ???????????? ??? ????????????.");
					break;
				}
        		// idx??? j?????? ????????? ?????? ???????????? classList??? ????????? ??? ??????????????? addClass()??? ????????????. 
				idx.next().addClass("selectionDay");
				idx = idx.next(); 	// ????????? ????????? ??????????????? ?????????.
				wCnt += 1;
    		}
        }else if(startVal && $("div[value='"+ endVal +"']").length){
        // input start??? value?????? ????????? ????????? ????????? startvalue??? ?????? div??? ?????????
        	// start??? end ?????? ??????????????? ?????????
    		var idx = $("div[value=" + startVal + "]").length ? $("div[value=" + startVal + "]") : $($(".startTag")[0]); 
    		var wCnt = 0;
        	while(!idx.next().hasClass("gray")){
				if(wCnt==31){
					alert("31??? ????????? ???????????? ??? ????????????.");
					break;
				}
        		// idx??? j?????? ????????? ?????? ???????????? classList??? ????????? ??? ??????????????? addClass()??? ????????????. 
				idx.next().addClass("selectionDay");
				idx = idx.next(); 	// ????????? ????????? ??????????????? ?????????.
				wCnt += 1;
    		}
        }
     	
        
        
        
        // ?????? ?????? ??????
        if (today.getMonth() == currentMonth) { // 0 == 0
            todayDate = today.getDate();	// ?????? '???'
            console.log(todayDate);	
            
            // currentMonthDate -> ??????(?????????)??? ?????? ???????????? ???????????? ????????? 9??? ?????? 10~31???
            var currentMonthDate = document.querySelectorAll('.dates .current');	// .dates ?????? .day current??? ???????????? ?????? ??????. ??????????????? class??? ????????? ?????? ???????????? ????????? ??? ??????.
       		// console.log(currentMonthDate);
            currentMonthDate[0].classList.add('today');	// classList : ??????????????? ????????? ?????? ?????? ???????????? ??????????????? ?????????
            // class.add??? ????????? classList.add ???????????????. today?????? ??????????????? ?????????????????? ????????? ?????????????????? css??? ?????????
            // ??????????????? ????????? html??? ?????? ??????????????? remove??? ?????? ??????
        }
    
        // ?????? ????????? ?????? ?????????=====================================================
        $(".day.choose").on("click", function(){
        	// ????????? ????????? ?????????????????? return
        	if($(this).hasClass("rnt")){
        		alert("?????? ???????????? ????????? ???????????? ???????????? ??? ????????????.");
        		return;
        	}
        	
        	// value ?????? ???????????? ????????? ?????? ????????? ????????? ???????????????
        	var thisValue = $(this).attr("value");
        	var startValue = $("input[name='strt_r_date']").val();
        	var endValue= $("input[name='rtrn_r_date']").val();
        	
        	if(!$("input[name='strt_r_date']").val()){
        	// ???????????? ?????????????????? ?????????
    	    	this.classList.add("gray"); 	// classList??? html??? ?????? ??????????????? j???????????? ?????? ???????????? ????????? $(this)??? ?????? this??? ????????????.
    	    	$("input[name='strt_r_date']").val(thisValue);
    	    	$("input[name='strt_r_date']").change();	// change ???????????? ?????? ?????? ?????? ????????? change?????? ?????????
        	
        	}else if(!endValue && startValue < thisValue){
        	// start??? ???????????? ????????? end?????? ???????????? ??????
        		
        		for(var i=0; i<list.length; i++){
        			if(startValue < list[i].strt_r_date && thisValue > list[i].rtrn_r_date){
        				alert("???????????? ?????? ????????? ??????????????? ?????? ??????????????? ???????????? ??? ????????????.");
        				return;
        			}
        		}
        	
        		this.classList.add("gray");
        		$("input[name='rtrn_r_date']").val(thisValue);
        		$("input[name='rtrn_r_date']").change();
        		
        		// start??? end ?????? ??????????????? ?????????
        		
        		var idx = $("div[value=" + startValue + "]").length ? $("div[value=" + startValue + "]") : $($(".startTag")[0]); 
        		//$($(".day")[0]) -> $(".day")[0]??? ??????????????? ???????????? ????????? ??????????????? ????????? ????????? ????????????????????? ??????????????????
        		var wCnt = 0;
        		
        		while(!idx.next().hasClass("gray")){
        			if(wCnt==31){
    					alert("31??? ????????? ???????????? ??? ????????????.");
    					break;
    				}
					// idx??? j?????? ????????? ?????? ???????????? classList??? ????????? ??? ??????????????? addClass()??? ????????????. 
					idx.next().addClass("selectionDay");
					idx = idx.next(); 	// ????????? ????????? ??????????????? ?????????.
					wCnt += 1;
					
        		}
        		
        		
        		
        	}else if(startValue == thisValue){
        	// start ?????? ??? ?????? ?????? ????????? ????????? ??????
        		this.classList.remove("gray");	// gray??????????????? ?????????????????? ????????? ??????
        		$("input[name='strt_r_date']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay"); // ?????????????????? start??? end??? ????????? ?????? ??? ????????? ?????? ???????????? css??? ?????????
        		$("input[name='strt_r_date']").change();
        		if(endValue){
        			$("input[name='strt_r_date']").val(endValue);
        			$("input[name='rtrn_r_date']").removeAttr("value");
        			$("input[name='strt_r_date']").change();
        			$("input[name='rtrn_r_date']").change();
        		}
        		
        		
        	}else if(endValue == thisValue){
        	// end ?????? ??? ?????? ?????? ????????? ????????? ??????
        		this.classList.remove("gray");
        		$("input[name='rtrn_r_date']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay");
        		$("input[name='rtrn_r_date']").change();
        	
        	}
        	else if($("[name='strt_r_date']").val() && $("[name='rtrn_r_date']").val()){
        	// start, end ??? ????????? ??? ?????? ?????? ????????? ??????
        		$(".gray").removeClass("gray");	// gray ??????????????? ?????? ???????????? ???????????? gray ???????????? ??????. j????????? ?????????????????? removeClass();??? ????????????.
        		$("input[name='strt_r_date']").removeAttr("value");	
        		$("input[name='rtrn_r_date']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay");
        		$("input[name='strt_r_date']").change();
        		$("input[name='rtrn_r_date']").change();
        		
        		
        	}
        	else if(startValue > thisValue){
        	// start ?????? ??? end ????????? start?????? ????????? ????????? ???????????? ??????
        		if(thisValue <= today.toJSON().substring(0,10)){
        		// ????????? end ????????? ????????? ???????????? ??? ????????? ????????? ?????? ???????????????.
        			alert("??????????????? ???????????? ??? ????????????.");
        			return;
        		}else{
        		// ????????? end ????????? ???????????? ?????? ????????? start?????? ????????? ??????
        			for(var i=0; i<list.length; i++){
            			if(thisValue < list[i].strt_r_date && startValue > list[i].rtrn_r_date){
            				alert("???????????? ?????? ????????? ??????????????? ?????? ??????????????? ???????????? ??? ????????????.");
            				return;
            			}
            		}
        		
        			this.classList.add("gray");
        			$("input[name='strt_r_date']").val(thisValue);
        			$("input[name='strt_r_date']").change();
        			$("input[name='rtrn_r_date']").val(startValue);
        			$("input[name='rtrn_r_date']").change();
        			
        			// start??? end ?????? ??????????????? ?????????
            		var idx = $("div[value=" + $("input[name='rtrn_r_date']").val() + "]").length ? $("div[value=" + $("input[name='rtrn_r_date']").val() + "]") : $($(".endTag")[0]);
            		var wCnt = 0;
        			while(!idx.prev().hasClass("gray")){
            			if(wCnt==31){
        					alert("31??? ????????? ???????????? ??? ????????????.");
        					break;
        				}
    					// idx??? j?????? ????????? ?????? ???????????? classList??? ????????? ??? ??????????????? addClass()??? ????????????. 
    					idx.prev().addClass("selectionDay");
    					idx = idx.prev(); 	// ????????? ????????? ??????????????? ?????????.
    					wCnt += 1;
            		}
        		}
        	
        	}
        });
    
    	// input change??? ??????????????? ?????????????????? input[name='strt_r_date']??? value?????? ?????????
        $("input[name=strt_r_date]").change(function(){
        	$("#stDayValue").text($("input[name='strt_r_date']").val());
        });
     	// input change??? ??????????????? ?????????????????? input[name='rtrn_r_date']??? value?????? ?????????
        $("input[name=rtrn_r_date]").change(function(){
        	$("#edDayValue").text($("input[name='rtrn_r_date']").val());
        	
        	// ????????? ???????????? ????????? input??? ????????? value ?????? ??????
    		$("input[name='pay']").removeAttr("value");
            $("#rntPrice").html(totalPrice.toLocaleString('ko-KR'));
        	
            // ????????????, ???????????? ??????-------------------------------------------------
        	if($("input[name=strt_r_date]").val && $("input[name=rtrn_r_date]").val()){
	        	var stDate = new Date($("input[name='strt_r_date']").val());
	            var edDate = new Date($("input[name='rtrn_r_date']").val());
	        	// ???????????? ?????????????????? ??????
	            var msStDate = stDate.getTime();
	        	var msEdtDate = edDate.getTime();
	        	// ????????????
	            var period = (msEdtDate-msStDate)/86400000;
	            var periodPrice = "${pVO.r_price}";
	            // ???????????? ????????? ????????????
	        	var rntPrice = periodPrice*period+(periodPrice*1);
	        	$("input[name='total_price']").val(rntPrice);
	            $("#rntPrice").html(rntPrice.toLocaleString('ko-KR')); // toLocaleString('ko-KR') : ###,###,###?????? ??????
	            
        		
        	}
        });
    
    	// ????????? ?????? ????????? ???????????? ???????????? ?????? for??? ?????? today??? ????????? ??????????????? today??? ????????????
        date = new Date(); // ?????? ??????(?????? ??????) ????????????
        utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct ????????? ??????
        kstGap = 9 * 60 * 60 * 1000; // ?????? kst ???????????? ?????????
        today = new Date(utc + kstGap); // ?????? ???????????? date ?????? ?????????(??????)
    
    
    
    
    
    }//-----------------------------------------------------------------------renderCalender() end
	
    
    
    // ???????????? ??????
    $('.go-prev').on('click', function() {
    	if(!$(".go-prev").hasClass("dontClick")){
	        thisMonth = new Date(currentYear, currentMonth - 1, 2);	// 2022-12-1
	        //if(thisMonth.getFullYear() == today.getFullYear() && thisMonth.getMonth() == today.getMonth()){
	        //	thisMonth = today;
	        //}
	        renderCalender(thisMonth);
    	}else{
    		alert("????????? ?????? ???????????? ?????? ???????????????.");
    		return false;
    	}
    });

    // ???????????? ??????
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 2); // 2023-2-1
        //if(thisMonth.getFullYear() == today.getFullYear() && thisMonth.getMonth() == today.getMonth()){
        //	thisMonth = today;
        //}
        renderCalender(thisMonth); 
    });
    
}
</script>
	
<jsp:include page="../include/footer.jsp"/>