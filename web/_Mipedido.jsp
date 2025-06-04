<%@page import="com.pe.model.entity.Movimiento"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
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
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
        <%--sweet alert--%>
        <script src= " https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <%--sweet alert--%>
    </head>

    <body>
        <!-- Header Area Start Here -->
        <%@include file="Frmcliente.jsp" %>
        <%            MovimientoDAO dao = new MovimientoDAO();
            int id = Integer.parseInt((String) request.getAttribute("idMPED"));
            Movimiento p = (Movimiento) dao.Reporte(id);
        %>

        <!-- Shop Main Area Start Here -->
        <!-- my account wrapper start -->
        <div class="my-account-wrapper mt-no-text">
            <div class="container container-default-2 custom-area">

                <div class="row">
                    <div class="col-lg-12 col-custom">
                        <!-- My Account Page Start -->
                        <div class="myaccount-page-wrapper">
                            <!-- My Account Tab Menu Start -->
                            <div class="row">
                                <!-- My Account Tab Content Start -->
                                <div class="col-lg-12 col-md-12 col-custom">
                                    <div class="tab-content" id="myaccountContent">
                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>Mi Orden</h3>
                                                <div class="myaccount-table table-responsive text-center">
                                                    <table class="table table-bordered">
                                                        <thead class="thead-light">
                                                            <tr>
                                                                <th>Cliente</th>
                                                                <th>Doc</th>
                                                                <th>Nº Doc</th>
                                                                <th>Fecha</th>
                                                                <th>Total</th>
                                                                <th>Estado</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%  MovimientoDAO vdao = new MovimientoDAO();
                                                                List<Movimiento> vlist = vdao.Mipedido(id);
                                                                Iterator<Movimiento> itvent = vlist.iterator();
                                                                Movimiento vent = null;

                                                                while (itvent.hasNext()) {
                                                                    vent = itvent.next();

                                                            %>
                                                            <tr>
                                                                <td style="display:none;" id="idv"><%= vent.getIdmovimiento()%></td>
                                                                <td style="display:none;"><%= vent.getIddocref()%></td>
                                                                <td><%= AuxiliarDAO.getNombre(vent.getIdauxiliar())%></td>
                                                                <td><%= AuxiliarDAO.getnrodocumento(vent.getIdauxiliar())%></td>
                                                                <td style="display:none;"><%= vent.getTipocomprobante()%></td>
                                                                <td><%= vent.getSerie()%>-<%= vent.getCorrelativo()%></td>
                                                                <td style="display:none;"><%= vent.getCorrelativo()%></td>
                                                                <%
                                                                    String da = vent.getFecha();
                                                                    String newda = da.substring(0, 10);
                                                                    String newdaa = da.substring(0, 2);
                                                                    String newdb = newda.substring(3, 5);
                                                                    String newdc = newda.substring(6, 10);
                                                                    String newdd = newdb + "/" + newdaa + "/" + newdc;
                                                                %>
                                                                <td><%= newdd%></td>
                                                                <td ALIGN="right"><%=String.format("%.2f", vent.getTotal())%></td>

                                                                <% String Estado = vent.getEstado();
                                                                    if (Estado.equalsIgnoreCase("Pendiente")) {%>
                                                                <td><markpendiente><%= Estado%></markpendiente></td>   
                                                                <%   } else if (Estado.equalsIgnoreCase("Terminado")) {%>
                                                        <td><markTerminado><%= Estado%></markTerminado></td>   
                                                            <%   } else {%>
                                                        <td><markanulado><%= Estado%></markanulado></td>    
                                                            <%     }
                                                            %>
                                                        <td>
                                                            <%
                                                                if (Estado.equalsIgnoreCase("Pendiente")) {%>
                                                            <!--<a data-toggle="modal" data-target="#editarestad" class="btn flosun-button secondary-btn theme-color  rounded-0">Anular</a>-->
                                                            <%   } else if (Estado.equalsIgnoreCase("Anulado")) { %>
                                                            <%}%>

                                                            <a href="DetallePDFController?accion=DetalleOC&id=<%= vent.getIdmovimiento()%>" class="btn flosun-button secondary-btn theme-color  rounded-0">Detalle</a>
                                                        </td>
                                                        </tr>

                                                        <%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div> <!-- Single Tab Content End -->
                                    </div>
                                </div> <!-- My Account Tab Content End -->
                            </div>
                        </div> <!-- My Account Page End -->
                    </div>
                </div>

            </div>
            <div id="editarestad" class="modal fade" >
                <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                    <div class="modal-content">
                        <form id="editaresta"  method="post" action="PedidoventaController" name="frm_edit"> 
                            <div class="modal-body">  
                                <div class="form-group">
                                    <input  type="hidden" type="text"  name="txtid" id="txtid" readonly="">
                                </div> 
                                <div class="form-group">
                                    <h6 style=" text-align: center;">Estas Seguro de anular el documento?</h6>
                                    <input type="hidden" class="form-control"  name="Txtidref" id="Txtidref" >
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <input class="btn btn-warning" type="submit" name="accion" value="Anular">
                                <a href="" class="btn btn-default" >Cancelar</a> 

                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>

        <!-- my account wrapper end -->
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
        <!-- ./wrapper -->
        <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
        <%@include file="js-plantilla.jsp"%>  
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>                   
        <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Pedido.js" type="text/javascript"></script>
        <script >
            $('.editbtn').on('click', function () {
                $tr = $(this).closest('tr');
                var datos = $tr.children('td').map(function () {
                    return $(this).text();
                });
                $('#txtid').val(datos[0]);
                $('#Txtidref').val(datos[1]);
            })
        </script>

    </body>
</html>