using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Abstract;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Models
{
    public class ReaderModel
    {
        public Reader reader { get; set; }
        public int FineCount { get; set; }
    }
}