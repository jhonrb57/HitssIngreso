using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Helpers;
using System.Web.Mvc;
using HitssIngresoBusinessLogic.Data;
using HitssIngresoBusinessLogic.Models;

namespace HitssIngreso.Controllers
{
    public class CatalogosController : Controller
    {
        private IngresoHitssContext db = new IngresoHitssContext();

        // GET: Catalogos
        public ActionResult Index()
        {
            return View(db.Productos.ToList());
        }

        public ActionResult GetImagen(string id)
        {
            var imagen = (from producto in db.Productos
                          where producto.IdProducto == id
                          select producto.Imagen).FirstOrDefault();

            return File(imagen, "image/jpg");
        }

        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Producto producto = db.Productos.Find(id);

            if (producto == null)
            {
                return HttpNotFound();
            }

            return View(producto);
        }

        public ActionResult Comprar(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Producto producto = db.Productos.Find(id);

            if (producto == null)
            {
                return HttpNotFound();
            }

            List<Cliente> clientes = db.Clientes.ToList();
            ViewBag.Clientes = new SelectList(clientes, "IdCliente", "NombreCliente");

            return View(producto);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Comprar([Bind(Include = "IdProducto,IdCliente")] Compra compra)
        {
            compra.IdCompra = Guid.NewGuid().ToString();
            compra.FechaCompra = DateTime.Now;

            if (ModelState.IsValid)
            {
                db.Compras.Add(compra);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View("Index");
        }
    }
}
