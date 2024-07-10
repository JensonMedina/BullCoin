function eliminarCotizacion(buton) {
    event.preventDefault();
    Swal.fire({
        title: "¿Estás seguro?",
        text: "Esta acción no se puede deshacer",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sí, eliminar",
        cancelButtonText: "Cancelar",
    }).then((result) => {
        if (result.isConfirmed) {
            x = buton.parentNode;
            const btnConfirmarEliminacion = x.getElementsByTagName("input");
            btnConfirmarEliminacion[0].click();
        }
    });
}

function cotizacionEliminada() {
    Swal.fire(
        "Eliminado",
        "La cotización ha sido eliminada.",
        "success"
    ).then(() => {
        window.location = "myFiles.aspx";
    });
}

function userNotLoggedIn() {
    Swal.fire({
        title: "Error",
        text: "Debes iniciar sesión para poder ver tus cotizaciones guardadas.",
        icon: "info",
        confirmButtonText: "OK",
    });
}
