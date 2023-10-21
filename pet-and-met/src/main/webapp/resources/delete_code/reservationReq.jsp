<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<br><br><br><br>
	
	<h3 id="total-price">20000</h3>
	<h3 id="total-pay-price">10000</h3>
	
	<div id="form-payment">
		<input type="text" name="pay-name">
		<input type="text" name="pay-tel">
		<input type="text" name="pay-email">
	</div> 
	
	<button id="btn-kakao-pay">결제창으로 이동</button>
	

	<script>
	// 카카오결제
	$(function(){
		$("#btn-kakao-pay").click(function(){
			
			// 필수입력값을 확인.
			var name = $("#form-payment input[name='pay-name']").val();
			var tel = $("#form-payment input[name='pay-tel']").val();
			var email = $("#form-payment input[name='pay-email']").val();
			
			if(name == ""){
				$("#form-payment input[name='pay-name']").focus()
			}
			if(tel == ""){
				$("#form-payment input[name='pay-tel']").focus()
			}
			if(email == ""){
				$("#form-payment input[name='pay-email']").focus()
			}
			
			// 결제 정보를 form에 저장한다.
			let totalPayPrice = parseInt($("#total-pay-price").text().replace(/,/g,''))
			let totalPrice = parseInt($("#total-price").text().replace(/,/g,''))
			let discountPrice = totalPrice - totalPayPrice 
			let usePoint = 0
			let useUserCouponNo = 0
			
			// 카카오페이 결제전송
			$.ajax({
				type:'get'
				,url:'payment.ready'
				,data:{
					total_amount: totalPayPrice
					,payUserName: name
					,sumPrice:totalPrice
					,discountPrice:discountPrice
					,totalPrice:totalPayPrice
					,tel:tel
					,email:email
					,usePoint:usePoint
					,useCouponNo:useUserCouponNo	
					
				},
				success:function(response){
					
					console.log(response);
					window.open(response.next_redirect_pc_url);
				}
			})
		})
	})
	</script>

</body>
</html>