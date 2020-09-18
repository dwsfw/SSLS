using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SSLS.WebUI.Models;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Infrastructure.Abstract
{
    public interface IWorkHelp
    {
        BookBorrowCountModel BookBorrowCount(List<Book> books, List<Borrow> borrows);
        BookBorrowCountModel CategoryBorrowCount(List<Category> categories, List<Borrow> borrows);
        BookBorrowCountModel ReaderBorrowCount(List<Reader> readers, List<Borrow> borrows);
        BookBorrowCountModel BookFineCount(List<Book> books, List<Fine> fines);
        BookBorrowCountModel ReaderFineCount(List<Reader> readers, List<Fine> fines);

    }
}
