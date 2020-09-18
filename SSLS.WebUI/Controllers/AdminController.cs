using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Concrete;
using SSLS.Domain.Abstract;
using SSLS.WebUI.Models;
using SSLS.WebUI.Infrastructure;
using SSLS.WebUI.Infrastructure.Abstract;
using SSLS.WebUI.Infrastructure.Concrete;
using System.Collections;
using System.Drawing;
using SSLS.WebUI.Filters;
namespace SSLS.WebUI.Controllers
{
    //[Authorize]
    [AdminLoginNeed]
    public class AdminController : Controller
    {
        private IProductsRepository repository;
        private IWorkHelp workHelp;
        private int PageSize = 8;
        public AdminController(IProductsRepository bookRepository,IWorkHelp workhelp)
        {
            this.repository = bookRepository;
            this.workHelp = workhelp;
        }
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult Summary(Admin admin)
        {
            return PartialView(admin);
        }
        public RedirectToRouteResult LoginOut()
        {
            Session.Abandon();
            return RedirectToAction("Login","Account");
        }
        public ActionResult BookIndex(int page=1)
        {
            List<Book> books = repository.Books.ToList();
            return View(new AdminBookListViewModel { 
            Books=books.Skip((page-1)*PageSize).Take(PageSize),
            pagingInfo = new PagingInfo
            {
                CurrentPage=page,
                ItemPerPage=PageSize,
                TotalItems=books.Count
            }
            });
        }
        public ActionResult EditBook(int id)
        {
            if(repository.Books.FirstOrDefault(e=>e.Id==id).Status!="在库")
            {
                TempData["error"] = "图书外借，拒绝修改";
                return RedirectToAction("BookIndex");
            }
            ViewBag.CategoryList = Utils.GetCategorySelectList(repository);
            return View(repository.Books.FirstOrDefault(e=>e.Id==id));
        }
        [HttpPost]
        public ActionResult EditBook(Book book,HttpPostedFileBase file)
        {
            string imageFileName = string.Empty;
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    try
                    {
                        imageFileName = Utils.GetImageSaveName(file.FileName);
                        string savePathAndName = string.Format("{0}/{1}", Server.MapPath("~/Images"), imageFileName);
                        file.SaveAs(savePathAndName);
                        book.ImageUrl = string.Format("{0}", imageFileName);
                    }
                    catch{
                        ModelState.AddModelError("", "图片保存失败！");
                    }
                }
                if (repository.SaveBook(book) == true)TempData["success"] = string.Format("{0} 保存成功", book.Name);
                else TempData["error"] = "系统错误，保存失败";
                return RedirectToAction("BookIndex");
            }
            ViewBag.CategoryList = Utils.GetCategorySelectList(repository);
            return View(book);
        }
        [HttpPost]
        public ActionResult DeleteBook(int id)
        {
            if (repository.Books.FirstOrDefault(e => e.Id == id).Status != "在库")
            {
                TempData["error"] = "图书外借，拒绝修改";
                return RedirectToAction("BookIndex");
            }
            string msg;
            Book deleteBook = repository.DeleteBook(id,out msg);
            if (deleteBook != null)
            {
                TempData["success"] = string.Format("“{0}” 产品信息{1}", deleteBook.Name,msg);
            }
            else
            {
                TempData["error"] = msg;
            }
            return RedirectToAction("BookIndex");
        }
        public ActionResult CreateBook()
        {
            ViewBag.CategoryList = Utils.GetCategorySelectList(repository);
            return View("EditBook", new Book());
        }
        public ActionResult CategoryIndex()
        {
            return View(repository.Categories.ToList());
        }
        public ActionResult EditCategory(int id)
        {
            return View(repository.Categories.FirstOrDefault(e=>e.Id==id));
        }
        [HttpPost]
        public ActionResult EditCategory(Category category)
        {
            if (ModelState.IsValid)
            {
                bool flag = repository.SaveCategory(category);
                if (flag == true)
                {
                    TempData["success"] = "修改保存成功";
                }
                else
                {
                    TempData["error"] = "书本不存在，请重试！";
                }

                return RedirectToAction("CategoryIndex");
            }
            return View(category);
        }
        [HttpPost]
        public ActionResult DeleteCategory(int id)
        {
            string msg;
            Category category = repository.DeleteCategory(id,out msg);
            if(category!=null)
            {
                TempData["success"] = string.Format("“{0}” 分类信息删除成功", category.Name);
            }
            else
            {
                TempData["error"] = msg;
            }
            return RedirectToAction("CategoryIndex");
        }
        public ActionResult CreateCategory()
        {
            return View("EditCategory", new Category());
        }
        public ActionResult ReaderIndex(int page=1)
        {
            List<Reader> reader=repository.Readers.ToList();
            return View(new ReaderListViewModel {
            readers=reader.Skip((page-1)*PageSize).Take(PageSize),
            pagingInfo = new PagingInfo
            {
                CurrentPage=page,
                ItemPerPage=PageSize,
                TotalItems=reader.Count
            }
            });
        }
        public ViewResult BorrowStatistics()
        {
            return View();
        }
        public ViewResult FineStatistics()
        {
            return View();
        }
        public ViewResult BorrowAnalysis()
        {
            List<Borrow> borrows = repository.Borrows.ToList();
            List<Book> books = repository.Books.ToList();
            BookBorrowCountModel countmodel = workHelp.BookBorrowCount(books, borrows);
            return View();
        }
        [HttpPost]
        public JsonResult BookBorrowCount()
        {
            List<Borrow> borrows = repository.Borrows.ToList();
            List<Book> books = repository.Books.ToList();
            return Json(workHelp.BookBorrowCount(books, borrows));
          
        }
        [HttpPost]
        public JsonResult CategoryBorrowCount()
        {
            List<Borrow> borrows = repository.Borrows.ToList();
            List<Category> categories=repository.Categories.ToList();
            return Json(workHelp.CategoryBorrowCount(categories,borrows));

        }
        [HttpPost]
        public JsonResult ReaderBorrowCount()
        {
            List<Borrow> borrows = repository.Borrows.ToList();
            List<Reader> readers = repository.Readers.ToList();
            return Json(workHelp.ReaderBorrowCount(readers,borrows));
        }
        [HttpPost]
        public JsonResult FineBookCount()
        {
            List<Book> books = repository.Books.ToList();
            List<Fine> fines = repository.Fines.ToList();
            return Json(workHelp.BookFineCount(books,fines));
        }
        [HttpPost]
        public JsonResult FineReaderCount()
        {
            List<Reader> readers = repository.Readers.ToList();
            List<Fine> fines = repository.Fines.ToList();
            return Json(workHelp.ReaderFineCount(readers,fines));
        }
        [HttpPost]
        public JsonResult BorrowChartDate(int len = 6)
        {
            var borrows = repository.Borrows;
            int[] nums = new int[len + 1];

            foreach (var borrow in borrows)
            {
                DateTime dt1 = DateTime.Now;
                DateTime dt2 = borrow.BorrowTime;
                var Month = (dt1.Year - dt2.Year) * 12 + (dt1.Month - dt2.Month);
                if (Month > len)
                {
                    continue;
                }
                nums[len - Month]++;
            }
            return Json(nums);
        }
    }
}