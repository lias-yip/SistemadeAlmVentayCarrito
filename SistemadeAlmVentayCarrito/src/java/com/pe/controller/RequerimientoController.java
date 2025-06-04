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

public class RequerimientoController extends HttpServlet {

    MovimientoDAO grmdao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO grmDAO;
    // venta
    String grmcomprobante;
    String numgrmcomprobante;
    // detalle _detalle
    int Ngrm;
    DecimalFormat formateadorgrm;
    Movimiento grm = new Movimiento();
    DetalleMovimiento dgrm = new DetalleMovimiento();

    public RequerimientoController() {
        grmDAO = new MovimientoDAO();
        formateadorgrm = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("procesarCarritoreq")) {
            this.procesarCarritoreq(request, response);
        }
        if (accion.equals("AnadirCarritoreq")) {
            this.anadirCarritoreq(request, response);
        }
        if (accion.equals("actualizarcantidadreq")) {
            this.actualizarcantidadreq(request, response);
        }
        if (accion.equals("RegistrarRequerimiento")) {
            this.RegistrarRequerimiento(request, response);
        }
        if (accion.equals("estadoanularreq")) {
            this.estadoanularreq(request, response);
        }
        if (accion.equals("Eliminar")) {
            this.Eliminar(request, response);
        }
        if (accion.equals("Limpiarreq")) {
            this.Limpiarreq(request, response);
        }
    }

    private void procesarCarritoreq(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carreq;//
        if (sesion.getAttribute("carreq") == null) {
            carreq = new ArrayList<DetalleMovimiento>();
        } else {
            carreq = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carreq");
        }
        if (carreq.size() > 0) {
            for (int i = 0; i < carreq.size(); i++) {

                DetalleMovimiento det = carreq.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < carreq.size(); i++) {
                DetalleMovimiento det = carreq.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("carreq", carreq);
        response.sendRedirect("InsertarRequerimiento.jsp");
    }

    private void anadirCarritoreq(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> carreq;//
        if (sesion.getAttribute("carreq") == null) {
            carreq = new ArrayList<DetalleMovimiento>();
        } else {
            carreq = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carreq");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("txtPro_id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("txtPro_id")));
        d.setProducto(p);
        d.setCantidad(Double.parseDouble(request.getParameter("txtPro_cantidad")));
        boolean indice = false;
        for (int i = 0; i < carreq.size(); i++) {
            DetalleMovimiento det = carreq.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            carreq.add(d);
        }
        sesion.setAttribute("carreq", carreq);
        response.sendRedirect("InsertarRequerimiento.jsp");
    }

    private void actualizarcantidadreq(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carreq;//
        if (sesion.getAttribute("carreq") == null) {
            carreq = new ArrayList<DetalleMovimiento>();
        } else {
            carreq = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carreq");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantreq"));
        int fila = Integer.parseInt(request.getParameter("idproductoreq"));
        DetalleMovimiento det = carreq.get(fila);
        det.setCantidad(cantidad);
        carreq.set(fila, det);
        sesion.setAttribute("carreq", carreq);
        response.sendRedirect("InsertarRequerimiento.jsp");
    }

    private void RegistrarRequerimiento(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie(request.getParameter("txtSerie").toUpperCase());
        v.setCorrelativo(request.getParameter("txtCorrelativo").toUpperCase());
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen(request.getParameter("txtAlmacen").toUpperCase());
        v.setCondicion(request.getParameter("txtCondicion").toUpperCase());
        v.setIdmotivo(4);
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(0.00);
        v.setIgv(0.00);
        v.setTotal(0.00);
        v.setEstado("Pendiente");
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carreq");
        if (grmDAO.insertarMovimiento(v, detalle)) {
            request.getSession().removeAttribute("proveedorREQ");
            request.getSession().removeAttribute("carreq");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("proveedorREQ");
            request.getSession().removeAttribute("carreq");
            response.getWriter().print("Nose realizo la venta");
        }
    }

    private void estadoanularreq(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        grm.setIdmovimiento(id);
        grm.setEstado("Anulado");
        dgrm.setEstado("Anulado");
        if (grmDAO.Edit(grm)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("El proveedor no");
        }
        grmDAO.editaranulardetalle(dgrm, id);
        idref = Integer.parseInt(request.getParameter("Txtidref"));
        grm.setEstado("Pendiente");
        grmDAO.editarEstadoref(grm, idref);

    }
        private void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idgrm"));
        System.out.println("[ID] " + id);
        grmDAO.EliminarDetalle(id);
        grmDAO.Eliminar(id);

    }

    private void Limpiarreq(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("proveedorREQ");
        request.getSession().removeAttribute("carreq");
        response.sendRedirect("InsertarRequerimiento.jsp");
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
