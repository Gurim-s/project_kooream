<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="">
	<input type="hidden" name="start">
	<input type="hidden" name="end">
	<input type="hidden" name="p_no" value="${p_no }">
	<input type="button" value="결제하기">
</form>

</body>
<script type="text/javascript">
$(document).ready(function() {
    calendarInit();
    
});
/*
    달력 렌더링 할 때 필요한 정보 목록 

    현재 월(초기값 : 현재 시간)
    금월 마지막일 날짜와 요일
    전월 마지막일 날짜와 요일
*/

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
        calendar.innerHTML = '';
        
        // 지난달 회색으로 표시
        for (var i = prevDate - prevDay + 1; i <= prevDate; i++) {	// i = 26; 6번 진행(26~31)
            calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>';
        }
        // 이번달
        var originMonth = today.getMonth();
        for (var i = 1; i <= nextDate; i++) {
        	
        	if(i<today.getDate() && currentMonth == originMonth){ // currentMonth: 달력에서 보이는 달-1, originMonth: 현재 달-1
        		calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">' + i + '</div>';	// 현재일 기준 이전날짜
        	}else{
        		thisMonth.setDate(thisMonth.getDate()+1);
	        	calendar.innerHTML = calendar.innerHTML + '<div class="day choose current" value="'+ thisMonth.toJSON().substring(0,10) +'">' + i + '</div>';
	        	
	        	// thisMonth.toJSON().substring(0,10) : 2022-10-11로 Date에서 문자열로 변환됨. 문자열이어도 >,<등으로 비교가능함
        	}
        	
        }
        // 다음달
        for (var i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
        	thisMonth.setDate(thisMonth.getDate()+1); 
            calendar.innerHTML = calendar.innerHTML + '<div class="day choose next disable" value="'+ thisMonth.toJSON().substring(0,10) +'">' + i + '</div>';
            
        }
        
        // 이전달 혹은 다음달로 넘어갔다가 돌아왔을때 선택된 날짜가 남아있도록 하게 하기
        var startVal = $("input[name='start']").val();
        var endVal = $("input[name='end']").val();
        // 시작값이 있고 그 값(value)를 가진 div가 있으면
        if($("div[value='"+ startVal +"']").length){
        	$("div[value='"+ startVal +"']").addClass("gray");
        }
     	// 끝값이 있고 그 값(value)를 가진 div가 있으면
        if($("div[value='"+ endVal +"']").length){
        	$("div[value='"+ endVal +"']").addClass("gray");
        }
        if($("div[value='"+ startVal +"']").length && $("div[value='"+ endVal +"']").length){
        	// start와 end 사이 색칠해주는 조건문
    		var idx = $("div[value=" + startVal + "]");
    		while(!idx.next().hasClass("gray")){
				// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
				idx.next().addClass("selectionDay");
				idx = idx.next(); 	// 검사한 요소의 다음요소를 넣어줌.
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
    
        // 날짜 선택시 클릭 이벤트
        $(".day.choose").on("click", function(){
        	// value 값이 문자열로 들어가 있기 때문에 날짜로 변환해야함
        	var thisValue = $(this).attr("value");
        	var startValue = $("input[name='start']").val();
        	var endValue= $("input[name='end']").val();
        	
        	if(!$("input[name='start']").val()){
        	// 아무것도 선택되어있지 않을때
    	    	this.classList.add("gray"); 	// classList는 html의 고유 속성이므로 j쿼리에서 사용 불가하기 때문에 $(this)가 아닌 this로 불러온다.
    	    	$("input[name='start']").val(thisValue);
    	    	$("input[name='start']").change();	// change 이벤트를 타게 하기 위해 강제로 change함수 걸어줌
        	
        	}else if(!endValue && startValue < thisValue){
        	// start만 선택되어 있을때 end값을 선택한 경우
        		this.classList.add("gray");
        		$("input[name='end']").val(thisValue);
        		$("input[name='end']").change();
        		
        		// start와 end 사이 색칠해주는 조건문
        		var idx = $("div[value=" + startValue + "]");
        		while(!idx.next().hasClass("gray")){
					// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
					idx.next().addClass("selectionDay");
					idx = idx.next(); 	// 검사한 요소의 다음요소를 넣어줌.
        		}
        		
        		
        		
        	}else if(startValue == thisValue){
        	// start 선택 후 다시 해당 날짜를 선택한 경우
        		this.classList.remove("gray");	// gray클래스명을 제거함으로써 스타일 제거
        		$("input[name='start']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay"); // 선택되어있는 start와 end가 날아갈 경우 그 사이의 잇던 요소들의 css도 날려줌
        		$("input[name='start']").change();
        		if(endValue){
        			$("input[name='start']").val(endValue);
        			$("input[name='end']").removeAttr("value");
        			$("input[name='start']").change();
        			$("input[name='end']").change();
        		}
        		
        		
        	}else if(endValue == thisValue){
        	// end 선택 후 다시 해당 날짜를 선택한 경우
        		this.classList.remove("gray");
        		$("input[name='end']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay");
        		$("input[name='end']").change();
        	
        	}
        	else if($("[name='start']").val() && $("[name='end']").val()){
        	// start, end 다 선택한 후 다른 날짜 선택한 경우
        		$(".gray").removeClass("gray");	// gray 클래스명을 가진 객체들을 가져와서 gray 클래스명 제거. j쿼리로 불러왔으므로 removeClass();를 사용한다.
        		$("input[name='start']").removeAttr("value");	
        		$("input[name='end']").removeAttr("value");
        		$(".selectionDay").removeClass("selectionDay");
        		$("input[name='start']").change();
        		$("input[name='end']").change();
        	}
        	else if(startValue > thisValue){
        	// start 선택 후 end 날짜를 start보다 이전의 날짜로 선택했을 경우
        		if(thisValue <= today.toJSON().substring(0,10)){
        		// 선택할 end 날짜가 현재일 기준으로 더 이전의 날짜일 경우 선택못하게.
        			alert("해당날짜는 선택하실 수 없습니다.");
        			return;
        		}else{
        		// 선택할 end 날짜가 현재일과 먼저 선택된 start날짜 사이일 경우
        			this.classList.add("gray");
        			$("input[name='start']").val(thisValue);
        			$("input[name='start']").change();
        			$("input[name='end']").val(startValue);
        			$("input[name='end']").change();
        			
        			// start와 end 사이 색칠해주는 조건문
            		var idx = $("div[value=" + startValue + "]");
            		while(!idx.prev().hasClass("gray")){
    					// idx에 j쿼리 문법이 사용 됐으므로 classList를 사용할 수 없기때문에 addClass()를 사용한다. 
    					idx.prev().addClass("selectionDay");
    					idx = idx.prev(); 	// 검사한 요소의 다음요소를 넣어줌.
            		}
        		}
        	
        	}
        });
    
    	// input change가 실행될경우 대여시작일에 input[name='start']의 value값이 들어감
        $("input[name=start]").change(function(){
        	$("#stDayValue").text($("input[name='start']").val());
        });
     	// input change가 실행될경우 대여종료일에 input[name='end']의 value값이 들어감
        $("input[name=end]").change(function(){
        	$("#edDayValue").text($("input[name='end']").val());
        });
    
    	
        date = new Date(); // 현재 날짜(로컬 기준) 가져오기
        utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
        kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
        today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
    
    
    
    
    
    
    }//-----------------------------------------------------------------------renderCalender() end
	
   
    
    
    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        if(thisMonth.getFullYear() == today.getFullYear() && thisMonth.getMonth() == today.getMonth()){
        	thisMonth = today;
        }
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        if(thisMonth.getFullYear() == today.getFullYear() && thisMonth.getMonth() == today.getMonth()){
        	thisMonth = today;
        }
        renderCalender(thisMonth); 
    });
    
    
    
    
    
    
}
</script>
	
<jsp:include page="../include/footer.jsp"/>