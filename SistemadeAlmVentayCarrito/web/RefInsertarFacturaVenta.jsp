<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="com.pe.DAO.ProductoDAO"%>
<%@page import="com.pe.model.entity.DetalleMovimiento"%>
<%@page import="com.pe.model.entity.Motivo"%>
<%@page import="com.pe.DAO.MotivoDAO"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="com.pe.model.entity.Movimiento"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link href="dist/css/css_estilocarrito.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <%    MovimientoDAO dao = new MovimientoDAO();

            int id = Integer.parseInt(request.getSession().getAttribute("FactVent").toString());
            Movimiento p = (Movimiento) dao.Reporte(id);
        %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <br>
            <section class="content">
                <form id="newventa" method="post" name="accion" action="RefPedidoaFacturaventaController">
                    <input type="hidden" name="accion" value="RegistrarrefFactura" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-outline card-info">
                                <div class="card-header">
                                    <h3 class="card-title" style=" color: #fff;">
                                        FACTURA DE VENTA
                                    </h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="d-flex">
                                                <label for="inputEmail3" class="col-sm-3 col-form-label" style="text-align:right">Documento:</label>
                                                <div class="col-sm-9">
                                                    <select name="txtTipodoc" id="tipo_comprobante" required="" class="form-control form-control-sm">
                                                        <option value="Factura de Venta">FACTURA DE VENTA</option>
                                                    </select>
                                                </div>
                                            </div>
                                             <% MovimientoDAO com = new MovimientoDAO();
                                                String numserie = com.NumserieFactura();
                                            %>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Número:</label>
                                                <div class="col-sm-2">
                                                    <input class="form-control form-control-sm" name="txtSerie" value="F001" required="">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="form-control form-control-sm" name="txtCorrelativo" value="<%=numserie%>" required="">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Razon social:</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group input-group-sm">
                                                        <input type="hidden" name="txtIdcli" value="<%=p.getIdauxiliar()%>" class="form-control">
                                                        <input type="text" name="txtNombre" value=" <%=AuxiliarDAO.getNombre(p.getIdauxiliar())%>" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">RUC:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtI" value="<%=AuxiliarDAO.getnrodocumento(p.getIdauxiliar())%>">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Referencia:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtReferencia" value="<%=p.getSerie()%>-<%=p.getCorrelativo()%>">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <!-- /.form-group -->
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Tienda:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtTienda" value="PLASTITEX S.A.C." required="">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Almacen:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtAlmacen" value="Almacen General" required="">
                                                </div>
                                            </div>
                                            <!-- /.form-group -->
                                            <div class="d-flex">
                                                <div class="col-sm-9">
                                                    <input type="hidden" name="txtCondicion" value="Contado" class="form-control form-control-sm" >
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Responsable:</label>
                                                <div class="col-sm-3">
                                                    <input class="form-control form-control-sm" type="text" name="txtIdusuario" value="<%=session.getAttribute("usuario")%>">
                                                    <input type="hidden" name="idmov" value="<%=p.getIdmovimiento()%>">
                                                </div>
                                                <% Date dNow = new Date();
                                                    SimpleDateFormat ft
                                                            = new SimpleDateFormat("dd/MM/yyyy");
                                                    String currentDate = ft.format(dNow);
                                                %>
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Fecha Emisión:</label>
                                                <div class="col-sm-3">
                                                    <input class="form-control  form-control-sm" value="<%=currentDate%>"  name="txtfecha">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label  class="col-sm-3 col-form-label" style="text-align:right">Forma de Pago:</label>
                                                <div class="col-sm-9">
                                                    <input type="Text" name="txtCondicion" value="Contado" class="form-control form-control-sm" >
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Dirección:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="text" name="txtdirecc" value="<%=AuxiliarDAO.getDireccion(p.getIdauxiliar())%>">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-->
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-outline card-info">
                                <div class="card-body p-0">
                                    <div class="table-wrapper">
                                        <table width="100% " class="table_fill table-striped">
                                            <thead>
                                                <tr>
                                                    <th style="width:3px;">Código</th>
                                                    <th >Nombre</th>
                                                    <th style="width:3px;">Cantidad</th>    
                                                    <th >Und</th> 
                                                    <th style="width:3px;">Precio</th>
                                                    <th >Sub Total</th>
                                                </tr>
                                            </thead>
                                            <%
                                                double total = 0;
                                                double igv = 0.00;
                                                double montototal = 0.00;

                                                ArrayList<DetalleMovimiento> listar = (ArrayList<DetalleMovimiento>) session.getAttribute("RefFacturaVenta");
                                                int fila = 0;

                                                if (listar != null) {
                                                    for (DetalleMovimiento ni : listar) {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td style="display:none;"><%=ni.getIdproducto()%></td>
                                                    <td><%= ProductoDAO.getCodProd(ni.getIdproducto())%></td>
                                                    <td style="width:500px;">
                                                        <p><%= ProductoDAO.getProducto(ni.getIdproducto())%></p>
                                                    </td>
                                                    <td style="width:2px; height:40px; text-align:center;"><p><%=String.format("%.2f",ni.getCantidad())%></p>

                                                    <td style="width:4px;">
                                                        <p><%=UnidadVentaDAO.getUndVenta(ni.getIdproducto())%></p>
                                                    </td>
                                                    <td style="width:4px;text-align:center;"><p><%=String.format("%.2f", ni.getCosto())%></p>
                                                    </td>
                                                    <td style="width:110px;text-align:right;"><%=String.format("%.2f", ni.getCantidad() * ni.getCosto())%></td>
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

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <div class="form-group row">
                                                    <input class="btn btn-success float-right" type="submit" value="Grabar" name="btnVenta"> 
                                                    <a class="btn btn-primary float-right" href="ListarFacturadeCompra.jsp" role="button">Salir</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card-body">
                                                <div class="form-group row">
                                                    <label for="inputEmail3" class="col-sm-4 col-form-label">Subtotal:</label>
                                                    <div class="col-sm-8">
                                                        <input style="text-align: right;" type="text" name="txtSubtotal" value="<%=String.format("%.2f", total)%>" readonly="readonly" class="form-control form-control-sm">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">I.G.V.</label>
                                                    <div class="col-sm-8">
                                                        <input style="text-align: right;" class="form-control form-control-sm" type="text" name="txtIgv" value="<%=String.format("%.2f", igv)%>" readonly="readonly">
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <label class="col-sm-4 col-form-label">Importe Total:</label>
                                                    <div class="col-sm-8">
                                                        <input style="text-align: right;" class="form-control form-control-sm" type="text" name="txtTotal" value="<%=String.format("%.2f", montototal)%>" readonly="readonly">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ./row -->
                </form>
                <!-- /.col-->

            </section>
            <!-- /.content -->
            <%@include file="js-plantilla.jsp"%> 
            <script src="plugins/toastr/toastr.min.js"></script>
            <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
            <script src="Validacionysweetalert/RefFacturaventa.js" type="text/javascript"></script>

            <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
            <!--Data table --->
    </body>
</html>
