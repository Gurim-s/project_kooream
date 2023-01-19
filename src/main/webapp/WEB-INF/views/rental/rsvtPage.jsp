<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
	<style type="text/css">
	/* section calendar */
	
	.sec_cal {
	    width: 360px;
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
	    color: #999;
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
	
	.sec_cal .cal_wrap .day:nth-child(7n -1) {
	    color: #3c6ffa;
	}
	
	.sec_cal .cal_wrap .day:nth-child(7n) {
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
		background-color: pink;
	}
	input[type=button],.choose{
		cursor: pointer;
	}
</style>

</head>
<body>
<div class="sec_cal">
  <div class="cal_nav">
    <a href="javascript:;" class="nav-btn go-prev">prev</a>
    <div class="year-month"></div>	<!-- 현재 월 표기 -->
    <a href="javascript:;" class="nav-btn go-next">next</a>
  </div>
  <div class="cal_wrap">
    <div class="days">
      <div class="day">MON</div>
      <div class="day">TUE</div>
      <div class="day">WED</div>
      <div class="day">THU</div>
      <div class="day">FRI</div>
      <div class="day">SAT</div>
      <div class="day">SUN</div>
    </div>
    <div class="dates">  <!-- 날짜 표기 (1~31) -->
    	
    </div>
  </div>
</div>
<div id="stDayView">대여시작일 : <span id="stDayValue"></span></div>
<div id="edDayView">대여종료일 : <span id="edDayValue"></span></div>
<div>
	대여금액 : <span id="rntPrice"><fmt:formatNumber value="${pVO.r_price}" pattern="###,###,###"/></span>원
</div>
<form id="myForm" action="/rsvt/rgstRsvt" method="get">
	<input type="hidden" name="strt_r_date">
	<input type="hidden" name="rtrn_r_date">
	<input type="hidden" name="p_no" value="${p_no }">
	<input type="hidden" name="pay">
	<input type="button" id="payBtn" value="결제하기">
</form>

</body>
<script type="text/javascript">
$(document).ready(function() {
	var list='';
	
	calendarInit();
    
	// 결제하기 버튼 클릭이벤트
	$("#payBtn").on("click",function(){
		if($("input[name='strt_r_date']").val() && $("input[name='rtrn_r_date']").val()){
			$("#myForm").submit();
		}else{
			alert("예약 하실 날짜를 선택해주세요.");
			return; 
		}
	});
	
	
	
});
/*
    달력 렌더링 할 때 필요한 정보 목록 

    현재 월(초기값 : 현재 시간)
    금월 마지막일 날짜와 요일
    전월 마지막일 날짜와 요일
*/
// 대여금액을 위한 상수
var totalPrice = "${pVO.r_price}"*1

function calendarInit() {
	
    // 날짜 정보 가져오기
    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
  
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate()); 
    // 달력에서 표기하는 날짜 객체
    
    var currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
    var currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
    var currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

    // kst 기준 현재시간
    // console.log(thisMonth);

    // 캘린더 렌더링
    renderCalender(thisMonth);

    function renderCalender(thisMonth) { //-------------------------------------------renderCalender start

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();	// (0~11)
        currentDate = thisMonth.getDate();		// (1~31)

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);	// 이전달 마지막날짜(ex)2022년 12월 31일 토요일)
        // var startDay = new Date(currentYear, currentMonth, 1); ->  이번달 첫번째 날짜(ex)2023년 1월 1일 일요일)
        var prevDate = startDay.getDate();	// 일
        var prevDay = startDay.getDay();	// 요일

        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0); // (ex)1월 31일 화요일)
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);	// 요일(0~6) : (일~토)
		// 결과 : 31 6 31 2
        
        
        // 현재 년,월 표기
        $('.year-month').text(currentYear + '.' + (currentMonth + 1));
        
        // 렌더링 html 요소 생성. 날짜(1~31) 부분
        calendar = document.querySelector('.dates');
        
        calendar.innerHTML = '<span class=startTag></span>';
        
        var lastMonth = startDay.getMonth();
        var lastYear = startDay.getFullYear();
        var lastDay = prevDate - prevDay + 1;
        
        var myDate = new Date(lastYear, lastMonth, lastDay);
        console.log(myDate);

        // 지난달 회색으로 표시
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {	// i = 26; 6번 진행(26~31)
        	if(myDate.toJSON().substring(0,10) > today.toJSON().substring(0,10)){
	        	myDate.setDate(myDate.getDate()+1);
	        	calendar.innerHTML = calendar.innerHTML + '<div class="day choose color prev disable" value="'+myDate.toJSON().substring(0,10)+'">' + i + '</div>';
 				       	
        	}else{
        		calendar.innerHTML = calendar.innerHTML + '<div class="day color prev disable">' + i + '</div>';
        	}
        }
        // 이번달
        var date = new Date(thisMonth)
        var originMonth = today.getMonth();
        if(currentMonth == originMonth){
        	date = today;
        }
        for (var i = 1; i <= nextDate; i++) {
        	if(i<today.getDate() && currentMonth == originMonth){ // currentMonth: 달력에서 보이는 달-1, originMonth: 현재 달-1
        		calendar.innerHTML = calendar.innerHTML + '<div class="day color prev disable">' + i + '</div>';	// 현재일 기준 이전날짜
        	}else{
        		
	        	calendar.innerHTML = calendar.innerHTML + '<div class="day choose color current" value="'+ date.toJSON().substring(0,10) +'">' + i + '</div>';
	        	// thisMonth.toJSON().substring(0,10) : 2022-10-11로 Date에서 문자열로 변환됨. 문자열이어도 >,<등으로 비교가능함
	        	date.setDate(date.getDate()+1);
        	}
        	
        }

        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
        	
            calendar.innerHTML = calendar.innerHTML + '<div class="day choose color next disable" value="'+ date.toJSON().substring(0,10) +'">' + i + '</div>';
            date.setDate(date.getDate()+1); 
        }
        
        // 예약 내역 불러와서 색칠해주는 ajax. 월이 변경되어도 불어올수 있도록 ajax로 만듦
        $.ajax({
        	   type : "POST",            
               url : "/rsvt/ajax/getRsvt",      
               data : {p_no:"${p_no}", m_no:9999}, 
               dataType : 'json',
               success : function(result){
               		 list = result; // list 전역변수에 result 대입
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
        
        
        // 이전달 혹은 다음달로 넘어갔다가 돌아왔을때 선택된 날짜가 남아있도록 하게 하기
        var startVal = $("input[name='strt_r_date']").val();
        var endVal = $("input[name='rtrn_r_date']").val();
        // 시작값이 있고 그 값(value)를 가진 div가 있으면
        if($("div[value='"+ startVal +"']").length){
        	$("div[value='"+ startVal +"']").addClass("gray");
        }
     	// 끝값이 있고 그 값(value)를 가진 div가 있으면
        if($("div[value='"+ endVal +"']").length){
        	$("div[value='"+ endVal +"']").addClass("gray");
        }
     	// 처음 화면 불러볼때 start가 선택되어 있지 않은 상태에서 실행되어 오류가 나기 때문에 있을때 실행하도록 조건걸어줌
        if($("div[value='"+ startVal +"']").length && endVal){
        	// start와 end 사이 색칠해주는 조건문
    		var idx = $("div[value=" + startVal + "]");
    		var wCnt = 0;
    		
    		// idx 다음요소에 gray클래스를 가진 j쿼리 요소가 없고 idx 다음요소가 있을때
        	while(!idx.next().hasClass("gray") && idx.next().length){ // j쿼리객체는 자바스크립트 부분에서 있다없다 구분이 안됨. 그래서 length를 붙여 숫자로 구분
				if(wCnt==31){
					alert("31일 이상은 선택하실 수 없습니다.");
					break;
				}
        		// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
				idx.next().addClass("selectionDay");
				idx = idx.next(); 	// 검사한 요소의 다음요소를 넣어줌.
				wCnt += 1;
    		}
        }else if(startVal && $("div[value='"+ endVal +"']").length){
        // input start에 value값이 있으나 캘린더 상으로 startvalue를 가진 div가 없을때
        	// start와 end 사이 색칠해주는 조건문
    		var idx = $("div[value=" + startVal + "]").length ? $("div[value=" + startVal + "]") : $($(".startTag")[0]); 
    		var wCnt = 0;
        	while(!idx.next().hasClass("gray")){
				if(wCnt==31){
					alert("31일 이상은 선택하실 수 없습니다.");
					break;
				}
        		// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
				idx.next().addClass("selectionDay");
				idx = idx.next(); 	// 검사한 요소의 다음요소를 넣어줌.
				wCnt += 1;
    		}
        }
     	
        
        
        
        // 오늘 날짜 표기
        if (today.getMonth() == currentMonth) { // 0 == 0
            todayDate = today.getDate();	// 오늘 '일'
            console.log(todayDate);	
            
            // currentMonthDate -> 회색(지난날)이 아닌 오늘기준 앞으로의 데이터 9일 기준 10~31일
            var currentMonthDate = document.querySelectorAll('.dates .current');	// .dates 아래 .day current를 불러오는 것과 같음. 띄어쓰기로 class명 선언한 경우 이렇게도 불러올 수 있다.
       		// console.log(currentMonthDate);
            currentMonthDate[0].classList.add('today');	// classList : 해당태그가 가지고 있는 모든 클래스를 배열형태로 가져옴
            // class.add는 없어서 classList.add 사용한것임. today라는 클래스명을 추가함으로써 배경색 회색으로하는 css가 부여됨
            // 지난날짜는 위에서 html이 다시 그려지므로 remove는 필요 없음
        }
    
        // 날짜 선택시 클릭 이벤트=====================================================
        $(".day.choose").on("click", function(){
        	// 클릭한 날짜가 예약날짜이면 return
        	if($(this).hasClass("rnt")){
        		alert("해당 날짜에는 예약이 되어있어 선택하실 수 없습니다.");
        		return;
        	}
        	
        	// value 값이 문자열로 들어가 있기 때문에 날짜로 변환해야함
        	var thisValue = $(this).attr("value");
        	var startValue = $("input[name='strt_r_date']").val();
        	var endValue= $("input[name='rtrn_r_date']").val();
        	
        	if(!$("input[name='strt_r_date']").val()){
        	// 아무것도 선택되어있지 않을때
    	    	this.classList.add("gray"); 	// classList는 html의 고유 속성이므로 j쿼리에서 사용 불가하기 때문에 $(this)가 아닌 this로 불러온다.
    	    	$("input[name='strt_r_date']").val(thisValue);
    	    	$("input[name='strt_r_date']").change();	// change 이벤트를 타게 하기 위해 강제로 change함수 걸어줌
        	
        	}else if(!endValue && startValue < thisValue){
        	// start만 선택되어 있을때 end값을 선택하는 경우
        		
        		for(var i=0; i<list.length; i++){
        			if(startValue < list[i].strt_r_date && thisValue > list[i].rtrn_r_date){
        				alert("선택하신 날짜 사이에 예약날짜가 있어 해당날짜는 선택하실 수 없습니다.");
        				return;
        			}
        		}
        	
        		this.classList.add("gray");
        		$("input[name='rtrn_r_date']").val(thisValue);
        		$("input[name='rtrn_r_date']").change();
        		
        		// start와 end 사이 색칠해주는 조건문
        		
        		var idx = $("div[value=" + startValue + "]").length ? $("div[value=" + startValue + "]") : $($(".startTag")[0]); 
        		//$($(".day")[0]) -> $(".day")[0]가 태그형태로 가져오기 떄문에 제이쿼리로 한번더 감싸서 제이쿼리형태로 변환해줘야함
        		var wCnt = 0;
        		
        		while(!idx.next().hasClass("gray")){
        			if(wCnt==31){
    					alert("31일 이상은 선택하실 수 없습니다.");
    					break;
    				}
					// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
					idx.next().addClass("selectionDay");
					idx = idx.next(); 	// 검사한 요소의 다음요소를 넣어줌.
					wCnt += 1;
					
        		}
        		
        		
        		
        	}else if(startValue == thisValue){
        	// start 선택 후 다시 해당 날짜를 선택한 경우
        		this.classList.remove("gray");	// gray클래스명을 제거함으로써 스타일 제거
        		$("input[name='strt_r_date']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay"); // 선택되어있는 start와 end가 날아갈 경우 그 사이의 잇던 요소들의 css도 날려줌
        		$("input[name='strt_r_date']").change();
        		if(endValue){
        			$("input[name='strt_r_date']").val(endValue);
        			$("input[name='rtrn_r_date']").removeAttr("value");
        			$("input[name='strt_r_date']").change();
        			$("input[name='rtrn_r_date']").change();
        		}
        		
        		
        	}else if(endValue == thisValue){
        	// end 선택 후 다시 해당 날짜를 선택한 경우
        		this.classList.remove("gray");
        		$("input[name='rtrn_r_date']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay");
        		$("input[name='rtrn_r_date']").change();
        	
        	}
        	else if($("[name='strt_r_date']").val() && $("[name='rtrn_r_date']").val()){
        	// start, end 다 선택한 후 다른 날짜 선택한 경우
        		$(".gray").removeClass("gray");	// gray 클래스명을 가진 객체들을 가져와서 gray 클래스명 제거. j쿼리로 불러왔으므로 removeClass();를 사용한다.
        		$("input[name='strt_r_date']").removeAttr("value");	
        		$("input[name='rtrn_r_date']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay");
        		$("input[name='strt_r_date']").change();
        		$("input[name='rtrn_r_date']").change();
        		
        		
        	}
        	else if(startValue > thisValue){
        	// start 선택 후 end 날짜를 start보다 이전의 날짜로 선택했을 경우
        		if(thisValue <= today.toJSON().substring(0,10)){
        		// 선택할 end 날짜가 현재일 기준으로 더 이전의 날짜일 경우 선택못하게.
        			alert("해당날짜는 선택하실 수 없습니다.");
        			return;
        		}else{
        		// 선택할 end 날짜가 현재일과 먼저 선택된 start날짜 사이일 경우
        			for(var i=0; i<list.length; i++){
            			if(thisValue < list[i].strt_r_date && startValue > list[i].rtrn_r_date){
            				alert("선택하신 날짜 사이에 예약날짜가 있어 해당날짜는 선택하실 수 없습니다.");
            				return;
            			}
            		}
        		
        			this.classList.add("gray");
        			$("input[name='strt_r_date']").val(thisValue);
        			$("input[name='strt_r_date']").change();
        			$("input[name='rtrn_r_date']").val(startValue);
        			$("input[name='rtrn_r_date']").change();
        			
        			// start와 end 사이 색칠해주는 조건문
            		var idx = $("div[value=" + $("input[name='rtrn_r_date']").val() + "]").length ? $("div[value=" + $("input[name='rtrn_r_date']").val() + "]") : $($(".endTag")[0]);
            		var wCnt = 0;
        			while(!idx.prev().hasClass("gray")){
            			if(wCnt==31){
        					alert("31일 이상은 선택하실 수 없습니다.");
        					break;
        				}
    					// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
    					idx.prev().addClass("selectionDay");
    					idx = idx.prev(); 	// 검사한 요소의 다음요소를 넣어줌.
    					wCnt += 1;
            		}
        		}
        	
        	}
        });
    
    	// input change가 실행될경우 대여시작일에 input[name='strt_r_date']의 value값이 들어감
        $("input[name=strt_r_date]").change(function(){
        	$("#stDayValue").text($("input[name='strt_r_date']").val());
        });
     	// input change가 실행될경우 대여종료일에 input[name='rtrn_r_date']의 value값이 들어감
        $("input[name=rtrn_r_date]").change(function(){
        	$("#edDayValue").text($("input[name='rtrn_r_date']").val());
        	
        	// 계산된 대여금액 날리고 input에 저장된 value 값도 날림
    		$("input[name='pay']").removeAttr("value");
            $("#rntPrice").html(totalPrice.toLocaleString('ko-KR'));
        	
            // 대여기간, 대여금액 계산-------------------------------------------------
        	if($("input[name=strt_r_date]").val && $("input[name=rtrn_r_date]").val()){
	        	var stDate = new Date($("input[name='strt_r_date']").val());
	            var edDate = new Date($("input[name='rtrn_r_date']").val());
	        	// 대여기간 밀리세컨드로 변환
	            var msStDate = stDate.getTime();
	        	var msEdtDate = edDate.getTime();
	        	// 대여기간
	            var period = (msEdtDate-msStDate)/86400000;
	            // 대여기간 반영한 대여금액
	        	var rntPrice = "${pVO.r_price}"*period;
	        	$("input[name='pay']").val(rntPrice);
	            $("#rntPrice").html(rntPrice.toLocaleString('ko-KR')); // toLocaleString('ko-KR') : ###,###,###으로 변경
	            
        		
        	}
        });
    
    	// 다음달 혹은 이전달 눌렀다가 돌아오는 경우 for문 돌때 today가 변해서 아래쪽에서 today값 다시정의
        date = new Date(); // 현재 날짜(로컬 기준) 가져오기
        utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
        kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
        today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
    
    
    
    
    
    }//-----------------------------------------------------------------------renderCalender() end
	
    
    
    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 2);	// 2022-12-1
        //if(thisMonth.getFullYear() == today.getFullYear() && thisMonth.getMonth() == today.getMonth()){
        //	thisMonth = today;
        //}
        renderCalender(thisMonth);
    });

    // 다음달로 이동
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