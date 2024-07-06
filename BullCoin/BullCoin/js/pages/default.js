//contenedor slider de los comentarios
const slider = document.querySelector('.slider');

//tarjeta de comentarios
const cards = document.querySelectorAll('.card-comentarios');

//boton de mover hacia izquierda los comentarios
const prevButton = document.querySelector('.prev');

//boton de mover a la derecha los comentarios
const nextButton = document.querySelector('.next');
let currentIndex = 0;


//con esta funcion actualizamos la posicion del slider en funcion del indice actual y el ancho de la primera tarjeta
function updateSlider() {
    const cardWidth = cards[0].clientWidth;
    slider.style.transform = `translateX(${-currentIndex * cardWidth}px)`;
}

//este evento se activa cuando hacemos click en el boton de la izquierda de la seccion de los comentarios, primero verificamos que el indice actual sea mayor que cero para asegurarnos de que no se vaya mas alla de la primera tarjeta
//decrementamos el indice actual en 1, porque nos estamos moviendo hacia la izquierda
//actualizamos la posicion del slider llamando la funcion creada anteriormente
prevButton.addEventListener('click', () => {
    event.preventDefault();
    if (currentIndex > 0) {
        currentIndex--;
        updateSlider();
    }
});

//este evento se activa cuando hacemos click en el boton de la derecha de la seccion de comentarios.
//verificamos que el indice actual sea menor que la longitud de las card menos 1 para asegurarmos que no nos vamos mas alla de la ultima tarjeta
//incrementamos el indice actual porque nos estamos moviendo a la derecha y por ultimo llamamos la funcion para actualizar la posicion del slider
nextButton.addEventListener('click', () => {
    event.preventDefault();
    if (currentIndex < cards.length - 1) {
        currentIndex++;
        updateSlider();
    }
});

//cada vez que se redimensiona la pantalla actualizamos la posicion del slider
window.addEventListener('resize', updateSlider);

function showSuccessAlert() {
    Swal.fire({
        title: "¡Cotización guardada!",
        text: "Cotización guardada correctamente.",
        icon: "success",
        confirmButtonText: "OK"
    });
}
function showErrorAlert() {
    Swal.fire({
        title: "Error",
        text: "Ya existe esta cotización en favoritos.",
        icon: "error",
        confirmButtonText: "OK",
    });
}