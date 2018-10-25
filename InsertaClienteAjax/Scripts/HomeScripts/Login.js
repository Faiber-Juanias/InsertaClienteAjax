$(document).ready(function () {
    //Envia los datos del logueo al controlador
    $("#form-login").on("submit", function (event) {
        event.preventDefault();

        $.ajax({
            url: "RecibeLogin",
            method: "POST",
            dataType: "json",
            data: $(this).serialize(),
            beforeSend: function(){

            }
        })
        .done(function (respuesta) {
            console.log(respuesta);
            if (respuesta.result == "Si existe") {
                location.href = "http://localhost:64930/";
            } else if (respuesta.result == "No existe") {
                alert("Usuario o contraseña incorrectos.");
            }
        })
        .fail(function (resp) {
            console.log(resp.responseText);
        })
        .always(function () {
            console.log("Completado");
        })
    });
});