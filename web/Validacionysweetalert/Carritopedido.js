/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//actualizar cantidad
function Actualizarcantidadcarrito(idproducto) {
    var cantidad = $("#txtPro_cantidad" + idproducto).val();
    window.location.href = "PedidoCarritoController?accion=actualizarcantidadcarrito&cantcarrito=" + cantidad + "&idproductocarrito=" + idproducto;
}

//funcion guardar
$(function () {
    $("#newventa").on("submit", function (e) {
        e.preventDefault();
        var data = $('#newventa').serialize();
        $.post("PedidoCarritoController?accion=Registrarcarritodeventa", data, function (res, est, jqXHR) {
            if (res === "oki") {
                swal("Se ha guardado la informacion", {
                    icon: "success"
                })
                
                        .then((willDelete) => {
                            if (willDelete) {
                                
                                parent.location.href = "Index.jsp";
                            }

                        });
                ;
            } else {

                swal("No se guardo la informacion",{
                    icon: "warning"
                })
                        .then((willDelete) => {
                            if (willDelete) {
                                parent.location.href = "_Detallepedido.jsp";
                            }

                        });
                ;
            }
        });
    });
});

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
                                parent.location.href = "PedidoCarritoController?accion=procesarCarritocarrito";
                            }

                        });
                    } else {
                      
                    }
                });

        function eliminar(idproducto) {
            $.ajax({
                url: 'DeleteitemCARRITO',
                type: 'post',
                data: {idproducto: idproducto},
                success: function (data, textStatus, jqXHR) {
                }
            });
        }
    });


});