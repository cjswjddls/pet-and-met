<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String pagePath = "./"; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reservationMain</title>
<style>

	.outer{
		width: 1000px;
		margin: auto;
		margin-top: 50px;
		border: 1px solid red;
	}

	div { border: 1px solid black;}

	/* index outer */
	.reservation-index {
		width: 400px;
		height: 100px;
		margin: auto;
		text-align: center;
	}

	/* 현재 선택된 페이지 index 원 라인 */
	.index {
		width: 30px;
		height: 30px;
		border-radius: 50px ;
		border: 1px solid rgb(176, 217, 177);
		display : inline-block;
		text-align: center;
		line-height: 30px; 	
		margin-top : 15px;
		background-color: white;
		font-weight: 700;
		color: rgb(121, 172, 120);
	}

	/* 나머지 index 원 */
	#index-one {
		width: 30px;
		height: 30px;
		border-radius: 50px ;
		border: 1px solid rgb(176, 217, 177);
		display : inline-block;
		text-align: center;
		line-height: 30px; 	
		margin-top : 15px;
		background-color: rgb(121, 172, 120);
		font-weight: 700;
		color: white;
	}

	/* index 원 라인 */
	.line {
		border: 1px solid rgb(176, 217, 177);
		width: 30px;
		margin-top: 15px;
		display : inline-block;
		margin-bottom : 4px;
	}

	/* index 텍스트 */
	#index-text {
		width: 100%;
		margin-top: 10px;
		font-size: 28px;
		font-weight: 550;
		color: rgb(121, 172, 120);	
	}

	/* contnet 구분선 */
	.dividing-line {
		width: 100%;
		border: 2px solid rgb(121, 172, 120);
		margin: auto;
		margin-top: 30px;
		box-sizing: border-box;	
	}

	/* content */
	.reservation-content {
		width: 100%;
		height: 950px;
		margin-top: 0px;
	}

	form {width: 100%; height: 40%; margin-top: 50px;}

	/* type div */
	.type {width: 100%; height: 100%; box-sizing: border-box;}
	.type > div {float: left; box-sizing: border-box;}
	.type-img { width: 45%; height: 100%; }
	.type-content { width: 35%; height: 100%;}
	.type-submit { width: 20%; height: 100%;}
	
	/* 객실 img */
	.roomImg { width: 100%; height: 80%; margin-top: 35px;}
	
	/* img size */
	img { height: 100%; }

	/* type content */
	.roomType {
		width: 80%;
		height: 80px;
		margin:auto;
		margin-top: 35px;
		border-radius: 10px;
		background-color: rgb(188, 142, 207);
		text-align: center;
		line-height: 80px;
		font-size: 25px;
	}


	/* select-button */
	.type-select-button {
		width: 150px;
		height: 45px;
		font-size: 18px;
		font-weight: 600;
		position: relative;
		top: 300px;
		left: 50px;
	}

	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<div class="outer" >

		<!-- reservation index -->
		<div class="reservation-index">
			<div class="index one" id="index-one">1</div
			><div class="line"></div
			><div class="index two">2</div
			><div class="line"></div
			><div class="index three">3</div>
			<div id="index-text">날짜, 타입, 마리수 선택</div>
		</div>
		
		<!-- contnet 구분선 -->
		<div class="dividing-line"></div>
		
		<!-- content -->
		<div class="reservation-content">	
			
			<!-- A type -->
			<form action="<%= pagePath %>request.resv" method="get">
				<div class="type">
					
					<!-- 객실 img typeA -->
					<div class="type-img">
						<div class="roomImg">
							<img src="<%= pagePath%>resources/img/room/A_type.png">
						</div>
					</div>
	
					<!-- A type content -->
					<div class="type-content">
						<div class="roomType" id="typeA">A TYPE</div>
						<input type="hidden" id="hiddenTypeA" name="hiddenTypeA" value="">
					</div>
	
					<!-- select-button -->
					<div class="type-submit">
						<button class="type-select-button"  onclick="typeA();" type="submit">예약하기</button>
					</div>
				</div>
			</form>

			<!-- contnet 구분선 -->
			<div class="dividing-line"></div>
			
			<!-- B type -->
			<form action="<%= pagePath %>request.resv" method="get">
				<div class="type">
					
					<!-- 객실 img typeB -->
					<div class="type-img">			
						<div class="roomImg">
							<img src="<%= pagePath%>resources/img/room/B_type.png">
						</div>
					</div>
					
					<!-- B type content -->
					<div class="type-content">
						<div class="roomType" id="typeB">B TYPE</div>
						<input type="hidden" id="hiddenTypeB" name="hiddenTypeB" value="B">
					</div>
	
					<!-- select-button -->
					<div class="type-submit">
						<button class="type-select-button" onclick="typeB();" type="submit">예약하기</button>
					</div>
				</div>
			</form>

			<script>
				// type 값 보내기
				function typeA() {

					$("#hiddenTypeA").val("A");
					
				}

				function typeB() {

					$("#hiddenTypeB").val("B");

				}
				
			</script>

		</div>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>