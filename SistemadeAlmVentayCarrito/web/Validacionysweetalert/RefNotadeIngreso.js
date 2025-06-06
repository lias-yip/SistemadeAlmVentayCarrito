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
                                parent.location.href = "RefNotadeIngresoController?accion=procesarCarritorefni";
                            }

                        });
                    } else {
                        swal("Your imaginary file is safe!");
                    }
                });

        function eliminar(idproducto) {
            $.ajax({
                url: 'DeleteitemREFNI',
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
function actualizarcantidad(idproducto) {
    var cantidad = $("#txtPro_cantidad" + idproducto).val();
    window.location.href = "RefNotadeIngresoController?accion=refNotaIActualizarcantidad&cantniref=" + cantidad + "&idproductorefni=" + idproducto;
}
//funcion guardar
$(function () {
    $("#newventa").on("submit", function (e) {
        e.preventDefault();
        var data = $('#newventa').serialize();
        $.post("RefNotadeIngresoController?accion=RegistrarrefNotadeingreso", data, function (res, est, jqXHR) {
            if (res === "oki") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "ListarNotaingreso.jsp";
                            }

                        });
                ;
            } else {

                swal("¡No se inserto la venta! ", "¡ Hiciste clic en el botón! ", " éxito ", {
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "InsertarNotadeIngreso.jsp";
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
            title: "Estas seguro de anular el documento?",
            text: "Se ha detectado que el documento tiene movimiento",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {

                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idv = fila.find('#idni').text();
                        console.log(idv);
                        var data = {"accion": "estadoanularni", id: idv};
                        $.post("NotadeIngresoController", data, function (res, est, jqXHR) {
                            //console.log('res ',res);


                            //console.log(est);  
                            if (jqXHR.status === 200) {
                                //success
                                //info
                                ///error
                                swal("Se anulo el documento correctamente!", {
                                    icon: "success"
                                }).then((willDelete) => {
                                    if (willDelete) {
                                        parent.location.href = "ListarNotaingreso.jsp.jsp";
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








