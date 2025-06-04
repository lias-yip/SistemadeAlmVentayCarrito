<%@page import="com.pe.model.entity.Auxiliar"%>
<%@page import="com.pe.DAO.DashboardDAO"%>
<%@page import="com.pe.model.entity.Categoria"%>
<%@page import="com.pe.DAO.CategoriaDAO"%>
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


                    <!-- Info boxes -->
                    <div class="row">
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box">
                                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>
                                    <%     DashboardDAO comm = new DashboardDAO();
                                        String numcli = comm.contarOC();
                                    %>
                                <div class="info-box-content">
                                    <span class="info-box-text">Ordenes De Compra</span>
                                    <span class="info-box-number">
                                        <%=numcli%>
                                    </span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-shopping-cart"></i></span>
                                    <%     DashboardDAO com = new DashboardDAO();
                                        String numf = com.contarFactura();
                                    %>
                                <div class="info-box-content">
                                    <span class="info-box-text">Total de Facturas</span>
                                    <span class="info-box-number"><%=numf%></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->

                        <!-- fix for small devices only -->
                        <div class="clearfix hidden-md-up"></div>

                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-success elevation-1"><i class="far fa-credit-card"></i></span>
                                    <% DashboardDAO cm = new DashboardDAO();
                                        String numvc = cm.valorcompra();
                                    %>
                                <div class="info-box-content">
                                    <span class="info-box-text">Valor total de Facturas</span>
                                    <span class="info-box-number">S/<%=numvc%></span>
                                </div>
                                <!-- /.info-box-content -->
                            </div>
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col 
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="info-box mb-3">
                                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>
                                    <% DashboardDAO emp = new DashboardDAO();
                                        String numemp = emp.Contarempleado();
                                    %>
                                <div class="info-box-content">
                                    <span class="info-box-text">Registro de trabajadores</span>
                                    <span class="info-box-number"><%=numemp%></span>
                                </div>
                                <!-- /.info-box-content 
                            </div>-->
                            <!-- /.info-box -->
                        </div>
                        <!-- /.col -->
                    </div>
                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                        <section class="col-lg-6 connectedSortable">
                            <div class="card">
                                <!-- /.card-header -->

                                <div class="card-header">
                                    <h3 class="card-title">10 principales proveedores</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th style="width: 10px">Nombre</th>
                                                <th>Documento</th>
                                                <th>Cantidad de productos comprados</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <% DashboardDAO dao = new DashboardDAO();
                                                List<Auxiliar> list = dao.consulta10principalesprovedores();
                                                Iterator<Auxiliar> iter = list.iterator();
                                                Auxiliar per = null;
                                                while (iter.hasNext()) {
                                                    per = iter.next();
                                            %>
                                            <tr>
                                                <td><%= per.getNombre()%></td>
                                                <td><%= per.getNumerodocumento()%></td>
                                                 <td><%= per.getIdauxiliar()%></td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>

                        <section class="col-lg-3 connectedSortable">
                            <div class="col-md-12">
                                <!-- Info Boxes Style 2 -->
                                <div class="info-box mb-3 bg-warning">
                                    <span class="info-box-icon"><i class="far fa-credit-card"></i></span>
                                        <% DashboardDAO vi = new DashboardDAO();
                                            String numvi = vi.Valorinventario();
                                            
                                        %>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Valor total de inventario</span>
                                        <span class="info-box-number">S/<%=numvi%></span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                                <!-- /.info-box -->
                                <div class="info-box mb-3 bg-success">
                                    <span class="info-box-icon"><i class="fas fa-tag"></i></span>
                                        <% DashboardDAO cxm = new DashboardDAO();
                                            String numRQ = cxm.ocpendiente();
                                        %>
                                    <div class="info-box-content">
                                        <span class="info-box-text">Ordenes de compra pendiente</span>
                                        <span class="info-box-number"><%=numRQ%></span>
                                    </div>
                                    <!-- /.info-box-content -->
                                </div>
                            </div>
                        </section>
                        <!-- /.Left col -->
                        <!-- right col (We are only adding the ID to make the widgets sortable)-->
                        <section class="col-lg-3 connectedSortable">

                            <!-- Map card -->
                            <div class="card bg-gradient-primary" hidden="false">
                                <!-- /.card-body-->
                                <div class="card-footer bg-transparent">
                                    <div class="row">
                                        <div class="col-4 text-center">
                                            <div id="sparkline-1"></div>

                                        </div>
                                        <!-- ./col -->
                                        <div class="col-4 text-center">
                                            <div id="sparkline-2"></div>

                                        </div>
                                        <!-- ./col -->
                                        <div class="col-4 text-center">
                                            <div id="sparkline-3"></div>

                                        </div>
                                        <!-- ./col -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                            </div>
                            <!-- /.card -->
                            <!-- Calendar -->
                            <div class="card bg-gradient-success">
                                <div class="card-header border-0">

                                    <h3 class="card-title">
                                        <i class="far fa-calendar-alt"></i>
                                        Calendar
                                    </h3>
                                    <!-- tools card -->
                                    <div class="card-tools">
                                        <!-- button with a dropdown -->
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" data-offset="-52">
                                                <i class="fas fa-bars"></i>
                                            </button>
                                            <div class="dropdown-menu" role="menu">
                                                <a href="#" class="dropdown-item">Add new event</a>
                                                <a href="#" class="dropdown-item">Clear events</a>
                                                <div class="dropdown-divider"></div>
                                                <a href="#" class="dropdown-item">View calendar</a>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-success btn-sm" data-card-widget="collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-success btn-sm" data-card-widget="remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                    <!-- /. tools -->
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body pt-0">
                                    <!--The calendar -->
                                    <div id="calendar" style="width: 100%"></div>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </section>


                    </div>
                </div>
                <!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>

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

        <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <script src="plugins/chart.js/Chart.min.js"></script>
        <!-- Sparkline -->
        <script src="plugins/sparklines/sparkline.js"></script>
        <!-- JQVMap -->
        <script src="plugins/jqvmap/jquery.vmap.min.js"></script>
        <script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
        <!-- jQuery Knob Chart -->
        <script src="plugins/jquery-knob/jquery.knob.min.js"></script>
        <!-- daterangepicker -->
        <script src="plugins/moment/moment.min.js"></script>
        <script src="plugins/daterangepicker/daterangepicker.js"></script>
        <!-- Tempusdominus Bootstrap 4 -->
        <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
        <!-- Summernote -->
        <script src="plugins/summernote/summernote-bs4.min.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/adminlte.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard.js"></script>
        <script src="dist/js/pages/dashboard2.js"></script>
    </body>
</html>
