/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
public class NotadeIngresoController extends HttpServlet {

    MovimientoDAO nidao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO niDAO;
    // venta
    String nicomprobante;
    String numnicomprobante;
    // detalle _detalle
    int Nni;
    DecimalFormat formateadorni;
    Movimiento ni = new Movimiento();
    DetalleMovimiento dni = new DetalleMovimiento();

    public NotadeIngresoController() {
        niDAO = new MovimientoDAO();
        formateadorni = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritoni")) {
            this.procesarCarritoni(request, response);
        }
        if (accion.equals("AnadirCarritoni")) {
            this.anadirCarritoni(request, response);
        }
        if (accion.equals("actualizarcantidadni")) {
            this.actualizarcantidadni(request, response);
        }
        if (accion.equals("Registrarnotadeingreso")) {
            this.Registrarnotadeingreso(request, response);
        }
        if (accion.equals("Eliminar")) {
            this.Eliminar(request, response);
        }
        if (accion.equals("Anular")) {
            this.Anular(request, response);
        }
        if (accion.equals("Limpiarni")) {
            this.Limpiarni(request, response);
        }
    }

    private void procesarCarritoni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carni;//
        if (sesion.getAttribute("carni") == null) {
            carni = new ArrayList<DetalleMovimiento>();

        } else {
            carni = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carni");
        }
        if (carni.size() > 0) {
            for (int i = 0; i < carni.size(); i++) {

                DetalleMovimiento det = carni.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < carni.size(); i++) {

                DetalleMovimiento det = carni.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("carni", carni);
        response.sendRedirect("InsertarNotadeIngreso.jsp");
    }

    private void anadirCarritoni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> carni;//
        if (sesion.getAttribute("carni") == null) {
            carni = new ArrayList<DetalleMovimiento>();
        } else {
            carni = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carni");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("txtPro_id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("txtPro_id")));
        d.setProducto(p);
        d.setCantidad(Double.parseDouble(request.getParameter("txtPro_cantidad")));
        double SaldoS = p.getStock() + d.getCantidad();
        d.setSaldo(SaldoS);
        boolean indice = false;
        for (int i = 0; i < carni.size(); i++) {
            DetalleMovimiento det = carni.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            carni.add(d);
        }
        sesion.setAttribute("carni", carni);
        response.sendRedirect("InsertarNotadeIngreso.jsp");
    }

    private void actualizarcantidadni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carni;//
        if (sesion.getAttribute("carni") == null) {
            carni = new ArrayList<DetalleMovimiento>();
        } else {
            carni = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carni");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantni"));
        int fila = Integer.parseInt(request.getParameter("idproductoni"));
        DetalleMovimiento det = carni.get(fila);
        det.setCantidad(cantidad);
        double SaldoS = det.getProducto().getStock() + det.getCantidad();
        det.setSaldo(SaldoS);
        carni.set(fila, det);
        sesion.setAttribute("carni", carni);
        response.sendRedirect("InsertarNotadeIngreso.jsp");
    }

    private void Registrarnotadeingreso(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("NI01");
        int Nnipt = niDAO.BuscarNnotaingresomp();
        Nnipt = Nnipt + 1;
        String format = formateadorni.format(Nnipt);
        v.setCorrelativo(format);
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
        v.setFechaentrega("");
        v.setReferencia("");
        v.setTienda(request.getParameter("txtTienda").toUpperCase());
        v.setAlmacen(request.getParameter("txtAlmacen").toUpperCase());
        v.setCondicion(request.getParameter("txtCondicion").toUpperCase());
        v.setIdmotivo(Integer.parseInt(request.getParameter("txtMotivo").toUpperCase()));
        v.setIdtrans(1);
        v.setIdvehi(1);
        v.setIdcond(1);
        v.setSubtotal(0.00);
        v.setIgv(0.00);
        v.setTotal(0.00);
        v.setEstado("Pendiente");
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carni");
        if (niDAO.insertarMov(v, detalle)) {
            request.getSession().removeAttribute("proveedorNI");
            request.getSession().removeAttribute("carni");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("proveedorNI");
            request.getSession().removeAttribute("carni");
            response.getWriter().print("Nose realizo la venta");

        }
    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idni"));
        System.out.println("[ID] " + id);
        niDAO.Eliminarkardex(id);
        niDAO.EliminarDetalle(id);
        niDAO.Eliminar(id);

    }

    private void Anular(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        ni.setIdmovimiento(id);
        ni.setEstado("Anulado");
        dni.setEstado("Anulado");
        if (niDAO.Edit(ni)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("Error");
        }
        niDAO.editaranulardetalle(dni, id);
        idref = Integer.parseInt(request.getParameter("Txtidref"));
        ni.setEstado("Pendiente");
        niDAO.editarEstadoref(ni, idref);
        niDAO.Eliminarkardex(id);

    }

    private void Limpiarni(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("proveedorNI");
        request.getSession().removeAttribute("carni");
        response.sendRedirect("InsertarNotadeIngreso.jsp");
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
