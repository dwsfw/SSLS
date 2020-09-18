using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Concrete;
using SSLS.Domain.Abstract;
namespace SSLS.WebUI.Models
{
    public class ResultModel
    {
        public IEnumerable<Book> books { get; set; }
        public DateTime nowtime { get; set; }
        public DateTime needtime { get; set; }
    }
}