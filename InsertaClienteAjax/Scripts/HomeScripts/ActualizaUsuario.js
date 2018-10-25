$(document).ready(function () {
    $("#form-actualiza-usuario").on("submit", function (event) {
        event.preventDefault();

        $.ajax({
            url: "http://localhost:64930/Home/ActualizaRegistroUsuario",
            method: "POST",
            dataType: "json",
            data: $(this).serialize(),
            beforeSend: function () {

            }
        })
        .done(function (respuesta) {
            console.log(respuesta);
            if (respuesta.result) {
                location.href = "http://localhost:64930";
            } else {
                alert("Ha ocurrido un error.");
            }
        })
        .fail(function (resp) {
            console.log("fail ejecutado");
        })
        .always(function () {
            console.log("Completado");
        })
    })
})