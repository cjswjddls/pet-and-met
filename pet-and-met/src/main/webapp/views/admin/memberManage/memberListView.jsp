<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList, com.kh.member.model.vo.Member, com.kh.common.model.vo.PageInfo" %>
    <%
    	String pagePath = "../";
		String pageName = "회원 조회";
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
		int memberCount = (int)request.getAttribute("memberCount");
		
		int currentPage = pi.getCurrentPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		int maxPage = pi.getMaxPage();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 조회</title>
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
        
        .head-area{ /* 헤드 영역 */
            width: 1000px;
            height: 600px;
            box-sizing: border-box;
            margin: auto;
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

        /* 조회된 건수 : default-전체조회 */
        #select-result{ width: 800px; }

        /* 검색창 영역 */
        #search-area{
            width: 550px;
            margin-left:200px;
            margin-top: 30px;
        }
        
        #condition-select{ width: 120px;} /* 검색조건 */
        #search-user{ /* 입력창 */
            width: 330px;
            margin: auto;
        }
        #btn-search{ /* 검색버튼 */
            width: 80px;
            height: 35px;
            border: 0px;
            border-radius: 10px;
            background-color: rgb(121, 172, 120);
            color: white;
            margin: auto;
        }

        /* 회원리스트 테이블 */
        #userList-table{
            width: 800px;
            margin-left:220px;
            text-align: center;
        }
        #select-result{
         width: 800px;
         margin-left:220px;
         text-align: right;
        }
        #userList-table>thead{
            background-color: rgb(121, 172, 120);
            border: 1px solid lightgray;
            box-sizing: border-box;
        }
        #userList-table tbody{ border-top: 2px solid black;}
        #userList-table>tbody>tr:hover{
        cursor:pointer;
        }
        #userList-table td{
            border: 1px solid lightgray;
            box-sizing: border-box;
        }
        /* 제목줄 */
        #th-userNo{width: 80px;}
        #th-userName{width: 120px;}
        #th-userStatus{width: 70px;}
        #th-userEmail{width: 250px;}
        #th-userPhone{width: 150px;}

        /* 페이지번호 버튼 */
        
        .paging-area{
	        width: 800px;
	        margin-left:220px;
	        margin-top:50px;
        }
        
        .paging-area button{
        	border:0px;
        	width:40px;
        	height:40px;
        	background-color : rgb(121, 172, 120);
        	color:white;
        	border-radius:10px;
        }

    </style>      
</head>
<body>
    <%@ include file="../../common/adminAttachment.jsp" %>
    <!-- 
	<div class="head-area">
        <div class="head-title">
            <h4>회원 조회</h4>
        </div>
    </div>
    -->
    
    <div class="userListAll-body" align="center">
        <form action="selectBy.mm" method="get">
        <div style="display: flex;" id="search-area">
        <select id="condition-select" name="selected" class="form-control form-control">
            <option value="id">아이디</option>
            <option value="name">회원명</option>
        </select>
        <input type="text" id="search-user"  name="search" class="form-control form-control">
        <button type="submit" id="btn-search">
            검색
        </button>
        </div>
        <br>	
        <div>
            <div id="select-result">
            	<span style="font-size:18px; color:rgb(121, 172, 120);"><b>전체 회원 수 : <%= memberCount %></b></span>
            	<br>
                <span style="font-size:18	px;"><%= list.size() %> 건 조회중</span>
            </div>
            <table id="userList-table">
                <thead>
                <tr>
                    <th id="th-userNo">회원번호</th>
                    <th id="th-userId">아이디</th>
                    <th id="th-userName">회원명</th>
                    <th id="th-userPhone">연락처</th>
                    <th id="th-userEmail">이메일</th>
                    <th id="th-userStatus">상태</th>
                </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()) { %>
                	<td colspan="6">조회된 회원이 없습니다.</td>
                <% } else { %>
                	<% for(Member m : list) {%>
		                 <tr>
		                    <td><%= m.getMemberNo() %></td>
		                    <td><%= m.getMemberId() %></td>
		                    <td><%= m.getMemberName() %></td>
		                    <td><%= m.getMemberPhone() %></td>
		                    <td><%= m.getMemberEmail() %></td>
		                    <td><% if(m.getMemberStatus() == 0) { %>
				                    		<span style="color:red;">이용중지</span>
		                    		<% } else { %>
		                    				<span style="color:green;">이용중</span>
		                    		<% } %>
		                    </td>
		                 </tr>
                	<% } %>
                <% } %>
                
                </tbody>
            </table>
        
        </div>
        
        	<!-- 페이징바 -->
    <div class="paging-area" align="center">
        
    <% if(currentPage != 1) { %>
       		<!-- 1 페이지가 아닌 경우에만 이전페이지로 이동 가능하게끔 -->
        	<button id="pageBtnFirst">
        		&lt;
        	</button>
       	
       	<% } %>
           
           <% for(int p = startPage; p <= endPage; p++) { %>
            
	           	<% if(p != currentPage) { %>
	           	
	            	<button type="button" class="pageBtns" value="<%= p %>">
	            		<%= p %>
	            	</button>
	           		
	           	<% } else { %>
	           		
	           		<!-- 현재 내가 보고있는 페이지일 경우 클릭 안되게끔 -->
	           		<button disabled style="color:yellow; font-weight:900;"><%= p %></button>
	           		
	           	<% } %>
	           
	        <% } %>
	           
	           <% if(currentPage != maxPage) { %>
	           
	           	<!-- 마지막 페이지가 아닌 경우에만 다음페이지로 이동하게끔 -->
	            <button id="pageBtnLast">
	            	&gt;
	            </button>       
       <% } %>
           
       </div>

    </form>
    
    <br>

    </div>
    
    <!-- 상세정보로 이동하는 함수 -->
    <script>
    $(function() {
        $("#userList-table>tbody>tr").click(function() {
            let mno = $(this).children().eq(0).text();
            location.href = "<%= contextPath %>/detailView.mm?mno=" + mno;
        });

        let targetPage = $(this).val(); // 현재 페이지를 변수로 저장
        let currentPage = <%= currentPage %>
        
        $(".pageBtns").click(function() {
        	
            let c = $(this).val();
            location.href = '<%= contextPath %>/selectBy.mm?currentPage=' + c + '&selected=' + $("#condition-select").val() + '&search=' + $("#search-user").val();
            
        });

        $("#pageBtnFirst").click(function() {
            location.href = '<%= contextPath %>/selectBy.mm?currentPage=' + '(currentPage - 1)' + '&selected=' + $("#condition-select").val() + '&search=' + $("#search-user").val();
        });

        $("#pageBtnLast").click(function() {
            location.href = '<%= contextPath %>/selectBy.mm?currentPage=' + '(currentPage + 1)' + '&selected=' + $("#condition-select").val() + '&search=' + $("#search-user").val();
        });
        
    });
    </script>

</body>
</html>