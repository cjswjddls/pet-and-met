<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
    	String pagePath = "../";

		String pageName = "매출 현황";

		int fontSize = 20;
    %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>매출 현황</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<style>
		.adminStatisticsWrapper { margin: 0% 15% 5% 30%; }
		.adminStatisticsWrapper>div { display: flex; }
		.adminStatisticsWrapper>div>div { width: 50%; height: 360px; }
	</style>
	</head>
	<body>
		<%@ include file="../../common/adminAttachment.jsp" %>

		<div class="container" style="margin: 0% 15% 0% 30%;">
			<h3>월 선택</h3>
			<input type="month" id="adminStatisticsMonth"><br><hr>
		</div>

		<script>
			$(function() {
				let today = "" + new Date().getFullYear() + "-" + ("" + (new Date().getMonth()+1)).padStart(2, "0");
				$("#adminStatisticsMonth").val(today);
				$("#adminStatisticsMonth").attr("max", today);
				cha($("#adminStatisticsMonth").val());
				$("#adminStatisticsMonth").change(function() {
					// console.log($(this).val());
					cha($(this).val());
				})
			});
			function cha(d) {
				reloadVisitorMonth(d);
				reloadVisitorYear(d);
				reloadIncomeMonth(d);
				reloadIncomeYear(d);
				reloadTypeReserve();
				reloadTypePercent();
			};
			function reloadVisitorMonth(e) {
				$.ajax({
					url: "stat.visitorMonth",
					type: "get",
					data: { date: e },
					success: function(list) {
						function drawChartVisitorMonth() {
							var data = google.visualization.arrayToDataTable([
								['Month', 'Visitor', 'Cancel'],
								[parseInt(list[0].month), parseInt(list[0].confirm), parseInt(list[0].cancel)],
								[parseInt(list[1].month), parseInt(list[1].confirm), parseInt(list[1].cancel)],
								[parseInt(list[2].month), parseInt(list[2].confirm), parseInt(list[2].cancel)],
							]);
							var options = {
							title: '월별 사용자수',
							fontSize: <%= fontSize %>,
							hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
							vAxis: {minValue: 0}
							};
							var chart = new google.visualization.AreaChart(document.getElementById('areaChartVisitorMonth'));
							chart.draw(data, options);
						}
						google.charts.setOnLoadCallback(drawChartVisitorMonth);
					},
					error: function() {
						console.log("");
					}
				})
			}
			function reloadVisitorYear(e) {
				$.ajax({
					url: "stat.visitorYear",
					type: "get",
					data: { date: e },
					success: function(list) {
						function drawChartVisitorYear() {
							var data = google.visualization.arrayToDataTable([
								['Year', 'Visitor', 'Cancel'],
								[parseInt(list[0].month), parseInt(list[0].confirm), parseInt(list[0].cancel)],
								[parseInt(list[1].month), parseInt(list[1].confirm), parseInt(list[1].cancel)],
								[parseInt(list[2].month), parseInt(list[2].confirm), parseInt(list[2].cancel)],
							]);
							var options = {
							title: '년간 사용자수',
							fontSize: <%= fontSize %>,
							hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
							vAxis: {minValue: 0}
							};
							var chart = new google.visualization.AreaChart(document.getElementById('areaChartVisitorYear'));
							chart.draw(data, options);
						}
						google.charts.setOnLoadCallback(drawChartVisitorYear);
					},
					error: function() {
						console.log("");
					}
				})
			}
			function reloadIncomeMonth(e) {
				$.ajax({
					url: "stat.incomeMonth",
					type: "get",
					data: { date: e },
					success: function(list) {
						function drawChartIncomeMonth() {
							var data = google.visualization.arrayToDataTable([
								['Month', 'Income', 'Profit', { role: 'style' } ],
								[parseInt(list[0].date), parseInt(list[0].income), parseInt(list[0].profit), 'color: gray'],
								[parseInt(list[1].date), parseInt(list[1].income), parseInt(list[1].profit), 'color: #76A7FA'],
								[parseInt(list[2].date), parseInt(list[2].income), parseInt(list[2].profit), 'opacity: 0.2'],
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
						google.charts.setOnLoadCallback(drawChartIncomeMonth);
					},
					error: function() {
						console.log("");
					}
				})
			}
			function reloadIncomeYear(e) {
				$.ajax({
					url: "stat.incomeYear",
					type: "get",
					data: { date: e },
					success: function(list) {
						function drawChartIncomeYear() {
							var data = google.visualization.arrayToDataTable([
								['Year', 'Income', 'Profit', { role: 'style' } ],
								[parseInt(list[0].date), parseInt(list[0].income), parseInt(list[0].profit), 'color: gray'],
								[parseInt(list[1].date), parseInt(list[1].income), parseInt(list[1].profit), 'color: #76A7FA'],
								[parseInt(list[2].date), parseInt(list[2].income), parseInt(list[2].profit), 'opacity: 0.2'],
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
						google.charts.setOnLoadCallback(drawChartIncomeYear);
					},
					error: function() {
						console.log("");
					}
				})
			}
			function reloadTypeReserve() {
				$.ajax({
					url: "stat.TypeReserve",
					type: "get",
					data: { },
					success: function(list) {
						function drawChartEmptyRoom() {
							var data = google.visualization.arrayToDataTable([
								['', '예약된 방', '빈 방', { role: 'style' } ],
								[list[0].date, list[0].reserve, list[0].empty, 'color: gray'],
								[list[1].date, list[1].reserve, list[1].empty, 'color: #76A7FA']
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
						google.charts.setOnLoadCallback(drawChartEmptyRoom);
					},
					error: function() {
						console.log("");
					}
				})
			}
			function reloadTypePercent() {
				$.ajax({
					url: "stat.TypePercent",
					type: "get",
					data: { },
					success: function(list) {
						function drawChartType() {
							var data = google.visualization.arrayToDataTable([
								['Task', 'Hours per Day'],
								['A타입', list.typeA/list.typeAll],
								['B타입', list.typeB/list.typeAll],
							]);
							var options = {
								title: '타입별 점유율',
								fontSize: <%= fontSize %>
							};
							var chart = new google.visualization.PieChart(document.getElementById('piechart'));
							chart.draw(data, options);
						}
						google.charts.setOnLoadCallback(drawChartType);
					},
					error: function() {
						console.log("");
					}
				})
			}
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
		</script>
	</body>
</html>