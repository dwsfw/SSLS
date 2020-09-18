using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SSLS.Domain.Concrete
{
    public class Bookshelf
    {
        private List<BookshelfLine> LineCollection = new List<BookshelfLine>();
        public void AddItem(Book book,int quantity)
        {
            BookshelfLine line = LineCollection.Where(e => e.Book.Id == book.Id).FirstOrDefault();
            if (line == null)
            {
                LineCollection.Add(new BookshelfLine { Book = book, Quantity = quantity });
            }
        }
        public void Clear()
        {
            LineCollection.Clear();
        }
        public decimal? ComputeTotalValue()
        {
            return LineCollection.Sum(e => e.Book.Price * e.Quantity);
        }
        public IEnumerable<BookshelfLine> Lines
        {
            get { return LineCollection; }
        }
        public void RemoveLine(Book book)
        {
            LineCollection.RemoveAll(e => e.Book.Id == book.Id);
        }
    }
}
