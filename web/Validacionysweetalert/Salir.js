$(document).ready(function() {
  $('.btn-exit').on('click', function() {
    swal({
      text: "¿Desea cerrar la sesión?",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    })
    .then((willDelete) => {
      if (willDelete) {
        // Realiza una solicitud al servidor para cerrar la sesión
        $.ajax({
          url: "UsuarioController?accion=Limpiar", // Reemplaza 'logoutServlet' con la URL correcta
          type: 'POST', // Utiliza el método HTTP correcto
          success: function(data) {
            // Redirige a la página de inicio de sesión después de cerrar la sesión
            window.location.href = "login.jsp";
          },
          error: function(error) {
            console.error(error);
          }
        });
      }
    });
  });
});