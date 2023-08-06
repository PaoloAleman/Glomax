const alerta = document.getElementById("alerta");

// Función para ocultar el elemento después de 3 segundos
function ocultarElemento() {
    alerta.classList.add('fade-out');

    // Después de 1 segundo (1000 milisegundos), agregamos la clase "hidden" para ocultar el elemento completamente
    setTimeout(function() {
        alerta.classList.add('hidden');
    }, 1000);
}

// Después de 3 segundos (3000 milisegundos), llamamos a la función para ocultar el elemento
setTimeout(ocultarElemento, 4000);
