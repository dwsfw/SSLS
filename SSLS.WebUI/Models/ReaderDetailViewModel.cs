using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Models
{
    public class ReaderDetailViewModel
    {
        public Reader reader { get; set; }
        public IEnumerable<Borrow> borrows { get; set; }
        public IEnumerable<Fine> fines { get; set; }
    }
}