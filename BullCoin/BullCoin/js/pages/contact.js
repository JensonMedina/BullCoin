let nombre = document.getElementById("user_name");
let email = document.getElementById("user_email");
let mensaje = document.getElementById("message");
let lblValidacion = document.getElementById("lblValidacion");
let formulario = document.getElementById("contact-form");


function EnviarFormulario() {
    event.preventDefault();
    if (ValidarFormulario()) {
        Swal.fire({
            title: "Correo enviado",
            text: "El correo se envió correctamente.",
            icon: "success",
            confirmButtonText: "OK",
        });
        LimpiarFormulario();

    }
}
function LimpiarFormulario() {
    nombre.value = "";
    email.value = "";
    mensaje.value = "";
    lblValidacion.style.display = "none";
}
function ValidarFormulario() {
    let patron = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (
        nombre.value.trim() == "" ||
        email.value.trim() == "" ||
        mensaje.value.trim() == ""
    ) {
        lblValidacion.innerText = "Debes completar todos los campos.";
        lblValidacion.style.color = "Red";
        lblValidacion.style.display = "block";
        return false;
    }
    if (!patron.test(email.value.trim())) {
        lblValidacion.innerText = "Email no válido.";
        lblValidacion.style.color = "Red";
        lblValidacion.style.display = "block";
        return false;
    }
    return true;
}

//window.onload = function () {
//    document
//        .getElementById("contact-form")
//        .addEventListener("submit", function (event) {
//            event.preventDefault();
//            if (ValidarFormulario()) {
//                emailjs.sendForm("contact_service", "contact_form", this).then(
//                    () => {
//                        console.log("SUCCESS!");
//                        Swal.fire({
//                            title: "Correo enviado",
//                            text: "El correo se envió correctamente.",
//                            icon: "success",
//                            confirmButtonText: "OK",
//                        });
//                        LimpiarFormulario();
//                    },
//                    (error) => {
//                        console.log("FAILED...", error);
//                    }
//                );
//            }
//        });
//};