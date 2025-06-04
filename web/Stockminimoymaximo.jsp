
<%@page import="com.pe.DAO.UnidadVentaDAO"%>
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
        <title>Agregar Stock mínimo y máximo</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
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
                            <h1><i class="fa fa-list-ul" aria-hidden="true"></i>&nbsp;&nbsp;Asignar Stock Mínimo y Máximo</h1>

                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- Main content -->
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-sm-12">
                            <div class="card card-primary card-tabs">
                                <div class="card-header">
                                    <h3 class="card-title" style="color: white;">ALMACEN GENERAL</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                    <br>
                                </div>
                                <div class="card-body">
                                    <div class="tab-content" id="custom-tabs-one-tabContent">
                                        <div class="tab-pane fade show active" id="custom-tabs-one-home" role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">
                                            <div class="table-wrapper">
                                                <table id="B" class="table table-striped table-bordered table-sm " cellspacing="0"
                                                       width="100%">
                                                    <thead style="text-align: center">
                                                        <tr>
                                                            <th style="display:none;">Id</th>
                                                            <th>Código</th>
                                                            <th>Descripción</th>
                                                            <th>Stock mínimo</th>
                                                            <th>Stock máximo</th>
                                                            <th>Stock Actual</th>
                                                            <th>Opciones</th>
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
                                                            <td style="display:none;;" id="idpro"><%= pro.getIdproducto()%></td>
                                                            <td><%= pro.getCodigo()%></td>
                                                            <td><%= pro.getDescripcion()%></td>
                                                            <td><%= String.format("%.2f", pro.getStockminimo())%></td>
                                                            <td><%=String.format("%.2f", pro.getStockmaximo())%></td>
                                                            <td><%=String.format("%.2f", pro.getStock())%></td>
                                                            <td style="text-align: center">
                                                                <a class="btn-warning btn-sm editbtn"  data-toggle="modal" data-target="#editar"><i class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="Edit"></i></a>
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card -->
                            </div>
                        </div>

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
                    <form id="editminmax"  method="post" action="ProductoController" name="frm_edit"> 
                        <div class="modal-body">  
                            <div class="form-group">
                                <input  type="hidden" type="text"  name="txtid" id="id" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Código</label>
                                <input type="text" class="form-control"  name="Txtcodigo" id="1" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Descripción</label>
                                <input type="text" class="form-control"  name="Txtdescripcion" id="2" readonly="">
                            </div> 
                            <div class="form-group">
                                <label>Stock mínimo</label>
                                <input class="form-control" type="text" name="Txtpcompra" id="3" placeholder="0.00" step="0.01" value="0.00" min="0">
                            </div> 
                            <div class="form-group">
                                <label>Stock máximo</label>
                                <input class="form-control" type="text" name="Txtpventa" id="4" placeholder="0.00" step="0.01" value="0.00" min="0">
                            </div> 
                        </div>
                        <div class="modal-footer">
                            <a href="Stockminimoymaximo.jsp" class="btn btn-default" >Cancelar</a> 
                            <input onclick="return valedit()" class="btn btn-success" type="submit" name="accion" value="Actualizar">
                        </div>
                    </form>
                </div>
            </div>
        </div> 
        <!-- ./wrapper -->
        <link rel="stylesheet" href="https://code.jquery.com/jquery-3.5.1.js">
        <%@include file="js-plantilla.jsp"%>  
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>                   
        <script src="assets/libs/js/Datatable.js" type="text/javascript"></script>
        <script src="Validacionysweetalert/Producto.js" type="text/javascript"></script>
        <script >
                                $('.editbtn').on('click', function () {
                                    $tr = $(this).closest('tr');
                                    var datos = $tr.children('td').map(function () {
                                        return $(this).text();
                                    });
                                    $('#id').val(datos[0]);
                                    $('#1').val(datos[1]);
                                    $('#2').val(datos[2]);
                                    $('#3').val(datos[3]);
                                    $('#4').val(datos[4]);
                                })
        </script>
    </body>
</html>





