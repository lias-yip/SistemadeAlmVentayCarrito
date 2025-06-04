
<%@page import="com.pe.model.entity.Empresa"%>
<%@page import="com.pe.DAO.EmpresaDAO"%>
<%@page import="com.pe.model.entity.Usuario"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista Empresa</title>

        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition sidebar-mini">

        <!-- Navbar -->

        <%@include file="Frmmenu.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
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
                                    <h2 class="card-title">EMPRESA</h2>
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
                                    <table class="table table-striped table-bordered" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th style="display:none;">#</th>
                                                <th style="width:100px;">Logo</th>
                                                <th style="width:300px;">Nombre</th>
                                                <th style="width:300px;">RUC</th>
                                                <th style="width:300px;">Dirección</th>
                                                <th style="text-align: center">Opciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%EmpresaDAO dao = new EmpresaDAO();
                                                List<Empresa> list = dao.ListadoEmpresa();
                                                Iterator<Empresa> iter = list.iterator();
                                                Empresa per = null;
                                                while (iter.hasNext()) {
                                                    per = iter.next();
                                            %>
                                            <tr>
                                                <td id="idemp" style="display:none;"><%=per.getId()%></td>
                                                <td style="text-align: center"><image src="<%=per.getFilename1()%>" width="250" height="100"/></td>
                                                <td ><%=per.getNombre()%></td>
                                                 <td ><%=per.getNro()%></td> 
                                                <td ><%=per.getDireccion()%>-<%=per.getUbigeo()%></td> 
                                                <td style="text-align: center">
                                                    <a href="EmpresaController?accion=editar&id=<%=per.getId()%>" class="btn-warning btn-sm editbtn"><i class="glyphicon glyphicon-pencil"  data-toggle="tooltip" title="Edit"></i></a>       
                                                </td>
                                            </tr>
                                            <%}%>
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
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="dist/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- ./wrapper -->
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <!-- AdminLTE for demo purposes -->
        <!-- Page specific script -->
    </body>
</html>
