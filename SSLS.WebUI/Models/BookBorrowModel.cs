using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Abstract;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Models
{
    public class BookBorrowModel
    {
        public Book book { get; set; }
        public Borrow borrow { get; set; }
    }
}