<%@page import="com.pe.DAO.ProductoDAO"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="com.pe.model.entity.DetalleMovimiento"%>
<%@page import="com.pe.model.entity.Motivo"%>
<%@page import="com.pe.DAO.MotivoDAO"%> 
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
    <%  Auxiliar objClienteNS = null;
        if (request.getSession().getAttribute("clienteNS") != null) {
            objClienteNS = (Auxiliar) request.getSession().getAttribute("clienteNS");
        } else {
            objClienteNS = new Auxiliar();
            objClienteNS.setIdauxiliar(0);
            objClienteNS.setCorreo("");
            objClienteNS.setNumerodocumento("0");
            objClienteNS.setNombre("");
            objClienteNS.setDireccion("");
        }
    %>
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <br>
            <section class="content">
                <form id="newventa" method="post" name="accion" action="NotadeSalidaController">
                    <input type="hidden" name="accion" value="Registrarnotadesalida" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-outline card-info">
                                <div class="card-header">
                                    <h3 class="card-title" style=" color: #fff;">
                                        EMITIR NOTA DE SALIDA
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
                                                        <option value="Nota de Salida">Nota de Salida</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <% MovimientoDAO com = new MovimientoDAO();
                                                String numserie = com.NumserieNS();
                                            %>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Número:</label>
                                                <div class="col-sm-2">
                                                    <input class="form-control form-control-sm" name="txtSerie" value="NS01" readonly="">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="form-control form-control-sm" name="txtCorrelativo" value="<%=numserie%>">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Proveedor:</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group input-group-sm">
                                                        <input type="hidden" name="txtIdcli" value="<%=objClienteNS.getIdauxiliar() == 0 ? "" : objClienteNS.getIdauxiliar()%>" class="form-control">
                                                        <input type="text" name="txtNombre" value=" <%=objClienteNS.getNombre()%>" class="form-control">
                                                        <span class="input-group-append">
                                                            <a href="#Buscarcliente" class="btn btn-info btn-flat editbtn" data-toggle="modal">Buscar</a>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">RUC:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtI" value="<%=objClienteNS.getNumerodocumento()%>">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Correo Receptor:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtcorreo" value="<%=objClienteNS.getCorreo()%>">
                                                </div>
                                            </div>

                                        </div>
                                        <div class="col-md-6">

                                            <!-- /.form-group -->
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Tienda:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtTienda" value="<%=EmpresaDAO.Nombre()%>" required="">
                                                </div>
                                            </div>
                                            <!-- /.form-group -->
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
                                                <label  class="col-sm-3 col-form-label" style="text-align:right">Motivo:</label>
                                                <div class="col-sm-9">
                                                    <select name="txtMotivo" id="txtMotivo" required="" class="form-control form-control-sm">
                                                        <option   value=""disabled="" selected=""></option>
                                                        <% MotivoDAO mot = new MotivoDAO();
                                                            List<Motivo> lism = mot.ListadoSalidaActivo();
                                                            Iterator<Motivo> itt = lism.iterator();
                                                            Motivo mo = null;
                                                            while (itt.hasNext()) {
                                                                mo = itt.next();
                                                        %>
                                                        <option  value="<%=mo.getIdmotivo()%>" required><%=mo.getNombre()%></option>
                                                        <%
                                                            }
                                                        %>
                                                    </select> 
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Dirección:</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" type="text" name="txtdirecc" value="<%=objClienteNS.getDireccion()%>">
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
                                                    <th >Quitar</th>
                                                </tr>
                                            </thead>
                                            <%

                                                ArrayList<DetalleMovimiento> listar = (ArrayList<DetalleMovimiento>) session.getAttribute("carns");
                                                int fila = 0;

                                                if (listar != null) {
                                                    for (DetalleMovimiento ni : listar) {
                                            %>
                                            <tbody>
                                                <tr>
                                                    <td style="width:3px;">
                                                        <p><%= ni.getProducto().getCodigo()%></p>
                                                    </td>
                                                    <td style="width:50%">
                                                        <p><%=ni.getProducto().getDescripcion()%></p>
                                                    </td>
                                                    <td style="width:4px;">
                                                        <input  class="form-control form-control-sm" style="width :110px; text-align:center;" type="number" value="<%=String.format("%.2f", ni.getCantidad())%>" placeholder="1.00" step="0.01" min="0.01" max="<%=ProductoDAO.getValidarstock(ni.getIdproducto())%>" id="txtPro_cantidad<%=fila%>" name="txtPro_cantidad"  onchange="Ventaactualizarcantidad(<%= fila%>)" required>
                                                    </td>
                                                    <td style="width:100px; text-align: center;">
                                                        <p><%=UnidadVentaDAO.getUndVenta(ni.getIdproducto())%></p>
                                                    </td>
                                                    <td style="width:3px;">
                                                        <span id="idarticulo" style="display:none;"><%= ni.getProducto().getIdproducto()%></span>

                                                        <button style="background-color: transparent; color: red; border: none " id="deleteitem" class="delete">
                                                            <i class="glyphicon glyphicon-remove" data-toggle="tooltip" title="Delete"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                                <%fila++;
                                                        }
                                                    }
                                                %>
                                            </tbody>
                                        </table>   
                                    </div>

                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="card-body">
                                                <div class="form-group row">
                                                    <a href="ProductosActivosns.jsp" class="btn btn-primary float-right"  role="button" style="height: 30px;display: inline-block;margin-bottom: 0;font-weight: bold;text-align: center;vertical-align: middle;letter-spacing: 1px;text-transform: uppercase;-ms-touch-action: manipulation;touch-action: manipulation;cursor: pointer;transition: all 0.2s;background-image: none;border: 2px solid transparent;white-space: nowrap;padding: 2px 18px;font-size: 12px;line-height: 1.78571;border-radius: 20px;-webkit-user-select: none;-ms-user-select: none;user-select: none;padding-top: 3px;">AGREGAR ITEM</a>
                                                    <a class="btn btn-secondary" href="NotadeSalidaController?accion=Limpiarns">Limpiar</a> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="card-body">
                                                <input class="btn btn-success float-right" type="submit" value="Registrar" name="btnVenta"> 
                                                <a class="btn btn-primary float-right" href="ListarNotasalida.jsp" role="button">Salir</a>
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
                                <h4 class="modal-title">Lista de Clientes</h4>
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
                                                    <a  href="ClienteController?accion=buscarPorIdNS&idClienteNS=<%=p.getIdauxiliar()%>" ><i class="glyphicon glyphicon-plus-sign" style="color: #09bb04" data-toggle="tooltip" title="agregar"></i></a>
                                                </td>
                                                <td><%=p.getCodigo()%></td>
                                                <td><%=p.getNombre()%></td>
                                                <td><%=p.getNumerodocumento()%></td> 
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
            <script src="Validacionysweetalert/NotaSalida.js" type="text/javascript"></script>
            <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
            <!--Data table --->
    </body>
</html>
