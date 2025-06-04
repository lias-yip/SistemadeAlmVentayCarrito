<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="com.pe.model.entity.UnidadVenta"%>
<%@page import="com.pe.DAO.ProductoDAO"%>
<%@page import="com.pe.model.entity.DetalleMovimiento"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="com.pe.model.entity.Movimiento"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
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

    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Navbar -->
        <%@include file="Frmcliente.jsp" %>
        <%            MovimientoDAO dao = new MovimientoDAO();
            int id = Integer.parseInt((String) request.getAttribute("idOC"));
            Movimiento p = (Movimiento) dao.Reporte(id);
        %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="mdl-grid center-block" style="background-color: #fff;width: 72%;">
                            <div class="container d-flex justify-content-center mt-50 mb-50">
                                <!-- /.card-header -->
                                <div class="row">
                                    <div class="col-md-12 text-right mb-3">
                                        <button class="btn btn-sm btn-primary" id="download">Descargar PDF</button>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="card" id="invoice">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="panel1 col-xs-1 DivLogos">
                                                        <img src="<%=EmpresaDAO.img()%>" width="150px" height="88px" alt=""/>   
                                                    </div>
                                                    <div class="col-xs-7 DivLogos">
                                                        <h6 class="FormatLetraRazonEmisor"><%=EmpresaDAO.Nombre()%></h6>
                                                        <h6 class="FormatLetraDirEmisor"><%=EmpresaDAO.Direccion()%><br><%=EmpresaDAO.ubigeo()%></h6>
                                                        <h6 class="FormatLetraDirEmisor"><%=EmpresaDAO.adicional()%></h6>
                                                    </div>
                                                    <div class="col-xs-4 DivInvoceCuadroCabecera">
                                                        <div class="panel1 panel-default DivContentInvoceCuadroCabecera">
                                                            <h4 class="FormatInvoiceCuadroCabecera">RUC:&nbsp;<%=EmpresaDAO.Nro()%></h4>
                                                            <h4 class="FormatInvoiceCuadroCabecera"><%=p.getTipocomprobante()%></h4>
                                                            <h4 class="FormatInvoiceCuadroCabecera">&nbsp;<%=p.getSerie()%> - <%=p.getCorrelativo()%></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top:2px !important">

                                                    <div class="col-xs-6">
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-4 col-xs-3">
                                                                <h6 class="FormatAlingProveedorInvoice"style="margin-top: 10px !important;">PROVEEDOR</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 20px !important;">RUC</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">TÉLEFONO</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px;">F.EMISIÓN</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important; color: #000">REFERENCIA</h6>
                                                            </div>
                                                            <div class="col-md-8 col-sm-8 col-xs-8 PositionProveedorInvoice2">
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;">: <%= AuxiliarDAO.getNombre(p.getIdauxiliar())%></h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 20px !important;">: <%= AuxiliarDAO.getnrodocumento(p.getIdauxiliar())%> </h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;">: <%= AuxiliarDAO.gettelefono(p.getIdauxiliar())%> </h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;">: <%=p.getFecha()%></h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;">: <%=p.getReferencia()%></h5>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-xs-5">
                                                        <div style="">
                                                            <div class="row">
                                                                <div class="col-md-5 col-sm-4 col-xs-3">
                                                                    <h6 class="FormatAlingProveedorInvoice" style=" margin-top: 10px;">LUGAR DE ENTREGA</h6>
                                                                    <h6 class="FormatAlingProveedorInvoice" style=" margin-top: 10px;">FECHA DE ENTREGA</h6>
                                                                    <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px;">MONEDA</h6>
                                                                    <h6 class="FormatAlingProveedorInvoice" style=" margin-top: 10px;">COND.PAGO</h6>
                                                                </div>
                                                                <div class="col-md-7 col-sm-2 col-xs-3">
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;">: Instalaciones de Plastitex SAC </h5>
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;">: <%=p.getFechaentrega()%> </h5>
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;">: Soles</h5>
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;">: <%=p.getCondicion()%></h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 DivDimenTablaDetalleProveedorInvoice">
                                                    <div class="panel panel-default PanelDefaultResponsive">
                                                        <div class="table-responsive DivDimTableResponsiveProveedorInvoice">
                                                            <table class="table table-condensed table_Invoice_Detall" style="height: 40%" >
                                                                <thead style="background-color: #ebedf1e8;">
                                                                    <tr>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Código</h4>
                                                                        </th>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Descripción</h4></th>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Cantidad</h4>
                                                                        </th>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Und</h4>
                                                                        </th>

                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Precio</h4>
                                                                        </th>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoiceCancel">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Total</h4>
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <%  MovimientoDAO pdao = new MovimientoDAO();
                                                                        List<DetalleMovimiento> listS = pdao.ticketDetalle(id);
                                                                        Iterator<DetalleMovimiento> iterr = listS.iterator();
                                                                        DetalleMovimiento pro = null;
                                                                        double total = 0, igv = 0, subtotal = 0;
                                                                        DecimalFormat formatea = new DecimalFormat("###,###.##");
                                                                        String Msubtotal = "";
                                                                        String Migv = "";
                                                                        while (iterr.hasNext()) {
                                                                            pro = iterr.next();%>

                                                                    <tr class="TrTableDeltalleProveedor">
                                                                        <td class="FormatTableResponsiveDetallHijo4"><%=ProductoDAO.getCodProd(pro.getIdproducto())%></td>
                                                                        <td class="FormatTableResponsiveDetallHijo1"><div style="padding-left: 8px; padding-right: 8px;"><%=ProductoDAO.getProducto(pro.getIdproducto())%></div></td>
                                                                        <td class="FormatTableResponsiveDetallHijo3"><%=String.format("%.2f", pro.getCantidad())%></td> 
                                                                        <td class="FormatTableResponsiveDetallHijo4"><%=UnidadVentaDAO.getUndVenta(pro.getIdproducto())%></td>
                                                                        <td class="FormatTableResponsiveDetallHijo4"><%=String.format("%.2f", pro.getCosto())%></td>
                                                                        <td class="FormatTableResponsiveDetallHijo5"><%=String.format("%.2f", pro.getCosto() * pro.getCantidad())%></td>
                                                                    </tr>
                                                                    <%}%>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <div class="d-md-flex flex-md-wrap">
                                                    <div class="pt-2 mb-3 wmin-md-400 ml-auto">
                                                        <div class="table-responsive">
                                                            <table class="table" >
                                                                <tbody>
                                                                    <tr >
                                                                        <th class="text-left" ">Subtotal:</th>
                                                                        <th class="text-right font-weight-normal">S/</th>
                                                                        <td class="FormatTablaDetalleMontoInvoice2"><span style="float:right; padding-right:4px"><%=String.format("%.2f", p.getSubtotal())%></span></td>
                                                                    </tr>
                                                                <th class="text-left">IGV: <span class="font-weight-normal">(18%)</span></th>
                                                                <th class="text-right font-weight-normal">&nbsp; &nbsp; &nbsp; &nbsp;S/</th>
                                                                <td class="FormatTablaDetalleMontoInvoice2"><span style="float:right; padding-right:4px"><%=String.format("%.2f", p.getIgv())%></span></td>
                                                                <tr>
                                                                    <th class="text-left">Importe Total:</th>
                                                                    <th class="text-right font-weight-normal">S/</th>
                                                                    <td class="FormatTablaDetalleMontoInvoice2" ><span style="float:right; padding-right:4px"><%=String.format("%.2f", p.getTotal())%></span></td>
                                                                </tr>
                                                                <tr>
                                                                    <th class="text-left"></th>
                                                                    <th class="text-left"></th>
                                                                    <td class="text-right"></td>
                                                                </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </div>
                        <!-- /.card -->
                        <!-- /.card -->

                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>

        <!-- ./wrapper -->
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="assets/bootstrapp.min.js" type="text/javascript"></script>
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
    </body>
</html>
