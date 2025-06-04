package com.pe.model.entity;

public class Producto {

    private int Idproducto;
    private String Codigo;
    private String Descripcion;
    private int Idcategoria;
    private int Idclasi;
    private int Iduventa;
    private String Moneda;
    private String Codigoanexo;
    private double Preciocompra;
    private double PrecioVenta;
    private String fechaRegistro;
    private String obser;
    private double stock;
    private double stockminimo;
    private double stockmaximo;
    private String Estado;
    private String Filename1;
    private String Path1;
    private String Filename2;
    private String Path2;
    private String Filename3;
    private String Path3;
    private String Filename4;
    private String Path4;
    private String Filename5;
    private String Path5;
    private String Filename6;
    private String Path6;
    private Auxiliar auxiliar;

    public Producto() {
    }

    public Producto(int Idproducto) {
        this.Idproducto = Idproducto;
    }

    public Producto(int Idproducto, String Codigo, String Descripcion, int Idcategoria, int Idclasi, int Iduventa, String Moneda, String Codigoanexo, double Preciocompra, double PrecioVenta, String fechaRegistro, String obser, double stock, double stockminimo, double stockmaximo, String Estado) {
        this.Idproducto = Idproducto;
        this.Codigo = Codigo;
        this.Descripcion = Descripcion;
        this.Idcategoria = Idcategoria;
        this.Idclasi = Idclasi;
        this.Iduventa = Iduventa;
        this.Moneda = Moneda;
        this.Codigoanexo = Codigoanexo;
        this.Preciocompra = Preciocompra;
        this.PrecioVenta = PrecioVenta;
        this.fechaRegistro = fechaRegistro;
        this.obser = obser;
        this.stock = stock;
        this.stockminimo = stockminimo;
        this.stockmaximo = stockmaximo;
        this.Estado = Estado;
    }

    public Producto(int Idproducto, String Codigo, String Descripcion, int Idcategoria, int Idclasi, int Iduventa,String Moneda, String Codigoanexo, double Preciocompra, double PrecioVenta, String fechaRegistro, String obser, double stock, double stockminimo, double stockmaximo, String Estado, String Filename1, String Filename2, String Filename3, String Filename4, String Filename5, String Filename6) {
        this.Idproducto = Idproducto;
        this.Codigo = Codigo;
        this.Descripcion = Descripcion;
        this.Idcategoria = Idcategoria;
        this.Idclasi = Idclasi;
        this.Iduventa = Iduventa;
        this.Moneda = Moneda;
        this.Codigoanexo = Codigoanexo;
        this.Preciocompra = Preciocompra;
        this.PrecioVenta = PrecioVenta;
        this.fechaRegistro = fechaRegistro;
        this.obser = obser;
        this.stock = stock;
        this.stockminimo = stockminimo;
        this.stockmaximo = stockmaximo;
        this.Estado = Estado;
        this.Filename1 = Filename1;
        this.Filename2 = Filename2;
        this.Filename3 = Filename3;
        this.Filename4 = Filename4;
        this.Filename5 = Filename5;
        this.Filename6 = Filename6;
    }

    public double getStock() {
        return stock;
    }

    public void setStock(double stock) {
        this.stock = stock;
    }

    public double getStockminimo() {
        return stockminimo;
    }

    public String getFilename1() {
        return Filename1;
    }

    public void setFilename1(String Filename1) {
        this.Filename1 = Filename1;
    }

    public String getPath1() {
        return Path1;
    }

    public void setPath1(String Path1) {
        this.Path1 = Path1;
    }

    public String getFilename2() {
        return Filename2;
    }

    public void setFilename2(String Filename2) {
        this.Filename2 = Filename2;
    }

    public String getPath2() {
        return Path2;
    }

    public void setPath2(String Path2) {
        this.Path2 = Path2;
    }

    public String getFilename3() {
        return Filename3;
    }

    public void setFilename3(String Filename3) {
        this.Filename3 = Filename3;
    }

    public String getPath3() {
        return Path3;
    }

    public void setPath3(String Path3) {
        this.Path3 = Path3;
    }

    public String getFilename4() {
        return Filename4;
    }

    public void setFilename4(String Filename4) {
        this.Filename4 = Filename4;
    }

    public String getPath4() {
        return Path4;
    }

    public void setPath4(String Path4) {
        this.Path4 = Path4;
    }

    public String getFilename5() {
        return Filename5;
    }

    public void setFilename5(String Filename5) {
        this.Filename5 = Filename5;
    }

    public String getPath5() {
        return Path5;
    }

    public void setPath5(String Path5) {
        this.Path5 = Path5;
    }

    public String getFilename6() {
        return Filename6;
    }

    public void setFilename6(String Filename6) {
        this.Filename6 = Filename6;
    }

    public String getPath6() {
        return Path6;
    }

    public void setPath6(String Path6) {
        this.Path6 = Path6;
    }

    public void setStockminimo(double stockminimo) {
        this.stockminimo = stockminimo;
    }

    public double getStockmaximo() {
        return stockmaximo;
    }

    public void setStockmaximo(double stockmaximo) {
        this.stockmaximo = stockmaximo;
    }

    public int getIdproducto() {
        return Idproducto;
    }

    public String getMoneda() {
        return Moneda;
    }

    public void setMoneda(String Moneda) {
        this.Moneda = Moneda;
    }

    public String getCodigoanexo() {
        return Codigoanexo;
    }

    public void setCodigoanexo(String Codigoanexo) {
        this.Codigoanexo = Codigoanexo;
    }

    public void setIdproducto(int Idproducto) {
        this.Idproducto = Idproducto;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getIdcategoria() {
        return Idcategoria;
    }

    public void setIdcategoria(int Idcategoria) {
        this.Idcategoria = Idcategoria;
    }

    public int getIdclasi() {
        return Idclasi;
    }

    public void setIdclasi(int Idclasi) {
        this.Idclasi = Idclasi;
    }

    public int getIduventa() {
        return Iduventa;
    }

    public void setIduventa(int Iduventa) {
        this.Iduventa = Iduventa;
    }

    public double getPreciocompra() {
        return Preciocompra;
    }

    public void setPreciocompra(double Preciocompra) {
        this.Preciocompra = Preciocompra;
    }

    public double getPrecioVenta() {
        return PrecioVenta;
    }

    public String getObser() {
        return obser;
    }

    public void setObser(String obser) {
        this.obser = obser;
    }

    public void setPrecioVenta(double PrecioVenta) {
        this.PrecioVenta = PrecioVenta;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public Auxiliar getAuxiliar() {
        return auxiliar;
    }

    public void setAuxiliar(Auxiliar auxiliar) {
        this.auxiliar = auxiliar;
    }

}
