$(document).ready(function(){
    $('#txtModificarImagen').attr('disabled','disabled');
    
    $('#SelectImagenActual').click(function(){
        $('#txtImagen').removeAttr('disabled');
        $('#txtModificarImagen').attr('disabled','disabled');
    });
    
    $('#SelectModificarImagen').click(function(){
        $('#txtImagen').attr('disabled','disabled');
        $('#txtModificarImagen').removeAttr('disabled');
    });
});




//Valiaciones de campos nueva categoria
function validarcategoria() {
    var nombre = document.frm_nuevo.txtNom.value;
    if (nombre === '') {
        swal("Ingrese Nombre!", {
            icon: "warning"
        });
        return false;
    } else if (nombre.length > 30) {
        swal("Error demaciados caracteres!", {
            icon: "warning"
        });
        return false;
    }
}
////Valiaciones de campos Editar
function valeditarcategoria() {
    var nombre = document.frm_edit.Txtnombre.value;
    if (nombre === '') {
        swal("Ingrese Nombre!", {
            icon: "warning"
        });
        return false;
    } else if (nombre.length > 30) {
        swal("Error demaciados caracteres!", {
            icon: "warning"
        });
        return false;
    }
}
//sweetalert para Editar
$(function () {
    $("#editusu").on("submit", function (e) {
        e.preventDefault();

        // Crear un objeto FormData para recoger todos los datos del formulario
        var formData = new FormData(this);

        $.ajax({
            url: "UsuarioController?accion=Actualizar",
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
                            parent.location.href = "Usuario.jsp";
                        }
                    });
                } else if (res === "yaexiste") {
                    swal("El trabajador ya tiene un usuario", {
                        icon: "warning"
                    });
                } else {
                    swal("Error, intentar de nuevo", {
                        icon: "warning"
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "Usuario.jsp";
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

//sweetalert para guardar nuevo
$(function () {
    $("#newusu").on("submit", function (e) {
        e.preventDefault();

        // Crear un objeto FormData para recoger todos los datos del formulario
        var formData = new FormData(this);

        $.ajax({
            url: "UsuarioController?accion=add",
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
                            parent.location.href = "Usuario.jsp";
                        }
                    });
                } else if (res === "yaexiste") {
                    swal("El trabajador ya tiene un usuario", {
                        icon: "warning"
                    });
                } else {
                    swal("Error, intentar de nuevo", {
                        icon: "warning"
                    }).then((willDelete) => {
                        if (willDelete) {
                            parent.location.href = "Usuario.jsp";
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
            text: "Desea eliminar el usuario seleccionado?",
            icon: "warning",
            buttons: ['Cancel', 'Ok'],
            dangerMode: true
        })
                .then((willDelete) => {
                    if (willDelete) {

                        //if (opcion) {
                        var fila = $(this).parent().parent();
                        console.log(fila);
                        var idcli = fila.find('#idusu').text();
                        console.log(idcli);
                        var data = {"accion": "eliminar", idUsu: idcli};
                        $.post("UsuarioController", data, function (res, est, jqXHR) {
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
                                        parent.location.href = "Usuario.jsp";
                                    }
                                    //

                                    //
                                });
                                ;
                            }
                            console.log(jqXHR);
                            fila.remove();
                            //
                        }
                        );
                        // }

                    } else {
                    }
                });
    });

});




