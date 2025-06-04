
package com.pe.Interfaz;


import com.pe.model.entity.Producto;
import java.util.List;


public interface CRUDProducto {
    
     public List ListadoProducto();
    public Producto list(int id);
    public boolean add(Producto prod);
    public boolean Edit(Producto prod);
    public boolean Eliminar(int id);
}
