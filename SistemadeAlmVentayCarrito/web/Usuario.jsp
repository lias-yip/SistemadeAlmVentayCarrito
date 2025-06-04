<%@page import="com.pe.model.entity.Usuario"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Usuario</title>
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
            <br>
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Administrar Usuario</h1>
                        </div>
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <a href="InsertarUsuario.jsp" class="bluefacturactivaFocus js-customer-action-add btn-primary btn btn-default" ><i class="fas fa-folder-plus"></i> &nbsp; AGREGAR</a>
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
                                    <h2 class="card-title">LISTA DE USUARIOS</h2>
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
                                    <!-- Tabla HTML con identificador "example"-->
                                    <table id="example"  class="table table-striped table-bordered second" style="width:100%">
                                        <!-- Encabezado de la tabla -->
                                        <thead>
                                            <tr>
                                                <th style="display:none;">#</th>
                                                <th style="width:100px;">Foto</th>
                                                <th style="width:300px;">Empleado</th>
                                                <th>Usuario</th>
                                                <th>Contaseña</th>
                                                <th>Rol</th>
                                                <th style="text-align: center">Opciones</th>
                                            </tr>
                                        </thead>
                                        <!-- Cuerpo de la tabla -->
                                        <tbody>
                                            <!-- Bloque de código Java en el cual se obtienen y recorren los usuarios -->
                                            <!-- Se crea una instancia de la clase UsuarioDAO, la cual contiene métodos para interactuar con la base de datos-->
                                            <!-- Se llama al método ListadoUsuario(), Este método realiza una consulta a la base de datos-->
                                            <!--Se crea un Iterator llamado iter para recorrer la lista de usuarios. El iterador proporciona un medio para acceder a los elementos de la lista de manera secuencial.-->
                                           <!--Se inicia un bucle while que se ejecutará mientras haya más elementos en la lista de usuarios.-->
                                           
                                            <%UsuarioDAO dao = new UsuarioDAO(); 
                                                List<Usuario> list = dao.ListadoUsuario();
                                                Iterator<Usuario> iter = list.iterator();
                                                Usuario per = null;
                                                while (iter.hasNext()) {
                                                    per = iter.next();
                                            %>
                                            <!-- Fila de la tabla con información de un usuario -->
                                            <tr>
                                                <td id="idusu" style="display:none;"><%=per.getId()%></td>
                                                <td style="text-align: center"><image src="<%=per.getFilename1()%>" width="100" height="100"/></td>
                                                <td ><%=per.getNombre()%></td>
                                                <td ><%=per.getUsu()%></td>
                                                <td><input name="txtpassword" type="password" value="<%=per.getPassword()%>" class="form-control" readonly=""></td>
                                                <td><%= per.getRol()%></td>
                                                <!-- Celda de opciones con enlaces para editar y eliminar -->
                                                <td style="text-align: center">
                                                    <a href="UsuarioController?accion=editar&id=<%=per.getId()%>" class="btn-warning btn-sm editbtn"><i class="glyphicon glyphicon-pencil"  data-toggle="tooltip" title="Edit"></i></a>
                                                        <%--a class="btn-warning btn-sm editbtn"  data-toggle="modal" data-target="#editar"><i class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="Edit"></i></a--%>
                                                    <a id='btn-eliminar' class="btn-sm btn-danger"    class="edit"><i class="glyphicon glyphicon-trash"  title="Eliminar"></i></a>          
                                                </td>
                                            </tr>
                                            <!-- Fin del bloque de código Java -->
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
        <script src="Validacionysweetalert/Usuario.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <!-- Page specific script -->
    </body>
</html>
