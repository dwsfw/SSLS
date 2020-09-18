using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace SSLS.WebUI
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                 null,
                 "",
                 new { controller = "Book", action = "List", categoryId = 0, page = 1}
                );
            routes.MapRoute(
                 null,
                 "page{page}",
                 new { controller = "Book", action = "List", categoryId = 0 },
                 new { page = @"\d+" }
                 );
            routes.MapRoute(
                 null,
                 "cId{categoryId}",
                 new { controller = "Book", action = "List", page = 1 },
                 new { categoryId = @"\d+" }
                );
            routes.MapRoute(
                 null,
                 "cId{categoryId}/page{page}",
                 new { controller = "Book", action = "List" },
                 new { categoryId = @"\d+", page = @"\d+" }
                );
            routes.MapRoute(
                 null,
                 "key{key}",
                 new { controller = "Book", action = "List",key="" },
                 new { key= @"\d+" }
                );
            routes.MapRoute(
                name: null,
                url: "{controller}/{action}"
            );
        }
    }
}
