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
public class BoletaventaController extends HttpServlet {

    MovimientoDAO fbdao = new MovimientoDAO();
    int id;
    MovimientoDAO fbDAO;
    // venta
    String bocomprobante;
    String numfbcomprobante;
    // detalle _detalle
    int Nof;
    DecimalFormat formateadorfb;
    Movimiento fb = new Movimiento();
    DetalleMovimiento dfb = new DetalleMovimiento();

    public BoletaventaController() {
        fbDAO = new MovimientoDAO();
        formateadorfb = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritobo")) {
            this.procesarCarritobo(request, response);
        }
        if (accion.equals("AnadirCarritobo")) {
            this.anadirCarritobo(request, response);
        }
        if (accion.equals("actualizarcantidadbo")) {
            this.actualizarcantidadbo(request, response);
        }
        if (accion.equals("actualizarpreciobo")) {
            this.actualizarpreciobo(request, response);
        }
        if (accion.equals("Registrarboleta")) {
            this.Registrarboleta(request, response);
        }
        if (accion.equals("estadoanularbo")) {
            this.estadoanularbo(request, response);
        }
        if (accion.equals("Eliminar")) {
            this.Eliminar(request, response);
        }
        if (accion.equals("Limpiarbo")) {
            this.Limpiarbo(request, response);
        }
    }

    private void procesarCarritobo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carbo;//
        if (sesion.getAttribute("carbo") == null) {
            carbo = new ArrayList<DetalleMovimiento>();

        } else {
            carbo = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carbo");
        }
        if (carbo.size() > 0) {
            for (int i = 0; i < carbo.size(); i++) {

                DetalleMovimiento det = carbo.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < carbo.size(); i++) {

                DetalleMovimiento det = carbo.get(i);
                // insert into DetalleMovimiento values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }
        sesion.setAttribute("carbo", carbo);
        response.sendRedirect("InsertarBoletaventa.jsp");
    }

    private void anadirCarritobo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double subtotal;
        HttpSession sesion = request.getSession();//
        ArrayList<DetalleMovimiento> carbo;//
        if (sesion.getAttribute("carbo") == null) {
            carbo = new ArrayList<DetalleMovimiento>();
        } else {
            carbo = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carbo");
        }
        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("txtPro_id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("txtPro_id")));
        d.setProducto(p);
        d.setCantidad(Double.parseDouble(request.getParameter("txtPro_cantidad")));
        double SaldoS = p.getStock() - d.getCantidad();
        d.setSaldo(SaldoS);
        d.setCosto(Double.parseDouble(request.getParameter("txtPro_precio")));
        double subTotal = d.getCosto() * d.getCantidad();
        d.setSubtotal(subTotal);
        boolean indice = false;
        for (int i = 0; i < carbo.size(); i++) {
            DetalleMovimiento det = carbo.get(i);
            if (det.getIdproducto() == p.getIdproducto()) {
                // det.setCantidad(det.getCantidad()+ d.getCantidad());//auto incrementar cantidad
                // det.setDet_com_descuento(d.getDet_com_descuento()*det.getDet_com_cantidad());
                indice = true;
                break;
            }
        }
        if (!indice) {
            carbo.add(d);
        }
        sesion.setAttribute("carbo", carbo);
        response.sendRedirect("InsertarBoletaventa.jsp");
    }

    private void actualizarcantidadbo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carbo;//
        if (sesion.getAttribute("carbo") == null) {
            carbo = new ArrayList<DetalleMovimiento>();
        } else {
            carbo = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carbo");
        }
        Double cantidad = Double.parseDouble(request.getParameter("cantbo"));
        int fila = Integer.parseInt(request.getParameter("idproductobo"));
        DetalleMovimiento det = carbo.get(fila);
        det.setCantidad(cantidad);
        double SaldoS = det.getProducto().getStock() - det.getCantidad();
        det.setSaldo(SaldoS);
        carbo.set(fila, det);
        sesion.setAttribute("carbo", carbo);
        response.sendRedirect("InsertarBoletaventa.jsp");
    }
    private void actualizarpreciobo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carfb;//
        if (sesion.getAttribute("carbo") == null) {
            carfb = new ArrayList<DetalleMovimiento>();
        } else {
            carfb = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carbo");
        }
        Double Costo = Double.parseDouble(request.getParameter("costbo"));
        int fila = Integer.parseInt(request.getParameter("idproductobo"));
        DetalleMovimiento det = carfb.get(fila);
        det.setCosto(Costo);
        double subTotal = det.getCosto() * det.getCantidad();
        det.setSubtotal(subTotal);
        carfb.set(fila, det);
        sesion.setAttribute("carbo", carfb);
        response.sendRedirect("InsertarBoletaventa.jsp");
    }
    private void Registrarboleta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setSerie("B001");
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
        v.setEstado("Terminado");
        ArrayList<DetalleMovimiento> detalle = (ArrayList<DetalleMovimiento>) sesion.getAttribute("carbo");
        if (fbDAO.insertarMovimiento(v, detalle) && fbDAO.addinsersalida(v, detalle)) {
            request.getSession().removeAttribute("clienteBO");
            request.getSession().removeAttribute("carbo");
            response.getWriter().print("oki");
        } else {
            request.getSession().removeAttribute("clienteBO");
            request.getSession().removeAttribute("carbo");
            response.getWriter().print("Nose realizo la venta");

        }
    }

    private void estadoanularbo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("id"));
        String estado = MovimientoDAO.estado(id);
        if (estado.equalsIgnoreCase("Terminado")) {

            fb.setEstado("Anulado");
            dfb.setEstado("Anulado");
        } else {
            fb.setEstado("Anulado");
            dfb.setEstado("Anulado");
        }

        fbDAO.editarEstado(fb, id);
        fbDAO.editaranulardetalle(dfb, id);
        fbDAO.Eliminarkardex(id);

    }
    private void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idBo"));
        System.out.println("[ID] " + id);
        fbDAO.EliminarDetalle(id);
        fbDAO.Eliminar(id);

    }
    private void Limpiarbo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("clienteBO");
        request.getSession().removeAttribute("carbo");
        response.sendRedirect("InsertarBoletaventa.jsp");
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
