using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Abstract;
using SSLS.Domain.Concrete;
using SSLS.WebUI.Models;
namespace SSLS.WebUI.Controllers
{
    public class BookshelfController : Controller
    {
        
        public IProductsRepository repository;
        private IReaderRepository readerRepository;
        public BookshelfController(IProductsRepository bookRepository,IReaderRepository readerRepository)
        {
            this.repository = bookRepository;
            this.readerRepository = readerRepository;
        }
        public RedirectToRouteResult AddToBookshelf(Bookshelf bookshelf, int id, string returnUrl)
        {
            Book book = repository.Books.FirstOrDefault(e=>e.Id == id);
            if (book != null)
            {
                bookshelf.AddItem(book, 1);
            }
            return RedirectToAction("Index", new { returnUrl });
        }
        public RedirectToRouteResult RemoveFromBookshelf(Bookshelf bookshelf, int id, string returnUrl)
        {
            Book book = repository.Books.FirstOrDefault(e => e.Id == id);
            if (book != null)
            {
                bookshelf.RemoveLine(book);
            }
            return RedirectToAction("Index", new { returnUrl });
        }
        // GET: Bookshelf
        public ActionResult Index(Bookshelf bookshelf, string returnUrl)
        {
            return View(new BookshelfIndexViewModel { 
            Bookshelf=bookshelf,
            ReturnUrl=returnUrl
            });
        }

        public PartialViewResult Summary(Bookshelf bookshelf)
        {
            return PartialView(bookshelf);
        }
        [HttpPost]
        public ActionResult Borrow(int[] checkon,Reader reader,Bookshelf bookshelf,string returnUrl)
        {
            if (reader.Id == 0)
            {
                TempData["error"] = string.Format("请先登录再借阅！！！");
                return Redirect(Url.Action("Login", "Reader", new { returnUrl = returnUrl }));
            }
            if (checkon==null)
            {
                TempData["error"] = string.Format("书架上没有选中的书，请选择！！！");
                return Redirect(Url.Action("Index", "Bookshelf"));
            }
            if (repository.Readers.FirstOrDefault(e => e.Id == reader.Id).Fine.Count(p => p.PayFineTime == null)>0)
            {
                TempData["error"] = string.Format("您还有罚款未缴纳，请先缴纳罚款再借阅！！！");
                return Redirect(Url.Action("MyFine", "Reader"));
            }
            string msg;
            if (readerRepository.CreateBorrow(checkon, reader, bookshelf,out msg)==true)
            {
                TempData["success"] = msg;
                var books = repository.Checkbook(checkon);
                DateTime nowtime = DateTime.Now;
                DateTime needtime = nowtime.AddMonths(1);
                return View("Completed",new ResultModel{
                    books=books,
                    nowtime=nowtime,
                    needtime=needtime
                });
            }
            else
            {
                TempData["error"] = msg;
                return Redirect(Url.Action("Index", "Bookshelf"));
            }
            
        }
    }
}