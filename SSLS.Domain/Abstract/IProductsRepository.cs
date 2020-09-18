using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SSLS.Domain.Concrete;
namespace SSLS.Domain.Abstract
{
    public interface IProductsRepository
    {
        IQueryable<Book> Books { get; }
        IQueryable<Category> Categories { get; }
        IQueryable<Reader> Readers { get; }
        IQueryable<Borrow> Borrows { get; }
        IQueryable<Fine> Fines { get; }
        IQueryable<Admin> Admins { get; }
        int RenewBorrow(int id);
        List<Book> Checkbook(int[] checkon);
        bool ChangePwd(Reader reader,string pwd);
        bool Recharge(Reader reader, decimal Price);
        bool EditReader(Reader reader, string Name, string Email, string Sex, string Classes, string Phone);
        bool SaveBook(Book book);
        bool SaveCategory(Category category);
        Book DeleteBook(int id,out string msg);
        Category DeleteCategory(int id,out string msg);
    }
}
