using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Models
{
    public class ReaderListViewModel
    {
        public IEnumerable<Reader> readers { get; set; }
        public PagingInfo pagingInfo { get; set; }
    }
}