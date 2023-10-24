<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String pagePath = "./"; %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>FAQ 목록</title>
	
	<style>
		@font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        * { font-family: 'Pretendard-Regular'; 
        }
	 	.collapsible {
            background-color: rgb(121, 172, 150);
            color: white;
            cursor: pointer;
            padding: 18px;
            width: 70%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            margin-left:15%;
        }
        .active1,
        .collapsible:hover {
            background-color: #353;
        }
        .content {
            padding: 0 18px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.2s ease-out;
           
            width: 70%;
            margin-left:15%;
        }
        .collapsible:after {
            content: '\002B';
            color: white;
            font-weight: bold;
            float: right;
            margin-left: 5px;
        }
        .active1:after {
            content: "\2212";
        }
        
    </style>
		<script>
	        function collapse(element) {
	            var before = document.getElementsByClassName("active1")[0]               // 기존에 활성화된 버튼
	            if (before && document.getElementsByClassName("active1")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
	                before.classList.remove("active1");                  // 버튼 비활성화
	            }
	            element.classList.toggle("active1");         // 활성화 여부 toggle
	
	            var content = element.nextElementSibling;
	            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
	                content.style.maxHeight = null;         // 접기
	            } else {
	                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
	            }
	        }
	    </script>
	</head>
	<body>
	
	
		<%@ include file="/views/common/header.jsp" %>
		<%@ include file="/views/common/sidebarQuestion.jsp" %>
		
		<div class="container" >
			<h2>FAQ (자주 묻는 질문)</h2>
		</div>
		
        <button type="button" class="collapsible" onclick="collapse(this);">직접 통화를 사용하여 문의를 드리고 싶습니다.</button>
        <div class="content">
            <p><br>
                저희 사이트는 공식적으로 FAQ 및 1대1 상담을 제공하고 있습니다.<br><br>
                문의하고자하는 내용은 우측 하단의 아이콘을 클릭하여 요청해주시길 바랍니다.<br><br>
                또한 긴급한 경우 010-1111-2222로 연락 부탁드립니다.<br>
            </p>
        </div>
    
        <button type="button" class="collapsible" onclick="collapse(this);">예약 취소가 가능한 날짜는 언제까지인가요?</button>
        <div class="content">
            <p><br>
                예약 취소의 경우 입실일 하루전까지만 가능합니다.<br><br>
                취소 금액은 패널티 없이 결제 금액의 전액 환불해드리고 있습니다.<br><br>
                취소할 경우 마이페이지를 이용해주세요.<br>
            </p>
        </div>
        
        <button type="button" class="collapsible" onclick="collapse(this);">예약 취소를 하다가 문제가 발생하였어요!</button>
        <div class="content">
            <p><br>
                예약 취소하실때 오류가 발생하면 오류 발생 화면이 보입니다.<br><br>
                화면에서 TID 및 AID가 나오도록 사진을 찍어주시고 직접 문의를 통해 직접 취소를 진행해주세요.<br><br>
                빠른 시일내에 답변드리겠습니다.<br>
            </p>
        </div>
    
        <button type="button" class="collapsible" onclick="collapse(this);">체크인 체크아웃 시간이 궁금합니다.</button>
        <div class="content">
            <p><br>
                공식적으로 체크인 시간은 07:30 / 체크아웃 시간은 20:00입니다.<br><br>
                시간이 넘을 경우 예약 진행시 등록된 전화번호로 연락드립니다.<br><br>
                체크인 / 체크아웃 시간이 지날경우 불이익이 있을수 있습니다.<br>
            </p>
        </div>
    
        <button type="button" class="collapsible" onclick="collapse(this);">서비스 이용간 동물의 건강사항이 나빠지고 있는것 같아요.</button>
        <div class="content">
            <p><br>
                저희는 고객님의 반려견에게 검증된 서비스를 제공합니다.<br><br>
                그럼에도 불구하고 건강이 나빠질수 있으며, 계약기간내 반려견이 피해를 입을시 최소 50만원에서 최대 200만원까지 제공해드리고 있습니다.<br><br>
                이점을 숙지하고 동의해주셔야 입실이 가능합니다.<br>
            </p>
        </div>
        <br><br><br><br><br><br><br><br>
		
        <%@ include file="/views/common/footer.jsp" %>
        
        
	</body>
</html>