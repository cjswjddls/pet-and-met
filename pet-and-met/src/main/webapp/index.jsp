<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% 
      String pagePath = "./";
      String reservationNextPage = "list.resv";
    %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Pet & Met</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts(바꾸려면 바꾸세요! 다만 구글폰트만 써주세요!) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Eterna
    * Updated: Sep 18 2023 with Bootstrap v5.3.2
    * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
    <style>
      .mainInputCoral { height: 50px; border-top: none; border-left: none; border-right: none; border-bottom: 3px solid coral; }
      .mainBackGroundGreen { background-color: rgb(121, 172, 120); width: 100%; }

      /* 지우기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! .mainCalender !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
      /* .mainCalender { display: flex; justify-content: center; background-color: aliceblue; } */
      
      .mainReservationDays, .mainReservationRoom { width: 100%; }
      .mainFooterAHover { color: white; }
      .mainFooterAHover:hover { color: rgb(227, 240, 111) }
      .portfolio-wrap img { width: 100%; height: 400px;}
    </style>
  </head>

  <body>
    <%@ include file="views/common/header.jsp" %>
    <!-- ======= Hero Section ======= -->
    <section id="hero">
      <div class="hero-container">
        <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">
          <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>
          <div class="carousel-inner" role="listbox">
            <!-- Slide 1 -->
            <div class="carousel-item active" style="background-image: url(resources/img/slide/slide-1.jpg)">
              <div class="carousel-container">
                <!--
                <div class="carousel-content">
                  <h2 class="animate__animated animate__fadeInDown">Welcome to <span>Eterna</span></h2>
                  <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
                  <a href="" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
                </div>
                -->
              </div>
            </div>
            <!-- Slide 2 -->
            <div class="carousel-item" style="background-image: url(resources/img/slide/slide-2.jpg)">
              <div class="carousel-container">
                <div class="carousel-content">
                  <h2 class="animate__animated fanimate__adeInDown">Lorem <span>Ipsum Dolor</span></h2>
                  <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
                  <a href="" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
                </div>
              </div>
            </div>
            <!-- Slide 3 -->
            <div class="carousel-item" style="background-image: url(resources/img/slide/slide-3.jpg)">
              <div class="carousel-container">
                <div class="carousel-content">
                  <h2 class="animate__animated animate__fadeInDown">Sequi ea <span>Dime Lara</span></h2>
                  <p class="animate__animated animate__fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
                  <a href="" class="btn-get-started animate__animated animate__fadeInUp">Read More</a>
                </div>
              </div>
            </div>
          </div>
          <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
            <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
          </a>
          <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
            <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
          </a>
        </div>
      </div>
    </section><!-- End Hero -->

    <main id="main">
      <br><br><br><br><br><br><br>
      <%@ include file="views/reservation/reservationCalender.jsp" %>
      <br><br>
      <section id="portfolio" class="portfolio">
        <div class="container" data-aos="fade-up">
          <div class="section-title">
            <h2>포토존</h2>
            <p>포토형태로 글을 보세요!</p>
          </div>
          <div class="row" data-aos="fade-up" data-aos-delay="100">
            <div class="col-lg-12 d-flex justify-content-center">
              <ul id="portfolio-flters">
                <li data-filter="*" class="filter-active">전체</li>
                <li data-filter=".filter-app">시설사진</li>
                <li data-filter=".filter-card">이달의 강아지</li>
              </ul>
            </div>
          </div>
          <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/main/facil/1.PNG" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>취침공간</h4>
                  <p>취침공간</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/facil/1.PNG" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/main/facil/2.PNG" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>놀이공간</h4>
                  <p>놀이공간</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/facil/2.PNG" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/main/facil/3.PNG" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>A타입</h4>
                  <p>A타입</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/facil/3.PNG" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/2.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/main/facil/4.PNG" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>B타입</h4>
                  <p>B타입</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/facil/4.PNG" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/3.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/4.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/5.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/6.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/main/facil/5.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>놀이공터</h4>
                  <p>놀이공터</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/facil/5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/main/month/7.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>이달의 강아지</h4>
                  <p>이달의 강아지</p>
                  <div class="portfolio-links">
                    <a href="resources/img/main/month/7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="#" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main><!-- End #main -->
    <%@ include file="views/common/footer.jsp" %>
  </body>
</html>