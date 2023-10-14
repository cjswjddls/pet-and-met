<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String pagePath = "./"; %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
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
		
    <button type="button" class="collapsible" onclick="collapse(this);">전화번호를 알려주세요.</button>
    <div class="content">
        <p>010-9481-1400입니다.</p>
    </div>

    <button type="button" class="collapsible" onclick="collapse(this);">예약문의는 어떻게 하나요?</button>
    <div class="content">
        <p>모릅니다.</p>
    </div>
    
    <button type="button" class="collapsible" onclick="collapse(this);">제목 3</button>
    <div class="content">
        <p>내용 3 입니다.</p>
    </div>

    <button type="button" class="collapsible" onclick="collapse(this);">제목 4</button>
    <div class="content">
        <p>내용 4 입니다.</p>
    </div>

    <button type="button" class="collapsible" onclick="collapse(this);">제목 5</button>
    <div class="content">
        <p>내용 5 입니다.</p>
    </div>
		
        <%@ include file="/views/common/footer.jsp" %>
        
        
	</body>
</html>