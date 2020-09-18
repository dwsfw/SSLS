using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Infrastructure.Binders
{
    public class BookshelfModelBinder:IModelBinder
    {
        private const string sessionKey = "Bookshelf";
        public object BindModel(ControllerContext controllerContext,
            ModelBindingContext bindingContext)
        {
            Bookshelf bookshelf = null;
            {
                if (controllerContext.HttpContext.Session != null)
                {
                    bookshelf = controllerContext.HttpContext.Session[sessionKey] as Bookshelf;
                }
                if (bookshelf == null)
                {
                    bookshelf = new Bookshelf();
                    if(controllerContext.HttpContext.Session!=null)
                    {
                        controllerContext.HttpContext.Session[sessionKey] = bookshelf;
                    }
                }
                return bookshelf;
            }
        }
    }
}