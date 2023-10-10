<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kh.common.IP, java.io.File" %>

    <% 
        String contextRoot = "/pet-and-met"; 
        String contextPath = request.getContextPath();

        String ip = request.getRemoteAddr();
        String alertMsg = (String)session.getAttribute("alertMsg");

        // Member loginUser = (Member)session.getAttribute("loginUser");

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

        <!-- =======================================================
        * Template Name: Eterna
        * Updated: Sep 18 2023 with Bootstrap v5.3.2
        * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        <style>
            .mainBackGroundGreen { background-color: rgb(121, 172, 120); width: 100%; }
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
                    <a href="" style="color: white;"><b>로그인</b></a><p style="color: white;">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</p><a href="" style="color: white;"><b>회원가입</b></a>
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
                        <li><a class="active" href="<%= contextPath %>">예약</a></li>
                        <li class="dropdown"><a href="#"><span>소개</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="#">호텔 및 객실소개</a></li>
                                <li><a href="#">이용안내</a></li>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">위치안내</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="logo">
                    <h1 style="color: white;"><img src="<%= pagePath %>resources/img/main.png" width="80px" height="100px"><a href="<%= contextPath %>">Pet & Met</a></h1>
                </div>
                <div id="navbar" class="navbar">
                    <ul>
                        <li><a href="<%= contextPath %>">리뷰게시판</a></li>
                        <li class="dropdown"><a href="#"><span>고객문의</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <li><a href="#">FAQ 게시판</a></li>
                                <li><a href="#">1:1 문의</a></li>
                            </ul>
                        </li>
                    </ul>
                    <i class="bi bi-list mobile-nav-toggle"></i>
                </div><!-- .navbar -->
            </div>
        </header><!-- End Header -->
    </body>
</html>