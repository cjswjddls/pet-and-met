<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.member.model.vo.Member" %>
    <%
        String contextPath = request.getContextPath();
        Member m = (Member)request.getAttribute("m");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery 라이브러리 연동 (온라인 방식) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    @font-face {
           font-family: 'Pretendard-Regular';
           src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
           font-weight: 400;
           font-style: normal;
       }
       * { font-family: 'Pretendard-Regular'; }
       
       .head-area{
           width: 1000px;
           height: 600px;
           box-sizing: border-box;
           margin: auto;
       }
      .head-area{
           border-bottom: 3px solid rgb(121, 172, 120);
           box-sizing: border-box;
           margin: auto;
           width: 800px;
           height: 20%;
       }
       .head-title>h4{ /* 헤드 텍스트 */
           font-size: 26px;
           font-weight: 700;
           color: rgb(121, 172, 120);
           display: inline-block;
           margin-top: 60px;
           padding-bottom:10px;
           margin-left: 25px;
       }
       #detailView-table{
        margin-top: 50px;
        width: 650px;
        height: 350px;
        border: 2px solid rgb(121, 172, 120);
       }
       #detailView-table th{
        width: 100px;
        height: 50px;
        font-size: 16px;
        text-align: center;
       }
       #detailView-table td{
        width: 550px;
        font-size: 14px;
        padding-left: 10px;
       }

       #btn-goList{
        border: 0px;
        border-radius: 10px;
        width: 100px;
        height: 40px;
        margin-top: 30px;
        margin-bottom: 30px;
        color: white;
        background-color: rgb(121, 172, 120);
       }

       #selectStatus{ width: 80px; height: 25px;}
       #btn-updateStatus{
        width: 80px;
        height: 25px;
        border: 0px;
        border-radius: 10px;
       }

</style>

</head>

<body>

    <div class="head-area">
        <div class="head-title">
            <h4>회원 상세정보</h4>
        </div>
    </div>

    <div class="detailView-body" align="center">

        <form action="statusChange.mm" method="get">
            <table id="detailView-table">
                <tr>
                    <th>회원번호</th>
                    <td>
                    	<%= m.getMemberNo() %>
                    	<input type="hidden" name="memberNo" value="<%= m.getMemberNo() %>">
                    </td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td><%= m.getMemberId() %></td>
                </tr>
                <tr>
                    <th>회원명</th>
                    <td><%= m.getMemberName() %></td>
                </tr>
                <tr>
                    <th>휴대폰번호</th>
                    <td><%= m.getMemberPhone() %></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <%= m.getMemberAddress() %>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><%= m.getMemberEmail() %></td>
                </tr>
                <tr>
                    <th>가입일</th>
                    <td><%= m.getMemberJoin() %></td>
                </tr>
                <tr>
                    <th>회원상태</th>
                    <td>
                    	<% if(m.getMemberStatus() == 1) { %>
                    	<span style="color:green;">이용중</span>&nbsp;&nbsp;&nbsp;
                    	<% } else { %>
                    	<span style="color:red;">이용중지</span>&nbsp;&nbsp;&nbsp;
                    	<% } %>
                        <select id="selectStatus" name="status">
                            <option value="1">
                            이용중
                            </option>
                            <option value="0">
                            이용중지
                            </option>
                        </select>
                        <button type="submit" id="btn-updateStatus">
                            변경하기
                        </button>
                    </td>
                </tr>
                <tr>
                    <th>탈퇴일자</th>
                    <td>
                    <% if(m.getMemberLeave() == null) { %>
                    	-
                    <% } else { %>
                    	<%= m.getMemberLeave() %>
                    <% } %>
                    </td>
                </tr>
                <tr>
                    <th>탈퇴사유</th>
                    <td>
                    <% if(m.getMemberLeaveReason() == null) { %>
                    	-
                    <% } else { %>
                    	<%= m.getMemberLeaveReason() %>
                    <% } %></td>
                </tr>
            </table>
            
            <button type="button" id="btn-goList" onclick="location.href='<%= contextPath %>/selectBy.mm?currentPage=1&selected=&search='">
                목록으로
            </button>

        </form>
    </div>


</body>
</html>