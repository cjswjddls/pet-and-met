<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
    	String pagePath = "../";

		String pageName = "매출 현황";
		
		int reserveMonth1 = 327;
		int reserveMonth2 = 410;
		int reserveMonth3 = 291;
		
		int reserveYear1 = 1678;
		int reserveYear2 = 1820;
		int reserveYear3 = 1589;
		
		int incomeMonth1 = 7820000;
		int incomeMonth2 = 8946000;
		int incomeMonth3 = 3510000;

		int profitMonth1 = 3450000;
		int profitMonth2 = 4120000;
		int profitMonth3 = 2200000;
		
		int incomeYear1 = 99246500;
		int incomeYear2 = 76547000;
		int incomeYear3 = 99658000;

		int profitYear1 = 45861000;
		int profitYear2 = 2661000;
		int profitYear3 = 35806000;

		int currA = 110;
		int currB = 123;
		int maxA = 160;
		int maxB = 140;

		int typeA=46;
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
		.adminStatisticsWrapper { margin: 0% 15% 5% 30%; }
		.adminStatisticsWrapper>div { display: flex; }
		.adminStatisticsWrapper>div>div { width: 50%; height: 360px; }
	</style>
	</head>
	<body>
		<%@ include file="../common/adminAttachment.jsp" %>

		<div class="container" style="margin: 0% 15% 0% 30%;">
			<h3>월 선택</h3>
			<input type="month" id="adminStatisticsMonth"><br><hr>
		</div>

		<script>
			$(function() {
				let today = "" + new Date().getFullYear() + "-" + ("" + (new Date().getMonth()+1)).padStart(2, "0");
				$("#adminStatisticsMonth").val(today);
				$("#adminStatisticsMonth").attr("max", today);
				$("#adminStatisticsMonth").change(function() {
					console.log($(this).val());
				})
			});
		</script>

		<!-- 3 * 2 행렬 -->
		<div class="adminStatisticsWrapper">
			<div>
				<div><div id="areaChartVisitorMonth" style="width: 100%; height: 100%;"></div></div>
				<div><div id="drawchartIncomeMonth" style="width: 100%; height: 100%;"></div></div>
			</div>
			<div>
				<div><div id="areaChartVisitorYear" style="width: 100%; height: 100%;"></div></div>
				<div><div id="drawchartIncomeYear" style="width: 100%; height: 100%;"></div></div>
			</div>
			<div>
				<div><div id="drawchartEmptyRoom" style="width: 100%; height: 100%;"></div></div>
				<div><div id="piechart" style="width: 100%; height: 100%;"></div></div>
			</div>
		</div>

		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChartVisitorMonth);

			function drawChartVisitorMonth() {
				var data = google.visualization.arrayToDataTable([
					['Month', 'Visitor', 'Cancel'],
					['05월',  <%= reserveMonth1 %>, 163],
					['06월',  <%= reserveMonth2 %>, 180],
					['07월',  <%= reserveMonth3 %> ,60],
				]);
				var options = {
				title: '월별 방문자수',
				fontSize: <%= fontSize %>,
				hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
				vAxis: {minValue: 0}
				};
				var chart = new google.visualization.AreaChart(document.getElementById('areaChartVisitorMonth'));
				chart.draw(data, options);
			}
		</script>

		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChartVisitorYear);

			function drawChartVisitorYear() {
				var data = google.visualization.arrayToDataTable([
					['Year', 'Visitor', 'Cancel'],
					['2013년',  <%= reserveYear1 %>, 456],
					['2014년',  <%= reserveYear2 %>, 568],
					['2015년',  <%= reserveYear3 %> ,742],
				]);
				var options = {
				title: '년간 방문자수',
				fontSize: <%= fontSize %>,
				hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
				vAxis: {minValue: 0}
				};
				var chart = new google.visualization.AreaChart(document.getElementById('areaChartVisitorYear'));
				chart.draw(data, options);
			}
		</script>

		<script type="text/javascript">
			google.charts.load("current", {'packages':["corechart"]});
			google.charts.setOnLoadCallback(drawChartIncomeMonth);
			
			function drawChartIncomeMonth() {
			      var data = google.visualization.arrayToDataTable([
			        ['Month', 'Income', 'Profit', { role: 'style' } ],
			        ['05월', <%= incomeMonth1 %>, <%= profitMonth1 %>, 'color: gray'],
			        ['06월', <%= incomeMonth2 %>, <%= profitMonth2 %>, 'color: #76A7FA'],
			        ['07월', <%= incomeMonth3 %>, <%= profitMonth3 %>, 'opacity: 0.2'],
			      ]);
			      var view = new google.visualization.DataView(data);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);
			      var options = {
						title: '월별 매출',
						fontSize: <%= fontSize %>
				  };
			      var chart = new google.visualization.BarChart(document.getElementById('drawchartIncomeMonth'));
				  chart.draw(view, options);
			}
		</script>

		<script type="text/javascript">
			google.charts.load("current", {'packages':["corechart"]});
			google.charts.setOnLoadCallback(drawChartIncomeYear);
			
			function drawChartIncomeYear() {
			      var data = google.visualization.arrayToDataTable([
			        ['Year', 'Income', 'Profit', { role: 'style' } ],
			        ['2013년', <%= incomeYear1 %>, <%= profitYear1 %>, 'color: gray'],
			        ['2014년', <%= incomeYear2 %>, <%= profitYear2 %>, 'color: #76A7FA'],
			        ['2015년', <%= incomeYear3 %>, <%= profitYear3 %>, 'opacity: 0.2'],
			      ]);
			      var view = new google.visualization.DataView(data);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);
			      var options = {
						title: '년별 매출',
						fontSize: <%= fontSize %>
				  };
			      var chart = new google.visualization.BarChart(document.getElementById('drawchartIncomeYear'));
				  chart.draw(view, options);
			}
		</script>

		<script type="text/javascript">
			google.charts.load("current", {'packages':["corechart"]});
			google.charts.setOnLoadCallback(drawChartEmptyRoom);
			
			function drawChartEmptyRoom() {
			      var data = google.visualization.arrayToDataTable([
			        ['', '예약된 방', '빈 방', { role: 'style' } ],
			        ['A타입', <%= currA %>, <%= maxA %> - <%= currA %>, 'color: gray'],
			        ['B타입', <%= currB %>, <%= maxB %> - <%= currB %>, 'color: #76A7FA']
			      ]);
			      var view = new google.visualization.DataView(data);
			      view.setColumns([0, 1,
			                       { calc: "stringify",
			                         sourceColumn: 1,
			                         type: "string",
			                         role: "annotation" },
			                       2]);
			      var options = {
						title: '타입별 빈방 비율',
						fontSize: <%= fontSize %>,
						isStacked: 'relative'
				  };
			      var chart = new google.visualization.BarChart(document.getElementById('drawchartEmptyRoom'));
				  chart.draw(view, options);
			}
		</script>
		
		<script type="text/javascript">
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChartType);
			
			function drawChartType() {
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