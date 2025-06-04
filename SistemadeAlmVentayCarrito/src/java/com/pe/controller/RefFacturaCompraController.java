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
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yenny
 */
public class RefFacturaCompraController extends HttpServlet {

    MovimientoDAO fcdao = new MovimientoDAO();
    int id;
    int idref;
    MovimientoDAO fcDAO;
    String NotaSalida = "AlmacenInsertarNotasalida.jsp";
    // venta
    String fccomprobante;
    String numfccomprobante;
    // detalle _detalle
    // detalle _detalle
    int Nfc;
    Movimiento fc = new Movimiento();
    DetalleMovimiento dfc = new DetalleMovimiento();
    DecimalFormat formateadorreffc;

    public RefFacturaCompraController() {
        fcDAO = new MovimientoDAO();
        formateadorreffc = new DecimalFormat("00000000");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("procesarCarritoreffc")) {
            this.procesarCarritoreffc(request, response);
        }
        if (accion.equalsIgnoreCase("refFc")) {
            Detallereffc(request, response);
        }
        if (accion.equalsIgnoreCase("reffcActualizarcantidad")) {
            reffcActualizarcantidad(request, response);
        }
        if (accion.equals("actualizarcostofc")) {
            this.actualizarcostofc(request, response);
        }
        if (accion.equals("AnadirCarritoreffc")) {
            this.anadirProductoreffc(request, response);
        }
        if (accion.equals("RegistrarrefFacturadecompra")) {
            this.RegistrarrefFacturadecompra(request, response);
        }
         if (accion.equals("Eliminar")) {
            this.Eliminar(request, response);
        }
        if (accion.equals("Anular")) {
            this.Anular(request, response);
        }
    }

    private void procesarCarritoreffc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> movi;//
        if (sesion.getAttribute("FacturaCompra") == null) {
            movi = new ArrayList<DetalleMovimiento>();

        } else {
            movi = (ArrayList<DetalleMovimiento>) sesion.getAttribute("FacturaCompra");
        }

        if (movi.size() > 0) {
            double subtotal = 0;
            for (int i = 0; i < movi.size(); i++) {

                DetalleMovimiento det = movi.get(i);
                // subtotal+= det.subtotal();
            }
            //Compra
            //insert into compra values(numero_serie , idProveedor , idTRabjador , fecha , impuesto , subtotal , (subtotal + (subtotal * impuesto)));
            //Detalle
            for (int i = 0; i < movi.size(); i++) {

                DetalleMovimiento det = movi.get(i);
                // insert into detallecompra values(null , det.getProducto.getIdproducto() , numero_serie ,det.getCantidad(),det.getPrecioCompra , det.getPrecioVenta );
            }
        } else {
            //Validar si esta vacio
        }

        sesion.setAttribute("movi", movi);
        response.sendRedirect("RefInsertarFacturaCompra.jsp");

    }

    private void anadirProductoreffc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> carrito;//
        if (sesion.getAttribute("FacturaCompra") == null) {
            carrito = new ArrayList<DetalleMovimiento>();

        } else {
            carrito = (ArrayList<DetalleMovimiento>) sesion.getAttribute("FacturaCompra");
        }
        String[] selecionar = request.getParameterValues("accion");

        Producto p = ProductoDAO.obtenerProducto(Integer.parseInt(request.getParameter("Id")));
        DetalleMovimiento d = new DetalleMovimiento();
        d.setIdproducto(Integer.parseInt(request.getParameter("Id")));
        d.setProducto(p);

        boolean indice = false;
        for (int i = 0; i < carrito.size(); i++) {

            DetalleMovimiento det = carrito.get(i);

            if (det.getIdproducto() == p.getIdproducto()) {
                indice = true;
                break;
            }

        }
        if (!indice) {
            carrito.add(d);
        }
        sesion.setAttribute("FacturaCompra", carrito);
        request.getRequestDispatcher("RefInsertarFacturaCompra.jsp").forward(
                request, response);
    }

    protected void reffcActualizarcantidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "RefInsertarFacturaCompra.jsp";
        MovimientoDAO pdao = new MovimientoDAO();
        List<DetalleMovimiento> listS = ObtenerSesion(request);
        //PROCEDIMIENTO ACTUALIZAR
        int cantidad = Integer.parseInt(request.getParameter("cantreffc"));
        int fila = Integer.parseInt(request.getParameter("idproductoreffc"));
        DetalleMovimiento det = listS.get(fila);
        det.setCantidad(cantidad);
        listS.set(fila, det);
        //FIN
        GuardarSesion(request, listS);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    private void actualizarcostofc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        ArrayList<DetalleMovimiento> caroc;//
        if (sesion.getAttribute("FacturaCompra") == null) {
            caroc = new ArrayList<DetalleMovimiento>();
        } else {
            caroc = (ArrayList<DetalleMovimiento>) sesion.getAttribute("FacturaCompra");
        }
        Double Costo = Double.parseDouble(request.getParameter("costofc"));
        int fila = Integer.parseInt(request.getParameter("idproductofc"));
        DetalleMovimiento det = caroc.get(fila);
        det.setCosto(Costo);
        caroc.set(fila, det);
        sesion.setAttribute("FacturaCompra", caroc);
        response.sendRedirect("RefInsertarFacturaCompra.jsp");

    }

    protected void Detallereffc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id;
        if (request.getParameter("id") == null) {
            id = Integer.parseInt(request.getSession().getAttribute("FactComp").toString());
        } else {
            id = Integer.parseInt(request.getParameter("id"));
        }
        String acceso = "RefInsertarFacturaCompra.jsp";
        MovimientoDAO pdao = new MovimientoDAO();
        List<DetalleMovimiento> listS = pdao.ticketDetalle(id);
        GuardarSesion(request, listS);
        request.getSession().setAttribute("FactComp", id);
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    public ArrayList<DetalleMovimiento> ObtenerSesion(HttpServletRequest request) {
        ArrayList<DetalleMovimiento> lista;
        if (request.getSession().getAttribute("FacturaCompra") == null) {
            lista = new ArrayList<>();
        } else {
            lista = (ArrayList<DetalleMovimiento>) request.getSession().getAttribute("FacturaCompra");
        }
        return lista;
    }

    public void GuardarSesion(HttpServletRequest request, List<DetalleMovimiento> lista) {
        request.getSession().setAttribute("FacturaCompra", lista);
    }

    private void RegistrarrefFacturadecompra(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Movimiento v = new Movimiento();
        v.setIdauxiliar(Integer.parseInt(request.getParameter("txtIdcli").toUpperCase()));
        v.setIdusuario(1);
        v.setTipocomprobante(request.getParameter("txtTipodoc").toUpperCase());
        v.setIdreferencia(Integer.parseInt(request.getParameter("idmov").toUpperCase()));
        v.setReferencia(request.getParameter("txtReferencia").toUpperCase());
        v.setFechaentrega("");
        v.setSerie(request.getParameter("txtSerie").toUpperCase());
        v.setCorrelativo(request.getParameter("txtCorrelativo").toUpperCase());
        v.setFecha(request.getParameter("txtfecha").toUpperCase());
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
        ArrayList<DetalleMovimiento> detalle = ObtenerSesion(request);
        if (fcDAO.insertarMovimiento(v, detalle)) {
            response.getWriter().print("oki");
        } else {
            response.getWriter().print("Nose realizo la venta");

        }
        id = Integer.parseInt(request.getParameter("idmov"));
        v.setEstado("Terminado");
        fcDAO.editarEstadoref(v, id);
    }

    private void Anular(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("txtid"));
        fc.setIdmovimiento(id);
        fc.setEstado("Anulado");
        dfc.setEstado("Anulado");
        if (fcDAO.Edit(fc)) {
            response.getWriter().print("ok");
        } else {
            response.getWriter().print("no se anulo error");
        }
        fcDAO.editaranulardetalle(dfc, id);
        idref = Integer.parseInt(request.getParameter("Txtidref"));
        fc.setEstado("Pendiente");
        fcDAO.editarEstadoref(fc, idref);

    }

    private void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        id = Integer.parseInt(request.getParameter("idFc"));
        System.out.println("[ID] " + id);
        fcDAO.EliminarDetalle(id);
        fcDAO.Eliminar(id);

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
