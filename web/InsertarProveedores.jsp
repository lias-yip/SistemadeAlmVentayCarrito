<%@page import="com.pe.model.entity.TipoDocumento"%>
<%@page import="com.pe.DAO.TipoDocumentoDAO"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3 | DataTables</title>
        <%@include file="css-plantilla.jsp"%> 
        <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
        <link href="dist/css/ColordeEstado.css" rel="stylesheet" type="text/css"/>
        <style>
            legend {
                display: block;
                width: 100%;
                padding: 0;
                margin-bottom: 25px;
                font-size: 21px;
                line-height: inherit;
                color: #333;
                border: 0;
                border-bottom: 1px solid #D4D4D4;
            }
            .col-sm-12, .col-md-12, .col-lg-12 {
                position: relative;
                min-height: 1px;
                padding-left: 25px;
                padding-right: 25px;
            }
            .form-horizontal .form-group {
                margin-left: 0!important;
                margin-right: 0!important;
            }
            .form-control {
                color: #000;
                height: 30px;
                padding: 0 12px;
                box-shadow: none !important;
                border-width: 2px;
                letter-spacing: 0.5px;
                border-radius: 0 !important;
            }
            .form-control {
                display: block;
                width: 100%;
                height: 38px;
                padding: 6px 12px;
                font-size: 16px;
                line-height: 1.78571;
                color: #000;
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
                transition: border-color ease-in-out 0.15s,box-shadow ease-in-out 0.15s;
            }
        </style>
    </head>
    <body class="hold-transition sidebar-mini">
        <!-- Navbar -->
        <%@include file="Frmmenu.jsp" %>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
            </section>
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <!-- /.card-header --> 
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-7 col-sm-7 col-xs-12">
                                            <h1 class="h3" style="margin-bottom: 30px;">
                                                <i class="icon-fontello-users-2">&nbsp;</i>
                                                <!-- react-text: 408 -->Administrar <!-- /react-text -->
                                                <span class="h4"><!-- react-text: 410 -->&gt;<!-- /react-text --><!-- react-text: 411 --> Proveedores<!-- /react-text --></span>
                                            </h1>
                                        </div>
                                    </div>
                                    <div class="card-header" style="color: #FFF">
                                        <h1 class="card-title">Registrar Proveedor</h1>
                                    </div>
                                    <br>
                                    <form id="newproveedor" action="ProveedorController" method="Post" name="frm_nuevo">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <legend>Datos Personales
                                                    </legend>
                                                    <% AuxiliarDAO cli = new AuxiliarDAO();
                                                        String numserie = cli.Numserieproveedor();
                                                    %>
                                                    <div class="form-group">
                                                        <label for="txtNombresCliente" class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Código</label>
                                                        <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="txtCod" value="<%=numserie%>" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Proveedor</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtapellidos" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-6 col-md-4 col-sm-12 col-xs-12 control-label">Tipo de Doc. de Identidad</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <select class="border-focus-darkblue form-control" name="Txtidtipodocumento" id="Txtidtipodocumento">
                                                                <option   value=""disabled="" selected="" >Documentos de Identidad</option>
                                                                <% TipoDocumentoDAO tdoc = new TipoDocumentoDAO();
                                                                    List<TipoDocumento> lista = tdoc.listarTipodocumento();
                                                                    Iterator<TipoDocumento> iterr = lista.iterator();
                                                                    TipoDocumento doc = null;
                                                                    while (iterr.hasNext()) {
                                                                        doc = iterr.next();
                                                                %>
                                                                <option  value="<%=doc.getIdtipodocumento()%>"><%=doc.getTipoDocumento()%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-6 col-md-4 col-sm-12 col-xs-12 control-label">Documento de Identidad</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtnumerodocumento" onkeypress="return soloNumeros(event)" maxlength="11" id="cedula" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                        <div id="respuesta"> </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Dirección</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtdireccion" id="Txtdireccion" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Correo</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtcorreo" id="Txtcorreo" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                                <fieldset>
                                                    <legend>Información de contacto</legend>
                                                    <div class="form-group">
                                                        <% Date dNow = new Date();
                                                            SimpleDateFormat ft
                                                                    = new SimpleDateFormat("yyyy-MM-dd");
                                                            String currentDate = ft.format(dNow);
                                                        %>
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Fecha de Registro</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtfechaderegistro" value="<%=currentDate%>" class="border-focus-darkblue form-control" readonly="">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Contacto</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtcontacto" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Teléfono</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txttelefono" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Celular</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12">
                                                            <input type="text" name="Txtcelular"  id="Txtcelular" class="border-focus-darkblue form-control">
                                                            <span class="help-block"></span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="Txtsexo" class="col-lg-4 col-md-4 col-sm-12 col-xs-12 control-label">Género</label>
                                                        <div class="col-lg-11 col-md-8 col-sm-12 col-xs-12" class="border-focus-darkblue form-control">
                                                            <input type="radio" name="Txtsexo" value="M" >&nbsp; M
                                                            <input type="radio" name="Txtsexo" value="F" >&nbsp; F
                                                        </div>
                                                        <span class="help-block"></span>
                                                    </div>
                                                </fieldset>
                                            </div>


                                        </div>
                                        <div class="modal-footer"> 
                                            <center>
                                                <a class="btn btn-app bg-secondary" href="Proveedor.jsp"><i class="fa fa-window-close"></i> CANCELAR</a>
                                                <button onclick="return validarnewproveedor()" type="submit" name="accion" class="btn btn-app bg-cyan" ><i class="fas fa-check-square"></i> GRABAR</button>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.card-body -->
                            </div>
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
        <%@include file="js-plantilla.jsp"%> 
        <script src="plugins/toastr/toastr.min.js"></script>
        <script src="Validacionysweetalert/Proveedor.js" type="text/javascript"></script>
        <script type="text/javascript">
    $(document).ready(function() {
//Validando si existe la Cedula en BD antes de enviar el Form
$("#cedula").on("keyup", function() {
  var cedula = $("#cedula").val(); //CAPTURANDO EL VALOR DE INPUT CON ID CEDULA
//Valido la longitud 
    var dataString = 'cedula=' + cedula;
      $.ajax({
          url: 'ValidarRuc',
          type: "GET",
          data: dataString,
          dataType: "JSON",
          success: function(datos){
                if( datos.success == true){
                $("#respuesta").html(datos.message);
                }else{
                $("#respuesta").html(datos.message);
                    }
                  }
                });
          });
 });
      
</script>
    </body>
</html>
