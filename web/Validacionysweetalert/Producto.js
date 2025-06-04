/* global swal */
function comprobarRadio(radio)
{
    for (i = 0; i < radio.length; i++)
    {
        if (radio[i].checked)
        {
            return true;
        }
    }
    return false;
}
function soloLetras(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
    especiales = [8, 37, 39, 46];

    tecla_especial === false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) === -1 && !tecla_especial)
        return false;
}
function soloNumeros(e) {
    key = e.keyCode || e.which;
    tecla = String.fromCharCode(key).toLowerCase();
    letras = "0123456789";
    especiales = [8, 37, 39, 46];

    tecla_especial === false;
    for (var i in especiales) {
        if (key === especiales[i]) {
            tecla_especial = true;
            break;
        }
    }
    if (letras.indexOf(tecla) === -1 && !tecla_especial)
        return false;
}
//Valiaciones de campos nuevo cliente
function validarnewproductos() {
    var descrp = document.frm_nuevo.Txtdescripcion.value;
    var marca = document.frm_nuevo.Txtmarca.value;
    var cate = document.frm_nuevo.Txtcategoria.value;
    var subcat = document.frm_nuevo.TxtIdpublico.value;
    var unidv = document.frm_nuevo.Txtunidadv.value;
    if (descrp === '') {
        swal("Ingrese la Descripcion!", {
            icon: "warning"
        });
    } else if (descrp.length > 100)
    {
        swal("Demasiados caracteres", {
            icon: "warning"
        });
    } else if (marca === '--' || marca === null) {
        swal("Ingrese la Clasificacion!", {
            icon: "warning"
        });
    } else if (cate === "--" || cate === null) {
        swal("selecione una categoria!", {
            icon: "warning"
        });
    } else if (subcat === "--" || subcat === null)
    {
        swal("selecione una Sub Categoria!", {
            icon: "warning"
        });
    } else if (unidv === "--" || unidv === null)
    {
        swal("selecione unidad de venta!", {
            icon: "warning"
        });
    }
}

//Valiaciones de campos editar cliente
//Valiaciones de campos nuevo cliente
function validareditarproductos() {
    var descrp = document.frm_nuevo.Txtdescripcion.value;
    var marca = document.frm_nuevo.Txtmarca.value;
    var cate = document.frm_nuevo.Txtcategoria.value;
    var subcat = document.frm_nuevo.TxtIdpublico.value;
    var unidv = document.frm_nuevo.Txtunidadv.value;
    if (descrp === '') {
        swal("Ingrese la Descripcion!", {
            icon: "warning"
        });
    } else if (descrp.length > 100)
    {
        swal("Demasiados caracteres", {
            icon: "warning"
        });
    } else if (marca === '--' || marca === null) {
        swal("Ingrese la Clasificacion!", {
            icon: "warning"
        });
    } else if (cate === "--" || cate === null) {
        swal("selecione una categoria!", {
            icon: "warning"
        });
    } else if (subcat === "--" || subcat === null)
    {
        swal("selecione una Sub Categoria!", {
            icon: "warning"
        });
    } else if (unidv === "--" || unidv === null)
    {
        swal("selecione unidad de venta!", {
            icon: "warning"
        });
    }
}
//sweetalert para Editar
$(function () {
    $("#editproducto").on("submit", function (e) {
        e.preventDefault();

        // Crear un objeto FormData para recoger todos los datos del formulario
        var formData = new FormData(this);

        $.ajax({
            url: "ProductoController?accion=actualizarimg",
            type: "POST",
            data: formData,
            processData: false, // Evitar que jQuery procese los datos
            contentType: false, // Evitar que jQuery establezca el encabezado 'Content-Type'
            success: function (res) {
                if (res === "ok") {
                    swal("Se ha guardado la información", {
                        icon: "success"
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "Producto.jsp";
                        }
                    });
                } else if (res === "yaexiste") {
                    swal("El producto ya existe", {
                        icon: "warning"
                    });
                } else {
                    swal("Error, intentar de nuevo", {
                        icon: "warning"
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "InsertarProducto.jsp";
                        }
                    });
                }
            },
            error: function () {
                swal("Error en la solicitud", {
                    icon: "error"
                });
            }
        });
    });
});
//sweetalert para Editar
$(function () {
    $("#editproductoxxxx").on("submit", function (e) {
        e.preventDefault();
        var data = $('#editproductoxxxx').serialize();
        $.post("ProductoController?accion=actualizar", data, function (res, est, jqXHR) {
            if (res === "ok") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "Producto.jsp";
                            }

                        });
                ;
            } else {

                swal("¡Revise la informacion y vuelva a intentarlo ", {
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "EditarProducto.jsp";
                            }

                        });
                ;
            }
        });
    });
});

