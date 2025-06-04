
package com.pe.Interfaz;



import com.pe.model.entity.Clasificacion;
import java.util.List;


public interface CRUDMarca {
    public List ListadoMarca();
    public Clasificacion list(int id);
    public boolean add(Clasificacion  mar);
    public boolean Edit(Clasificacion  mar);
    public boolean Eliminar(int id);
}
