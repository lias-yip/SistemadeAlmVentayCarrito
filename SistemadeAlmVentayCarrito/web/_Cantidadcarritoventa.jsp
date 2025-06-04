
<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.pe.model.entity.Producto"%>
<%@page import="com.pe.DAO.ProductoDAO"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from htmldemo.net/flosun/flosun/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2022 05:03:17 GMT -->
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
    <style>
        .stock-agotado {
            color: red; /* Color rojo para indicar agotado */
            font-weight: bold; /* Texto en negrita */
            /* Otros estilos según necesites */
        }

        .stock-disponible {
            color: green; /* Color verde para indicar disponible */
            /* Otros estilos según necesites */
        }
    </style>
    <body>
        <!-- Header Area Start Here -->
        <%@include file="Frmcliente.jsp" %>
        <!-- Shop Main Area Start Here -->
        <!-- Breadcrumb Area Start Here -->
        <%            Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("idproxalmcarrito")));
        %>
        <!-- Breadcrumb Area End Here -->
        <div class="single-product-main-area">
            <form method="post" action="PedidoCarritoController" accion="AnadirCarritocarrito"> 
                <div class="container container-default custom-area">
                    <div class="row">
                        <div class="col-lg-5 offset-lg-0 col-md-8 offset-md-2 col-custom">
                            <div class="product-details-img">
                                <div class="single-product-img swiper-container gallery-top popup-gallery">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <a class="w-100" width="150" height="550"href="<%= p.getFilename1()%>">
                                                <img class="w-100" width="150" height="550" src="<%= p.getFilename1()%>" alt="Product">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="w-100" width="150" height="520" href="<%= p.getFilename2()%>">
                                                <img class="w-100" width="150" height="520" src="<%= p.getFilename2()%>" alt="Product">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="w-100" width="150" height="520" href="<%= p.getFilename3()%>">
                                                <img class="w-100" width="150" height="520" src="<%= p.getFilename3()%>" alt="Product">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="w-100" width="150" height="520" href="<%= p.getFilename4()%>">
                                                <img class="w-100" width="150" height="520" src="<%= p.getFilename4()%>" alt="Product">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="w-100" width="150" height="520" href="<%= p.getFilename5()%>">
                                                <img class="w-100" width="150" height="520" src="<%= p.getFilename5()%>" alt="Product">
                                            </a>
                                        </div>
                                        <div class="swiper-slide">
                                            <a class="w-100" width="150" height="520" href="<%= p.getFilename6()%>">
                                                <img class="w-100" width="150" height="520" src="<%= p.getFilename6()%>" alt="Product">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="single-product-thumb swiper-container gallery-thumbs">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide">
                                            <img width="130" height="130" src="<%= p.getFilename1()%>" alt="Product">
                                        </div>
                                        <div class="swiper-slide">
                                            <img width="130" height="130" src="<%= p.getFilename2()%>" alt="Product">
                                        </div>
                                        <div class="swiper-slide">
                                            <img width="130" height="130" src="<%= p.getFilename3()%>" alt="Product">
                                        </div>
                                        <div class="swiper-slide">
                                            <img width="130" height="130" src="<%= p.getFilename4()%>" alt="Product">
                                        </div>
                                        <div class="swiper-slide">
                                            <img width="130" height="130" src="<%= p.getFilename5()%>" alt="Product">
                                        </div>
                                        <div class="swiper-slide">
                                            <img width="130" height="130" src="<%= p.getFilename6()%>" alt="Product">
                                        </div>
                                    </div>
                                    <!-- Add Arrows -->
                                    <div class="swiper-button-next swiper-button-white"><i class="lnr lnr-arrow-right"></i></div>
                                    <div class="swiper-button-prev swiper-button-white"><i class="lnr lnr-arrow-left"></i></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-custom">
                            <div class="product-summery position-relative">
                                <div class="product-head mb-3">
                                    <input  type="hidden" type="text"  name="txtPro_id" value="<%=p.getIdproducto()%>"readonly="">
                                    <h2 class="product-title"><%=p.getDescripcion()%></h2>
                                </div>
                                <div class="price-box mb-2">
                                    <input class="form-control" type="hidden" id="txtPro_precio" name="txtPro_precio" value="<%=String.format("%.2f", p.getPrecioVenta())%>">
                                    <span class="regular-price"><%=String.format("%.2f", p.getPrecioVenta())%></span>
                                </div>
                                <p class="desc-content mb-5"><%=p.getObser()%></p>
                                <div class="price-box mb-2">
                                    <H4 class="regular-price <%= p.getStock() == 0 ? "stock-agotado" : "stock-disponible"%>">
                                        <% if (p.getStock() == 0) { %>
                                        Stock Agotado
                                        <% } else {%>
                                        <%= String.format("%.2f", p.getStock())%> <%= UnidadVentaDAO.getUndVenta(p.getIdproducto())%> Disponibles
                                        <% }%>
                                    </H4> 
                                </div>
                                </br>
                                <div class="quantity-with_btn mb-5">
                                    <div class="quantity">
                                        <div class="cart-plus-minus">
                                            <input class="cart-plus-minus-box" id="txtPro_cantidad"  max="<%=p.getStock()%>" name="txtPro_cantidad" value="1" type="number">
                                            <div class="dec qtybutton">-</div>
                                            <div class="inc qtybutton">+</div>
                                        </div>
                                    </div>
                                    <div class="add-to_cart">
                                        <input type="submit" value="Agregar al Carrito" class="btn product-cart button-icon flosun-button dark-btn" name="btnAnadir">
                                        <a href="Index.jsp" class="btn flosun-button secondary-btn rounded-0">Cancelar</a>
                                        <input type="hidden" name="accion" value="AnadirCarritocarrito"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <!--Footer Area Start-->
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


    <!-- Mirrored from htmldemo.net/flosun/flosun/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2022 05:03:17 GMT -->
</html>