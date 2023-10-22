<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.common.IP, java.io.File, 
                    com.kh.member.model.vo.Member,
                    com.kh.common.Keys" %>

    <% 
        String contextRoot = "/pet-and-met"; 
        String contextPath = request.getContextPath();

        String ip = request.getRemoteAddr();

        Member loginMember = (Member)session.getAttribute("loginMember");
        String alertMsg = (String)session.getAttribute("alertMsg");

        Cookie[] cookies = request.getCookies();
	    String saveId = "";
	
	    if(cookies != null) { for(int i=0; i < cookies.length; i++) { if(cookies[i].getName().equals("userId")) { saveId = cookies[i].getValue(); break; } } }
    %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Pet & Met</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons(대충 창 아이콘) -->
        <link href="<%= pagePath %>resources/img/favicon.png" rel="icon">
        <link href="<%= pagePath %>resources/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Vendor CSS Files -->
        <link href="<%= pagePath %>resources/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="<%= pagePath %>resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="<%= pagePath %>resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="<%= pagePath %>resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="<%= pagePath %>resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="<%= pagePath %>resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="<%= pagePath %>resources/css/style.css" rel="stylesheet">

        <!-- jQuery 3.7버전 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <!-- jQuery UI -->
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>

        <!-- Latest compiled JavaScript -->
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- datepicker range -->
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        
        <!-- 데이터피커쪽 관련-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

        <!-- Popper JS -->
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->

        <!-- =======================================================
        * Template Name: Eterna
        * Updated: Sep 18 2023 with Bootstrap v5.3.2
        * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        <style>
            .mainBackGroundGreen { background-color: rgb(121, 172, 120); width: 100%; }
            .modal{ transform: translate(-5%, 40%); }
            .modal-header {background-color: rgb(230, 230, 230);}
            .modal-body { height: 160px; }
            .modal-content{ width: 700px;}
            .modal-reservation {
                width: 45%;
                height: 75%;
                display: inline-block;
                margin: auto;
                margin-left: 5px;
                border: 1px solid lightgrey;
                margin-top: 20px;
            }
            #modal-reservation1 { margin-left: 25px;}
            .reservation-div1 { width: 30px; height: 30px; margin: auto; margin-top: 15px;}
            .reservation-div2 { margin: auto; margin-top: 15px; text-align: center;}
            .reservation-img {width: 100%; height: 100%;}
        </style>
    </head>
    <body>
        <section id="topbar" class="d-flex align-items-center">
            <div class="container d-flex justify-content-center justify-content-md-between">
                <div class="contact-info d-flex align-items-center">
                    <i class="bi bi-envelope d-flex align-items-center"><a href="mailto:petmet@kh.com" style="color: white;">&nbsp;petmet@kh.com</a></i>
                    <i class="bi bi-phone d-flex align-items-center ms-4"><span style="color: white;">82+ 010-1234-5678</span></i>
                </div>
                <div class="social-links d-none d-md-flex align-items-center">
                    <% if((loginMember != null) && (((Member)(loginMember)).getMemberAdmin() == 1)) { %>
                        <a href="<%= contextPath %>/admin.mainPage" style="color: white;"><b>어드민 페이지</b></a><p style="color: white;">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p>
                    <% } %>
                    <% if(loginMember == null) { %>
	                	<a href="<%= contextPath %>/login.mb" style="color: white;"><b>로그인</b></a><p style="color: white;">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p><a href="<%= contextPath %>/send.rg" style="color: white;"><b>회원가입</b></a>
                	<% } else { %>
		                <a href="<%= contextPath %>/logout.mb" style="color: white;"><b>로그아웃</b></a><p style="color: white;">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p><a href="<%= contextPath %>/main.mp" style="color: white;"><b>마이페이지</b></a>
                	<% } %>
                    <!--
                    <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></i></a>
                    -->
                </div>
            </div>
        </section>
        
        <!-- ======= Header ======= -->
        <header id="header" class="d-flex align-items-center">
            <div class="container d-flex justify-content-between align-items-center mainBackGroundGreen" style="height: 100%; width:100%">      
                <div class="navbar">
                    <ul>
                        <li><a class="active" href="<%= contextPath %>" data-toggle="modal" data-target="#myModal">예약</a></li>
                        <li class="dropdown"><a href="<%= contextPath %>/doghouse"><span>소개</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="<%= contextPath %>/hotel">호텔 소개</a></li>
                                <li><a href="<%= contextPath %>/doghouse">객실 소개</a></li>
                                <li><a href="<%= contextPath %>/lists.bo?currentPage=1&keyword=&method=">공지사항</a></li>
                                <li><a href="<%= contextPath %>/use">이용안내</a></li>
                                <li><a href="<%= contextPath %>/map">위치안내</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <!-- 예약하기 모달창 -->
				<div class="modal" id="myModal">
				    <div class="modal-dialog">
				        <div class="modal-content">
			
                            <!-- Modal Header -->
                            <div class="modal-header">
				                <h4 class="modal-title">예약</h4>
				                <button type="button" class="close" data-dismiss="modal">&times;</button>
				            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="modal-reservation" id="modal-reservation1" style=" cursor: pointer;" onclick="location.href='<%= contextPath %>/main.resv';">
                                    <div class="reservation-div1">
                                        <img class="reservation-img" src="<%= pagePath %>resources/img/room/bed_icon.png">
                                    </div>
                                    <div class="reservation-div2">객실 예약</div>
                                </div>             
                                <div class="modal-reservation" style=" cursor: pointer;" onclick="location.href='<%= contextPath %>/check.resv';">
                                    <div class="reservation-div1">
                                        <img class="reservation-img" src="<%= pagePath %>resources/img/room/note_icon.png">
                                    </div>
                                    <div class="reservation-div2">예약 내역 조회</div>
                                </div>
                            </div>

				        </div>
				    </div>
				</div>

                <div class="logo">
                    <h1 style="color: white;"><img src="<%= pagePath %>resources/img/main.png" width="80px" height="100px"><a href="<%= contextPath %>">Pet & Met</a></h1>
                </div>
                <div id="navbar" class="navbar">
                    <ul>
                        <li><a href="<%= contextPath %>/reviewList.rv?currentPage=1">리뷰게시판</a></li>
                        <li class="dropdown"><a href="<%= contextPath %>/FAQ"><span>고객문의</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="<%= contextPath %>/FAQ">FAQ 게시판</a></li>
                                <li><a href="#">1:1 문의</a></li>
                            </ul>
                        </li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </div><!-- .navbar -->
            </div>
        </header><!-- End Header -->
        <script>
            let msg = "<%= alertMsg %>";
            if (msg != "null") {
                window.alert(msg);
                <% session.removeAttribute("alertMsg"); %>
            }
		</script>
    </body>
</html>