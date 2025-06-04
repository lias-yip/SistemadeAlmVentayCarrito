<%@page import="com.pe.model.entity.Producto"%>
<%@page import="com.pe.DAO.ProductoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Administrar Producto</title>
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
            <section class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">

                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">LISTA DE COSTO Y PRECIO</h3>
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
                                        <thead style="text-align: center">
                                            <tr>
                                                <th style="width:10px;">Codigo</th>
                                                <th style="width:100px;">Codigo Anexo</th>
                                                <th style="width:350px; text-align: left">Descripcion</th>
                                                <th style="width:10px;">Costo</th>
                                                <th style="width:8px;">Precio</th>                                           
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%DecimalFormat df = new DecimalFormat("#.##");
                                                ProductoDAO pdao = new ProductoDAO();
                                                List<Producto> listS = pdao.ListadoProducto();
                                                Iterator<Producto> iterr = listS.iterator();
                                                Producto pro = null;
                                                while (iterr.hasNext()) {
                                                    pro = iterr.next();%>
                                            <tr>
                                                <td style="width:10px; text-align: center"><%= pro.getCodigo()%></td>
                                                <td style="width:100px;text-align: center"><%=pro.getCodigoanexo()%></td>
                                                <td style="width:350px"><%= pro.getDescripcion()%></td>
                                                <td style="width:10px;text-align: center"><%=String.format("%.2f",pro.getPreciocompra())%></td>
                                                <td style="width:10px;text-align: center"><%=String.format("%.2f",pro.getPrecioVenta())%></td>
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
        <%@include file="js-plantilla.jsp"%> 
        <%@include file="js-datatable.jsp"%> 
        <script src="assets/jqueryy.js" type="text/javascript"></script>
        <script src="assets/bootstrapp.min.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Producto.js" type="text/javascript"></script>
        <!-- AdminLTE for demo purposes -->
        <!-- Page specific script -->

    </body>
</html>

