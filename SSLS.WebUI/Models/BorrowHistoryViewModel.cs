using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Models
{
    public class BorrowHistoryViewModel
    {
        public IEnumerable<Borrow> Borrows { get; set; }
        public PagingInfo pagingInfo { get; set; }
    }
}