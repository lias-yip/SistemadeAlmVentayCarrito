<%@page import="com.pe.model.entity.Auxiliar"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
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

        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <link href="dist/css/Stilodetabla.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Navbar -->
        <%@include file="Frmmenu.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <br>
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <div class="col-sm-6">
                            <h1><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Administrar Cliente</h1>
                        </div>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default" href="InsertarClientes.jsp"><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>
                                <!--<a class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default" href="ControllerdatosModal?accion=addCliente"  data-toggle="modal" data-target="#addcliente" class="edit"><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>-->
                            </ol>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">LISTA DE CLIENTES</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example"  class="table table-striped table-bordered second" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="display:none;;">#</th>
                                                <th>C�digo</th>
                                                <th style="width:300px">Cliente</th>
                                                <th>Nro. Documento</th>
                                                <th>Correo</th> 
                                                <th style="text-align: center">Estado</th>
                                                <th style="text-align: center">Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% AuxiliarDAO cli = new AuxiliarDAO();
                                                List<Auxiliar> listar = cli.ListadoCliente();
                                                Iterator<Auxiliar> iter = listar.iterator();
                                                Auxiliar cl = null;
                                                while (iter.hasNext()) {
                                                    cl = iter.next();
                                            %>
                                            <tr>
                                                <td  style="display:none;;"id="idcliet"><%=cl.getIdauxiliar()%></td>
                                                <td><%=cl.getCodigo()%></td>
                                                <td style="width:300px"><%=cl.getNombre()%></td>
                                                <td><%=cl.getNumerodocumento()%></td>
                                                <td><%=cl.getCorreo()%></td>
                                                <% String Estado = AuxiliarDAO.estado(cl.getIdauxiliar());
                                                    if (Estado.equalsIgnoreCase("Activo")) {%>

                                                <td style="text-align: center"><markactivo><%= Estado%></markactivo></td>   
                                                <%   } else {%>

                                        <td><markdesactivado><%= Estado%></markdesactivado></td>    
                                            <%     }
                                            %>
                                        <td style="text-align: center"> 
                                            <a href="ClienteController?accion=editar&id=<%=cl.getIdauxiliar()%>" class="btn-warning btn-sm editbtn"><i class="glyphicon glyphicon-pencil"  data-toggle="tooltip" title="Edit"></i></a>
                                            <a id='btn-estado' class="btn-sm btn-primary"   class="edit"><i class="glyphicon glyphicon-refresh" data-toggle="tooltip" title="Estado"></i></a>
                                            <a id='btn-eliminar' class="btn-sm btn-danger"    class="edit"><i class="glyphicon glyphicon-trash" data-toggle="tooltip" title="Eliminar"></i></a>          
                                            <a href="ClienteController?accion=detalle&id=<%=cl.getIdauxiliar()%>" class="btn btn-success"><i class="glyphicon glyphicon-eye-open" data-toggle="tooltip" title="Detalle"></i></a>
                                        </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                            <!-- /.card -->
                        </div>
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
        <%@include file="js-datatable.jsp"%> 
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="assets/bootstrapp.min.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Cliente.js" type="text/javascript"></script>

    </body>
</html>
