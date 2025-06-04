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
        <title>Guia De Remision"</title>
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <%-- finBuscador select.---%>
    </head>
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <!-- pageContent -->
        <div class="content-wrapper">
            <BR>
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Administrar Guia De Remision</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="InsertarGuiaremisioncliente.jsp" class="bluefacturactivaFocus js-customer-action-add btn-success btn btn-default" ><i class="fas fa-folder-plus"></i> &nbsp; NUEVO DIRECTO</a>
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
                                    <h2 class="card-title">LISTA GUIA DE REMISION</h2>
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
                                                    <th>Cliente</th>
                                                    <th>Nro Identidad</th>
                                                    <th style="display:none;">Doc</th>
                                                    <th>Numeración</th>
                                                    <th style="display:none;">Correlativo</th>
                                                    <th>Fecha(M/D/A)</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  MovimientoDAO vdao = new MovimientoDAO();
                                                    List<Movimiento> vlist = vdao.ListadoGuiaremisioncliente();
                                                    Iterator<Movimiento> itvent = vlist.iterator();
                                                    Movimiento vent = null;
                                                    double tot = 0.00;
                                                    while (itvent.hasNext()) {
                                                        vent = itvent.next();

                                                %>
                                                <tr>
                                                    <td style="display:none;" id="idv"><%= vent.getIdmovimiento()%></td>
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
                                                    <td><%=newdd%></td>
                                                    <% String Estado = vent.getEstado();
                                                        if (Estado.equalsIgnoreCase("Terminado")) {%>
                                                    <td style="width:2px"><markTerminado><%= Estado%></markTerminado></td>   
                                                    <%   } else {%>
                                            <td style="width:2px"><markanulado><%= Estado%></markanulado></td>    
                                                <%     }
                                                %>
                                            <td>
                                                <%
                                                    if (Estado.equalsIgnoreCase("Terminado")) {%>
                                                <a id='btn-anular' class="btn-sm btn-danger" class="anular"><i class="glyphicon glyphicon-remove-sign" data-toggle="tooltip" title="Anular"></i>Anular</a>
                                                <%   } else { %>
                                                <%     }
                                                %>
                                                <a href="DetallePDFController?accion=DetalleGRC&id=<%= vent.getIdmovimiento()%>" class="btn-sm btn-success" >Detalle</a>
                                            </td>
                                            <%
                                                }
                                            %>
                                            </tr>
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
    </body>
    <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
    <%@include file="js-plantilla.jsp"%>  
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>                   
    <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
    <script src="Validacionysweetalert/Guiaremisioncliente.js" type="text/javascript"></script>

</html>
