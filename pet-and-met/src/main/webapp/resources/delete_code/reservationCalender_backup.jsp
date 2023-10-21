<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.mainReservationDays, .mainReservationRoom { width: 100%; }
		.mainCalender { display: flex; justify-content: center; background-color: aliceblue; }
	</style>
	</head>
	<body>
		<section id="mainCalender" class="mainCalender container">
        <div>
          <h2 align="center">예약</h2><br>
          <form action="<%= contextPath %>/<%= reservationNextPage %>" method="POST">
            <table> 
              <thead>
                <tr>
                  <td width="100">객실선택</td>
                  <td width="280">날짜선택</td>
                  <td width="80">일수</td>
                  <td width="20"></td>
                  <td width="80">객실</td>
                  <td width="40"></td>
                  <td rowspan="2"><input type="submit" value="예약" class="btn btn-outline-success"></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><select name="mainReservationType" id="mainReservationType" required>
                    <option value="A">A타입</option>
                    <option value="B">B타입</option>
                  </select></td>
                  <td><input type="input" class="mainReservationDatePicker" id="mainReservationDatePicker" required></td>
                  <td><input type="text" id="mainReservationDays" class="mainReservationDays" readonly value="1일"></td>
                  <td></td>
                  <td><input type="text" id="mainReservationRoom" class="mainReservationRoom" readonly value="A타입"></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      </section>

      <script>
        $(function() {
          $(".mainReservationDatePicker").daterangepicker({
            locale: {
              "separator": " ~ ",
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
          })
          $(".mainReservationDatePicker").change(function() {
            let startDate = $(this).val().split(" ~ ")[0];
            let endDate = $(this).val().split(" ~ ")[1];
            $(".mainReservationDays").val(((new Date(endDate) - new Date(startDate))/(1000*60*60*24) + 1) + "일");
          })
          $("#mainReservationType").change(function(){
            let room = $(this).val() + '타입';
            $(".mainReservationRoom").val(room);
          })
        })
      </script>
	</body>
</html>