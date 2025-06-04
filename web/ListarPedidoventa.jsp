<%@page import="com.pe.model.entity.Movimiento"%>
<%@page import="com.pe.DAO.MovimientoDAO"%>
<%@page import="com.pe.model.entity.Auxiliar"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Pedido De Venta</title>
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <%-- finBuscador select.---%>
    </head>
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <!-- pageContent -->
        <div class="content-wrapper">
            <br>
                       <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Administrar Pedido De Venta</h1>
                        </div>
                        <div class="col-sm-6">
                             <ol class="breadcrumb float-sm-right">
                                <a href="Listacotizacionpedido.jsp" class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default" ><i class="fas fa-folder-plus"></i> &nbsp; Pedido desde Cotizacion</a>
                                <a href="InsertarPedidoventa.jsp" class="bluefacturactivaFocus js-customer-action-add btn-success btn btn-default"><i class="fas fa-folder-plus"></i> &nbsp;Nuevo</a>
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>

            <section class="content">
                <form id="newmovimiento" method="post" name="accion">
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-outline card-info">
                                                                <div class="card-header">
                                    <h2 class="card-title">LISTA PEDIDO DE VENTA</h2>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body  ">

                                    <div class="full-width panel-content" id="div1">
                                        <table id="B" class="table table-striped table-bordered second" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th style="display:none;">N°</th>
                                                    <th style="display:none;">N°</th>
                                                    <th>Cliente</th>
                                                    <th>Nro Identidad</th>
                                                    <th style="display:none;">Doc</th>
                                                    <th>Numeración</th>
                                                    <th style="display:none;">Correlativo</th>
                                                    <th>Fecha(M/D/A)</th>
                                                    <th>Total</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  MovimientoDAO vdao = new MovimientoDAO();
                                                    List<Movimiento> vlist = vdao.ListadoPedido();
                                                    Iterator<Movimiento> itvent = vlist.iterator();
                                                    Movimiento vent = null;
                                                    double tot = 0.00;
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
                                                <a class="btn-primary btn-sm editbtn"  data-toggle="modal" data-target="#editarestad"><i class="glyphicon glyphicon-ban-circle" data-toggle="tooltip" title="Anular"></i>Anular</a>

                                                <%   } else if (Estado.equalsIgnoreCase("Anulado")) { %>
                                                <a id='eliminar' class="btn-sm btn-danger" class="Eliminar"><i class="glyphicon glyphicon-trash" data-toggle="tooltip" title="Eliminar">Eliminar</i></a>

                                                <%}%>
                                                <a href="DetallePDFController?accion=DetalleOC&id=<%= vent.getIdmovimiento()%>" class="btn-sm btn-success" >Detalle</a>
                                            </td>
                                            </tr>
                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>                                                             
                        </div>
                    </div>
                </form>   
            </section> 
        </div>
        <div id="editarestad" class="modal fade" >
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <form id="editarestado"  method="post" action="PedidoventaController" name="frm_edit"> 
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
                            <a href="ListarPedidoventa.jsp" class="btn btn-default" >Cancelar</a> 
                            <input class="btn btn-success" type="submit" name="accion" value="Anular">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
    </body>
    <%@include file="js-plantilla.jsp"%> 
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
</html>
