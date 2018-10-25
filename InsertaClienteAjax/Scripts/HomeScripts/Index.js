$(document).ready(function () {
    //Evento para el boton de agregar cliente
    $("#btn-agrega-cliente").on("click", function () {
        location.href = "http://localhost:64930/Home/RegistraUsuario";
    });

    //Evento para el boton cierra sesion
    $("#cierra-sesion").on("click", function () {
        location.href = "http://localhost:64930/Home/CierraSesion";
    });

    //Evento para el boton inicia sesion
    $("#inicia-sesion").on("click", function () {
        location.href = "http://localhost:64930/Home/Login";
    });

    //Evento para el boton editar cliente
    $(document).on("click", "#btn-editar", function () {
        var id = $(this).data("id");
        location.href = "http://localhost:64930/Home/ActualizaUsuario?doc="+id;
    });

    //Evento para el boton elimina cliente
    $(document).on("click", "#btn-eliminar", function () {
        var id = $(this).data("id");

        $.ajax({
            url: "http://localhost:64930/Home/EliminaRegistroUsuario",
            method: "POST",
            dataType: "json",
            data: { doc: id },
            beforeSend: function () {

            }
        })
        .done(function (respuesta) {
            console.log(respuesta);
            location.href = "http://localhost:64930";
        })
        .fail(function (resp) {
            console.log("fail ejecutado");
            console.log(resp);
        })
        .always(function () {
            console.log("Completado");
        });
    });
})