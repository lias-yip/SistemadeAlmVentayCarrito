
<%@page import="com.pe.model.entity.Clasificacion"%>
<%@page import="com.pe.DAO.ClasificacionDAO"%>
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
    <body>
        <%@include file="Frmcliente.jsp" %>

        <div class="shop-main-area">
            <div class="container container-default custom-area">
                <div class="row flex-row-reverse">
                    <div class="col-12 col-custom widget-mt">
                        <!--shop toolbar start-->
                        <div class="shop_toolbar_wrapper mb-30 d-flex align-items-center justify-content-between">
                            <div class="shop_toolbar_btn">
                                <button data-role="grid_4" type="button" class="active btn-grid-4" title="Grid-4"><i class="fa fa-th"></i></button>
                                <button data-role="grid_3" type="button" class="btn-grid-3" title="Grid-3"> <i class="fa fa-th-large"></i></button>
                                <button data-role="grid_list" type="button" class="btn-list" title="List"><i class="fa fa-th-list"></i></button>
                            </div>
                            <div class="">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="searchInput" placeholder="Buscar productos...">
                                    <div class="input-group-append">
                                        <button class="btn flosun-button secondary-btn rounded-0" type="button" onclick="filterProducts()">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="shop-select">
                                <form class="d-flex flex-column w-100" action="#">
                                    <div class="form-group">
                                        <select id="categorySelect" class="form-control nice-select w-100" onchange="filterProducts()">
                                            <option value="">Categoria</option>
                                            <% ClasificacionDAO mar = new ClasificacionDAO();
                                                List<Clasificacion> list = mar.ListadoEstadoActivos();
                                                Iterator<Clasificacion> ite = list.iterator();
                                                while (ite.hasNext()) {
                                                    Clasificacion m = ite.next();
                                            %>
                                            <option value="<%=m.getNombre()%>"><%=m.getNombre()%></option>
                                            <% } %>
                                        </select>
                                    </div>
                                </form>
                            </div>

                        </div>
                        <!--shop toolbar end-->
                        <!-- Shop Wrapper Start -->
                        <div class="row shop_wrapper grid_4" id="productContainer">
                            <%
                                ProductoDAO pdao = new ProductoDAO();
                                List<Producto> listS = pdao.ListadoProducto();
                                Iterator<Producto> iterr = listS.iterator();
                                Producto pro = null;
                                while (iterr.hasNext()) {
                                    pro = iterr.next();%>
                            <div class="col-lg-3 col-md-6 col-sm-6  col-custom product-area">
                                <div class="product-item">
                                    <div class="single-product position-relative mr-0 ml-0">
                                        <div class="product-image">
                                            <a class="d-block" href="_Cantidadcarritoventa.jsp?idproxalmcarrito=<%= pro.getIdproducto()%>">
                                                <img src="<%= pro.getFilename1()%>" width="80" height="320"  alt="" class="product-image-1 w-100">
                                                <img src="<%= pro.getFilename2()%>" width="80" height="320" alt="" class="product-image-2 position-absolute w-100">
                                            </a>

                                            <div class="add-action d-flex flex-column position-absolute">
                                                <a href="_Cantidadcarritoventa.jsp?idproxalmcarrito=<%= pro.getIdproducto()%>"  data-bs-target="#exampleModalCenter">
                                                    <i class="lnr lnr-eye" data-toggle="tooltip" data-placement="left" title="Ver Detalle"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="product-content">
                                            <div class="product-title">
                                                <h4 class="title-2"> 
                                                    <a href="_Cantidadcarritoventa.jsp?idproxalmcarrito=<%= pro.getIdproducto()%>"><%= pro.getDescripcion()%></a>
                                                </h4>
                                            </div>
                                            <div class="product-title">
                                                <h4 class="title-3"> 
                                                    <a href="_Cantidadcarritoventa.jsp?idproxalmcarrito=<%= pro.getIdproducto()%>"><%=ClasificacionDAO.getNombreClasificacion(pro.getIdproducto())%></a>
                                                </h4>
                                            </div>
                                            <div >
                                                <h4 class="regular-price " style="color: #FF0000;">S/<%=String.format("%.2f", pro.getPrecioVenta())%></h4>
                                            </div>
                                            <a  href="ControllerdatosModal?accion=Cantidadcarrit&id=<%=pro.getIdproducto()%>"  class="btn flosun-button dark-btn button-icon" data-toggle="modal" data-target="#exampleModalCenter">AGREGAR AL CARRITO</a>
                                        </div>
                                        <div class="product-content-listview">
                                            <div class="product-title">
                                                <h4 class="title-2"> <a href="_Cantidadcarritoventa.jsp?idproxalmcarrito=<%= pro.getIdproducto()%>"><%= pro.getDescripcion()%></a></h4>
                                            </div>
                                            <div class="price-box">
                                                <h4 class="regular-price " style="color: #FF0000;">S/<%=String.format("%.2f", pro.getPrecioVenta())%></h4>
                                            </div>
                                            <p class="desc-content"><%=pro.getObser()%></p>
                                            <div class="button-listview">
                                                <a  href="ControllerdatosModal?accion=Cantidadcarrit&id=<%=pro.getIdproducto()%>"  class="btn product-cart button-icon flosun-button dark-btn" data-toggle="modal" data-target="#exampleModalCenter">AGREGAR AL CARRITO</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                        <!-- Shop Wrapper End -->
                    </div>
                </div>
            </div>
        </div>
        <!--Footer Area Start-->
        <%@include file="footer.jsp" %>
        <!--Footer Area End-->
        <div class="modal flosun-modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                </div> 
            </div>
        </div>
        <div class="modal flosun-modal fade" id="" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <div class="modal-body">
                    </div>
                </div>                    
            </div>
        </div>
        <!-- Scroll to Top Start -->
        <a class="scroll-to-top" href="#">
            <i class="lnr lnr-arrow-up"></i>
        </a>
        <!-- Scroll to Top End -->
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
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="dist/js/bootstrap.min.js" type="text/javascript"></script>
        <%@include file="js-plantilla.jsp"%>
        <!-- Main JS -->
        <script src="assetcart/js/main.js"></script>
        <script>
                                            function filterProducts() {
                                                var searchText = document.getElementById('searchInput').value.toLowerCase();
                                                var selectedCategory = document.getElementById('categorySelect').value.toLowerCase();

                                                var products = document.querySelectorAll('.product-area');

                                                products.forEach(product => {
                                                    var title = product.querySelector('.title-2 a').textContent.toLowerCase();
                                                    var categoryLink = product.querySelector('.title-3 a');
                                                    var productName = categoryLink ? categoryLink.textContent.trim().toLowerCase() : '';

                                                    var matchesSearch = title.includes(searchText);
                                                    var matchesCategory = selectedCategory === '' || productName === selectedCategory;

                                                    if (matchesSearch && matchesCategory) {
                                                        product.style.display = 'block';
                                                    } else {
                                                        product.style.display = 'none';
                                                    }
                                                });
                                            }


        </script>
        <script>
            function filterProductss() {
                var searchText = document.getElementById('searchInput').value.toLowerCase();
                var selectedCategory = document.querySelector('.nice-select').value.toLowerCase(); // Assuming '.nice-select' is the selector for your select dropdown

                var products = document.querySelectorAll('.product-area');

                products.forEach(product => {
                    var title = product.querySelector('.title-2 a').textContent.toLowerCase();
                    var categoryLink = product.querySelector('.title-3 a');
                    var productName = categoryLink ? categoryLink.textContent.trim().toLowerCase() : '';

                    var matchesSearch = title.indexOf(searchText) > -1;
                    var matchesCategory = selectedCategory === '' || productName === selectedCategory;

                    if (matchesSearch && matchesCategory) {
                        product.style.display = 'block';
                    } else {
                        product.style.display = 'none';
                    }
                });
            }

        </script>
    </body>


    <!-- Mirrored from htmldemo.net/flosun/flosun/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2022 05:03:17 GMT -->
</html>