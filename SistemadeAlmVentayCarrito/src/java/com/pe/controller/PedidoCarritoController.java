/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.controller;
import com.pe.DAO.MovimientoDAO;
import com.pe.DAO.ProductoDAO;
import com.pe.model.entity.DetalleMovimiento;
import com.pe.model.entity.Movimiento;
import com.pe.model.entity.Producto;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 *
 * @author yenny
 */
public class PedidoCarritoController extends HttpServlet {
    MovimientoDAO carritodao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO carritoDAO;
    int Ncarrito;
    Movimiento carrito = new Movimiento();
    DetalleMovimiento dcarrito = new DetalleMovimiento();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritocarrito")) {
            this.procesarCarritocarrito(request, response);
        }
        if (accion.equals("AnadirCarritocarrito")) {
            this.anadirCarritocarrito(request, response);
        }
        if (accion.equals("actualizarcantidadcarrito")) {
            this.actualizarcantidadcarrito(request, response);
        }
        if (accion.equals("Registrarcarritodeventa")) {
            this.Registrarcarritodeventa(request, response);
        }
    }
    private void procesarCarritocarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carrito;//
        if (sesion.getAttribute("carrito") == null) {
            carrito = new ArrayList<DetalleMovimiento>();

        } else {
            carrito = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carrito");
        }
        if (carrito.size() > 0) {
            for (int i = 0; i < carrito.size(); i++) {

                DetalleMovimiento det = carrito.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < carrito.size(); i++) {

                DetalleMovimiento det = carrito.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("carrito", carrito);
        response.sendRedirect("_Detalledepedido.jsp");
    }

    private void anadirCarritocarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> carrito;//
        if (sesion.getAttribute("carrito") == null) {
            carrito = new ArrayList<DetalleMovimiento>();
        } else {
            carrito = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carrito");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("txtPro_id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("txtPro_id")));
        d.setProducto(p);
        d.setCantidad(Double.parseDouble(request.getParameter("txtPro_cantidad")));
        d.setCosto(Double.parseDouble(request.getParameter("txtPro_precio")));
        double subTotal = d.getCosto() * d.getCantidad();
        d.setSubtotal(subTotal);
        boolean indice = false;
        for (int i = 0; i < carrito.size(); i++) {
            DetalleMovimiento det = carrito.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            carrito.add(d);
        }
        sesion.setAttribute("carrito", carrito);
        response.sendRedirect("_Detalledepedido.jsp");
    }

    private void actualizarcantidadcarrito(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carrito;//
        if (sesion.getAttribute("carrito") == null) {
            carrito = new ArrayList<DetalleMovimiento>();
        } else {
            carrito = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carrito");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantcarrito"));
        int fila = Integer.parseInt(request.getParameter("idproductocarrito"));
        DetalleMovimiento det = carrito.get(fila);
        det.setCantidad(cantidad);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        carrito.set(fila, det);
        sesion.setAttribute("carrito", carrito);
        response.sendRedirect("_Detalledepedido.jsp");
    }

    private void Registrarcarritodeventa(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtAuxiliar").toUpperCase()));
        v.setIdusuario(Integer.parseInt(request.getParameter("txtUsuario").toUpperCase()));
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("P001");
        v.setCorrelativo(request.getParameter("txtCorrelativo").toUpperCase());
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setFechaentrega(request.getParameter("txtFechaentrega").toUpperCase());
        v.setIdreferencia(1);
        v.setReferencia("Ninguno");
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen("ALMACEN GENERAL");
        v.setCondicion("Contado");
        v.setIdmotivo(1);
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(Double.parseDouble(request.getParameter("txtSubtotal").toUpperCase()));
        v.setIgv(Double.parseDouble(request.getParameter("txtIgv").toUpperCase()));
        v.setTotal(Double.parseDouble(request.getParameter("txtTotal").toUpperCase()));
        v.setEstado("Pendiente");
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carrito");
        if (carritodao.insertarMovimiento(v, detalle)) {
            request.getSession().removeAttribute("carrito");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("carrito");
            response.getWriter().print("Nose realizo la venta");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
