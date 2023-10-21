<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.HttpURLConnection" %>
    <%
        String pagePath = "./"; 
        String tid = (String)request.getAttribute("tid");
        String aid = (String)request.getAttribute("aid");
        int amount = (int)request.getAttribute("amount");
        int amountAfter = (int)request.getAttribute("amountAfter");
    %>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .paymentCancelTable { background-color: rgb(121, 172, 120); color: azure; }
    </style>
    </head>
    <body>
        <%@ include file="../common/header.jsp" %>

        <br><br><br><br>
		<div class="container">
            <h1 align="center">예약취소</h1>
            <hr>
            <div class="container">
                <table class="paymentCancelTable" align="center">
                    <tr>
                        <th>결제고유번호(TID)</th>
                        <td><%= tid %></td>
                    </tr>
                    <tr>
                        <th>요청고유번호(AID)</th>
                        <td><%= aid %></td>
                    </tr>
                    <tr>
                        <th>환불요청금액</th>
                        <td><%= amount %></td>
                    </tr>
                    <tr>
                        <th>실환불금액</th>
                        <td><%= amountAfter %></td>
                    </tr>
                </table>
                <br><br><br><br>
                <h3 align="center">성공적으로 예약이 취소되었습니다.</h3>
            </div>
        </div>
        <br><br><br>

        <%@ include file="../common/footer.jsp" %>
    </body>
</html>