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
        <%    MovimientoDAO dao = new MovimientoDAO();

            int id = Integer.parseInt(request.getSession().getAttribute("refNotaI").toString());
            Movimiento p = (Movimiento) dao.Reporte(id);
        %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Main content -->
            <br>
            <section class="content">
                <form id="newventa" method="post" name="accion" action="RefNotadeIngresoController">
                    <input type="hidden" name="accion" value="RegistrarrefNotadeingreso" />
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card card-outline card-info">
                                <div class="card-header">
                                    <h3 class="card-title" style=" color: #fff;">
                                        EMITIR NOTA DE INGRESO
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
                                                        <option value="Nota de Ingreso">Nota de Ingreso</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <% MovimientoDAO com = new MovimientoDAO();
                                                String numserie = com.NumserieNI();
                                            %>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Número:</label>
                                                <div class="col-sm-2">
                                                    <input class="form-control form-control-sm" name="txtSerie" value="NI01" readonly="">
                                                </div>
                                                <div class="col-sm-3">
                                                    <input class="form-control form-control-sm" name="txtCorrelativo" value="<%=numserie%>">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Proveedor:</label>
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
                                                    <input class="form-control form-control-sm" name="txtTienda" value="PLASTITEX S.A.C.">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label class="col-sm-3 col-form-label" style="text-align:right">Almacen</label>
                                                <div class="col-sm-9">
                                                    <input class="form-control form-control-sm" name="txtAlmacen" value="Almacen General">
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
                                                <label class="col-sm-3 col-form-label" style="text-align:right">F. Registro:</label>
                                                <div class="col-sm-3">
                                                    <input class="form-control  form-control-sm" value="<%=currentDate%>"  name="txtfecha">
                                                </div>
                                            </div>
                                            <div class="d-flex">
                                                <label  class="col-sm-3 col-form-label" style="text-align:right">Motivo:</label>
                                                <div class="col-sm-9">
                                                    <select name="txtMotivo" id="tipo_comprobante" required="" class="form-control form-control-sm">
                                                        <option   value=""disabled="" selected=""></option>
                                                        <% MotivoDAO mot = new MotivoDAO();
                                                            List<Motivo> lism = mot.ListadoIngresoActivo();
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
                                                    <th >Descripcción</th>
                                                    <th >Und</th>  
                                                    <th >Cantidad</th>    
                                                </tr>
                                            </thead>

                                            <%

                                                ArrayList<DetalleMovimiento> listS = (ArrayList<DetalleMovimiento>) request.getSession().getAttribute("RefNotaIngreso");
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
                                                    <td style="width:3px;"><%= ProductoDAO.getCodProd(rni.getIdproducto())%></td>
                                                    <td style="width:500px;">
                                                        <p><%= ProductoDAO.getProducto(rni.getIdproducto())%></p>
                                                    </td>
                                                    <td style="width:4px;">
                                                        <p><%=UnidadVentaDAO.getUndVenta(rni.getIdproducto())%></p>
                                                    </td>
                                                    <td  style="width:5px; height:40px; text-align:center;"><p><%=String.format("%.2f",rni.getCantidad())%></p>
                                                    </td>
                                                </tr>

                                                <%fila++;
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
                                                    <%--a href="RefProductosActivosni.jsp" class="btn btn-primary float-right"  role="button" style="height: 30px;display: inline-block;margin-bottom: 0;font-weight: bold;text-align: center;vertical-align: middle;letter-spacing: 1px;text-transform: uppercase;-ms-touch-action: manipulation;touch-action: manipulation;cursor: pointer;transition: all 0.2s;background-image: none;border: 2px solid transparent;white-space: nowrap;padding: 2px 18px;font-size: 12px;line-height: 1.78571;border-radius: 20px;-webkit-user-select: none;-ms-user-select: none;user-select: none;padding-top: 3px;">AGREGAR ÍTEM</a--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card-body">
                                                <input class="btn btn-success float-right" type="submit" value="Registrar" name="btnVenta"> 
                                                <a class="btn btn-primary float-right" href="Generardocumentodealmacen.jsp" role="button">Salir</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- /.col-->

            </section>
            <!-- /.content -->
            <%@include file="js-plantilla.jsp"%> 
            <script src="plugins/toastr/toastr.min.js"></script>
            <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
            <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
            <script src="Validacionysweetalert/RefNotadeIngreso.js" type="text/javascript"></script>
            <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
            <!--Data table --->
    </body>
</html>
