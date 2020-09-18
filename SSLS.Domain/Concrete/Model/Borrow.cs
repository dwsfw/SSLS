using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace SSLS.Domain.Concrete
{
    public partial class Borrow
    {
        public int CanRenew
        {
            get
            {
                if (BorrowStatu != "未归还")
                    return 1;
                if (Renew == 1)
                    return 2;
                if (NeedReturnTime < DateTime.Now)
                    return 3;
                return 0;
            }
        }
    }
}
