<%@page import="com.pe.DAO.MotivoDAO"%>
<%@page import="com.pe.DAO.VehiculoDAO"%>
<%@page import="com.pe.DAO.TransporteDAO"%>
<%@page import="com.pe.DAO.ConductorDAO"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="com.pe.DAO.UnidadVentaDAO"%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de clientes</title>
        <link href="dist/css/Stilodetabla.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/detallepdfventas.css" rel="stylesheet" type="text/css"/>
        <script src="dist/js/PDF.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
        <%@include file="css-plantilla.jsp"%> 
    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Navbar -->
        <%@include file="Frmmenu.jsp" %>
        <%            MovimientoDAO dao = new MovimientoDAO();
            int id = Integer.parseInt((String) request.getAttribute("idGRC"));
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
                                                            <h4 class="FormatInvoiceCuadroCabecera">GUIA DE REMISION COMPRA</h4>
                                                            <h4 class="FormatInvoiceCuadroCabecera">&nbsp;<%=p.getSerie()%> - <%=p.getCorrelativo()%></h4>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top:2px !important">
                                                    <div class="col-xs-6">
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-4 col-xs-3">
                                                                <h6 class="FormatAlingProveedorInvoice"style="margin-top: 10px !important;">Destinatario:</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">Doc. ID:</h6>
                                                            </div>

                                                            <div class="col-md-8 col-sm-8 col-xs-8 PositionProveedorInvoice2">
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%= AuxiliarDAO.getNombre(p.getIdauxiliar())%></h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%= AuxiliarDAO.getnrodocumento(p.getIdauxiliar())%> </h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <div style="">
                                                            <div class="row">
                                                                <div class="col-md-5 col-sm-4 col-xs-3">
                                                                    <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">Responsable:</h6>
                                                                    <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px;">F.Emisión:</h6>
                                                                </div>
                                                                <div class="col-md-7 col-sm-2 col-xs-3">
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%= UsuarioDAO.getNombre(p.getIdusuario())%></h5>
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;"><%=p.getFecha()%></h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                <div class="row" style="margin-top:2px !important">
                                                    <div class="col-xs-6">
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-4 col-xs-3">
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px;">Transportista:</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">Modalidad:</h6>
                                                                <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px;">Identificación del Conductor:</h6>
                                                            </div>

                                                            <div class="col-md-6 col-sm-8 col-xs-8 PositionProveedorInvoice2">
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%=TransporteDAO.getNombre(p.getIdtrans())%> </h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%=TransporteDAO.getTipo(p.getIdtrans())%></h5>
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%=ConductorDAO.getNumerodocumento(p.getIdcond())%> </h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <div style="">
                                                            <div class="row">
                                                                <div class="col-md-5 col-sm-4 col-xs-3">
                                                                    <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">Marca:</h6>
                                                                    <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">Placa:</h6>
                                                                    <h6 class="FormatAlingProveedorInvoice" style="margin-top: 10px !important;">Motivo del Traslado:</h6>

                                                                </div>
                                                                <div class="col-md-7 col-sm-2 col-xs-3">
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%=VehiculoDAO.getPlaca(p.getIdvehi())%></h5>
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%=VehiculoDAO.getMarca(p.getIdvehi())%></h5>
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px !important;"><%= MotivoDAO.getNombreMotivo(p.getIdmotivo())%></h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top:2px !important">
                                                    <div class="col-xs-6">
                                                        <div class="row">
                                                            <div class="col-md-3 col-sm-4 col-xs-3">
                                                                <h6 class="FormatAlingProveedorInvoice" style=" margin-top: 10px;">Punto de partida:</h6>
                                                            </div>
                                                            <div class="col-md-8 col-sm-8 col-xs-8 PositionProveedorInvoice2">
                                                                <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;">Jr. Ancash Nrp. 919 int. 9 Lima - Lima - Lima</h5>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-5">
                                                        <div style="">
                                                            <div class="row">
                                                                <div class="col-md-5 col-sm-4 col-xs-3">
                                                                    <h6 class="FormatAlingProveedorInvoice" style=" margin-top: 10px;">Punto de llegada:</h6>                                                                </div>
                                                                <div class="col-md-7 col-sm-2 col-xs-3">
                                                                    <h5 class="FormatAlingProveedorInvoiceDetall" style="margin-top: 10px;"><%= AuxiliarDAO.getDireccion(p.getIdauxiliar())%> </h5>
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
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Cantidad</h4>
                                                                        </th>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">UM</h4>
                                                                        </th>
                                                                        <th class="BoderDimTableResponsiveProveedorInvoice">
                                                                            <h4 class="FormatTableResponsiveDetallCabecera" style="margin:6px;">Descripción</h4></th>
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
                                                                        <td class="FormatTableResponsiveDetallHijo3"><%=String.format("%.2f", pro.getCantidad())%></td>
                                                                        <td class="FormatTableResponsiveDetallHijo4"><%=UnidadVentaDAO.getUndVenta(pro.getIdproducto())%></td>
                                                                        <td class="FormatTableResponsiveDetallHijo1"><div style="padding-left: 8px; padding-right: 8px;"><%=ProductoDAO.getProducto(pro.getIdproducto())%></div></td>
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
                                                            <br>
                                                            <br>
                                                            <br> 
                                                            <br>
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
        <%@include file="js-plantilla.jsp"%> 
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="assets/bootstrapp.min.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Cliente.js" type="text/javascript"></script>

    </body>
</html>
