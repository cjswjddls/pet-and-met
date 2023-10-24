<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Pet & Met</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- =======================================================
        * Template Name: Eterna
        * Updated: Sep 18 2023 with Bootstrap v5.3.2
        * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        <style>
            .mainFooterAHover { color: white; }
            .mainFooterAHover:hover { color: coral; }
            .mainFooterImgHover:hover { cursor: pointer; }
        </style>
    </head>
    <body>
        <!-- ======= Footer ======= -->
        <footer id="footer" style="background-color: rgb(121, 172, 120);">
            <div class="footer-newsletter">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6" style="display: flex; width: 100%;">
                            <img src="<%= pagePath %>resources/img/main.png" width="140" height="140" onclick="location.href='<%= contextPath %>'" class="mainFooterImgHover">
                            <div style="display: flex; padding-top: 30px; padding-bottom: 30px;">
                                <h2 style="line-height: 60px;"><b>&nbsp;Pet & Met</b></h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <h5 style="line-height: 60px;"><b><a href="<%= contextPath %>/lists.bo?currentPage=1&keyword=&method=" class="mainFooterAHover">호텔 소식</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="FAQ" class="mainFooterAHover">고객문의</a></b></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h4>사업자 정보</h4>
                            <p>
                            Pet & Met <br>
                            천정인 <br>
                            서울 영등포구 선유동2로 57 이레빌딩 19,20층<br><br>
                            <strong>Phone:</strong> +82 010 1234 5678<br>
                            <strong>Email:</strong> petmet@kh.com<br>
                            </p>
                        </div>
                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>이용약관</h4>
                            <ul>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">개인정보 수집 및 이용 약관</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="<%= contextPath %>/terms.indiv">개인정보 처리 방침</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="#">예약 취소 약관</a></li>
                                <li><i class="bx bx-chevron-right"></i> <a href="<%= contextPath %>/terms.service">서비스 이용 약관</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-6 footer-info">
                            <h3>Pet & Met</h3>
                            <p>기존의 단순한 동물에서 벗어나 인생의 동반자로서 잊지못할 추억을 만들어주세요.
                                바쁜 사회생활로 인해 피곤한 현대인들을 위한 서비스입니다.</p>
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="background-color: rgb(121, 172, 120);">
                <div align="center">
                    <a href="https://www.freepik.com/free-photo/modern-skyscraper-reflects-blue-cityscape-glass-window-generative-ai_41074064.htm#query=hotel&position=21&from_view=search&track=sph">작가 vecstock</a> 출처 Freepik<br>
                    <a href='https://kor.pngtree.com/freebackground/three-puppies-with-their-mouths-open-are-posing-for-a-photo_3054035.html'>작가 tree</a> 출처 pngtree<br>
                    <a href="https://www.freepik.com/free-psd/luxury-beach-house-generative-ai_47893239.htm#query=hotel&position=1&from_view=search&track=sph">작가 WangXiNa</a> 출처 Freepik<br>
                </div>
                <div class="copyright">
                    &copy; Copyright <strong><span>Eterna</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: https://bootstrapmade.com/license/ -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/ -->
                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
            </div>
        </footer><!-- End Footer -->

        <!--  상담버튼 -->
        <!-- <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-phone"></i></a> -->

        <!-- 페이지 맨위로 올라가는 아이콘(우상단에 있음)-->
        <!--<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>-->

        <!-- Vendor JS Files -->
        <script src="<%= pagePath %>resources/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="<%= pagePath %>resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="<%= pagePath %>resources/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="<%= pagePath %>resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="<%= pagePath %>resources/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="<%= pagePath %>resources/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="<%= pagePath %>resources/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="<%= pagePath %>resources/js/main.js"></script>
    </body>
</html>