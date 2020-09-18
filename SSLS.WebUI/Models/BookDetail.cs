using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SSLS.Domain.Concrete;
namespace SSLS.WebUI.Models
{
    public class BookDetail
    {
        public Book book { get; set; }
        public string returnUrl { get; set; }
    }
}