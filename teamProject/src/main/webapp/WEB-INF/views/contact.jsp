<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Always force latest IE rendering engine -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Meta Keyword -->
        <meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
        <!-- meta character set -->
        <meta charset="utf-8">

        <!-- Site Title -->
        <title>Kasper One Page Template</title>
        
        <!--
        Google Fonts
        ============================================= -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700" rel="stylesheet" type="text/css">
        
        <!--
        CSS
        ============================================= -->
        <!-- Fontawesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Fancybox -->
        <link rel="stylesheet" href="css/jquery.fancybox.css">
        <!-- owl carousel -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <!-- Animate -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="css/main.css">
        <!-- Main Responsive -->
        <link rel="stylesheet" href="css/responsive.css">
        
        
        <!-- Modernizer Script for old Browsers -->
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
        <style>
            h4{
                display : inline;
                margin-right: 10px;
            }
            .btn{
                padding: 0px 2px;
            }
        </style>
    </head>
    
    <body>

        <!--
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar-fixed-top">
            <div class="container">

                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->

                    <!-- logo -->
                    <h1 class="navbar-brand">
                        <a href="#body">
                            <img src="img/logo.png" alt="Kasper Logo">
                        </a>
                    </h1>
                    <!-- /logo -->

                    </div>

                    <!-- main nav -->
                    <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                        <ul id="nav" class="nav navbar-nav">
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="./MyInfo.html">MyInfo</a></li>
                            <li><a href="./event.html">Event</a></li>                            
                            <li><a href="./contact.html">Contact</a></li>
                            <li><a href="./etc.html">Etc</a></li>
                        </ul>
                    </nav>
                    <!-- /main nav -->
                </div>

            </div>
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->
        
        <!--
        #service-bottom
        ========================== -->
        
        <section id="service-bottom">
            <div class="container">
                    <div class="mobile-device">
                       <img data-wow-delay="0.2s" class="img-responsive black  wow fadeInLeftBig" src="img/icons/iphone-black.png" alt="iPhone Black">
                        <img data-wow-delay="0.5s" class="img-responsive white  wow fadeInLeftBig" src="img/icons/iphone-white.png" alt="iPhone White">
                    </div>
                <div class="service-features wow fadeInRight">
                    <h3>OUR DESIGNS COMES WITH...</h3>
                    <ul>
                        <li>Responsive Design</li>
                        <li>Modern And Clean Design</li>
                        <li>Clean Code</li>
                        <li>Browser Friendly</li>
                    </ul>
                </div>
            </div>
        </section>
        <!--
        End #service-bottom
        ========================== -->

        <!--
        #contact
        ========================== -->
        <section id="contact">
            <div class="container">
                <div class="row">

                    <div class="section-title text-center wow fadeInDown">
                        <h2>문의사항 남기기</h2>
                        <p>영화와 관련된 질문사항이 있으면 문의사항을 작성해주세요.</p>
                    </div>
                    
                    <div class="col-md-8 col-sm-9 wow fadeInLeft">
                        <div class="contact-form clearfix">
                            <form action="index.html" method="post">
                                <div class="input-field">
                                    <input type="text" class="form-control" name="name" placeholder="성함" required="">
                                </div>
                                <div class="input-field">
                                    <input type="phone" class="form-control" name="phone" placeholder="전화번호" required="">
                                </div>
                                <div class="input-field message">
                                    <textarea name="message" class="form-control" placeholder="내용을 입력해주세요." required></textarea>
                                </div>
                                <input type="submit" class="btn btn-blue pull-right" value="문의사항 전송" id="msg-submit">
                            </form>
                        </div> <!-- end .contact-form -->
                    </div> <!-- .col-md-8 -->

                    <div class="col-md-4 col-sm-3 wow fadeInRight">
                        <div class="contact-details">
                            <span>전화번호</span>
                            <p>+82 010.999.888 <br> <br> +82 010.999.889</p>
                        </div> <!-- end .contact-details -->

                        <div class="contact-details">
                            <span>이메일</span>
                            <p>herais100@naver.com<br> <br>herais100@gmail.com</p>
                        </div> <!-- end .contact-details -->
                    </div> <!-- .col-md-4 -->

                </div>
            </div>
        </section>
        <!--
        End #contact
        ========================== -->

        <!--
        #about
        ========================== -->
        <section id="about">
            <div class="container">
                <div class="row">

                    <div class="section-title text-center wow fadeInUp">
                        <h2>About Us</h2>    
                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                    </div>
                    
                    <div class="about-us text-center wow fadeInDown">
                        <img src="img/about.png" alt="About Us" class="img-responsive">
                    </div>
                </div>
            </div>
        </section>
        <!--
        End #about
        ========================== -->
        
                <!--
        #about-us
        ========================== -->
        <section id="about-us">
            <div class="container">
                <div class="row">
                    
                    <div class="col-md-5 col-md-offset-1 wow fadeInLeft">

                        <div class="subtitle text-center">
                            <h3>Testimonials</h3>
                            <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                        </div>

                        <div id="testimonial">

                            <div class="tst-item clearfix">
                                <div class="tst-single clearfix">
                                    <img src="img/client/1.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                                        <span>John Doe,CEO</span>
                                    </div>
                                </div>

                                <div class="tst-single clearfix">
                                    <img src="img/client/2.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                                        <span>John Doe,CEO</span>
                                    </div>
                                </div>
                            </div>

                            <div class="tst-item">
                                <div class="tst-single clearfix">
                                    <img src="img/client/3.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                                        <span>John Doe,CEO</span>
                                    </div>
                                </div>
                                <div class="tst-single clearfix">
                                    <img src="img/client/1.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                                        <span>John Doe,CEO</span>
                                    </div>
                                </div>
                            </div>

                            <div class="tst-item">
                                <div class="tst-single clearfix">
                                    <img src="img/client/2.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                                        <span>John Doe,CEO</span>
                                    </div>
                                </div>
                                <div class="tst-single clearfix">
                                    <img src="img/client/3.jpg" alt="Client" class="img-circle">
                                    <div class="tst-content">
                                        <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                                        <span>John Doe,CEO</span>
                                    </div>
                                </div>
                            </div>

                        </div> <!-- end #testimonial -->
                    </div> <!-- end .col-md-5 -->

                    <div class="col-md-5 col-md-offset-1 wow fadeInRight">

                        <div class="subtitle text-center">
                            <h3>OUR SKILLS</h3>
                            <p>Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Mauris blandit aliquet elit, eget tincidunt.</p>
                        </div>

                        <div class="progress-bars">
                            
                            <span>HTML 5 - <small>95%</small></span>
                            <div class="progress"  data-progress="95">
                                <div class="bar"></div>
                            </div>
                            <span>CSS 3 - <small>93%</small></span>
                            <div class="progress"  data-progress="93">
                                <div class="bar"></div>
                            </div>
                            <span>PHP - <small>85%</small></span>
                            <div class="progress" data-progress="85">
                                <div class="bar"></div>
                            </div>
                            <span>mySQL - <small>87%</small></span>
                            <div class="progress kill-margin"  data-progress="87">
                                <div class="bar"></div>
                            </div>

                        </div>  <!-- progress-bars -->

                    </div>  <!-- end .col-md-5 -->

                </div>
            </div>
        </section>
        <!--
        End #about-us
        ========================== -->

                <!--
        #footer
        ========================== -->
        <footer id="footer" class="text-center">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">

                        <div class="footer-logo wow fadeInDown">
                            <img src="img/logo.png" alt="logo">
                        </div>

                        <div class="footer-social wow fadeInUp">
                            <h3>We are social</h3>
                            <ul class="text-center list-inline">
                                <li><a href="http://goo.gl/RqhEjP"><i class="fa fa-facebook fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/hUfpSB"><i class="fa fa-twitter fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/r4xzR4"><i class="fa fa-google-plus fa-lg"></i></a></li>
                                <li><a href="http://goo.gl/k9zAy5"><i class="fa fa-dribbble fa-lg"></i></a></li>
                            </ul>
                        </div>

                        <div class="copyright">
                           
                           Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>

                        </div>

                    </div>
                </div>
            </div>
        </footer>
        <!--
        End #footer
        ========================== -->


        <!--
        JavaScripts
        ========================== -->
        
        <!-- main jQuery -->
        <script src="js/vendor/jquery-1.11.1.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- jquery.nav -->
        <script src="js/jquery.nav.js"></script>
        <!-- Portfolio Filtering -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- Fancybox -->
        <script src="js/jquery.fancybox.pack.js"></script>
        <!-- Parallax sections -->
        <script src="js/jquery.parallax-1.1.3.js"></script>
        <!-- jQuery Appear -->
        <script src="js/jquery.appear.js"></script>
        <!-- countTo -->
        <script src="js/jquery-countTo.js"></script>
        <!-- owl carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- WOW script -->
        <script src="js/wow.min.js"></script>
        <!-- theme custom scripts -->
        <script src="js/main.js"></script>
        <script>
            $("#nav>li:eq(3)").attr("class","current");        
        </script>
    </body>
</html>
