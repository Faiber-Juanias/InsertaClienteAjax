using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InsertaClienteAjax.Entity
{
    public class Cliente
    {
        public string Documento { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Celular { get; set; }
        public string Correo { get; set; }
        public string Usuario { get; set; }
        public string Contrasena { get; set; }
    }
}