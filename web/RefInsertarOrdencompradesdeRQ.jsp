<%@page import="com.pe.model.entity.Auxiliar"%>
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
        <title>AdminLTE 3 | Editors</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link href="dist/css/css_estilocarrito.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <%  Auxiliar objProvedorROC = null;
            if (request.getSession().getAttribute("proveedorROC") != null) {
                objProvedorROC = (Auxiliar) request.getSession().getAttribute("proveedorROC");
            } else {
                objProvedorROC = new Auxiliar();
                objProvedorROC.setIdauxiliar(0);
                objProvedorROC.setCorreo("");
                objProvedorROC.setNumerodocumento("0");
                objProvedorROC.setNombre("");
                objProvedorROC.setDireccion("");
            }
        %>

        <%    MovimientoDAO dao = new MovimientoDAO();

            int id = Integer.parseInt(request.getSession().getAttribute("NotaSa").toString());
            Movimiento p = (Movimiento) dao.Reporte(id);
        %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <br>
            <section class="content">
                <form id="newventa" method="post" name="accion" action="RefRequerimientoaOCController">
                    <input type="hidden" name="accion" value="Registrarocrefrequerimiento" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-outline card-info">
                                <div class="card-header">
                                    <h3 class="card-title" style=" color: #fff;">
                                        EMITIR ORDEN DE COMPRA
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
                                                    <input class="form-control form-control-sm" name="txtTipodoc" value="ORDEN DE COMPRA" required="">
                                                </div>
                                            </div>
                                            <% MovimientoDAO com = new MovimientoDAO();
                                                String numserie = com.NumserieOC();
                                            %>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Número:</label>
                                                <div class="col-sm-2">
                                                    <input class="form-control form-control-sm" name="txtSerie" value="OC01" readonly="">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="form-control form-control-sm" name="txtCorrelativo" value="<%=numserie%>" readonly="">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Proveedor:</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group input-group-sm">
                                                        <input type="hidden" name="txtIdcli" value="<%=objProvedorROC.getIdauxiliar() == 0 ? "" : objProvedorROC.getIdauxiliar()%>" class="form-control">
                                                        <input type="text" name="txtNombre" value=" <%=objProvedorROC.getNombre()%>" class="form-control">
                                                        <span class="input-group-append">
                                                            <a href="#Buscarcliente" class="btn btn-info btn-flat editbtn" data-toggle="modal">Buscar</a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">RUC:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtI" value="<%=objProvedorROC.getNumerodocumento()%>">
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
                                                <label class="col-sm-3 col-form-label" style="text-align:right">General:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtAlmacen" value="Almacen General" required="">
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
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Direccion:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="text" name="txtdirecc" value="<%=objProvedorROC.getDireccion()%>">
                                                </div>
                                            </div>
                                            <!-- /.form-group -->
                                            <div class="d-flex">
                                                <div class="col-sm-8">
                                                    <input type="hidden" name="txtCondicion" value="JR. ANCASH NRO. 919 INT. 9 LIMA - LIMA - LIMA" class="form-control form-control-sm" >
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
                                                    <th >Código</th>
                                                    <th >Nombre</th>
                                                    <th >Cantidad</th> 
                                                    <th >Und</th> 
                                                    <th >Costo</th> 
                                                    <th >Total</th> 
                                                    <th >Quitar</th> 
                                                </tr>
                                            </thead>

                                            <%
                                                double total = 0;
                                                double igv = 0.00;
                                                double montototal = 0.00;
                                                ArrayList<DetalleMovimiento> listS = (ArrayList<DetalleMovimiento>) request.getSession().getAttribute("RefOrdendecompra");
                                                Iterator<DetalleMovimiento> iterr = listS.iterator();
                                                DetalleMovimiento rni = null;
                                                int fila = 0;
                                                if (listS != null) {
                                                    for (DetalleMovimiento d : listS) {
                                                        while (iterr.hasNext()) {
                                                            rni = iterr.next();
                                            %>

                                            <tbody>
                                                <tr>
                                                    <td style="display:none;"><%=rni.getIdproducto()%></td>
                                                    <td style="width:4px;"><%= ProductoDAO.getCodProd(rni.getIdproducto())%></td>
                                                    <td style="width:500px;">
                                                        <p><%= ProductoDAO.getProducto(rni.getIdproducto())%></p>
                                                    </td>
                                                    <td  style="width:5px; height:40px; text-align:center;"><p><%=String.format("%.2f", rni.getCantidad())%></p>
                                                    </td>
                                                    <td style="width:2px;">
                                                        <p><%=UnidadVentaDAO.getUndVenta(rni.getIdproducto())%></p>
                                                    </td>
                                                    <td style="width:4px;">
                                                        <input class="form-control form-control-sm" style="width : 110px; text-align:center;" type="number" value="<%=String.format("%.2f", rni.getCosto())%>" id="txtPro_precio<%=fila%>" name="txtPro_precio" step="0.01" min="0.01" onchange="Actualizarprecio(<%= fila%>)" required="">
                                                    </td>
                                                    <td style="width:110px;text-align:right;"><%=String.format("%.2f", rni.getCantidad() * rni.getCosto())%></td>

                                                    <td style="width:3px;">
                                                        <span id="idarticulo" style="display:none;"><%= rni.getIdproducto()%></span>

                                                        <button style="background-color: transparent; color: red; border: none " id="deleteitem" class="delete">
                                                            <i class="glyphicon glyphicon-remove" data-toggle="tooltip" title="Delete"></i>
                                                        </button>
                                                    </td>

                                                </tr>

                                                <%fila++;
                                                                montototal = montototal + rni.getCantidad() * (Math.round(rni.getCosto() * 100.00) / 100.00);
                                                                igv = montototal * 0.18;
                                                                total = montototal - igv;
                                                            }
                                                        }
                                                    }%>
                                            </tbody>
                                        </table>   
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="card-body">
                                                <div class="form-group row">
                                                    <a href="RefProductosActivosOC.jsp" class="btn btn-primary float-right"  role="button" style="height: 30px;display: inline-block;margin-bottom: 0;font-weight: bold;text-align: center;vertical-align: middle;letter-spacing: 1px;text-transform: uppercase;-ms-touch-action: manipulation;touch-action: manipulation;cursor: pointer;transition: all 0.2s;background-image: none;border: 2px solid transparent;white-space: nowrap;padding: 2px 18px;font-size: 12px;line-height: 1.78571;border-radius: 20px;-webkit-user-select: none;-ms-user-select: none;user-select: none;padding-top: 3px;">AGREGAR ITEM</a>
                                                    <a class="btn btn-primary float-right" href="ListarOrdendeCompra.jsp" role="button">Salir</a>
                                                    <input class="btn btn-success float-right" type="submit" value="Registrar" name="btnVenta"> 
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
                                <h4 class="modal-title">Lista de Proveedor</h4>
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
                                                <th style="width:8%">OK</th>
                                                <th class="">CÓDIGO</th>
                                                <th class="">NOMBRE</th>
                                                <th class="">NRO DOCUMENTO</th>
                                            </tr>
                                        </thead>
                                        <tbody >
                                            <% AuxiliarDAO prov = new AuxiliarDAO();
                                                List<Auxiliar> list = prov.ListadeProveedoresActivos();
                                                Iterator<Auxiliar> itex = list.iterator();
                                                Auxiliar ax = null;
                                                while (itex.hasNext()) {
                                                    ax = itex.next();
                                            %>
                                            <tr>
                                                <td  style="display:none;width:0;"id="idcat"><%=ax.getIdauxiliar()%></td>
                                                <td style="width:8%">
                                                    <%--<a  href="javascript:void(0)" onclick="CargarDatos(<%=p.getIdproveedor()%>)"><i class="material-icons" style="color: #09bb04" data-toggle="tooltip" title="Ver">&#xe147;</i></a>--%>
                                                    <a  href="ProveedorController?accion=buscarPorIdROC&idProveedorROC=<%=ax.getIdauxiliar()%>" ><i class="glyphicon glyphicon-plus-sign" style="color: #09bb04" data-toggle="tooltip" title="agregar"></i></a>
                                                </td>
                                                <td><%=ax.getCodigo()%></td>
                                                <td><%=ax.getNombre()%></td>
                                                <td><%=ax.getNumerodocumento()%></td> 
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

            <%@include file="js-plantilla.jsp"%> 
            <script src="plugins/toastr/toastr.min.js"></script>
            <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
            <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
            <script src="Validacionysweetalert/RefRequerimiento.js" type="text/javascript"></script>
            <!--Data table --->
    </body>
</html>
