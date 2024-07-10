using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Reporting.WebForms;
using HitssIngresoBusinessLogic.Models;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace HitssIngreso.Controllers
{
    public class ReportesController : Controller
    {
        // GET: Reportes
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Generar(DateTime FechaInicial, DateTime FechaFinal)
        {
            LocalReport report = new LocalReport();
            report.ReportPath = Server.MapPath("~/Reports/Ventas.rdlc");

            ReportParameter[] parameters = new ReportParameter[2];
            parameters[0] = new ReportParameter("FechaInicial", FechaInicial.ToString("yyyy-MM-dd"));
            parameters[1] = new ReportParameter("FechaFinal", FechaFinal.ToString("yyyy-MM-dd"));
            report.SetParameters(parameters);

            List<Ventas> datos = ObtenerDatos(FechaInicial, FechaFinal);
            report.DataSources.Add(new ReportDataSource("DataSet", datos));

            byte[] bytes = report.Render("PDF");

            return File(bytes, "application/pdf");
        }

        public List<Ventas> ObtenerDatos(DateTime fechaInicial, DateTime fechaFinal)
        {
            List<Ventas> listaVentas = new List<Ventas>();
            string conexion = ConfigurationManager.ConnectionStrings["HitssIngresoContext"].ToString();
            using (SqlConnection context = new SqlConnection(conexion))
            {
                SqlCommand cmd = new SqlCommand("listarVentas", context);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fechaInicial", fechaInicial.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@fechaFinal", fechaFinal.ToString("yyyy-MM-dd"));

                try
                {
                    context.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            listaVentas.Add(new Ventas()
                            {
                                Producto = dr["NombreProducto"].ToString(),
                                Cliente = dr["NombreCliente"].ToString()
                            });
                        }

                    }

                    return listaVentas;
                }
                catch (Exception ex)
                {
                    return listaVentas;
                }
            }
        }
    }
}