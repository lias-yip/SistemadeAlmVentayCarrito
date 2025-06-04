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
import java.io.PrintWriter;
import java.text.DecimalFormat;
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
public class OrdenCompraController extends HttpServlet {

    MovimientoDAO ocdao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO ocDAO;
    // venta
    String occomprobante;
    String numoccomprobante;
    // detalle _detalle
    int Noc;
    DecimalFormat formateadoroc;
    Movimiento oc = new Movimiento();
    DetalleMovimiento doc = new DetalleMovimiento();

    public OrdenCompraController() {
        ocDAO = new MovimientoDAO();
        formateadoroc = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritooc")) {
            this.procesarCarritooc(request, response);
        }
        if (accion.equals("AnadirCarritooc")) {
            this.anadirCarritooc(request, response);
        }
        if (accion.equals("actualizarcantidadoc")) {
            this.actualizarcantidadoc(request, response);
        }
        if (accion.equals("actualizarcostooc")) {
            this.actualizarcostooc(request, response);
        }
        if (accion.equals("Registrarordendecompra")) {
            this.Registrarordendecompra(request, response);
        }
        if (accion.equals("Anular")) {
            this.estadoanularoc(request, response);
        }
        if (accion.equals("Eliminar")) {
            this.Eliminar(request, response);
        }
        if (accion.equals("Limpiaroc")) {
            this.Limpiaroc(request, response);
        }
    }

    private void procesarCarritooc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("caroc") == null) {
            caroc = new ArrayList<DetalleMovimiento>();

        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("caroc");
        }
        if (caroc.size() > 0) {
            for (int i = 0; i < caroc.size(); i++) {

                DetalleMovimiento det = caroc.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < caroc.size(); i++) {

                DetalleMovimiento det = caroc.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("caroc", caroc);
        response.sendRedirect("InsertarOrdendeCompra.jsp");
    }

    private void anadirCarritooc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("caroc") == null) {
            caroc = new ArrayList<DetalleMovimiento>();
        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("caroc");
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
        for (int i = 0; i < caroc.size(); i++) {
            DetalleMovimiento det = caroc.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            caroc.add(d);
        }
        sesion.setAttribute("caroc", caroc);
        response.sendRedirect("InsertarOrdendeCompra.jsp");
    }

    private void actualizarcantidadoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("caroc") == null) {
            caroc = new ArrayList<DetalleMovimiento>();
        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("caroc");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantoc"));
        int fila = Integer.parseInt(request.getParameter("idproductooc"));
        DetalleMovimiento det = caroc.get(fila);
        det.setCantidad(cantidad);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        caroc.set(fila, det);
        sesion.setAttribute("caroc", caroc);
        response.sendRedirect("InsertarOrdendeCompra.jsp");
    }

    private void actualizarcostooc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("caroc") == null) {
            caroc = new ArrayList<DetalleMovimiento>();
        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("caroc");
        }
        Double Costo = Double.parseDouble(request.getParameter("costoc"));
        int fila = Integer.parseInt(request.getParameter("idproductooc"));
        DetalleMovimiento det = caroc.get(fila);
        det.setCosto(Costo);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        caroc.set(fila, det);
        sesion.setAttribute("caroc", caroc);
        response.sendRedirect("InsertarOrdendeCompra.jsp");

    }

    private void Registrarordendecompra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("OC01");
        v.setCorrelativo(request.getParameter("txtCorrelativo").toUpperCase());
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setFechaentrega(request.getParameter("txtFechaentrega").toUpperCase());
        v.setIdreferencia(1);
        v.setReferencia(request.getParameter("txtReferencia").toUpperCase());
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen(request.getParameter("txtAlmacen").toUpperCase());
        v.setCondicion(request.getParameter("txtCondicion").toUpperCase());
        v.setIdmotivo(1);
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(Double.parseDouble(request.getParameter("txtSubtotal").toUpperCase()));
        v.setIgv(Double.parseDouble(request.getParameter("txtIgv").toUpperCase()));
        v.setTotal(Double.parseDouble(request.getParameter("txtTotal").toUpperCase()));
        v.setEstado("Pendiente");
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("caroc");
        if (ocDAO.insertarMovimiento(v, detalle)) {
            request.getSession().removeAttribute("proveedorOC");
            request.getSession().removeAttribute("caroc");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("proveedorOC");
            request.getSession().removeAttribute("caroc");
            response.getWriter().print("Nose realizo la venta");
        }
    }

    private void estadoanularoc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        oc.setIdmovimiento(id);
        oc.setEstado("Anulado");
        doc.setEstado("Anulado");
        if (ocDAO.Edit(oc)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El proveedor no");
        }
        ocDAO.editaranulardetalle(doc, id);
        idref = Integer.parseInt(request.getParameter("Txtidref"));
        oc.setEstado("Pendiente");
        ocDAO.editarEstadoref(oc, idref);

    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idMot"));
        System.out.println("[ID] " + id);
        ocDAO.EliminarDetalle(id);
        ocDAO.Eliminar(id);

    }

    private void Limpiaroc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("proveedorOC");
        request.getSession().removeAttribute("caroc");
        response.sendRedirect("InsertarOrdendeCompra.jsp");
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
