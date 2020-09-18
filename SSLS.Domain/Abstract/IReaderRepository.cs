using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SSLS.Domain.Concrete;

namespace SSLS.Domain.Abstract
{
    public interface IReaderRepository
    {
        bool CreateBorrow(int[] checkon, Reader reader, Bookshelf bookshelf, out string msg);
        bool Register(string Name,string Email,string Password,string Phone, out string msg);
        bool ReturnBook(int id, Reader r, out string msg);
        bool PayFine(int id, Reader r, out string msg);
    }
}
