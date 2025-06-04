<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AdminLTE 3 | Log in (v2)</title>

        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link href="dist/css/plantilla.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="hold-transition login-page" >
        <div class="login-box">
            <!-- /.login-logo -->
            <div class="card card-outline card-primary">
                <br>
                <figure class="text-center">
                    <img src="descarga.png" alt=""
                         width="250" height="200"  class="img-fluid mx-auto" alt="Logo gatas y gatos" border-radius="50%">
                </figure>
                <p class="text-center text-condensedLight">Inicia sesión </p>

                ${mensaje}
                <div class="card-body">
                    <form action="LoginController" method="POST">
                        <div class="input-group mb-3">
                            <box-icon type="solid" name="user" style="width:200%;float:left;"></box-icon>
                            <input  name="txtUsuario" class="form-control" type="text" id="userName" required="">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <box-icon type='solid'style="width:200%;float:left;" name='key'></box-icon>
                            <input name="txtPassword"  class="form-control" type="password" id="pass" required>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <input type="checkbox" id="remember">
                                    <label for="remember">
                                        Remember Me
                                    </label>
                                </div>
                            </div>
                            <div class="col-8">
                                <div class="icheck-primary">
                                    <a href="_RegistrarCliente.jsp">Crear una cuenta</a>
                                </div>
                            </div>
                            <!-- /.col -->
                            <div class="col-4">
                                <input type="submit" name="btnEntrar"  value="Iniciar" id="SingIn" class="btn btn-primary btn-block" >
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.login-box -->

            <!-- jQuery -->
            <script src="plugins/jquery/jquery.min.js"></script>
            <!-- Bootstrap 4 -->
            <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
            <!-- AdminLTE App -->
            <script src="dist/js/adminlte.min.js"></script>
            <%
                HttpSession sesion = request.getSession();
                String tipo = "";
                if (request.getAttribute("tipo") != null) {
                    tipo = request.getAttribute("tipo").toString();
                    if (tipo.equalsIgnoreCase("Administrador")) {
                        sesion.setAttribute("usuario", request.getAttribute("usuario"));
                        sesion.setAttribute("tipo", tipo);
                        response.sendRedirect("Producto.jsp");
                    } else if (tipo.equalsIgnoreCase("Almacen")) {
                        sesion.setAttribute("usuario", request.getAttribute("usuario"));
                        sesion.setAttribute("tipo", tipo);
                        response.sendRedirect("Producto.jsp");
                    } else if (tipo.equalsIgnoreCase("Compra")) {
                        sesion.setAttribute("usuario", request.getAttribute("usuario"));
                        sesion.setAttribute("tipo", tipo);
                        response.sendRedirect("Proveedor.jsp");
                    } else if (tipo.equalsIgnoreCase("Venta")) {
                        sesion.setAttribute("usuario", request.getAttribute("usuario"));
                        sesion.setAttribute("tipo", tipo);
                        response.sendRedirect("ListarFacturaventa.jsp");
                    } else if (tipo.equalsIgnoreCase("Cliente")) {
                        sesion.setAttribute("usuario", request.getAttribute("usuario"));
                        sesion.setAttribute("tipo", tipo);
                        response.sendRedirect("Index.jsp");
                    }
                }

                if (request.getParameter("cerrar") != null) {
                    session.invalidate();
                }
            %>
    </body>
</html>
