using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Concrete;
using SSLS.Domain.Abstract;
namespace SSLS.WebUI.Controllers
{
    public class NavController : Controller
    {
        private IProductsRepository repository;
        public NavController(IProductsRepository bookRepository)
        {
            this.repository = bookRepository;
        }
        // GET: Nav
        public PartialViewResult Menu(int categoryId = 0)
        {
            ViewBag.CurrentCategoryId = categoryId;
            IEnumerable<Category> categories = repository.Categories.ToList();
            return PartialView(categories);
        }
        public PartialViewResult AdminMenu()
        {
            return PartialView();
        }
    }
}