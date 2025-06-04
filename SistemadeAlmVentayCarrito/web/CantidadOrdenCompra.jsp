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
    <body>
        <!-- add Modal HTML -->
        <div >
            <%
                ProductoDAO dao = new ProductoDAO();
                int id = Integer.parseInt((String) request.getAttribute("idproxalmoc"));
                Producto p = (Producto) dao.list(id);
            %>
            <div class="modal-content">
                <div class="modal-header">      
                    <h4 class="modal-title"   id="myModalLabel">Ingrese Cantidad de Producto</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <form method="post" action="OrdenCompraController" accion="AnadirCarritooc"> 
                    <div class="modal-body">  
                        <div class="form-group">
                            <input  type="hidden" type="text"  name="txtPro_id" value="<%=p.getIdproducto()%>"readonly="">
                        </div>  
                        <div class="form-group">
                            <label>Descripción</label>
                            <textarea class="form-control" name="textarea" rows="2" cols="54" readonly=""><%=p.getDescripcion()%></textarea>
                        </div> 
                        <div class="form-group"> 
                            <label >Cantidad</label>   
                            <input class="form-control" type="number" placeholder="0.00" step="0.01"  min="0.01" id="txtPro_cantidad" name="txtPro_cantidad" required="">
                        </div>
                        <div class="form-group">
                            <label>Und</label>
                            <input type="text" class="form-control" name="txtPro_descripcion" value="<%=UnidadVentaDAO.getUndVenta(p.getIdproducto())%>" readonly="">
                        </div> 
                         <div class="form-group">
                            <label>Costo</label>
                            <input class="form-control" type="number" placeholder="0.00" step="0.01" min="0.01" id="txtPro_precio" name="txtPro_precio" required="">
                            <%--input class="form-control" type="number" placeholder="1.00" step="0.01" value="<%=String.format("%.2f",ProductoDAO.getProductocosto(p.getIdproducto()))%>" min="0.01" id="txtPro_precio" name="txtPro_precio" required=""--%>
                        </div> 
                    </div>

                    <div class="modal-footer">
                        <a href="ProductosActivosoc.jsp" class="btn btn-default" >Cancelar</a> 
                        <input type="submit" value="Añadir" class="btn btn-success" name="btnAnadir">
                        <input type="hidden" name="accion" value="AnadirCarritooc"/>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
