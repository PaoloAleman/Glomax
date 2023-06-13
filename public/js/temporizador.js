if (window.location.pathname === '/partida/jugar' || window.location.pathname === '/partida/respuestaCorrecta' ||
        window.location.pathname === '/duelo/versus' || window.location.pathname === '/duelo/respuestaCorrecta' ){
    let tiempoInicial = 9;

    function mostrarTemporizador() {
        document.getElementById("temporizador").textContent = tiempoInicial;

        tiempoInicial--;

        if (tiempoInicial < 0) {
            clearInterval(temporizador);
        }
    }

    let temporizador = setInterval(mostrarTemporizador, 1000);
}