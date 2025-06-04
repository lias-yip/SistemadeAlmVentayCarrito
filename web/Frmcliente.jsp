<%@page import="com.pe.DAO.EmpresaDAO"%>
<%@page import="com.pe.DAO.UsuarioDAO"%>
<%@page import="com.pe.model.entity.Usuario"%>
<%
    HttpSession sesionOK = request.getSession();

    if (sesionOK.getAttribute("tipo") != null) {
    }
%>
<%
    String codigo = (String) sesionOK.getAttribute("usuario");
    Usuario usu = UsuarioDAO.listimg(codigo);
%>
<!-- Header Area Start Here -->
<header class="main-header-area">
    <!-- Main Header Area Start -->
    <div class="main-header header-sticky" style="background-color: #000000">
        <div class="container-fluid">
            <div class="row align-items-center">
                <div class="col-lg-2 col-xl-2 col-sm-6 col-6 col-custom">
                    <div class="header-logo d-flex align-items-center">
                        <a href="Index.jsp">
                            <img  src="<%=EmpresaDAO.img()%>" width="50" height="45">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8 d-none d-lg-flex justify-content-center col-custom">
                    <nav class="main-nav d-none d-lg-flex">
                        <ul class="nav"> 
                            <li>
                                <a href="Index.jsp">
                                    <span class="menu-text">Inicio</span>
                                </a>
                            </li>
                            <%if (sesionOK.getAttribute("tipo") != null && sesionOK.getAttribute("tipo").equals("Cliente")) {
                            %>
                            <li>
                                <a href="DetallePDFController?accion=Mipedido&id=<%= usu.getId()%>">
                                    <span class="menu-text">Mis Pedidos</span>
                                </a>
                            </li>
                            <%
                                }
                            %>
                            <li>
                                <a href="_Contacto.jsp">
                                    <span class="menu-text">Contact Us</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2 col-md-6 col-6 col-custom">
                    <div class="header-right-area main-nav">
                        <ul class="nav">

                            <%if (sesionOK.getAttribute("tipo") != null && sesionOK.getAttribute("tipo").equals("Cliente")) {
                            %>
                            <li class="minicart-wrap">
                                <a href="_Detalledepedido.jsp" class="minicart-btn toolbar-btn">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                            </li>
                            <li class="minicart-wrap">
                                <a href="#" class="minicart-btn toolbar-btn">
                                    <i class="fa fa-power-off"></i>
                                </a>
                                <div class="cart-item-wrapper dropdown-sidemenu dropdown-hover-2">
                                    <div class="single-cart-item">
                                        <div class="cart-text">
                                            <h5 class="title"><a href="UsuarioController?accion=Limpiar">Salir</a></h5>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <%
                                }
                            %>

                            <%
                                if (sesionOK.getAttribute("tipo") == null || !sesionOK.getAttribute("tipo").equals("Cliente")) {
                            %>
                            <li class="minicart-wrap">
                                <a href="login.jsp" class="minicart-btn toolbar-btn">
                                    <i class="fa fa-user"></i>
                                </a>
                            </li>
                            <% } %>

                            <%if (sesionOK.getAttribute("tipo") != null && sesionOK.getAttribute("tipo").equals("Cliente")) {
                            %>
                            <li class="account-menu-wrap d-none d-lg-flex">
                                <a href="#" class="off-canvas-menu-btn">
                                    <i class="fa fa-bars"></i>
                                </a>
                            </li>
                            <% } %>
                            <li class="mobile-menu-btn d-lg-none">
                                <a class="off-canvas-btn" href="#">
                                    <i class="fa fa-bars"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Header Area End -->
    <!-- off-canvas menu start -->
    <%if (sesionOK.getAttribute("tipo") != null && sesionOK.getAttribute("tipo").equals("Cliente")) {
    %>
    <aside class="off-canvas-menu-wrapper" id="sideMenu">
        <div class="off-canvas-overlay"></div>
        <div class="off-canvas-inner-content">
            <div class="off-canvas-inner">
                <div class="btn-close-off-canvas">
                    <i class="fa fa-times"></i>
                </div>
                <!-- offcanvas widget area start -->
                <div class="offcanvas-widget-area">
                    <div class="switcher">
                        <div class="language">
                            <span class="switcher-title">NOMBRE:</span>
                            <span class="switcher-title"><%=usu.getNombre()%></span>
                        </div>
                        <div class="language">
                            <span class="switcher-title">NUMERO DOC:</span>
                            <span class="switcher-title"><%=usu.getNrodocumento()%></span>
                        </div>
                    </div>
                    <div class="top-info-wrap text-left text-black">
                        <ul class="address-info">
                            <li>
                                <i class="fa fa-phone"></i>
                                <a href="info%40yourdomain.html"><%=usu.getTelefono()%></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- offcanvas widget area end -->
            </div>
        </div>
    </aside>
    <!-- off-canvas menu end -->
    <%
        }
    %>
</header>
<!-- Shop Main Area Start Here -->
