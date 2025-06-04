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
                                parent.location.href = "BoletaventaController?accion=procesarCarritoboleta";
                            }

                        });
                    } else {
                        swal("Your imaginary file is safe!");
                    }
                });

        function eliminar(idproducto) {
            $.ajax({
                url: 'VDeleteitemventa',
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
function actualizarcantidadfc(idproducto) {
    var cantidad = $("#txtPro_cantidad" + idproducto).val();
    window.location.href = "RefFacturaCompraController?accion=reffcActualizarcantidad&cantreffc=" + cantidad + "&idproductoreffc=" + idproducto;
}

function actualizarpreciocomprafc(idproducto) {

    var pcompra = $("#txtPro_precio" + idproducto).val();
    window.location.href = "RefFacturaCompraController?accion=actualizarcostofc&costofc=" + pcompra + "&idproductofc=" + idproducto;
}

//funcion guardar
$(function () {
    $("#newventa").on("submit", function (e) {
        e.preventDefault();
        var data = $('#newventa').serialize();
        $.post("RefFacturaCompraController?accion=RegistrarrefFacturadecompra", data, function (res, est, jqXHR) {
            if (res === "oki") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "ListarFacturadeCompra.jsp";
                            }

                        });
                ;
            } else {

                swal("¡No se inserto la venta! ", "¡ Hiciste clic en el botón! ", " éxito ", {
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "RefInsertarFacturaCompra.jsp";
                            }

                        });
                ;
            }
        });
    });
});

//Confirmacion anulacion
//sweetalert para Editar
$(function () {
    $("#editarestado").on("submit", function (e) {
        e.preventDefault();
        var data = $('#editarestado').serialize();
        $.post("RefFacturaCompraController?accion=Anular", data, function (res, est, jqXHR) {
            if (res ==="ok") {
                swal("Documento anulado", {
                    icon: "success"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "ListarFacturadeCompra.jsp";
                            }

                        });
                ;
            } else {

                swal("Hubo un error", {
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "ListarFacturadeCompra.jsp";
                            }

                        });
                ;
            }
        });
    });
});

//Eliminar
$(function () {
    $('tr #btn-eliminar').click(function (e) {
        e.preventDefault();

        swal({
            text: "Desea eliminar el documento?",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {

                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idni = fila.find('#idfc').text();
                        console.log(idni);
                        var data = {"accion": "Eliminar", idFc: idni};
                        $.post("RefFacturaCompraController", data, function (res, est, jqXHR) {
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
                                        parent.location.href = "ListarFacturadeCompra.jsp";
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








