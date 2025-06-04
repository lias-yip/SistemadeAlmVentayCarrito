<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="com.pe.model.entity.Producto"%>
<%@page import="com.pe.DAO.ProductoDAO"%>
<%@page import="com.pe.model.entity.Categoria"%>
<%@page import="com.pe.DAO.CategoriaDAO"%>
<%@page import="com.pe.model.entity.Clasificacion"%>
<%@page import="com.pe.DAO.ClasificacionDAO"%>
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
        <title>Relación de Stock Mínimo</title>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css"/>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/tabletools/2.2.4/css/dataTables.tableTools.min.css"/>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.css">
        <link rel="stylesheet" type="text/css" href="" id="css">
        <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
        <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
        <%--Buscador select.---%>
        <link rel="//cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
        <script src="//cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
        <%@include file="css-plantilla.jsp"%> 
        
        <%-- finBuscador select.---%>
    </head>

    <body class="hold-transition sidebar-mini" s>
        <%@include file="Frmmenu.jsp" %>
        <!-- pageContent -->
        <div class="content-wrapper">
            <section class="content-header">
                <div class="container-fluid">
                </div><!-- /.container-fluid -->
            </section>
            <section class="content">
                <!--modal listar-->
                <form id="newmovimiento" method="post" name="accion">
                    <div class="row">
                        <div class="col-md-12">
                            <!--modal listar-->
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title" style="color: white;">Productos</h3>
                                    <div class="card-tools">
                                        <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="card-body"> 
                                    <div class="row">
                                        <input type="hidden" id="todclisel" value="" />
                                        <input type="hidden" id="clisel" value="" />
                                        <input type="hidden" id="clirucsel" value="" />

                                        <input type="hidden" id="toddocsel" value="" />
                                        <input type="hidden" id="docsel" value="" />

                                        <input type="hidden" id="todclasel" value="" />
                                        <input type="hidden" id="clasel" value="" />

                                        <input type="hidden" id="todcatsel" value="" />
                                        <input type="hidden" id="catsel" value="" />

                                        <input type="hidden" id="todsubsel" value="" />
                                        <input type="hidden" id="subsel" value="" />

                                        <input type="hidden" id="todpersel" value="" />
                                        <input type="hidden" id="persel" value="" />
                                        <script>

                                            function validaciones() {
                                                if (
                                                        document.getElementById('rbCli').checked ||
                                                        document.getElementById('rbRUC').checked ||
                                                        document.getElementById('rbCla').checked ||
                                                        document.getElementById('rbCat').checked ||
                                                        document.getElementById('rbSub').checked
                                                        ) {
                                                    document.getElementById('todclisel').value = '';
                                                    document.getElementById('clisel').value = document.getElementById('cbCli').value.toLowerCase();
                                                    document.getElementById('clirucsel').value = document.getElementById('cbRU').value.toLowerCase();

                                                    document.getElementById('toddocsel').value = '';
                                                    document.getElementById('todclasel').value = '';
                                                    document.getElementById('clasel').value = document.getElementById('cbCla').value.toLowerCase();

                                                    document.getElementById('todcatsel').value = '';
                                                    document.getElementById('catsel').value = document.getElementById('cbCat').value.toLowerCase();

                                                    document.getElementById('todsubsel').value = '';
                                                    document.getElementById('subsel').value = document.getElementById('cbSub').value.toLowerCase();

                                                    document.getElementById('todpersel').value = '';

                                                    var fecha = '';

                                                }

                                                document.getElementById('selInfo').value = document.getElementById('todclisel').value.toLowerCase() + ' ' +
                                                        document.getElementById('clisel').value.toLowerCase() + ' ' +
                                                        document.getElementById('clirucsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('toddocsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('docsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('todclasel').value.toLowerCase() + ' ' +
                                                        document.getElementById('clasel').value.toLowerCase() + ' ' +
                                                        document.getElementById('todcatsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('catsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('todsubsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('subsel').value.toLowerCase() + ' ' +
                                                        document.getElementById('todpersel').value.toLowerCase() + ' ' +
                                                        document.getElementById('persel').value.toLowerCase() + ' ' + fecha;

                                                console.log(document.getElementById('selInfo').value.toLowerCase());
                                            }
                                        </script>
                                        <div class="form-group col-md-2">
                                            <input type="radio" value="" id="rbCla" name = "cla"style="align-items: center" onclick="
                                                    cbClas.disabled = false;
                                                   ">
                                            <label>Clasificación:</label>
                                            <select class="form-control select2" name="cbClas" id="cbCla" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value ="" selected="" style="text-align: center">-Todos-</option>
                                                <% ClasificacionDAO mar = new ClasificacionDAO();
                                                    List<Clasificacion> list = mar.ListadoEstadoActivos();
                                                    Iterator<Clasificacion> ite = list.iterator();
                                                    Clasificacion m = null;
                                                    while (ite.hasNext()) {
                                                        m = ite.next();
                                                %>
                                                <option value="<%=m.getNombre()%>"><%=m.getNombre()%></option>
                                                <%}%>
                                            </select> 
                                        </div>
                                        <div class="form-group col-md-2">
                                            <input type="radio" value="" id="rbCat" name = "cat"style="align-items: center" onclick="
                                                    cbCate.disabled = false;

                                                   ">
                                            <label>Categoría:</label>
                                            <select class="form-control select2" name="cbCate" id="cbCat" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value ="" selected="" style="text-align: center">-Todos-</option>
                                                <% CategoriaDAO cat = new CategoriaDAO();
                                                    List<Categoria> lista = cat.ListadoEstadoActivos();
                                                    Iterator<Categoria> iter = lista.iterator();
                                                    Categoria c = null;
                                                    while (iter.hasNext()) {
                                                        c = iter.next();

                                                %>
                                                <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                                                <%}%>
                                            </select> 
                                        </div>
                                        <div class="form-group col-md-4">
                                            <input type="radio" value="" id="rbCli" name = "cliente" onclick="
                                                    cbCliente.disabled = false;
                                                    cbRUC.disabled = true;
                                                    document.getElementById('cbRU').value = '';

                                                   ">
                                            <label style="text-align:right">Productos:</label>
                                            <select class="form-control select2" name="cbCliente" id="cbCli" required="" disabled="true"
                                                    onchange="
                                                            validaciones();
                                                            document.getElementById('selInfo').focus();
                                                    ">
                                                <option value ="" selected ="" >--Todos-</option>
                                                <%  ProductoDAO pdao = new ProductoDAO();
                                                    List<Producto> prov = pdao.ListadoStockminimo();
                                                    Iterator<Producto> itclient = prov.iterator();
                                                    Producto prove = null;

                                                    while (itclient.hasNext()) {
                                                        prove = itclient.next();
                                                %>
                                                <option value="<%=prove.getDescripcion()%>"><%=prove.getDescripcion()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <input type="radio"  value="" id="rbRUC" name = "cliente" onclick="
                                                    cbCliente.disabled = true;
                                                    cbRUC.disabled = false;
                                                    document.getElementById('cbCli').value = '';

                                                   ">
                                            <label  style="text-align:right">Codigo:</label>
                                            <select class="form-control select2" name="cbRUC" id="cbRU" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value =""  selected="" style="text-align: center">-Todos-</option>
                                                <%
                                                    Iterator<Producto> itclien = prov.iterator();
                                                    while (itclien.hasNext()) {
                                                        prove = itclien.next();
                                                %>
                                                <option value="<%=prove.getCodigo()%>"><%=prove.getCodigo()%></option>
                                                <%}%>
                                            </select>
                                            <input type="text" value="" id="selInfo" placeholder="Resultados de la busqueda" 
                                                   readonly="true"
                                                   style="width: 0px;height: 0px; outline: none; border-color: transparent"
                                                   >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-primary">
                                <div class="card-header">
                                    <h3 class="card-title">Stock Mínimo</h3>
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

                                    <div class="full-width panel-content " id="div1">
                                        <table id="datatable" class="table table-striped table-bordered second" style="width:100%">
                                            <thead style="text-align: center">
                                                <tr>

                                                    <th>Código</th>
                                                    <th style="width:300px">Descripción</th>
                                                    <th style="width:50px">U.medida</th>
                                                    <th>Stock</th>
                                                    <th>Stock Mínimo</th>
                                                    <th>Clasificación</th>
                                                    <th>Categoría</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%ProductoDAO pddao = new ProductoDAO();
                                                    List<Producto> listS = pddao.ListadoStockminimo();
                                                    Iterator<Producto> iterr = listS.iterator();
                                                    Producto pro = null;
                                                    while (iterr.hasNext()) {
                                                        pro = iterr.next();%>
                                                <tr>
                                                    <td><%=pro.getCodigo()%></td>
                                                    <td style="width:300px"><%=pro.getDescripcion()%></td>
                                                    <td style="width:50px"><%=UnidadVentaDAO.getUndVenta(pro.getIdproducto())%></td>
                                                    <td style="text-align: right;"><%=String.format("%.2f",pro.getStock())%></td>
                                                    <td style="text-align: right;"><%=String.format("%.2f",pro.getStockminimo())%></td>
                                                    <!--td style="text-align: right"><span style="text-align: right;content:''; display: inline-block; width: 10px; height:10px; margin-top:-4px; margin-right:24px; border-radius: 50%; padding:5px; vertical-align: middle; background-color: #f22;"></span><%=String.format("%.2f", pro.getStockminimo())%></td-->
                                                    <td ><%=ClasificacionDAO.getNombreClasificacion(pro.getIdproducto())%></td>
                                                    <td><%=CategoriaDAO.getNombreCategoria(pro.getIdproducto())%></td>
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
    </body>
    <%@include file="js-plantilla.jsp"%> 

    <script src="dist/js/search.js" type="text/javascript"></script>
    <script src ="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src ="https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
    <script src ="https://cdn.datatables.net/buttons/1.7.1/js/buttons.print.min.js"></script>
    <script src ="//cdn.datatables.net/tabletools/2.2.4/js/dataTables.tableTools.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src ="https://cdn.datatables.net/datetime/1.1.0/js/dataTables.dateTime.min.js"></script>
    <script src="plugins/select2/js/select2.full.min.js"></script>
    <script>
                                                        $(function () {
                                                            //Initialize Select2 Elements
                                                            $('.select2').select2()

                                                            //Initialize Select2 Elements
                                                            $('.select2bs4').select2({
                                                                theme: 'bootstrap4'
                                                            })
                                                        })

    </script>
    <script>
        function anularcss() {
            document.getElementById("css").href = "";
        }
        function retornarcss() {
            document.getElementById("css").href = "https://cdn.datatables.net/datetime/1.1.0/css/dataTables.dateTime.min.css";
        }
    </script>
    <script>
        var minDate, maxDate;
        // Custom filtering function which will search data in column four between two values
        $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    var min = minDate.val();
                    var max = maxDate.val();
                    var date = new Date(data[6]);
                    if (
                            (min === null && max === null) ||
                            (min === null && date <= max) ||
                            (min <= date && max === null) ||
                            (min <= date && date <= max)
                            ) {
                        return true;
                    }
                    return false;
                }
        );
        $(document).ready(function () {
            // Create date inputs
            minDate = new DateTime($('#fec2'), {
                format: 'MM/DD/YYYY'
            });
            maxDate = new DateTime($('#fec3'), {
                format: 'MM/DD/YYYY'
            });
            // DataTables initialisation
            var table = $('#datatable').DataTable({

                dom: 'Bfrtip',
                buttons: [
                    {extend: 'copyHtml5', text: 'Copiar tabla', footer: true},
                    {extend: 'excelHtml5', text: 'Exportar Excel', footer: true},
                    {extend: 'pdfHtml5', text: 'Exportar PDF', footer: true},
                    {extend: 'print', text: 'Imprimir Reporte', footer: true}
                ],
                "footerCallback": function (row, data, start, end, display) {
                    var api = this.api(), data;
                    // Remove the formatting to get integer data for summation
                    var intVal = function (i) {
                        return typeof i === 'string' ?
                                i.replace(/(S\/.)/g, '') * 1 :
                                typeof i === 'number' ?
                                i : 0;
                    };

                }
            });
            // Refilter the table
            $('#fec2, #fec3').on('focus', function () {
                table.draw();
            });
            $('#selInfo').on('focus', function () {
                table.search(this.value).draw();
            });
        });
    </script>
    <script type="text/javascript">
        function func() {
            var cbCli = document.getElementById("cbCli");
            var textCli = cbCli.options[cbCli.selectedIndex].text;
            alert(textCli);

        }
    </script>
</html>
