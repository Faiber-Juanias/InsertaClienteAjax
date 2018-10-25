using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using InsertaClienteAjax.Entity;
using InsertaClienteAjax.Models;
using System.Data;

namespace InsertaClienteAjax.Controllers
{
    public class HomeController : Controller
    {
        List<Cliente> listaClientes;
        ModelCliente objClienteModel;

        //
        // GET: /Cliente/

        public ActionResult Index()
        {
            objClienteModel = new ModelCliente();
            listaClientes = objClienteModel.TraeListaClientes();
            return View(listaClientes);
        }

        public ActionResult RegistraUsuario()
        {
            return View();
        }

        [HttpPost]
        public JsonResult RecibeRegistroUsuario(string documento, string nombre, string apellido, string celular, string correo, string usuario, string contrasena)
        {
            objClienteModel = new ModelCliente();
            bool insertado = objClienteModel.InsertaRegistroCliente(documento, nombre, apellido, celular, correo, usuario, contrasena);

            if (insertado)
            {
                return Json(new Dictionary<string, bool>() { { "result", true } });
            }
            else
            {
                return Json(new Dictionary<string, bool>() { { "result", false } });                
            }
        }

        [HttpPost]
        public JsonResult EliminaRegistroUsuario(string doc)
        {
            objClienteModel = new ModelCliente();
            bool eliminado = objClienteModel.EliminaRegistroCliente(doc);

            if (eliminado)
            {
                return Json(new Dictionary<string, bool>() { {"result", true} });
            }
            else
            {
                return Json(new Dictionary<string, bool>() { { "result", false } });
                
            }
        }

        [HttpPost]
        public JsonResult ActualizaRegistroUsuario(string documento, string nombre, string apellido, string celular, string correo, string usuario, string contrasena)
        {
            objClienteModel = new ModelCliente();
            bool actualizado = objClienteModel.ActualizaRegistroCliente(documento, nombre, apellido, celular, correo, usuario, contrasena);

            if (actualizado)
            {
                return Json(new Dictionary<string, bool>() { {"result", true} });
            }
            else
            {
                return Json(new Dictionary<string, bool>() { { "result", false } });
            }
        }

        [HttpGet]
        public ActionResult ActualizaUsuario(string doc)
        {
            objClienteModel = new ModelCliente();
            DataTable objUsuario = objClienteModel.TraeClienteUnico(doc);

            Cliente objCliente = new Cliente();
            foreach (DataRow columna in objUsuario.Rows)
            {
                objCliente.Documento = columna["Documento"].ToString();
                objCliente.Nombre = columna["Nombre"].ToString();
                objCliente.Apellido = columna["Apellido"].ToString();
                objCliente.Celular = columna["Celular"].ToString();
                objCliente.Correo = columna["Correo"].ToString();
                objCliente.Usuario = columna["Usuario"].ToString();
                objCliente.Contrasena = columna["Contrasena"].ToString();
            }
            return View(objCliente);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public JsonResult RecibeLogin(string usuario, string contrasena)
        {
            objClienteModel = new ModelCliente();
            bool siexiste = objClienteModel.TraeLoginCliente(usuario, contrasena);
            if (siexiste)
            {
                Session["usuario"] = usuario;
                return Json(new Dictionary<string, string>() {{ "result", "Si existe" }});
                //return Content("<script>location.href='Index';</script>");
            }
            //return Content("<script>alert('Usuario o contraseña incorrectos'); location.href='Login';</script>");
            return Json(new Dictionary<string, string>() { { "result", "No existe" } });
        }

        public ContentResult CierraSesion()
        {
            Session.Abandon();
            return Content("<script>location.href='http://localhost:64930/';</script>");
        }
    }
}