
<%@page import="com.pe.model.entity.Producto"%>
<%@page import="com.pe.DAO.DashboardDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lista de Categoria</title>
        <%@include file="css-plantilla.jsp"%> 
        <%@include file="css-datatable.jsp"%>
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
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
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <%                                DashboardDAO com = new DashboardDAO();
                                String numRQ = com.ocpendiente();
                            %>
                            <div class="small-box bg-success">
                                <div class="inner">
                                    <h3><%=numRQ%><sup style="font-size: 20px"></sup></h3>

                                    <p>Ordenes de Compra Pendientes</p>
                                </div>
                                <div class="icon">
                                    <i class="far fa-copy"></i>
                                </div>
                                <a href="Generardocumentodealmacen.jsp" class="small-box-footer">Mas informacion<i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <%
                                DashboardDAO comm = new DashboardDAO();
                                String numcli = comm.contarcliente();
                            %>
                            <div class="small-box bg-warning">
                                <div class="inner">
                                    <h3><%=numcli%></h3>

                                    <p>Registro de Clientes</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="Cliente.jsp" class="small-box-footer">Mas informacion<i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>     <!-- small box -->
                        <div class="col-lg-3 col-6">
                            <%
                                DashboardDAO prov = new DashboardDAO();
                                String numprove = prov.contarproveedor();
                            %>
                            <div class="small-box bg-info">
                                <div class="inner">
                                    <h3><%=numprove%></h3>

                                    <p>Registro de Proveedores</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="Proveedor.jsp" class="small-box-footer">Mas informacion<i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div> 

                        <!-- ./col -->
                        <div class="col-lg-3 col-6">
                            <!-- small box -->
                            <%
                                DashboardDAO pro = new DashboardDAO();
                                String numproduc = pro.contarproducto();
                            %>
                            <div class="small-box bg-danger">
                                <div class="inner">
                                    <h3><%=numproduc%></h3>

                                    <p>Registro de Productos</p>
                                </div>
                                <div class="icon">
                                    <i class="fas fa-tag"></i>
                                </div>
                                <a href="Producto.jsp" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>

                    <div class="row">

                        <!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-6 connectedSortable">
                            <div class="card">
                                <!-- /.card-header -->

                                <div class="card-header">
                                    <h3 class="card-title">10 productos con mas Ingresos</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 10px">Codigo</th>
                                                <th>Descripcion</th>
                                                <th>Cantidad de Ingreso</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% DashboardDAO dao = new DashboardDAO();
                                                List<Producto> list = dao.consulta10productosconmasingresos();
                                                Iterator<Producto> iter = list.iterator();
                                                Producto per = null;
                                                while (iter.hasNext()) {
                                                    per = iter.next();
                                            %>
                                            <tr>
                                                <td><%= per.getCodigo()%></td>
                                                <td><%= per.getDescripcion()%></td>
                                                <td><%= per.getStock()%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <a href="#" class="small-box-footer">Mas informacion<i class="fas fa-arrow-circle-right"></i></a>
                            </div>
                        </section>
                        <section class="col-lg-6 connectedSortable">
                            <div class="card">
                                <!-- /.card-header -->

                                <div class="card-header">
                                    <h3 class="card-title">10 productos con mas Salidas</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 10px">Codigo</th>
                                                <th>Descripcion</th>
                                                <th>Cantidad de Salida</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% DashboardDAO daao = new DashboardDAO();
                                                List<Producto> lisst = daao.consulta10productosconmassalidas();
                                                Iterator<Producto> iters = lisst.iterator();
                                                Producto pers = null;
                                                while (iters.hasNext()) {
                                                    pers = iters.next();
                                            %>
                                            <tr>
                                                <td><%= pers.getCodigo()%></td>
                                                <td><%= pers.getDescripcion()%></td>
                                                <td><%= pers.getStock()%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                                <a href="#" class="small-box-footer">Mas informacion<i class="fas fa-arrow-circle-right"></i></a>

                            </div>
                        </section>
                        <!-- right col -->
                    </div>

                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!--Formulario de Modificar-->
        <div id="editar" class="modal fade" >
            <div class="modal-dialog" role="document" style="z-index: 9999; width: 450px">
                <div class="modal-content">
                    <form id="editcategoria"  method="post" action="CategoriaController" name="frm_edit"> 
                        <div class="modal-body">  
                            <div class="form-group">
                                <input  type="hidden" type="text"  name="txtid" id="id" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Código</label>
                                <input type="text" class="form-control"  name="TxtCod" id="cod" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Nombre</label>
                                <input type="text" class="form-control" name="Txtnombre" id="nombre">
                            </div>  
                        </div>
                        <div class="modal-footer">
                            <a href="Categoria.jsp" class="btn btn-default" >Cancelar</a> 
                            <input onclick="return valeditarcategoria()" class="btn btn-success" type="submit" name="accion" value="Actualizar">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!-- ./wrapper -->
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/Categoria.js" type="text/javascript"></script>
        <script >
                                $('.editbtn').on('click', function () {
                                    $tr = $(this).closest('tr');
                                    var datos = $tr.children('td').map(function () {
                                        return $(this).text();
                                    });
                                    $('#id').val(datos[0]);
                                    $('#cod').val(datos[1]);
                                    $('#nombre').val(datos[2]);

                                })
        </script>


    </body>
</html>

