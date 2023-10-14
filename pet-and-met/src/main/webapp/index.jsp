<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% String pagePath = "./"; %>

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
      .mainCalender { display: flex; justify-content: center; background-color: aliceblue; }
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
      <section id="mainCalender" class="mainCalender container">
        <div>
          <h2 align="center">예약</h2><br>
          <form action="<%= contextPath %>/list.resv" method="POST">
            <table> 
              <thead>
                <tr>
                  <td width="100">객실선택</td>
                  <td width="280">날짜선택</td>
                  <td width="80">일수</td>
                  <td width="20"></td>
                  <td width="80">객실</td>
                  <td width="40"></td>
                  <td rowspan="2"><input type="submit" value="예약" class="btn btn-outline-success"></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><select name="mainReservationType" id="mainReservationType" required>
                    <option value="A">A타입</option>
                    <option value="B">B타입</option>
                  </select></td>
                  <td><input type="input" class="mainReservationDatePicker" id="mainReservationDatePicker" required></td>
                  <td><input type="text" id="mainReservationDays" class="mainReservationDays" readonly value="1일"></td>
                  <td></td>
                  <td><input type="text" id="mainReservationRoom" class="mainReservationRoom" readonly value="A타입"></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      </section>

      <script>
        $(function() {
          $(".mainReservationDatePicker").daterangepicker({
            locale: {
              "separator": " ~ ",
              "format": 'YYYY-MM-DD',
              showMonthAfterYear:true,
              showOn:"both",
              numberOfMonths:[1,2],
              "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
              "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              "applyLabel": "확인",
              "cancelLabel": "취소",
            },
            minDate: new Date(),
            showDropdowns: true,
            cancelButtonClasses: "btn btn-outline-secondary",
            applyButtonClasses:"btn btn-outline-success"
          })
          $(".mainReservationDatePicker").change(function() {
            let startDate = $(this).val().split(" ~ ")[0];
            let endDate = $(this).val().split(" ~ ")[1];
            $(".mainReservationDays").val(((new Date(endDate) - new Date(startDate))/(1000*60*60*24) + 1) + "일");
          })
          $("#mainReservationType").change(function(){
            let room = $(this).val() + '타입';
            $(".mainReservationRoom").val(room);
          })
        })
      </script>
    
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
                <li data-filter=".filter-app">공지사항</li>
                <li data-filter=".filter-card">리뷰게시판</li>
              </ul>
            </div>
          </div>
          <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>App 1</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>App</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-3.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>App 2</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 2</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 2</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>App 3</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 1</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 3</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 3</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-10.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 3</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-app">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-11.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>App 3</h4>
                  <p>App</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-12.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 3</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 portfolio-item filter-card">
              <div class="portfolio-wrap">
                <img src="resources/img/portfolio/portfolio-13.jpg" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>Card 3</h4>
                  <p>Card</p>
                  <div class="portfolio-links">
                    <a href="resources/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>
                    <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
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