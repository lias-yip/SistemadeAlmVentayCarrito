
package com.pe.Interfaz;



import com.pe.model.entity.Transporte;
import java.util.List;


public interface CRUDMaterial {
    public List ListadoMaterial();
    public Transporte list(int id);
    public boolean add(Transporte mat);
    public boolean Edit(Transporte mat);
    public boolean Eliminar(int id);
}
