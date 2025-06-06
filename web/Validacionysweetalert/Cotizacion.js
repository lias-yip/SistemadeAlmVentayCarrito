//eliminar carrito
$(function () {
    $('tr #deleteitem').click(function (e) {
        e.preventDefault();
        var elemento = $(this);
        var idproducto = elemento.parent().find('#idarticulo').text();
        swal({
            text: "Estas seguro de eliminar el ITEM del documento",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
                .then((willDelete) => {
                    if (willDelete) {
                        eliminar(idproducto);
                        swal("Se elimino el item", {
                            icon: "success",
                        }).then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "CotizacionventaController?accion=procesarCarritoco";
                            }

                        });
                    } else {
                      
                    }
                });

        function eliminar(idproducto) {
            $.ajax({
                url: 'DeleteitemFV',
                type: 'post',
                data: {idproducto: idproducto},
                success: function (data, textStatus, jqXHR) {
                }
            });
        }
    });


});

//fecha actual
$(document).ready(function () {

    var now = new Date();

    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth() + 1)).slice(-2);

    var today = now.getFullYear() + "-" + (month) + "-" + (day);
    $("#fecha").val(today);
});

//calcular impuesto
$(function () {
    calcularimpuesto();

});
function calcularimpuesto() {
    var tipo = $("#txtTipoventa").val();
    var impuesto = 0;
    if (tipo === "Boleta") {
        impuesto = 0;
    } else if (tipo === "Factura") {
        impuesto = 0.18;
    }
    $("#txtimpuesto").val(impuesto);

}

//actualizar cantidad
function ActualizarcantidadCO(idproducto) {
    var cantidad = $("#txtPro_cantidad" + idproducto).val();
    window.location.href = "CotizacionventaController?accion=actualizarcantidadco&cantco=" + cantidad + "&idproductoco=" + idproducto;
}
//actualizar ´Costo

function actualizarpreciocompra(idproducto) {

    var pcompra = $("#txtPro_precio" + idproducto).val();
    window.location.href = "CotizacionventaController?accion=actualizarcostoco&costco=" + pcompra + "&idproductoco=" + idproducto;
}
//funcion guardar
$(function () {
    $("#newventa").on("submit", function (e) {
        e.preventDefault();
        var data = $('#newventa').serialize();
        $.post("CotizacionventaController?accion=Registrarcotizacion", data, function (res, est, jqXHR) {
            if (res === "oki") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                
                        .then((willDelete) => {
                            if (willDelete) {
                                
                                parent.location.href = "ListarCotizacionventa.jsp";
                            }

                        });
                ;
            } else {

                swal("No se guardo la informacion",{
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "InsertarCotizacionventa.jsp";
                            }

                        });
                ;
            }
        });
    });
});

//Confirmacion anulacion
$(function () {
    $('tr #btn-anular').click(function (e) {
        e.preventDefault();

        swal({
            text: "Estas seguro de anular el documento?",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {

                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idv = fila.find('#idv').text();
                        console.log(idv);
                        var data = {"accion": "estadoanularco", id: idv};
                        $.post("CotizacionventaController", data, function (res, est, jqXHR) {
                            //console.log('res ',res);


                            //console.log(est);  
                            if (jqXHR.status === 200) {
                                //success
                                //info
                                ///error
                                swal("Documento anulado", {
                                    icon: "success"
                                }).then((willDelete) => {
                                    if (willDelete) {
                                        parent.location.href = "ListarCotizacionventa.jsp";
                                    }
                                });
                                ;
                            }
                        });
                        // }
                    } else {
                      
                    }
                });
    });

});

//Eliminar
$(function () {
    $('tr #eliminar').click(function (e) {
        e.preventDefault();

        swal({
            text: "Desea eliminar?",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {

                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idv = fila.find('#idv').text();
                        console.log(idv);
                        var data = {"accion": "Eliminar", idMot: idv};
                        $.post("CotizacionventaController", data, function (res, est, jqXHR) {
                            //console.log('res ',res);
                            //console.log(est);  
                            if (jqXHR.status === 200) {
                                //success
                                //info
                                ///error
                                swal("Registro eliminado", {
                                    icon: "success"
                                }).then((willDelete) => {
                                    if (willDelete) {
                                        parent.location.href = "ListarCotizacionventa.jsp";
                                    }

                                });
                                ;
                            }
                            console.log(jqXHR);
                            fila.remove();
                        });
                        // }
                    } else {
                    }
                });
    });

});








