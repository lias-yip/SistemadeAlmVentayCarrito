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
                                parent.location.href = "PedidoventaController?accion=procesarCarritopedi";
                            }

                        });
                    } else {
                      
                    }
                });

        function eliminar(idproducto) {
            $.ajax({
                url: 'DeleteitemPedido',
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
function ActualizarcantidadPEDI(idproducto) {
    var cantidad = $("#txtPro_cantidad" + idproducto).val();
    window.location.href = "PedidoventaController?accion=actualizarcantidadpedi&cantpedi=" + cantidad + "&idproductopedi=" + idproducto;
}
//actualizar ´Costo

function Actualizarprecio(idproducto) {
    var pcompra = $("#txtPro_precio" + idproducto).val();
    window.location.href = "PedidoventaController?accion=actualizarcostopedi&costpedi=" + pcompra + "&idproductopedi=" + idproducto;
}
//funcion guardar
$(function () {
    $("#newventa").on("submit", function (e) {
        e.preventDefault();
        var data = $('#newventa').serialize();
        $.post("PedidoventaController?accion=Registrarpedido", data, function (res, est, jqXHR) {
            if (res === "oki") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                
                        .then((willDelete) => {
                            if (willDelete) {
                                
                                parent.location.href = "ListarPedidoventa.jsp";
                            }

                        });
                ;
            } else {

                swal("No se guardo la informacion",{
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "InsertarPedidoventa.jsp";
                            }

                        });
                ;
            }
        });
    });
});

//sweetalert para Editar
$(function () {
    $("#editarestado").on("submit", function (e) {
        e.preventDefault();
        var data = $('#editarestado').serialize();
        $.post("PedidoventaController?accion=Anular", data, function (res, est, jqXHR) {
            if (res ==="ok") {
                swal("Documento anulado", {
                    icon: "success"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "ListarPedidoventa.jsp";
                            }

                        });
                ;
            } else {

                swal("Hubo un error", {
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "ListarPedidoventa.jsp";
                            }

                        });
                ;
            }
        });
    });
});

//Editar estado en carrito de compra cliente
//sweetalert para Editar

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
                        var data = {"accion": "estadoanularpedi", id: idv};
                        $.post("PedidoventaController", data, function (res, est, jqXHR) {
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
                                        parent.location.href = "ListarPedidoventa.jsp";
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
                        $.post("PedidoventaController", data, function (res, est, jqXHR) {
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
                                        parent.location.href = "ListarPedidoventa.jsp";
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








