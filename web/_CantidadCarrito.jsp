<%@page import="com.pe.DAO.UnidadVentaDAO"%>
<%@page import="com.pe.DAO.ProductoDAO"%>
<%@page import="com.pe.model.entity.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PLASTITEX</title>
    </head>
    <style>
        .stock-agotado {
            color: red; /* Color rojo para indicar agotado */
            font-weight: bold; /* Texto en negrita */
            /* Otros estilos según necesites */
        }

        .stock-disponible {
            color: green; /* Color verde para indicar disponible */
            /* Otros estilos según necesites */
        }
    </style>
    <body>
        <!-- add Modal HTML -->
        <div >
            <%
                ProductoDAO dao = new ProductoDAO();
                int id = Integer.parseInt((String) request.getAttribute("idproxalmcarrit"));
                Producto p = (Producto) dao.list(id);
            %>
            <form method="post" action="PedidoCarritoController" accion="AnadirCarritocarrito">

                <div class="modal-header">      
                    <h4 class="modal-title"   id="myModalLabel">Lo que llevas en tu carro</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>

                <div class="modal-body">
                    <div class="container-fluid custom-area">
                        <div class="row">
                            <div class="form-group">
                                <input  type="hidden" type="text"  name="txtPro_id" value="<%=p.getIdproducto()%>"readonly="">
                            </div>
                            <div class="col-md-6 col-custom">
                                <div class="modal-product-img">
                                    <a class="w-100" href="#">
                                        <img class="w-100" width="150" height="450" src="<%= p.getFilename1()%>" alt="Product">
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-6 col-custom">
                                <div class="modal-product">
                                    <div class="product-content">
                                        <div class="product-head mb-3">
                                            <H1 class="title"><%=p.getDescripcion()%></H1>
                                        </div>
                                        <div class="price-box">
                                            <input class="form-control" type="hidden" value="<%=String.format("%.2f", p.getPrecioVenta())%>" id="txtPro_precio" name="txtPro_precio" required="">

                                            <H4 class="regular-price ">S/ <%=String.format("%.2f", p.getPrecioVenta())%></H4>
                                        </div>
                                        <p class="desc-content"><%=p.getObser()%></p>
                                        <div class="price-box">
                                            <input class="form-control" type="hidden" value="<%=String.format("%.2f", p.getPrecioVenta())%>" id="txtPro_precio" name="txtPro_precio" required="">

                                            <H4 class="regular-price <%= p.getStock() == 0 ? "stock-agotado" : "stock-disponible"%>">
                                                <% if (p.getStock() == 0) { %>
                                                Stock Agotado
                                                <% } else {%>
                                                <%= String.format("%.2f", p.getStock())%> <%= UnidadVentaDAO.getUndVenta(p.getIdproducto())%> Disponibles
                                                <% }%>
                                            </H4>                                        </div>
                                        <div class="quantity-with-btn">
                                            <div class="quantity">
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box" id="txtPro_cantidad" max="<%=p.getStock()%>" name="txtPro_cantidad" min="1" value="1" type="number">
                                                    <div class="dec qtybutton">-</div>
                                                    <div class="inc qtybutton">+</div>
                                                </div>
                                            </div>
                                            </br>
                                            <div class="add-to_cart">
                                                <input type="submit" value="Agregar al Carrito" class="btn product-cart button-icon flosun-button dark-btn" name="btnAnadir">
                                                <a href="Index.jsp" class="btn flosun-button secondary-btn rounded-0">Cancelar</a>
                                                <input type="hidden" name="accion" value="AnadirCarritocarrito"/>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </form>
        </div>

    </body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $('.qtybutton').on('click', function () {
            var $button = $(this);
            var oldValue = $button.siblings('input.cart-plus-minus-box').val();

            if ($button.hasClass('inc')) {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                // Don't allow decrementing below zero
                if (oldValue > 0) {
                    var newVal = parseFloat(oldValue) - 1;
                } else {
                    newVal = 0;
                }
            }

            $button.siblings('input.cart-plus-minus-box').val(newVal);
        });
    });
</script>

