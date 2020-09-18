using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSLS.WebUI.Models
{
    public class BookBorrowCountModel
    {
        public string[] categories { get; set; }
        public int[] data { get; set; }
    }
}