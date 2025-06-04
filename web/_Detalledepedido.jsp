<%@page import="com.pe.DAO.EmpresaDAO"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
<%@page import="com.pe.model.entity.DetalleMovimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!doctype html>
<html class="no-js" lang="en">



    <!-- Mirrored from htmldemo.net/flosun/flosun/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2022 05:03:26 GMT -->
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
    <%
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("tipo") == null) {

            response.sendRedirect("login.jsp");
        } else {
            String tipo = sesion.getAttribute("tipo").toString();
            if (!tipo.equals("Cliente")) {
                response.sendRedirect("login.jsp");
            }
        }
    %>
    <%
        String cod = (String) session.getAttribute("usuario");
        Usuario xusu = UsuarioDAO.listimg(cod);
    %>

    <body>
        <%@include file="Frmcliente.jsp" %>
        <!-- cart main wrapper start -->
        <div class="cart-main-wrapper mt-no-text">
            <form id="newventa" method="post" name="accion" action="PedidoCarritoController">
                <input type="hidden" name="accion" value="Registrarcarritodeventa" />
                <div class="container custom-area">
                    <div class="col-sm-9">
                        <input class="form-control form-control-sm" type="hidden" value="<%=xusu.getIdcliente()%>" name="txtAuxiliar">
                    </div>
                    <div class="col-sm-9">
                        <input type="hidden" class="form-control form-control-sm" name="txtTipodoc" value="Pedido de venta" readonly="">
                    </div>
                    <% MovimientoDAO com = new MovimientoDAO();
                        String numserie = com.NumseriePedi();
                    %>
                    <div class="d-flex">
                        <div class="col-sm-2">
                            <input type="hidden" class="form-control form-control-sm" name="txtSerie" value="P001" readonly="">
                        </div>
                        <div class="col-sm-3">
                            <input type="hidden" class="form-control form-control-sm" name="txtCorrelativo" value="<%=numserie%>" readonly="">
                        </div>
                    </div>
                    <% Date dNow = new Date();
                        SimpleDateFormat ft
                                = new SimpleDateFormat("dd/MM/yyyy");
                        String currentDate = ft.format(dNow);
                    %>
                    <div class="col-sm-3">
                        <input type="hidden" class="form-control  form-control-sm" value="<%=currentDate%>"  name="txtfecha">
                    </div>
                    <div class="col-sm-3">
                        <input  type="hidden" class="form-control  form-control-sm" value=""  name="txtFechaentrega">
                    </div>
                    <div class="d-flex">
                        <div class="col-sm-9">
                            <input class="form-control form-control-sm" type="hidden" id="txtTienda" name="txtTienda" value="<%=EmpresaDAO.Nombre()%>">
                        </div>
                    </div>
                        <div class="d-flex">
                        <div class="col-sm-9">
                            <input class="form-control form-control-sm" type="hidden" id="txtUsuario" name="txtUsuario" value="<%=xusu.getId()%>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-custom">
                            <!-- Cart Table Area -->
                            <div class="cart-table table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="pro-thumbnail">Imagen</th>
                                            <th class="pro-title">Producto</th>
                                            <th class="pro-price">Precio</th>
                                            <th class="pro-quantity">Cantidad</th>
                                            <th class="pro-subtotal">Total</th>
                                            <th class="pro-remove">Eliminar</th>
                                        </tr>
                                    </thead>
                                    <%
                                        double total = 0;
                                        double igv = 0.00;
                                        double montototal = 0.00;

                                        ArrayList<DetalleMovimiento> listar = (ArrayList<DetalleMovimiento>) session.getAttribute("carrito");
                                        int fila = 0;

                                        if (listar != null) {
                                            for (DetalleMovimiento ni : listar) {
                                    %>
                                    <tbody>
                                        <tr>
                                            <td class="pro-thumbnail"><a href="#"><img class="img-fluid" src="<%=ni.getProducto().getFilename1()%>" width="100" height="100"/></a></td>
                                            <td class="pro-title"><a href="#"><%=ni.getProducto().getDescripcion()%></a></td>
                                            <td class="pro-price">
                                                <%=ni.getCosto()%>
                                            </td>
                                            <td >
                                                <div class="">
                                                    <div class="">
                                                        <input style="text-align: center;" class="form-control form-control-sm" type="number" value="<%=String.format("%.2f", ni.getCantidad())%>" step="1" min="1" id="txtPro_cantidad<%=fila%>" name="txtPro_cantidad"  onchange="Actualizarcantidadcarrito(<%= fila%>)" required>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="pro-subtotal"><span><%=String.format("%.2f", ni.getCantidad() * ni.getCosto())%></span></td>
                                            <td style="width:3px;">
                                                <span id="idarticulo" style="display:none;"><%= ni.getProducto().getIdproducto()%></span>

                                                <button style="background-color: transparent; color: red; border: none" id="deleteitem" class="delete">
                                                    <i class="lnr lnr-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <%
                                                    fila++;
                                                    montototal = montototal + ni.getCantidad() * (Math.round(ni.getCosto() * 100.00) / 100.00);
                                                    igv = montototal * 0.18;
                                                    total = montototal - igv;
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-5 ml-auto col-custom">
                            <!-- Cart Calculation Area -->
                            <div class="cart-calculator-wrapper">
                                <div class="cart-calculate-items">
                                    <h3>Cart Totals</h3>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <td>Sub Total</td>
                                                <td><input style="text-align: right;" type="text" name="txtSubtotal" value="<%=String.format("%.2f", total)%>" readonly="readonly" class="form-control form-control-sm">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>IGV</td>
                                                <td><input style="text-align: right;" class="form-control form-control-sm" type="text" name="txtIgv" value="<%=String.format("%.2f", igv)%>" readonly="readonly">
                                                </td>
                                            </tr>
                                            <tr class="total">
                                                <td>Total</td>
                                                <td class="total-amount">
                                                    <input style="text-align: right;" class="form-control form-control-sm" type="text" name="txtTotal" value="<%=String.format("%.2f", montototal)%>" readonly="readonly">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <input class="btn flosun-button primary-btn rounded-0 black-btn w-100" type="submit" value="Grabar" name="btnVenta">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- cart main wrapper end -->
        <%@include file="footer.jsp" %>
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
        <script src="Validacionysweetalert/Carritopedido.js" type="text/javascript"></script>
    </body>
</html>