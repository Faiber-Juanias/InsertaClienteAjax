$(document).ready(function () {
    $("#form-registro-usuario").on("submit", function (event) {
        event.preventDefault();

        $.ajax({
            url: "RecibeRegistroUsuario",
            method: "POST",
            dataType: "json",
            data: $(this).serialize(),
            beforeSend: function () {

            }
        })
        .done(function (respuesta) {
            console.log("done ejecutado");
            if (respuesta.result) {
                location.href = "http://localhost:64930";
            } else {
                alert("Ha ocurrido un error.");
                $("#form-registro-usuario")[0].reset();
            }
        })
        .fail(function (resp) {
            console.log("fail ejecutado");
            console.log(resp);
        })
        .always(function () {
            console.log("Completado");
        })
    });
})