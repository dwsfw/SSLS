using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.WebUI.Models;
using SSLS.WebUI.Infrastructure.Abstract;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Infrastructure.Concrete
{
    public class databaseWorkHelp:IWorkHelp
    {
        SSLSEntities db = new SSLSEntities();
        public BookBorrowCountModel BookBorrowCount(List<Book> books,List<Borrow> borrows)
        {
            int[] data = new int[books.Count];
            string[] categories = new string[books.Count];
            int cnt = 0;
            foreach (var book in books)
            {
                data[cnt] = db.Borrow.Count(e => e.Book_Id == book.Id);
                categories[cnt] = book.Name;
                cnt++;
            }
            BookBorrowCountModel countmodel = new BookBorrowCountModel();
            countmodel.categories = categories.ToArray();
            countmodel.data = data.ToArray();
            return countmodel;
        }
        public BookBorrowCountModel CategoryBorrowCount(List<Category> categories, List<Borrow> borrows)
        {
            int[] data = new int[categories.Count];
            string[] categoriesname = new string[categories.Count];
            int cnt = 0;
            foreach (var category in categories)
            {
                data[cnt] = db.Borrow.Count(e => e.Book.Category_Id == category.Id);
                categoriesname[cnt] = category.Name;
                cnt++;
            }
            BookBorrowCountModel countmodel = new BookBorrowCountModel();
            countmodel.categories = categoriesname.ToArray();
            countmodel.data = data.ToArray();
            return countmodel;
        }
        public BookBorrowCountModel ReaderBorrowCount(List<Reader> readers, List<Borrow> borrows)
        {
            int[] data = new int[readers.Count];
            string[] categoriesname = new string[readers.Count];
            int cnt = 0;
            foreach (var reader in readers)
            {
                data[cnt] = db.Borrow.Count(e => e.Reader_Id == reader.Id);
                categoriesname[cnt] = reader.Name;
                cnt++;
            }
            BookBorrowCountModel countmodel = new BookBorrowCountModel();
            countmodel.categories = categoriesname.ToArray();
            countmodel.data = data.ToArray();
            return countmodel;
        }
        public BookBorrowCountModel BookFineCount(List<Book> books, List<Fine> fines)
        {
            int cnt = 0;
            int[] data = new int[books.Count];
            string[] categories = new string[books.Count];
            foreach (var book in books)
            {
                data[cnt] = db.Fine.Count(e => e.Borrow.Book_Id == book.Id);
                categories[cnt] = book.Name;
                cnt++;
            }
            BookBorrowCountModel countmodel = new BookBorrowCountModel();
            countmodel.categories = categories.ToArray();
            countmodel.data = data.ToArray();
            return countmodel;
        }
        public BookBorrowCountModel ReaderFineCount(List<Reader> readers, List<Fine> fines)
        {
            int cnt = 0;
            int[] data = new int[readers.Count];
            string[] categories = new string[readers.Count];
            foreach (var reader in readers)
            {
                data[cnt] = db.Fine.Count(e => e.Reader_Id == reader.Id);
                categories[cnt] = reader.Name;
                cnt++;
            }
            BookBorrowCountModel countmodel = new BookBorrowCountModel();
            countmodel.categories = categories;
            countmodel.data = data;
            return countmodel;
        }
    }
}