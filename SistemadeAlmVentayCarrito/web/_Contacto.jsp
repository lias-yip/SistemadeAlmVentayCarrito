<%@page import="java.util.Iterator"%>
<%@page import="com.pe.model.entity.TipoDocumento"%>
<%@page import="java.util.List"%>
<%@page import="com.pe.DAO.TipoDocumentoDAO"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from htmldemo.net/flosun/flosun/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2022 05:03:27 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>FloSun - Flower Shop HTML5 Template</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assetcart/images/favicon.ico">

        <!-- CSS
            ============================================ -->
        <!-- Bootstrap CSS -->
        <%--sweet alert--%>
        <script src= " https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <%--sweet alert--%>
        <link rel="stylesheet" href="assetcart/css/vendor/bootstrap.min.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="assetcart/css/vendor/font.awesome.min.css">
        <!-- Linear Icons CSS -->
        <link rel="stylesheet" href="assetcart/css/vendor/linearicons.min.css">
        <!-- Swiper CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/swiper-bundle.min.css">
        <!-- Animation CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/animate.min.css">
        <!-- Jquery ui CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/jquery-ui.min.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/nice-select.min.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="assetcart/css/plugins/magnific-popup.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assetcart/css/style.css">
    </head>

    <body>
        <!-- Header Area Start Here -->
        <%@include file="Frmcliente.jsp" %>
        <div class="contact-us-area mt-no-text">
            <div class="container custom-area">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-custom">
                        <div class="contact-info-item">
                            <div class="con-info-icon">
                                <i class="lnr lnr-map-marker"></i>
                            </div>
                            <div class="con-info-txt">
                                <h4>Our Location</h4>
                                <p>(800) 123 456 789 / (800) 123 456 789 info@example.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-custom">
                        <div class="contact-info-item">
                            <div class="con-info-icon">
                                <i class="lnr lnr-smartphone"></i>
                            </div>
                            <div class="con-info-txt">
                                <h4>Contact us Anytime</h4>
                                <p>Mobile: 012 345 678<br>Fax: 123 456 789</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-custom text-align-center">
                        <div class="contact-info-item">
                            <div class="con-info-icon">
                                <i class="lnr lnr-envelope"></i>
                            </div>
                            <div class="con-info-txt">
                                <h4>Support Overall</h4>
                                <p>Support24/7@example.com <br> info@example.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-custom">
                        <form method="post" action="http://whizthemes.com/mail-php/reza/flosun/mail.php" id="contact-form" accept-charset="UTF-8" class="contact-form">
                            <div class="comment-box mt-5">
                                <h5 class="text-uppercase">Get in Touch</h5>
                                <div class="row mt-3">
                                    <div class="col-md-6 col-custom">
                                        <div class="input-item mb-4">
                                            <input class="border-0 rounded-0 w-100 input-area name gray-bg" type="text" name="con_name" id="con_name" placeholder="Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-custom">
                                        <div class="input-item mb-4">
                                            <input class="border-0 rounded-0 w-100 input-area email gray-bg" type="email" name="con_email" id="con_email" placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="col-12 col-custom">
                                        <div class="input-item mb-4">
                                            <input class="border-0 rounded-0 w-100 input-area email gray-bg" type="text" name="con_content" id="con_content" placeholder="Subject">
                                        </div>
                                    </div>
                                    <div class="col-12 col-custom">
                                        <div class="input-item mb-4">
                                            <textarea cols="30" rows="5" class="border-0 rounded-0 w-100 custom-textarea input-area gray-bg" name="con_message" id="con_message" placeholder="Message"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12 col-custom mt-40">
                                        <button type="submit" id="submit" name="submit" class="btn flosun-button secondary-btn theme-color rounded-0">Send A Message</button>
                                    </div>
                                    <p class="col-8 col-custom form-message mb-0"></p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!--Footer Area End-->

        <!-- JS
    ============================================ -->


        <!-- jQuery JS -->
        <script src="assetcart/js/vendor/jquery-3.6.0.min.js"></script>
        <!-- jQuery Migrate JS -->
        <script src="assetcart/js/vendor/jquery-migrate-3.3.2.min.js"></script>
        <!-- Modernizer JS -->
        <script src="assetcart/js/vendor/modernizr-3.7.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assetcart/js/vendor/bootstrap.bundle.min.js"></script>
        <!-- Swiper Slider JS -->
        <script src="assetcart/js/plugins/swiper-bundle.min.js"></script>
        <!-- nice select JS -->
        <script src="assetcart/js/plugins/nice-select.min.js"></script>
        <!-- Ajaxchimpt js -->
        <script src="assetcart/js/plugins/jquery.ajaxchimp.min.js"></script>
        <!-- Jquery Ui js -->
        <script src="assetcart/js/plugins/jquery-ui.min.js"></script>
        <!-- Jquery Countdown js -->
        <script src="assetcart/js/plugins/jquery.countdown.min.js"></script>
        <!-- jquery magnific popup js -->
        <script src="assetcart/js/plugins/jquery.magnific-popup.min.js"></script>
        <!-- Main JS -->
        <script src="assetcart/js/main.js"></script>
    </body>
</html>