//sweetalert para Editar
$(function () {
    $("#editminmax").on("submit", function (e) {
        e.preventDefault();
        var data = $('#editminmax').serialize();
        $.post("ProductoController?accion=Editarstockminmax", data, function (res, est, jqXHR) {
            if (res === "ok") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "Stockminimoymaximo.jsp";
                            }

                        });
                ;
            } else {

                swal("¡no se asigno! ", {
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "Stockminimoymaximo.jsp";
                            }

                        });
                ;
            }
        });
    });
});
//sweetalert para guardar nuevo
//$(function () {
//    $("#newproductooo").on("submit", function (e) {
//        e.preventDefault();
//        var data = $('#newproductooo').serialize();
//        $.post("ProductoController?accion=add", data, function (res, est, jqXHR) {
//            if (res === "ok") {
//                swal("Se ha guardado la informacion", {
//                    icon: "success"
//                })
//                        .then((willDelete) => {
//                            if (willDelete) {
//                                parent.location.href = "Producto.jsp";
//                            }
//
//                        });
//                ;
//            } else if (res === "yaexiste") {
//                debugger;
//                swal("El codigo anexo ya existe", {
//                    icon: "warning"
//                });
//                return false;
//            } else {
//
//                swal("Revise la informacion y vuelva a intentarlo", {
//                    icon: "warning"
//                })
//                        .then((willDelete) => {
//                            if (willDelete) {
//                                parent.location.href = "InsertarProducto.jsp";
//                            }
//
//                        });
//                ;
//            }
//        });
//    });
//});

//sweetalert para guardar nuevo
$(function () {
    $("#newproducto").on("submit", function (e) {
        e.preventDefault();

        // Crear un objeto FormData para recoger todos los datos del formulario
        var formData = new FormData(this);

        $.ajax({
            url: "ProductoController?accion=addimg",
            type: "POST",
            data: formData,
            processData: false, // Evitar que jQuery procese los datos
            contentType: false, // Evitar que jQuery establezca el encabezado 'Content-Type'
            success: function (res) {
                if (res === "ok") {
                    swal("Se ha guardado la información", {
                        icon: "success"
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "Producto.jsp";
                        }
                    });
                } else if (res === "yaexiste") {
                    swal("El producto ya tiene movimiento", {
                        icon: "warning"
                    });
                } else {
                    swal("Error, intentar de nuevo", {
                        icon: "warning"
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "InsertarProducto.jsp";
                        }
                    });
                }
            },
            error: function () {
                swal("Error en la solicitud", {
                    icon: "error"
                });
            }
        });
    });
});


//Eliminar
$(function () {
    $('tr #btn-eliminar').click(function (e) {
        e.preventDefault();

        swal({
            text: "Desea eliminar el producto seleccionado?",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {
                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idpro = fila.find('#idpro').text();
                        console.log(idpro);
                        var data = {"accion": "eliminar", idPro: idpro};
                        $.post("ProductoController", data, function (res, est, jqXHR) {
                            //console.log('res ',res);
                            //console.log(est);  
                            if (jqXHR.status === 200) {
                                //success
                                //info
                                ///error
                                swal("Registro eliminado correctamente!", {
                                    icon: "success"
                                }).then((willDelete) => {
                                    if (willDelete) {
                                        parent.location.href = "Producto.jsp";
                                    }
                                });
                                ;
                            }
                            console.log(jqXHR);
                            fila.remove();
                            if (res === "tienemovi") {
                                swal("El Producto tiene movimientos, no se puede eliminar", {
                                    icon: "warning"
                                })
                                        .then((willDelete) => {
                                            if (willDelete) {
                                                parent.location.href = "Producto.jsp";
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
//Confirmacion de cambio de estado
$(function () {
    $('tr #btn-estado').click(function (e) {
        e.preventDefault();

        swal({
            text: "Estas seguro de cambiar el estado?",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {

                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idpro = fila.find('#idpro').text();
                        console.log(idpro);
                        var data = {"accion": "estado", id: idpro};
                        $.post("ProductoController", data, function (res, est, jqXHR) {
                            //console.log('res ',res);


                            //console.log(est);  
                            if (jqXHR.status === 200) {
                                //success
                                //info
                                ///error
                                swal("Cambio de estado correcto!", {
                                    icon: "success"
                                }).then((willDelete) => {
                                    if (willDelete) {
                                        parent.location.href = "Producto.jsp";
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






