if (window.location.pathname === '/partida/jugar' || window.location.pathname === '/duelo/versus') {

    function preguntar() {
        $.ajax({
            url: "http://localhost/partida/nuevaPregunta",
            method: "GET",
            success: function (preguntatxt) {
                var respuesta = JSON.parse(preguntatxt);
                var pregunta = respuesta.pregunta;
                var opciones = respuesta.opciones;
                var opcionCorrecta = respuesta.opcionCorrecta;
                $('#pregunta').text(pregunta);
                $('#opcion1').text(opciones[0]);
                $('#opcion1').val(opciones[0]);
                $('#opcion2').text(opciones[1]);
                $('#opcion2').val(opciones[1]);
                $('#opcion3').text(opciones[2]);
                $('#opcion3').val(opciones[2]);
                $('#opcion4').text(opciones[3]);
                $('#opcion4').val(opciones[3])

                $('button').on('click', function () {
                    var valor = $(this).val();

                    if(window.location.pathname === '/partida/jugar'){
                        if (valor == opcionCorrecta) {
                            window.location.href = "/partida/respuestaCorrecta";
                        } else {
                            window.location.href = "/partida/respuestaIncorrecta";
                        }
                    }
                    if(window.location.pathname === '/duelo/versus'){
                        if (valor == opcionCorrecta) {
                            window.location.href = "/duelo/respuestaCorrecta";
                        } else {
                                window.location.href = "/duelo/resultado";
                        }
                    }
                });

            },
            error: function (xhr, status, error) {
                alert("Ocurrió un error en la solicitud AJAX");
            }
        });
    }

    $(document).ready(function () {
        preguntar()
    });

}

