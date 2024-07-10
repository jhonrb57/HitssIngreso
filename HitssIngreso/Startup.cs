using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;
using HitssIngresoBusinessLogic.Data;

[assembly: OwinStartup(typeof(HitssIngreso.Startup))]

namespace HitssIngreso
{
    public partial class Startup
    {
        public void ConfigureAuth(IAppBuilder app)
        {
            app.CreatePerOwinContext(IngresoHitssContext.Create);
        }
    }
}
