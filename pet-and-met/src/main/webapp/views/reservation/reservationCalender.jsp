<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Pet & Met</title>
	<style>

    /* div {border: 1px solid black;} */

    #mainCalender{
      width: 1400px;
      height: 115px;
	  margin: auto;
	  /* border: 1px solid black; */
    }
    .calerder-form { width:1300px; height: 100%; background-color: rgb(240, 240, 240); box-sizing: border-box; border: 1px solid black; }
    .calerder-form> div {float: left; box-sizing: border-box;}
    .calerder-outer {width: 1100px; height: 100%; padding: 10px}

    .calerder > div {display: inline-block;  color: rgb(101, 101, 101); font-size: 20px; box-sizing: border-box; margin-left: 15px; } 
    .calerder {height: 50%; width: 1100px; }
    .calerder-data {margin-top: 4px; height: 48%; width: 1100px;}
    .calerder-data > div { display: inline-block; font-size: 22px; margin-left: 15px; box-sizing: border-box;}

    .calerder-hotel { width: 300px; height: 100%;}
    .calerder-check, .calerder-out {width: 300px; text-align: center; height: 100%; border: 1px solid black; line-height: 45px; }
    .calerder-day{width:100px; height: 100%; text-align: center;}
    
    .calerder-button {width: 198px; height: 100%; margin: auto;}
	.calerder-button-div { width: 100%; height: 100%;}

    .mainReservationDatePicker { border: 0px; width: 100%; text-align: center; font-size: 22px; font-weight: 700; box-sizing: border-box; height: 96%;}
    .mainReservationDays { border: 0px; width:100%;  text-align: center; font-size: 22px; color: rgb(82, 81, 81); font-weight: 700; box-sizing: border-box; background-color: rgb(240, 240, 240);}
    .calerder-submit{ width: 100%; height: 100%; background-color: rgb(176, 217, 177);}
  
	</style>
	</head>
	<body>
		
		<div id="mainCalender" class="mainCalender container">
			<form action="<%= contextPath %>/<%= reservationNextPage %>" method="get" class="calerder-form">
				<div class="calerder-outer">
					
					<div class="calerder"> 
						<div class="calerder-hotel">호텔</div>
						<div class="calerder-check">체크인</div>
						<div class="calerder-day">일수</div>
						<div class="calerder-out">체크아웃</div>
					</div>

						
					<div class="calerder-data">
						<div class="calerder-hotel">Pet & Met 호텔</div>
						<div class="calerder-check"><input type="text" class="mainReservationDatePicker" id="mainReservationStartDate" name="startDate" required></div>
						<div class="calerder-day"><input type="text" id="mainReservationDays" class="mainReservationDays" name="stayDate" value="1박" readonly></div>
						<div class="calerder-out"><input type="text" class="mainReservationDatePicker" id="mainReservationEndDate" name="endDate" required></div>
						<input type="hidden" id="stayDateHidden" name="stayDateHidden" value="1">
					</div>

				</div>

				<div class="calerder-button">
					<div class="calerder-button-div"><button type="submit" class="calerder-submit">검색</button></div>
				</div>


      		</form>

    	</div>

      <script>
        $(function() {	
        	$(".mainReservationDatePicker").daterangepicker({
	            locale: {
	              "separator": " - ",
	              "format": 'YYYY-MM-DD',
	              showMonthAfterYear:true,
	              showOn:"both",
	              numberOfMonths:[1,2],
	              "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	              "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	              "applyLabel": "확인",
	              "cancelLabel": "취소",
	         
	            },
	              minDate: new Date(),
	              showDropdowns: true,
	              cancelButtonClasses: "btn btn-outline-secondary",
	              applyButtonClasses:"btn btn-outline-success"
	          });
         	
            
	        $(".mainReservationDatePicker").change(function() {
	        	let startDate = $(this).val().split(" - ")[0];
	        	let endDate = $(this).val().split(" - ")[1];
	        	
	        	$("#mainReservationStartDate").val(startDate);
	        	$("#mainReservationEndDate").val(endDate);
	
	        	$(".mainReservationDays").val(((new Date(endDate) - new Date(startDate))/(1000*60*60*24)) + "박");
	        	$("#stayDateHidden").val(((new Date(endDate) - new Date(startDate))/(1000*60*60*24)));
	        })

	        // 자바스크립트로 오늘날짜 구하기
	        // 시작일 구하기
	        let startDefaultValue = new Date();
	        
	        let tempMonth = "";
	        let tempDate = "";
	        
	        if(startDefaultValue.getMonth() + 1 < 10) {
	        	tempMonth = "0" + (startDefaultValue.getMonth() + 1);
	        } else {
	        	tempMonth = (startDefaultValue.getMonth() + 1);
	        }

	        if(startDefaultValue.getDate() < 10) {
	        	tempDate = "0" + startDefaultValue.getDate();
	        } else {
	        	tempDate = startDefaultValue.getDate();
	        }
	        
	        let startDefaultValueStr = startDefaultValue.getFullYear() + "-" + tempMonth + "-" + tempDate;
	        
	        // 종료일 구하기 
	        let endDefaultValue = new Date();
	        endDefaultValue.setDate(startDefaultValue.getDate() + 1); // 매 달의 마지막날일 경우를 대비해서
	        
	        tempMonth = "";
	        tempDate = "";
	        
	        if(endDefaultValue.getMonth() + 1 < 10) {
	        	tempMonth = "0" + (endDefaultValue.getMonth() + 1);
	        } else {
	        	tempMonth = (endDefaultValue.getMonth() + 1);
	        }

	        if(endDefaultValue.getDate() < 10) {
	        	tempDate = "0" + endDefaultValue.getDate();
	        } else {
	        	tempDate = endDefaultValue.getDate();
	        }
	        
	        let endDefaultValueStr = endDefaultValue.getFullYear() + "-" + tempMonth + "-" + tempDate;
	        
			$("#mainReservationStartDate").val(startDefaultValueStr);
			$("#mainReservationEndDate").val(endDefaultValueStr);
	        
        });
      </script>

	</body>
</html>