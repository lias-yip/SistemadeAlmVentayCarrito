<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="com.pe.model.entity.DetalleMovimiento"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
<%@page import="com.pe.model.entity.Auxiliar"%>
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
        <title>AdminLTE 3 | Editors</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link href="dist/css/css_estilocarrito.css" rel="stylesheet" type="text/css"/>
    </head>
    <%  Auxiliar objClienteCO = null;
        if (request.getSession().getAttribute("clientePEDI") != null) {
            objClienteCO = (Auxiliar) request.getSession().getAttribute("clientePEDI");
        } else {
            objClienteCO = new Auxiliar();
            objClienteCO.setIdauxiliar(0);
            objClienteCO.setCorreo("");
            objClienteCO.setNumerodocumento("0");
            objClienteCO.setNombre("");
            objClienteCO.setDireccion("");
        }
    %>
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <br>
            <section class="content">
                <form id="newventa" method="post" name="accion" action="PedidoventaController">
                    <input type="hidden" name="accion" value="Registrarpedido" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-outline card-info">
                                <div class="card-header">
                                    <h3 class="card-title" style=" color: #fff;">
                                        EMITIR PEDIDO VENTA
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
                                                     <input class="form-control form-control-sm" name="txtTipodoc" value="Pedido de venta" readonly="">
                                                   
                                                </div>
                                            </div>
                                            <% MovimientoDAO com = new MovimientoDAO();
                                                String numserie = com.NumseriePedi();
                                            %>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Número:</label>
                                                <div class="col-sm-2">
                                                    <input class="form-control form-control-sm" name="txtSerie" value="P001" readonly="">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="form-control form-control-sm" name="txtCorrelativo" value="<%=numserie%>" readonly="">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Cliente:</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group input-group-sm">
                                                        <input type="hidden" name="txtIdcli" value="<%=objClienteCO.getIdauxiliar() == 0 ? "" : objClienteCO.getIdauxiliar()%>" class="form-control" required="">
                                                        <input type="text" name="txtNombre" value=" <%=objClienteCO.getNombre()%>" class="form-control" required="">
                                                        <span class="input-group-append">
                                                            <a href="#Buscarcliente" class="btn btn-info btn-flat editbtn" data-toggle="modal">Buscar</a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">RUC:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtI" value="<%=objClienteCO.getNumerodocumento()%>">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Referencia:</label>
                                                <div class="col-sm-3">
                                                    <input type="text" class="form-control form-control-sm" name="txtReferencia" value="">
                                                </div>
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Forma de Pago:</label>
                                                <div class="col-sm-3">
                                                    <input type="text" name="txtCondicion" value="Contado" class="form-control form-control-sm" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">

                                            <!-- /.form-group -->
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Tienda:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="text" id="txtTienda" name="txtTienda" value="<%=EmpresaDAO.Nombre()%>">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Almacen:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="txt" id="txtAlmacen" name="txtAlmacen" value="Almacen General">
                                                </div>
                                            </div>
                                            <!-- /.form-group -->
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Responsable:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="text" value="<%=session.getAttribute("usuario")%>" name="txtUsuario" >
                                                </div>
                                            </div>
                                            <% Date dNow = new Date();
                                                SimpleDateFormat ft
                                                        = new SimpleDateFormat("dd/MM/yyyy");
                                                String currentDate = ft.format(dNow);
                                            %>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Fecha Emisión:</label>
                                                <div class="col-sm-3">
                                                    <input class="form-control  form-control-sm" value="<%=currentDate%>"  name="txtfecha">
                                                </div>
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Fecha Entrega:</label>
                                                <div class="col-sm-3">
                                                    <input type="date" class="form-control  form-control-sm" value=""  name="txtFechaentrega">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Dirección:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="text" name="txtdirecc" value="<%=objClienteCO.getDireccion()%>">
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-->
                    </div>
                    <!-- ./row -->
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
                                                    <th >Quitar</th>
                                                </tr>
                                            </thead>
                                            <%
                                                double total = 0;
                                                double igv = 0.00;
                                                double montototal = 0.00;

                                                ArrayList<DetalleMovimiento> listar = (ArrayList<DetalleMovimiento>) session.getAttribute("carpedi");
                                                int fila = 0;

                                                if (listar != null) {
                                                    for (DetalleMovimiento ni : listar) {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td style="width:3px;">
                                                        <p><%= ni.getProducto().getCodigo()%></p>
                                                    </td>
                                                    <td >
                                                        <p><%=ni.getProducto().getDescripcion()%></p>
                                                    </td>
                                                    <td  style="width:5px;">
                                                        <input  class="form-control form-control-sm" style="width : 110px; text-align:center;" type="number" value="<%=String.format("%.2f", ni.getCantidad())%>" placeholder="1.00" step="0.01" min="0.01" id="txtPro_cantidad<%=fila%>" name="txtPro_cantidad"  onchange="ActualizarcantidadPEDI(<%= fila%>)" required>
                                                    </td>
                                                    <td style="width:100px; text-align: center;">
                                                        <p><%=UnidadVentaDAO.getUndVenta(ni.getIdproducto())%></p>
                                                    </td>
                                                    <td style="width:4px;">
                                                        <input class="form-control form-control-sm" style="width : 110px; text-align:center;" type="number" value="<%=String.format("%.2f", ni.getCosto())%>" id="txtPro_precio<%=fila%>" name="txtPro_precio" step="0.01" min="0.01" onchange="Actualizarprecio(<%= fila%>)" required="">
                                                    </td>
                                                    <td style="width:110px;text-align:right;"><%=String.format("%.2f", ni.getCantidad() * ni.getCosto())%></td>
                                                    <td style="width:3px;">
                                                        <span id="idarticulo" style="display:none;"><%= ni.getProducto().getIdproducto()%></span>

                                                        <button style="background-color: transparent; color: red; border: none " id="deleteitem" class="delete">
                                                            <i class="glyphicon glyphicon-remove" data-toggle="tooltip" title="Delete"></i>
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

                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <div class="form-group row">
                                                    <a href="ProductosActivospedi.jsp" class="btn btn-primary float-right"  role="button" style="height: 30px;display: inline-block;margin-bottom: 0;font-weight: bold;text-align: center;vertical-align: middle;letter-spacing: 1px;text-transform: uppercase;-ms-touch-action: manipulation;touch-action: manipulation;cursor: pointer;transition: all 0.2s;background-image: none;border: 2px solid transparent;white-space: nowrap;padding: 2px 18px;font-size: 12px;line-height: 1.78571;border-radius: 20px;-webkit-user-select: none;-ms-user-select: none;user-select: none;padding-top: 3px;">Agregar Item</a>
                                                    <a class="btn btn-secondary" href="PedidoventaController?accion=Limpiarpedi">Limpiar</a> 
                                                    <a class="btn btn-primary float-right" href="ListarPedidoventa.jsp" role="button">Salir</a>
                                                    <input class="btn btn-success float-right" type="submit" value="Grabar" name="btnVenta"> 
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
                </form>
                <!-- /.col-->
                <div class="modal fade" id="Buscarcliente">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Lista de Cliente</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="table-responsive">
                                    <table id="m" class="table table-bordered table-hover projects"  width="100%">
                                        <thead>
                                            <tr>
                                                <th style="display:none; width:0%;"></th>
                                                <th style="width:8%">Ok</th>
                                                <th class="">CÓDIGO</th>
                                                <th >NOMBRE</th>
                                                <th class="">NRO DOCUMENTO</th>
                                            </tr>
                                        </thead>
                                        <tbody >
                                            <% AuxiliarDAO prov = new AuxiliarDAO();
                                                List<Auxiliar> list = prov.ListadeClientesActivos();
                                                Iterator<Auxiliar> ite = list.iterator();
                                                Auxiliar p = null;
                                                while (ite.hasNext()) {
                                                    p = ite.next();
                                            %>
                                            <tr>
                                                <td  style="display:none;width:0;"id="idcat"><%=p.getIdauxiliar()%></td>
                                                <td style="width:8%">
                                                    <%--<a  href="javascript:void(0)" onclick="CargarDatos(<%=p.getIdproveedor()%>)"><i class="material-icons" style="color: #09bb04" data-toggle="tooltip" title="Ver">&#xe147;</i></a>--%>
                                                    <a  href="ClienteController?accion=buscarPorIdPEDI&idClientePEDI=<%=p.getIdauxiliar()%>" ><i class="glyphicon glyphicon-plus-sign" style="color: #09bb04" data-toggle="tooltip" title="agregar"></i></a>
                                                </td>
                                                <td ><%=p.getCodigo()%></td>
                                                <td ><%=p.getNombre()%></td>
                                                <td ><%=p.getNumerodocumento()%></td> 
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal"></button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
            </section>
            <!-- /.content -->
            <%@include file="js-plantilla.jsp"%> 
            <script src="plugins/toastr/toastr.min.js"></script>
            <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
            <script src="Validacionysweetalert/Pedido.js" type="text/javascript"></script>
            <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
            <!--Data table --->
    </body>
</html>
