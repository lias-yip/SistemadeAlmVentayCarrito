<%@page import="com.pe.model.entity.Motivo"%>
<%@page import="com.pe.DAO.MotivoDAO"%>
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
        <title>Nota de Ingreso Plastitex"</title>
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
    <body class="hold-transition sidebar-mini">
        <%@include file="Frmmenu.jsp" %>
        <!-- pageContent -->
        <div class="content-wrapper">
            <section class="content-header">
            </section>
            <section class="content">
                <form id="newmovimiento" method="post" name="accion">
                    <div class="row">
                        <div class="col-md-12">
                            <!--modal listar-->
                            <div class="card card-default">
                                <div class="card-header">
                                    <h3 class="card-title" style="color: white;">REPORTE DE INGRESO</h3>
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
                                        <div class="form-group col-md-3">
                                            <%  String clisel = "";
                                                String docsel = "";
                                                String fechSel = "";
                                                String sel = clisel + " " + docsel + " " + fechSel;
                                            %>
                                            <input type="hidden" id="todclisel" value="" />
                                            <input type="hidden" id="clisel" value="" />
                                            <input type="hidden" id="clirucsel" value="" />
                                            <input type="hidden" id="toddocsel" value="" />
                                            <input type="hidden" id="todmovsel" value="" />
                                            <input type="hidden" id="docsel" value="" />
                                            <input type="hidden" id="movsel" value="" />
                                            <input type="hidden" id="todpersel" value="" />
                                            <input type="hidden" id="persel" value="" />
                                            <input type="hidden" id="fechsel" value="" />
                                            <script>
                                                function validaciones() {
                                                    if (
                                                            document.getElementById('rbCli').checked ||
                                                            document.getElementById('rbRUC').checked ||
                                                            document.getElementById('rbTodDoc').checked ||
                                                            document.getElementById('rbTodmov').checked ||
                                                            document.getElementById('rbDoc').checked ||
                                                            document.getElementById('rbMov').checked ||
                                                            document.getElementById('rbTodPer').checked ||
                                                            document.getElementById('rbPer1').checked
                                                            ) {
                                                        document.getElementById('todclisel').value = '';
                                                        document.getElementById('clisel').value = document.getElementById('cbCli').value.toLowerCase();
                                                        document.getElementById('clirucsel').value = document.getElementById('cbRU').value.toLowerCase();

                                                        document.getElementById('toddocsel').value = '';
                                                        document.getElementById('docsel').value = document.getElementById('cbDoc').value.toLowerCase();

                                                        document.getElementById('todmovsel').value = '';
                                                        document.getElementById('movsel').value = document.getElementById('cbMov').value.toLowerCase();
                                                        
                                                        document.getElementById('todpersel').value = '';

                                                        if (document.getElementById('anoperiodo').value.toLowerCase() < 2000 || document.getElementById('anoperiodo').value.toLowerCase() > 2030) {
                                                            document.getElementById('anoperiodo').value = '';
                                                        }

                                                        document.getElementById('persel').value = document.getElementById('mesperiodo').value.toLowerCase() + ' /' +
                                                                document.getElementById('anoperiodo').value.toLowerCase();
                                                        var fecha = '';

                                                    }

                                                    document.getElementById('selInfo').value = document.getElementById('todclisel').value.toLowerCase() + ' ' +
                                                            document.getElementById('clisel').value.toLowerCase() + ' ' +
                                                            document.getElementById('clirucsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('toddocsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('docsel').value.toLowerCase() + ' ' +
                                                             document.getElementById('todmovsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('movsel').value.toLowerCase() + ' ' +
                                                            document.getElementById('todpersel').value.toLowerCase() + ' ' +
                                                            document.getElementById('persel').value.toLowerCase() + ' ' + fecha;

                                                    console.log(document.getElementById('selInfo').value.toLowerCase());
                                                }
                                            </script>

                                            <input type="radio" value="" id="rbCli" name = "cliente" style="align-items: center" onclick="
                                                    cbCliente.disabled = false;
                                                    cbRUC.disabled = true;
                                                    document.getElementById('cbRU').value = '';

                                                   ">
                                            <label>Proveedor:</label>
                                            <select class="form-control select2" name="cbCliente" id="cbCli" required="" disabled="true"
                                                    onchange="
                                                            validaciones();
                                                            document.getElementById('selInfo').focus();
                                                    ">
                                                <option value ="" selected="" style="text-align: center">-Todos-</option>
                                                <%  AuxiliarDAO cdao = new AuxiliarDAO();
                                                    List<Auxiliar> clist = cdao.ListadoProveedor();
                                                    Iterator<Auxiliar> itclient = clist.iterator();
                                                    Auxiliar cli = null;

                                                    while (itclient.hasNext()) {
                                                        cli = itclient.next();
                                                %>
                                                <option value="<%=cli.getNombre()%>"><%=cli.getNombre()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <input type="radio"  value="" id="rbRUC" name = "cliente" onclick="
                                                    cbCliente.disabled = true;
                                                    cbRUC.disabled = false;
                                                    document.getElementById('cbCli').value = '';
                                                   ">
                                            <label style="text-align:right">Nro Doc:</label>
                                            <select class="form-control select2" name="cbRUC" id="cbRU" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value ="" selected="" style="text-align: center">-Todos-</option>
                                                <%
                                                    Iterator<Auxiliar> itclien = clist.iterator();
                                                    while (itclien.hasNext()) {
                                                        cli = itclien.next();
                                                %>
                                                <option value="<%=cli.getNumerodocumento()%>"><%=cli.getNumerodocumento()%></option>
                                                <%}%>
                                            </select>
                                            <input type="text" value="" id="selInfo" placeholder="Resultados de la busqueda" 
                                                   readonly="true"
                                                   style="width: 0px;height: 0px; outline: none; border-color: transparent"
                                                   >
                                        </div>
                                        <div class="form-group col-md-3">
                                            <input type="radio" value="" id="rbTodDoc" name ="doc" style="align-items: center" onclick="
                                                    cbDocu.disabled = true;
                                                    document.getElementById('cbDoc').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                   " 
                                                   checked="true">
                                            <label>Todos:</label>
                                            <input type="radio" value="" id="rbDoc" name = "doc" style="align-items: center" onclick="
                                                    cbDocu.disabled = false;
                                                   " >
                                            <label style="text-align:right">Numeración</label>
                                            <select class="form-control select2" name="cbDocu" id="cbDoc" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value ="" style="text-align: center">Todos</option>
                                                <% MovimientoDAO vddao = new MovimientoDAO();
                                                    List<Movimiento> vdlist = vddao.ListadoNotaIngresoNI();
                                                    Iterator<Movimiento> iitvent = vdlist.iterator();
                                                    Movimiento dvent = null;
                                                    while (iitvent.hasNext()) {
                                                        dvent = iitvent.next();
                                                %>
                                                <option value="<%=dvent.getSerie()%>-<%=dvent.getCorrelativo()%>"><%=dvent.getSerie()%>-<%=dvent.getCorrelativo()%></option>
                                                <%}%>
                                            </select> 
                                        </div>

                                        <div class="form-group col-md-3">
                                            <input type="radio" value="" id="rbTodmov" name ="mov" style="align-items: center" onclick="
                                                    cbMovi.disabled = true;
                                                    document.getElementById('cbMov').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                   " 
                                                   checked="true">
                                            <label>Todos:</label>
                                            <input type="radio" value="" id="rbMov" name = "mov" style="align-items: center" onclick="
                                                    cbMovi.disabled = false;
                                                   " >
                                            <label style="text-align:right">Motivos</label>
                                            <select class="form-control select2" name="cbMovi" id="cbMov" required="" disabled="true"
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value ="" style="text-align: center">Todos</option>
                                                <% MotivoDAO vvddao = new MotivoDAO();
                                                    List<Motivo> vdlistv = vvddao.ListadoIngresoActivo();
                                                    Iterator<Motivo> iitventv = vdlistv.iterator();
                                                    Motivo dventv = null;
                                                    while (iitventv.hasNext()) {
                                                        dventv = iitventv.next();
                                                %>
                                                <option value="<%=dventv.getNombre()%>"><%=dventv.getNombre()%></option>
                                                <%}%>
                                            </select> 
                                        </div>

                                        <%Date date = new Date();
                                            DateFormat dfm = new SimpleDateFormat("yyyy-MM-dd");
                                            String d = dfm.format(date).toString();
                                            int year = date.getYear();
                                        %>
                                        <div class="form-group col-md-2">
                                            <input type="radio" value="" id="rbTodPer" name ="periodo"style="align-items: center" onclick="

                                                    cbMesPeriodo.disabled = true;
                                                    txtAnoPeriodo.disabled = true;
                                                    document.getElementById('mesperiodo').value = '';
                                                    document.getElementById('anoperiodo').value = '';
                                                    document.getElementById('fec2').value = '';
                                                    document.getElementById('fec3').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                    document.getElementById('fec2').focus();
                                                    document.getElementById('fec3').focus();
                                                    anularcss();
                                                    fecha2.disabled = true;
                                                    fecha3.disabled = true;

                                                   " 
                                                   checked="true">
                                            <input type="radio" name="periodo" value="" id = "rbPer1" style="align-items: center" onclick="
                                                    cbMesPeriodo.disabled = false;
                                                    txtAnoPeriodo.disabled = false;
                                                    document.getElementById('fec2').value = '';
                                                    document.getElementById('fec3').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                    document.getElementById('fec2').focus();
                                                    document.getElementById('fec3').focus();
                                                    anularcss();
                                                    fecha2.disabled = true;
                                                    fecha3.disabled = true;
                                                   ">
                                            <label>Periodo:</label>
                                            <select class="form-control select2" name="cbMesPeriodo" id="mesperiodo" required="" disabled = ""
                                                    onchange="validaciones();
                                                            document.getElementById('selInfo').focus();">
                                                <option value="" disabled="" selected="" style="text-align: center">Mes</option>
                                                <option value="01/">Enero</option>
                                                <option value="02/">Febrero</option>
                                                <option value="03/">Marzo</option>
                                                <option value="04/">Abril</option>
                                                <option value="05/">Mayo</option>
                                                <option value="06/">Junio</option>
                                                <option value="07/">Julio</option>
                                                <option value="08/">Agosto</option>
                                                <option value="09/">Septiembre</option>
                                                <option value="10/">Octubre</option>
                                                <option value="11/">Noviembre</option>
                                                <option value="12/">Diciembre</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label>Año:</label>
                                            <input class="form-control" type="number" name="txtAnoPeriodo" id="anoperiodo" value="" min="2010" max="2030" required="" disabled = ""
                                                   onchange="validaciones();
                                                           document.getElementById('selInfo').focus();"
                                                   onkeyup="validaciones()"
                                                   placeholder="--Año--"
                                                   >
                                        </div>
                                        <div class="form-group col-md-3"> 
                                            <input type="radio" name="periodo" id="rbPer3" style="align-items: center" onclick="
                                                    cbMesPeriodo.disabled = true;
                                                    txtAnoPeriodo.disabled = true;
                                                    document.getElementById('mesperiodo').value = '';
                                                    document.getElementById('anoperiodo').value = '';
                                                    validaciones();
                                                    document.getElementById('selInfo').focus();
                                                    document.getElementById('fec2').focus();
                                                    document.getElementById('fec3').focus();
                                                    retornarcss()
                                                    fecha2.disabled = false;
                                                    fecha3.disabled = false;
                                                   ">
                                            <label>Fechas:</label>
                                            <input class="form-control" type="text" name="fecha2" value="" id="fec2" disabled="true" readonly="true"/>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Hasta:</label>
                                            <input class="form-control" type="text" name="fecha3" value="" id="fec3" disabled="true" readonly="true"/>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-outline card-info">
                                <!--   <div class="card card-primary">
                              <div class="card-header">
                                     <h3 class="card-title">Ion Slider</h3>
                                     <div class="card-tools">
                                         <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                                             <i class="fas fa-minus"></i>
                                         </button>
                                         <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                                             <i class="fas fa-times"></i>
                                         </button>
                                     </div>
                                 </div>-->

                                <div class="card-body  ">

                                    <div class="full-width panel-content" id="div1">
                                        <table id="B" class="table table-striped table-bordered second" style="width:100%">
                                            <thead>
                                                <tr>
                                                    <th style="display:none;">N°</th>
                                                    <th>Cliente</th>
                                                    <th>Nro Identidad</th>
                                                    <th style="display:none;">Doc</th>
                                                    <th>Numeracion</th>
                                                    <th >Motivo</th>
                                                    <th>Fecha(M/D/A)</th>
                                                    <th>Referencia</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%  MovimientoDAO vdao = new MovimientoDAO();
                                                    List<Movimiento> vlist = vdao.ListadoNotaIngresoNI();
                                                    Iterator<Movimiento> itvent = vlist.iterator();
                                                    Movimiento vent = null;
                                                    double tot = 0.00;
                                                    while (itvent.hasNext()) {
                                                        vent = itvent.next();

                                                %>
                                                <tr>
                                                    <td style="display:none;" id="idni"><%= vent.getIdmovimiento()%></td>
                                                    <td><%= AuxiliarDAO.getNombre(vent.getIdauxiliar())%></td>
                                                    <td><%= AuxiliarDAO.getnrodocumento(vent.getIdauxiliar())%></td>
                                                    <td style="display:none;"><%= vent.getTipocomprobante()%></td>
                                                    <td><%= vent.getSerie()%>-<%= vent.getCorrelativo()%></td>
                                                    <td><%= MotivoDAO.getNombreMotivo(vent.getIdmotivo())%></td>
                                                    <%
                                                        String da = vent.getFecha();
                                                        String newda = da.substring(0, 10);
                                                        String newdaa = da.substring(0, 2);
                                                        String newdb = newda.substring(3, 5);
                                                        String newdc = newda.substring(6, 10);
                                                        String newdd = newdb + "/" + newdaa + "/" + newdc;
                                                    %>
                                                    <td><%= newdd%></td>
                                                    <td><%= vent.getReferencia()%></td>
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
    <script src="Validacionysweetalert/NotaIngreso.js" type="text/javascript"></script>
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
            var table = $('#B').DataTable({

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
