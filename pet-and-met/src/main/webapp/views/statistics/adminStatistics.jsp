<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
    	String pagePath = "../";

		String pageName = "매출 현황";

		int typeA=40;
		int typeB=32;
		int typeTotal = typeA + typeB;

		int fontSize = 20;
    %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<style>
		.adminStatisticsWrapper { margin: 0% 0% 0% 30%; }
		.adminStatisticsWrapper>div { display: flex; }
		.adminStatisticsWrapper>div>div { width: 50%; height: 360px; }
	</style>
	</head>
	<body>
		<%@ include file="../common/adminAttachment.jsp" %>

		<div class="adminStatisticsWrapper">
			<div>
				<div></div>
				<div></div>
			</div>
			<div>
				<div></div>
				<div></div>
			</div>
			<div>
				<div></div>
				<div><div id="piechart" style="width: 100%; height: 100%;"></div></div>
			</div>
		</div>
		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
	  
			function drawChart() {
	  
			  var data = google.visualization.arrayToDataTable([
				['Task', 'Hours per Day'],
				['A타입', <%= typeA  %>/<%= typeTotal %>],
				['B타입', <%= typeB  %>/<%= typeTotal %>],
			  ]);
	  
			  var options = {
				title: '타입별 점유율',
				fontSize: <%= fontSize %>
			  };
	  
			  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	  
			  chart.draw(data, options);
			}
		  </script>
	</body>
</html>