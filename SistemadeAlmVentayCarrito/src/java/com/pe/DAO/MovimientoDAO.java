package com.pe.DAO;

import com.pe.conection.ConexionBD;
import com.pe.model.entity.DetalleMovimiento;
import com.pe.model.entity.Movimiento;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Angel Albinagorta
 */
public class MovimientoDAO {

    ConexionBD cn = new ConexionBD();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Movimiento v = new Movimiento();
    CallableStatement call = null;
    String mensaje = "";

    public boolean insertarMovimiento(Movimiento varventa, ArrayList<DetalleMovimiento> d) {
        boolean rpta = false;
        try {

            con = cn.getConnection();
            CallableStatement cl = con.prepareCall("{call sp_RegistrarMovimiento(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cl.registerOutParameter(1, Types.INTEGER);
            cl.setInt(2, varventa.getIdauxiliar());
            cl.setInt(3, varventa.getIdusuario());
            cl.setString(4, varventa.getTipocomprobante());
            cl.setString(5, varventa.getSerie());
            cl.setString(6, varventa.getCorrelativo());
            cl.setString(7, varventa.getFecha());
            cl.setString(8, varventa.getFechaentrega());
            cl.setInt(9, varventa.getIdreferencia());
            cl.setString(10, varventa.getReferencia());
            cl.setString(11, varventa.getTienda());
            cl.setString(12, varventa.getAlmacen());
            cl.setString(13, varventa.getCondicion());
            cl.setInt(14, varventa.getIdmotivo());
            cl.setInt(15, varventa.getIdtrans());
            cl.setInt(16, varventa.getIdvehi());
            cl.setInt(17, varventa.getIdcond());
            cl.setDouble(18, varventa.getSubtotal());
            cl.setDouble(19, varventa.getIgv());
            cl.setDouble(20, varventa.getTotal());
            cl.setString(21, varventa.getEstado());
            if (cl.executeUpdate() == 2) {
                rpta = true;
            }
            varventa.setIdauxiliar(cl.getInt(1));
            CallableStatement cl2 = con.prepareCall("{CALL newdetallemovimiento(?,?,?,?,?)}");
            for (DetalleMovimiento aux : d) {
                cl2.setInt(1, varventa.getIdauxiliar());
                cl2.setInt(2, aux.getIdproducto());
                cl2.setDouble(3, aux.getCantidad());
                cl2.setDouble(4, aux.getCosto());
                cl2.setDouble(5, aux.getSubtotal());
                if (cl2.executeUpdate() == 1) {
                    rpta = true;
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpta;
    }

    public boolean insertarMov(Movimiento varventa, ArrayList<DetalleMovimiento> d) {
        boolean rpta = false;
        try {

            con = cn.getConnection();
            CallableStatement cl = con.prepareCall("{call sp_RegistrarMovimiento(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
            cl.registerOutParameter(1, Types.INTEGER);
            cl.setInt(2, varventa.getIdauxiliar());
            cl.setInt(3, varventa.getIdusuario());
            cl.setString(4, varventa.getTipocomprobante());
            cl.setString(5, varventa.getSerie());
            cl.setString(6, varventa.getCorrelativo());
            cl.setString(7, varventa.getFecha());
            cl.setString(8, varventa.getFechaentrega());
            cl.setInt(9, varventa.getIdreferencia());
            cl.setString(10, varventa.getReferencia());
            cl.setString(11, varventa.getTienda());
            cl.setString(12, varventa.getAlmacen());
            cl.setString(13, varventa.getCondicion());
            cl.setInt(14, varventa.getIdmotivo());
            cl.setInt(15, varventa.getIdtrans());
            cl.setInt(16, varventa.getIdvehi());
            cl.setInt(17, varventa.getIdcond());
            cl.setDouble(18, varventa.getSubtotal());
            cl.setDouble(19, varventa.getIgv());
            cl.setDouble(20, varventa.getTotal());
            cl.setString(21, varventa.getEstado());
            if (cl.executeUpdate() == 2) {
                rpta = true;
            }
            varventa.setIdauxiliar(cl.getInt(1));
            CallableStatement cl1 = con.prepareCall("{CALL newdetallekardex(?,?,?,?,?)}");
            for (DetalleMovimiento aux : d) {
                cl1.setInt(1, varventa.getIdauxiliar());
                cl1.setInt(2, aux.getIdproducto());
                cl1.setDouble(3, aux.getCantidad());
                cl1.setDouble(4, aux.getCosto());
                cl1.setDouble(5, aux.getSaldo());
                if (cl1.executeUpdate() == 1) {
                    rpta = true;
                }
            }
            varventa.setIdauxiliar(cl.getInt(1));
            CallableStatement cl2 = con.prepareCall("{CALL newdetallemovimiento(?,?,?,?,?)}");
            for (DetalleMovimiento aux : d) {
                cl2.setInt(1, varventa.getIdauxiliar());
                cl2.setInt(2, aux.getIdproducto());
                cl2.setDouble(3, aux.getCantidad());
                cl2.setDouble(4, aux.getCosto());
                cl2.setDouble(5, aux.getSubtotal());
                if (cl2.executeUpdate() == 1) {
                    rpta = true;
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpta;
    }

    public boolean addinsersalida(Movimiento varventa, ArrayList<DetalleMovimiento> d) {
        boolean rpta = false;
        try {
            CallableStatement cl1 = con.prepareCall("{CALL newdetallekardex(?,?,?,?,?)}");
            for (DetalleMovimiento aux : d) {
                cl1.setInt(1, varventa.getIdauxiliar());
                cl1.setInt(2, aux.getIdproducto());
                cl1.setDouble(3, aux.getCosto());
                cl1.setDouble(4, aux.getCantidad());
                cl1.setDouble(5, aux.getSaldo());
                if (cl1.executeUpdate() == 1) {
                    rpta = true;
                }
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpta;
    }

    public static String CodigoMovimiento() {
        try {
            String sql = "select max(Idmovimiento)from Movimiento";
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString(1);

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public boolean editarEstado(Movimiento v, int id) {
        String sql = " update Movimiento set Estado='" + v.getEstado() + "' where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return false;

    }

    //Eliminar cliente uso en ControllerCliente
    public boolean Eliminar(int id) {
        String sql = "delete from Movimiento where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public static String estado(int cod) {

        try {
            String sql = "select Estado from Movimiento where Idmovimiento=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Estado");

            }
            return "--";

        } catch (Exception e) {
            return "--";
        }
    }

    public List ListadoDetalle() {
        ArrayList<DetalleMovimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM DetalleMovimiento WHERE Idmovimiento=(SELECT MAX(Idmovimiento) from Movimiento)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleMovimiento detalle_venta = new DetalleMovimiento();
                detalle_venta.setIddetalle(rs.getInt("Iddetalle"));
                detalle_venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                detalle_venta.setIdproducto(rs.getInt("Idproducto"));
                detalle_venta.setCantidad(rs.getInt("Cantidad"));
                list.add(detalle_venta);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List ticketDetalle(int id) {
        ArrayList<DetalleMovimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM DetalleMovimiento WHERE Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleMovimiento detalle = new DetalleMovimiento();
                detalle.setIddetalle(rs.getInt("Iddetalle"));
                detalle.setIdmovimiento(rs.getInt("Idmovimiento"));
                detalle.setIdproducto(rs.getInt("Idproducto"));
                detalle.setCantidad(rs.getDouble("Cantidad"));
                detalle.setCosto(rs.getDouble("Costo"));
                detalle.setSubtotal(rs.getDouble("Subtotal"));
                list.add(detalle);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public List Detallemovimientoporproducto(int id) {
        ArrayList<DetalleMovimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM kardex WHERE Idproducto=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetalleMovimiento detalle = new DetalleMovimiento();
                detalle.setIddetalle(rs.getInt("Iddetallekardex"));
                detalle.setIdmovimiento(rs.getInt("Idmovimiento"));
                detalle.setIdproducto(rs.getInt("Idproducto"));
                detalle.setCantidad(rs.getDouble("Ingreso"));
                detalle.setCosto(rs.getDouble("Salida"));
                detalle.setSubtotal(rs.getDouble("Saldo"));
                list.add(detalle);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public boolean editaranulardetalle(DetalleMovimiento v, int id) {
        String sql = " update DetalleMovimiento set Estado='" + v.getEstado() + "' where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return false;

    }

    public boolean editarestadodetalle_Movimiento(DetalleMovimiento v, int id) {
        String sql = " update DetalleMovimiento set Estado='" + v.getEstado() + "' where Idventa=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return false;

    }

    public List ListadoGuiaremisioncliente() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM Movimiento where Tipocomprobante='Guia de Remision'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    //listar Nota de ingreso
    public List ListadoNotaIngresoNI() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Nota de Ingreso') ORDER BY Correlativo DESC";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setIdmotivo(rs.getInt("Idmotivo"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    //listar Nota de Salida
    public List ListadoNotaSalidaNS() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Nota de Salida')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    //listar Orden de Compra
    public List ListadoBoleta() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Boleta de venta')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    //listar factura
    public List ListadoFactura() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Factura de venta')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    //listar factura
    public List ListadoCoti() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Cotizacion de venta')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    //listar pedido de venta
    public List ListadoPedido() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Pedido de venta')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    //listar Orden de Compra
    public List ListadoOrdendeCompra() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Orden de Compra')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List ListadoRequerimiento() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Requerimiento')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List Facturadecompra() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Factura de Compra')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List ListadoVenta() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM Movimiento";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List Mipedido(int id) {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM Movimiento WHERE Idusuario=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento detalle = new Movimiento();
                detalle.setIdmovimiento(rs.getInt("Idmovimiento"));
                detalle.setIdauxiliar(rs.getInt("Idauxiliar"));
                detalle.setIdusuario(rs.getInt("Idusuario"));
                detalle.setTipocomprobante(rs.getString("Tipocomprobante"));
                detalle.setSerie(rs.getString("Serie"));
                detalle.setCorrelativo(rs.getString("Correlativo"));
                detalle.setFecha(rs.getString("Fecha"));
                detalle.setFechaentrega(rs.getString("Fechaentrega"));
                detalle.setReferencia(rs.getString("Referencia"));
                detalle.setTienda(rs.getString("Tienda"));
                detalle.setAlmacen(rs.getString("Almacen"));
                detalle.setCondicion(rs.getString("Condicion"));
                detalle.setIdmotivo(rs.getInt("Idmotivo"));
                detalle.setIdtrans(rs.getInt("Idtrans"));
                detalle.setIdcond(rs.getInt("Idcond"));
                detalle.setIdvehi(rs.getInt("Idvehi"));
                detalle.setSubtotal(rs.getDouble("Subtotal"));
                detalle.setIgv(rs.getDouble("Igv"));
                detalle.setTotal(rs.getDouble("Total"));
                detalle.setEstado(rs.getString("Estado"));
                list.add(detalle);
            }

        } catch (Exception e) {

        }
        return list;
    }

    public Movimiento Reporte(int id) {
        String sql = "select *from Movimiento where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                v.setIdmovimiento(rs.getInt("Idmovimiento"));
                v.setIdauxiliar(rs.getInt("Idauxiliar"));
                v.setIdusuario(rs.getInt("Idusuario"));
                v.setTipocomprobante(rs.getString("Tipocomprobante"));
                v.setSerie(rs.getString("Serie"));
                v.setCorrelativo(rs.getString("Correlativo"));
                v.setFecha(rs.getString("Fecha"));
                v.setFechaentrega(rs.getString("Fechaentrega"));
                v.setReferencia(rs.getString("Referencia"));
                v.setTienda(rs.getString("Tienda"));
                v.setAlmacen(rs.getString("Almacen"));
                v.setCondicion(rs.getString("Condicion"));
                v.setIdmotivo(rs.getInt("Idmotivo"));
                v.setIdtrans(rs.getInt("Idtrans"));
                v.setIdcond(rs.getInt("Idcond"));
                v.setIdvehi(rs.getInt("Idvehi"));
                v.setSubtotal(rs.getDouble("Subtotal"));
                v.setIgv(rs.getDouble("Igv"));
                v.setTotal(rs.getDouble("Total"));
                v.setEstado(rs.getString("Estado"));

            }

        } catch (Exception e) {

        }
        return v;

    }

    public boolean EliminarDetalle(int id) {
        String sql = "delete from DetalleMovimiento where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Eliminarkardex(int id) {
        String sql = "delete from Kardex where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public int BuscarNguiaremisongrc() {
        String sSQL = "SELECT COUNT(*) as Nguia FROM Movimiento WHERE tipocomprobante ='Guia de Remision'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nfactura = rs.getInt("Nguia");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public int BuscarNBoleta() {
        String sql = "SELECT COUNT(*) as Nboleta FROM Movimiento WHERE Tipocomprobante ='Boleta'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Nfactura = rs.getInt("Nboleta");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public int BuscarNnotaingresomp() {
        String sSQL = "SELECT COUNT(*) as Nnotaingresomp FROM Movimiento WHERE Tipocomprobante ='Nota de Ingreso'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nfactura = rs.getInt("Nnotaingresomp");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public int BuscarNnotasalidamp() {
        String sSQL = "SELECT COUNT(*) as Nnotasalidamp FROM Movimiento WHERE Tipocomprobante ='Nota de Salida'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nfactura = rs.getInt("Nnotasalidamp");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public int usu(String usu, String pass) {
        String sql = "SELECT id FROM usuario WHERE usu ='" + usu + "' AND password='" + pass + "'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Nfactura = rs.getInt("id");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public Movimiento getVenta(int id) {
        Movimiento com = null;
        try {
            ResultSet res;
            PreparedStatement stmt = this.con.prepareStatement("call getVentas(?)");
            stmt.setInt(1, id);
            res = stmt.executeQuery();
            while (res.next()) {
                com = new Movimiento();
                com.setIdmovimiento(rs.getInt("Idmovimiento"));
                com.setIdauxiliar(rs.getInt("Idauxiliar"));
                com.setIdusuario(rs.getInt("Idusuario"));
                com.setTipocomprobante(rs.getString("Tipocomprobante"));
                com.setSerie(rs.getString("Serie"));
                com.setCorrelativo(rs.getString("Correlativo"));
                com.setFecha(rs.getString("Fecha"));
                com.setFechaentrega(rs.getString("Fechaentrega"));
                com.setReferencia(rs.getString("Referencia"));
                com.setTienda(rs.getString("Tienda"));
                com.setAlmacen(rs.getString("Almacen"));
                com.setCondicion(rs.getString("Condicion"));
                com.setSubtotal(rs.getDouble("Subtotal"));
                com.setIgv(rs.getDouble("Igv"));
                com.setTotal(rs.getDouble("Total"));
            }
            res.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return com;
    }

    //listar Orden de Compra
    public List ListadoCostoPT() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('COSTO PRODUCCION')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setIddocref(rs.getInt("Idreferencia"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setIdmotivo(rs.getInt("Idmotivo"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String NumserieOC() {
        String sql = "{call sp_generar_codigoordendecompra()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumserieFactura() {
        String sql = "{call sp_generar_codigofacturaventa()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumserieBoleta() {
        String sql = "{call sp_generar_codigoboletaventa()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumserieCoti() {
        String sql = "{call sp_generar_codigocotizacionventa()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumseriePedi() {
        String sql = "{call sp_generar_codigopedidoventa()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumserieNI() {
        String sql = "{call sp_generar_codigonotadeingreso()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumserieNS() {
        String sql = "{call sp_generar_codigonotadesalida()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String NumserieGRC() {
        String sql = "{call sp_generar_codigoguiaremisoncli()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public String Numseriecostopt() {
        String sql = "{call sp_generar_codigocostoPT()}";

        try {
            con = cn.getConnection();
            call = con.prepareCall(sql);
            rs = call.executeQuery();

            if (rs.next()) {
                mensaje = rs.getString(1);

            }
        } catch (SQLException e) {
        }
        return mensaje;
    }

    public boolean editarEstadoref(Movimiento m, int id) {
        String sql = " update Movimiento set Estado='" + m.getEstado() + "' where Idmovimiento=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return false;
    }

    public boolean Edit(Movimiento cat) {
        boolean flag = false;
        String sql = "update Movimiento set Estado='" + cat.getEstado() + "'where Idmovimiento=" + cat.getIdmovimiento();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    //Reportes Compra Factura de compra y Orden de compra
    public List Reportedecompra() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM Movimiento WHERE Tipocomprobante IN ('Orden de Compra', 'FACTURA DE COMPRA')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setIdmotivo(rs.getInt("Idmotivo"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    //Reportes Documentos de compra
    public List Reportedeingreso() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM Movimiento WHERE Tipocomprobante ='Nota de Ingreso'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setIdmotivo(rs.getInt("Idmotivo"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public List Reportedesalida() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "SELECT * FROM Movimiento WHERE Tipocomprobante IN ('NOTA DE SALIDA', 'GUIA DE REMISION')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setIdmotivo(rs.getInt("Idmotivo"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }
    //listar Nota de ingreso INGRESO POR PRODUCCION

    public List ListadoNotaIngresoNIIP() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Nota de Ingreso') and Idmotivo='3'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setIdmotivo(rs.getInt("Idmotivo"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }
    //listar Nota de ingreso INGRESO POR COMPRA

    public List ListadoNotaIngresoNIIC() {
        ArrayList<Movimiento> list = new ArrayList<>();
        String sql = "Select * from Movimiento where Tipocomprobante in ('Nota de Ingreso') and Idmotivo='4'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movimiento venta = new Movimiento();
                venta.setIdmovimiento(rs.getInt("Idmovimiento"));
                venta.setIdauxiliar(rs.getInt("Idauxiliar"));
                venta.setIdusuario(rs.getInt("Idusuario"));
                venta.setTipocomprobante(rs.getString("Tipocomprobante"));
                venta.setSerie(rs.getString("Serie"));
                venta.setCorrelativo(rs.getString("Correlativo"));
                venta.setFecha(rs.getString("Fecha"));
                venta.setFechaentrega(rs.getString("Fechaentrega"));
                venta.setReferencia(rs.getString("Referencia"));
                venta.setTienda(rs.getString("Tienda"));
                venta.setAlmacen(rs.getString("Almacen"));
                venta.setCondicion(rs.getString("Condicion"));
                venta.setSubtotal(rs.getDouble("Subtotal"));
                venta.setIgv(rs.getDouble("Igv"));
                venta.setTotal(rs.getDouble("Total"));
                venta.setEstado(rs.getString("Estado"));
                list.add(venta);
            }
        } catch (Exception e) {

        }
        return list;
    }

    public static String getNombredocumento(int cod) {
        try {
            String sql = "select Tipocomprobante from Movimiento where Idmovimiento=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Tipocomprobante");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

    public static String getfechadocumento(int cod) {
        try {
            String sql = "select Fecha from Movimiento where Idmovimiento=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Fecha");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

    public static String getseriedocumento(int cod) {
        try {
            String sql = "select Serie from Movimiento where Idmovimiento=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Serie");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

    public static String getcorrelativodocumento(int cod) {
        try {
            String sql = "select Correlativo from Movimiento where Idmovimiento=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Correlativo");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }
}
