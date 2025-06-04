<%@page import="java.util.Iterator"%>
<%@page import="com.pe.model.entity.TipoDocumento"%>
<%@page import="java.util.List"%>
<%@page import="com.pe.DAO.TipoDocumentoDAO"%>
<%@page import="com.pe.DAO.AuxiliarDAO"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!doctype html>
<html class="no-js" lang="en">


    <!-- Mirrored from htmldemo.net/flosun/flosun/my-account.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 04 Dec 2022 05:03:27 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>FloSun - Flower Shop HTML5 Template</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assetcart/images/favicon.ico">

        <!-- CSS
            ============================================ -->
        <!-- Bootstrap CSS -->
        <%--sweet alert--%>
        <script src= " https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
        <%--sweet alert--%>
        <link rel="stylesheet" href="assetcart/css/vendor/bootstrap.min.css">
        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="assetcart/css/vendor/font.awesome.min.css">
        <!-- Linear Icons CSS -->
        <link rel="stylesheet" href="assetcart/css/vendor/linearicons.min.css">
        <!-- Swiper CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/swiper-bundle.min.css">
        <!-- Animation CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/animate.min.css">
        <!-- Jquery ui CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/jquery-ui.min.css">
        <!-- Nice Select CSS -->
        <link rel="stylesheet" href="assetcart/css/plugins/nice-select.min.css">
        <!-- Magnific Popup -->
        <link rel="stylesheet" href="assetcart/css/plugins/magnific-popup.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assetcart/css/style.css">
    </head>

    <body>
        <!-- Header Area Start Here -->
        <%@include file="Frmcliente.jsp" %>
        <!-- Shop Main Area Start Here -->
        <!-- my account wrapper start -->
        <div class="my-account-wrapper mt-no-text">
            <div class="container container-default-2 custom-area">

                <div class="row">
                    <div class="col-lg-12 col-custom">
                        <!-- My Account Page Start -->
                        <div class="myaccount-page-wrapper">
                            <!-- My Account Tab Menu Start -->
                            <div class="row">
                                <!-- My Account Tab Content Start -->
                                <div class="col-lg-12 col-md-12 col-custom">
                                    <div class="tab-content" id="myaccountContent">
                                        <!-- Single Tab Content Start -->
                                        <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                            <div class="myaccount-content">
                                                <h3>Detalle de la cuenta</h3>
                                                <div class="account-details-form">
                                                    <form id="nuevocliente" action="ClienteController" method="Post" name="frm_nuevo" >
                                                        <% AuxiliarDAO clie = new AuxiliarDAO();
                                                            String numserie = clie.Numseriecliente();
                                                        %>
                                                        <input type="hidden" id="first-name" name="txtCod" value="<%=numserie%>"/>

                                                        <div class="single-input-item mb-3">
                                                            <label for="display-name" class="required mb-1">Nombre Completo</label>
                                                            <input type="text" id="display-name" name="Txtapellidos" required=""/>
                                                            <%UsuarioDAO usua = new UsuarioDAO();
                                                                String numserieusu = usua.Numserieusuario();
                                                            %>
                                                            <input type="hidden" value="<%=numserieusu%>" name="txtCodigo">
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-lg-6 col-custom">
                                                                <div class="single-input-item mb-3">

                                                                    <label>Documentos de Identidad<span class="required">*</span></label>
                                                                    <select class="myniceselect nice-select wide rounded-0" name="Txtidtipodocumento" id="Txtidtipodocumento">
                                                                        <option   value=""disabled="" selected="" class="required mb-1"></option>
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
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-6 col-custom">
                                                                <div class="single-input-item mb-3">
                                                                    <label for="first-name" class="required mb-1">Numero Documento</label>
                                                                    <input type="text" id="first-name" name="Txtnumerodocumento" onkeypress="return soloNumeros(event)" required=""/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-lg-6 col-custom">
                                                                <div class="single-input-item mb-3">
                                                                    <label class="required mb-1">Celular</label>
                                                                    <input type="text" id="" name="Txtcelular" onkeypress="return soloNumeros(event)" required=""/>
                                                                </div> 
                                                            </div> 
                                                        </div>
                                                        <% Date dNow = new Date();
                                                            SimpleDateFormat ft
                                                                    = new SimpleDateFormat("yyyy-MM-dd");
                                                            String currentDate = ft.format(dNow);
                                                        %>
                                                        <input type="hidden" name="Txtfechaderegistro" value="<%=currentDate%>">
                                                        <fieldset>
                                                            <legend>Password</legend>
                                                            <div class="row">
                                                                <div class="col-lg-6 col-custom">
                                                                    <div class="single-input-item mb-3">
                                                                        <label for="new-pwd" class="required mb-1">Usuario</label>
                                                                        <input type="text" id="new-pwd" name="txtusuario" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6 col-custom">
                                                                    <div class="single-input-item mb-3">
                                                                        <label for="confirm-pwd" class="required mb-1">Contraseña</label>
                                                                        <input type="password" id="confirm-pwd" name="txtcontraseña" required=""/>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </fieldset>
                                                        <div class="single-input-item single-item-button">
                                                            <button class="btn flosun-button primary-btn rounded-0 black-btn w-100" type="submit" name="accion">Crea tu cuenta</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div> <!-- Single Tab Content End -->
                                    </div>
                                </div> <!-- My Account Tab Content End -->
                            </div>
                        </div> <!-- My Account Page End -->
                    </div>
                </div>

            </div>
        </div>

        <!-- my account wrapper end -->
        <!--Footer Area Start-->
        <%@include file="footer.jsp" %>
        <!--Footer Area End-->

        <!-- JS
    ============================================ -->


        <!-- jQuery JS -->
        <script src="assetcart/js/vendor/jquery-3.6.0.min.js"></script>
        <!-- jQuery Migrate JS -->
        <script src="assetcart/js/vendor/jquery-migrate-3.3.2.min.js"></script>
        <!-- Modernizer JS -->
        <script src="assetcart/js/vendor/modernizr-3.7.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="assetcart/js/vendor/bootstrap.bundle.min.js"></script>
        <!-- Swiper Slider JS -->
        <script src="assetcart/js/plugins/swiper-bundle.min.js"></script>
        <!-- nice select JS -->
        <script src="assetcart/js/plugins/nice-select.min.js"></script>
        <!-- Ajaxchimpt js -->
        <script src="assetcart/js/plugins/jquery.ajaxchimp.min.js"></script>
        <!-- Jquery Ui js -->
        <script src="assetcart/js/plugins/jquery-ui.min.js"></script>
        <!-- Jquery Countdown js -->
        <script src="assetcart/js/plugins/jquery.countdown.min.js"></script>
        <!-- jquery magnific popup js -->
        <script src="assetcart/js/plugins/jquery.magnific-popup.min.js"></script>
        <!-- Main JS -->
        <script src="assetcart/js/main.js"></script>
        <script type="text/javascript">
                                                                        $(function () {
                                                                            $("#nuevocliente").on("submit", function (e) {
                                                                                e.preventDefault();
                                                                                var data = $('#nuevocliente').serialize();
                                                                                $.post("ClienteController?accion=addcliente", data, function (res, est, jqXHR) {
                                                                                    if (res === "ok") {
                                                                                        swal("Se ha guardado la informacion", {
                                                                                            icon: "success"
                                                                                        })
                                                                                                .then((willDelete) => {
                                                                                                    if (willDelete) {
                                                                                                        parent.location.href = "_RegistrarCliente.jsp";
                                                                                                    }
                                                                                                });
                                                                                        ;
                                                                                    } else if (res === "yaexiste") {
                                                                                        debugger;
                                                                                        swal("Ya existe Cliente", {
                                                                                            icon: "warning"
                                                                                        });
                                                                                        return false;
                                                                                    } else {
                                                                                        swal("Revise la informacion y vuelva a intentarlo", {
                                                                                            icon: "warning"
                                                                                        })
                                                                                                .then((willDelete) => {
                                                                                                    if (willDelete) {
                                                                                                        parent.location.href = "_RegistrarCliente.jsp";
                                                                                                    }
                                                                                                });
                                                                                        ;
                                                                                    }
                                                                                });
                                                                            });
                                                                        });
        </script>
        <script>
            function soloNumeros(e) {
                key = e.keyCode || e.which;
                tecla = String.fromCharCode(key).toLowerCase();
                letras = "0123456789";
                especiales = [8, 37, 39, 46];

                tecla_especial = false
                for (var i in especiales) {
                    if (key == especiales[i]) {
                        tecla_especial = true;
                        break;
                    }
                }

                if (letras.indexOf(tecla) == -1 && !tecla_especial)
                    return false;
            }
        </script>
    </body>
</html>