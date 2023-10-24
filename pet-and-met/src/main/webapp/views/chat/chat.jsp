<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String pagePath = "./"; %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1:1 채팅 이용안내</title>

    <style>

        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }

        * {
            font-family: 'Pretendard-Regular';
        }

        .stepone{
            font-size:24px;
            color:rgb(121, 172, 120);
        }
        .steptwo{
            font-size:24px;
            color:rgb(121, 172, 120);
        }
        .stepthree{
            font-size:24px;
            color:rgb(121, 172, 120);
        }
    </style>

</head>
<body>
    <%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/sidebarQuestion.jsp" %>
    <div class="step" align="center">
        <div class="stepone">
            <h4>1. 오른쪽 아래 실시간 채팅 버튼을 눌러주세요.</h4>
            <img src="<%= pagePath %>resources/img/chat/chat_button.jpg"/>
        </div><br><br>
        <div class="steptwo">
            <h4>2. 채팅 시작을 위한 양식을 입력해주세요.</h4>
            <img src="<%= pagePath %>resources/img/chat/chat_form.jpg"/>
        </div><br><br>
        <div class="stepthree">
            <h4>3. 버튼을 눌러 관리자와 채팅을 시작하세요.</h4>
            <img src="<%= pagePath %>resources/img/chat/chat_start.jpg"/>
        </div><br><br>
    </div>
    <%@ include file="/views/common/footer.jsp" %>

	<!--Start of Tawk.to Script-->
	<script type="text/javascript">
        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
        (function(){
            var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
            s1.async=true;
            s1.src='https://embed.tawk.to/6535c21fa84dd54dc483fa45/1hdcvsj45';
            s1.charset='UTF-8';
            s1.setAttribute('crossorigin','*');
            s0.parentNode.insertBefore(s1,s0);
        })();
	</script>
    <br><br>
<!--End of Tawk.to Script-->
</body>
</html>