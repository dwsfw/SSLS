using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SSLS.Domain.Concrete
{
    public class BookshelfLine
    {
        public Book Book { get; set; }
        public int Quantity { get; set; }
    }
}
