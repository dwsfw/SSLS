using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SSLS.Domain.Abstract;

namespace SSLS.Domain.Concrete
{
    public class EFProductRepository : IProductsRepository
    {
        private SSLSEntities db = new SSLSEntities();
        private const int days = 30;
        public IQueryable<Book> Books
        {
            get
            {
                return db.Book;
            }
        }
        public IQueryable<Category> Categories
        {
            get { return db.Category; }
        }
        public IQueryable<Borrow> Borrows
        {
            get { return db.Borrow; }
        }
        public IQueryable<Reader> Readers
        {
            get
            {
                return db.Reader;
            }
        }
        public IQueryable<Fine> Fines
        {
            get
            {
                return db.Fine;
            }
        }
        public IQueryable<Admin> Admins
        {
            get
            {
                return db.Admin;
            }
        }
        public List<Book> Checkbook(int[] checkon)
        {
            List<Book> books = new List<Book>();
            foreach (int c in checkon)
            {
                Book b = db.Book.FirstOrDefault(e => e.Id == c);
                books.Add(b);
            }
            return books;
        }
        public int RenewBorrow(int id)
        {
            Borrow borrow;
            borrow = db.Borrow.Find(id);
            if (borrow != null)
            {
                if (borrow.NeedReturnTime > DateTime.Now)
                {
                    borrow.NeedReturnTime = borrow.NeedReturnTime.AddDays(days);
                    borrow.Renew = 1;
                    db.SaveChanges();
                    return 0;
                }
                return 1;
            }
            return 2;
        }
        public bool ChangePwd(Reader reader, string pwd)
        {
            Reader dbReader = db.Reader.Find(reader.Id);
            if (dbReader != null)
            {
                dbReader.Password = pwd;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public bool Recharge(Reader reader, decimal Price)
        {
            Reader dbReader = db.Reader.Find(reader.Id);
            if (dbReader != null)
            {
                dbReader.Balance += Price;
                reader.Balance += Price;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public bool EditReader(Reader reader, string Name, string Email, string Sex, string Classes, string Phone)
        {
            Reader dbReader = db.Reader.Find(reader.Id);
            if (dbReader != null)
            {
                dbReader.Name = Name;
                dbReader.Email = Email;
                dbReader.Classes= Classes;
                dbReader.Sex = Sex;
                dbReader.Phone = Phone;
                reader.Name = Name;
                reader.Email = Email;
                reader.Classes= Classes;
                reader.Sex= Sex;
                reader.Phone = Phone;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public bool SaveBook(Book book)
        {
            if(book.Id==0){
                book.Status = "在库";
                db.Book.Add(book);
                db.SaveChanges();
                return true;
            }
            Book dbbook;
            dbbook = db.Book.Find(book.Id);
            if (dbbook != null)
            {
                dbbook.Name = book.Name;
                dbbook.Press = book.Press;
                dbbook.Price = book.Price;
                dbbook.PublishDate = book.PublishDate;
                dbbook.Authors = book.Authors;
                dbbook.Category_Id = book.Category_Id;
                dbbook.Description = book.Description;
                dbbook.ImageUrl = book.ImageUrl;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public bool SaveCategory(Category category)
        {
            if (category.Id == 0)
            {
                db.Category.Add(category);
                db.SaveChanges();
                return true;
            }
            Category dbCategory;
            dbCategory = db.Category.Find(category.Id);
            if (dbCategory != null)
            {
                dbCategory.Name = category.Name;
                dbCategory.Description = category.Description;
                db.SaveChanges();
                return true;
            }
            return false;
        }
        public Book DeleteBook(int id,out string msg)
        {
            try
            {
                Book dbBook = db.Book.Find(id);
                if (dbBook != null)
                {
                    db.Book.Remove(dbBook);
                    db.SaveChanges();
                }
                msg = "删除成功";
                return dbBook;
            }
            catch(Exception ex)
            {
                msg = "异常，删除失败";
                return null;
            }
            
        }
        public Category DeleteCategory(int id,out string msg)
        {
            try
            {
                Category dbCategory = db.Category.Find(id);
                if (dbCategory != null)
                {
                    db.Category.Remove(dbCategory);
                    db.SaveChanges();
                }
                msg = "删除成功";
                return dbCategory;
            }
            catch(Exception ex)
            {
                msg = "异常，删除失败";
                return null;
            }
        }
    }
}