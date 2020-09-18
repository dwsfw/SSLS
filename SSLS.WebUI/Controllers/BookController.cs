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
    public class BookController : Controller
    {
        private IProductsRepository repository;
        public int Pagesize = 4;
        public BookController(IProductsRepository bookRepository)
        {
            this.repository = bookRepository;
        }
        // GET: Book
        public ActionResult Details(int id,string returnUrl)
        {
            Book book = repository.Books.FirstOrDefault(p => p.Id == id);
            return View(new BookDetail { 
            book=book,
            returnUrl=returnUrl
            });
        }
        public ActionResult List(int categoryId=0,int page=1,string key="")
        {
            ViewBag.key = key;
            IQueryable<Book> bookList = repository.Books;
            int cnt = 0;
            if(key!="")
            {
                cnt = 1;
                bookList = repository.Books.Where(p => p.Name.Contains(key));
            }
            if(categoryId>0)
            {
                if (cnt == 0)
                {
                    bookList = repository.Books.Where(p => p.Category_Id == categoryId);
                }
                else
                {
                    bookList = bookList.Where(p => p.Category_Id == categoryId);
                }
            }
            BooksListViewModel viewModel=new BooksListViewModel
            {
                Books=bookList.OrderBy(p => p.Id).Skip((page - 1) * Pagesize).Take(Pagesize),
                pagingInfo =new PagingInfo{
                    CurrentPage=page,
                    ItemPerPage=Pagesize,
                    TotalItems=bookList.Count()
                },
                CurrentCategoryId=categoryId,
                key=key
            };
            return View(viewModel);
        }
    }
}