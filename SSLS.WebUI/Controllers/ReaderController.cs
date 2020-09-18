using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Concrete;
using SSLS.Domain.Abstract;
using SSLS.WebUI.Models;
using System.Drawing;
using SSLS.WebUI.Filters;
namespace SSLS.WebUI.Controllers
{
    public class ReaderController : Controller
    {
        private IProductsRepository repository;
        private IReaderRepository readerRepository;
        public int Pagesize = 4;
        public ReaderController(IProductsRepository bookRepository,IReaderRepository readerRepository)
        {
            this.readerRepository = readerRepository;
            this.repository = bookRepository;
        }
        //验证码
        public ContentResult CheckCode()
        {
            ContentResult cr = new ContentResult();
            cr.ContentType = "image/JPEG";//定义图片类型
            Random r = new Random();
            string code = r.Next(1000, 9999).ToString();//取随机数
            Session["check"] = code;
            Bitmap map = new Bitmap(60, 30);//定义大小
            Graphics g = Graphics.FromImage(map);//画图
            g.FillRectangle(Brushes.White, 1, 1, 58, 28);//定义矩形
            g.DrawString(code, new Font("微软雅黑", 16), Brushes.Black, new PointF(1, 1));//向矩形中绘入文字以及定义字体和大小
            for (int i = 0; i < 300; i++)
            {
                map.SetPixel(r.Next(1, 58), r.Next(1, 28), Color.Gray);
            }
            map.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);//保存到流中
            return cr;
        }
        //登录
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel model, string returnUrl,string code)
        {
                if (ModelState.IsValid)
                {
                    if(Session["check"].ToString()==code)
                    {
                        Reader readerEntry = repository.Readers.FirstOrDefault(c => c.Email == model.Email
                            && c.Password == model.Password);
                        if (readerEntry != null)
                        {
                            HttpContext.Session["Reader"] = readerEntry;
                            TempData["success"] = "欢迎你,"+readerEntry.Name;
                            return Redirect(returnUrl ?? Url.Action("List", "Book"));
                        }
                        else
                        {
                            ModelState.AddModelError("pwderror", "用户名或密码不正确！");
                            return View();
                        }
                    }
                    else{
                        ModelState.AddModelError("", "验证码不正确");
                        return View();
                    }
            }
            return View();

        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(RegisterViewModel model, Reader reader)
        {
            if (ModelState.IsValid)
            {
                string msg;
                bool flag = readerRepository.Register(model.Name, model.Email, model.Password, model.Phone, out msg);
                if (flag == true)
                {
                    TempData["success"] = msg;
                    TempData["Name"] = model.Email;
                    return RedirectToAction("Login");
                }
                else
                {
                    TempData["error"] = msg;
                }
            }
            return View();
        }
        //注销
        public ActionResult LoginOut()
        {
            Session.Abandon();
            return Redirect(Url.Action("List", "Book"));
        }
        [LoginNeed]
        public ViewResult Center(Reader reader)
        {
            return View(new ReaderDetailViewModel
            {
                reader = repository.Readers.FirstOrDefault(e => e.Id == reader.Id),
                borrows = repository.Borrows.Where(e => e.Reader_Id == reader.Id && e.BorrowStatu == "未归还").OrderByDescending(e => e.Id).Take(3),
                fines=repository.Fines.Where(e=>e.Reader_Id==reader.Id).OrderByDescending(e=>e.Id).Take(3)
            });
        }
        public PartialViewResult Summary(Reader reader)
        {
            int FineCount = repository.Fines.Count(e => e.PayFineTime == null);
            return PartialView(new ReaderModel {
                reader=reader,
                FineCount=FineCount
            });
        }
        [LoginNeed]
        public ViewResult ChangePwd()
        {
            return View();
        }
        [HttpPost]
        [LoginNeed]
        public ActionResult ChangePwd(Reader reader,ChangePwdViewModel Pwd )
        {
            if (ModelState.IsValid)
            {
                Reader dbreader=repository.Readers.FirstOrDefault(e=>e.Id==reader.Id);
                if(dbreader.Password==Pwd.OldPwd)
                {
                    if (repository.ChangePwd(reader, Pwd.NewPwd) == true)
                        TempData["success"] = "密码修改成功";
                    else TempData["error"] = "修改失败";
                    return RedirectToAction("Center");
                }
                else
                {
                    ModelState.AddModelError("pwderror", "原密码不正确！");
                    return View();
                }
            }
            return View();
        }
        [LoginNeed]
        public ActionResult EditReader(Reader reader)
        {
            return View(new EditReaderViewModel
            {
                Name = reader.Name,
                Email = reader.Email,
                Classes = reader.Classes,
                Phone = reader.Phone,
                Sex = reader.Sex
            });
        }
        [HttpPost]
        [LoginNeed]
        public RedirectToRouteResult EditToReader(Reader reader, EditReaderViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (repository.EditReader(reader, model.Name, model.Email, model.Sex, model.Classes, model.Phone) == true)
                    TempData["success"] = "信息修改成功";
                else TempData["error"] = "修改失败";
                return RedirectToAction("Center");
            }
            return RedirectToAction("EditReader");
        }
        [LoginNeed]
        public ViewResult Recharge(Reader reader)
        {
            return View(reader);
        }
        [HttpPost]
        [LoginNeed]
        public ActionResult Recharge(Reader reader,decimal Price)
        {
            if (Price == 0)
            {
                TempData["error"] = "请输入充值金额";
                return View(reader);
            }
            if (repository.Recharge(reader, Price) == true)
            {
                return RedirectToAction("Success");
            }
            else
            {
                TempData["error"] = "错误，充值失败";
                return View();
            }
        }
        [LoginNeed]
        public ViewResult Success()
        {
            return View();
        }
        [LoginNeed]
        public ActionResult MyBorrow(Reader reader)
        {
            List<Borrow> borrows = repository.Borrows.Where(e => e.Reader_Id == reader.Id&&e.BorrowStatu=="未归还").ToList();
            return View(borrows);
        }
        [LoginNeed]
        public ActionResult MyBorrowHistory(Reader reader,int page=1)
        {
            List<Borrow> borrows = repository.Borrows.Where(e => e.Reader_Id == reader.Id && e.BorrowStatu == "已归还").ToList();
            BorrowHistoryViewModel BorrowHistory = new BorrowHistoryViewModel
            {
                Borrows = borrows.Skip((page - 1) * Pagesize).Take(Pagesize),
                pagingInfo = new PagingInfo
                {
                    CurrentPage = page,
                    ItemPerPage = Pagesize,
                    TotalItems = borrows.Count
                }
            };
            return View(BorrowHistory);
        }
        [LoginNeed]
        public ActionResult RenewBook(int borrowid)
        {
            Borrow borrow = repository.Borrows.FirstOrDefault(e => e.Id == borrowid);
            return View(borrow);
        }
        [HttpPost]
        [LoginNeed]
        public ActionResult Renew(int borrowid,Reader reader)
        {
            if (repository.Readers.FirstOrDefault(e => e.Id == reader.Id).Fine.Count(p => p.PayFineTime == null) > 0)
            {
                TempData["error"] = string.Format("您还有罚款未缴纳，请先缴纳罚款在续借！！！");
                return Redirect(Url.Action("MyFine", "Reader"));
            }
            int a=repository.RenewBorrow(borrowid);
            if (a == 0)
            {
                TempData["success"] = string.Format("图书续借成功！！！");
                return RedirectToAction("MyBorrow");
            }
            else if (a == 1)
            {
                TempData["error"] = string.Format("图书已超期，无法续借！！！");
            }
            else
            {
                TempData["error"] = string.Format("没有该条借阅记录，请与管理员联系！！！");
            }
            return View("RenewBook");
        }
        [LoginNeed]
        public ActionResult ReturnBook(int borrowid)
        {
            Borrow borrow=repository.Borrows.FirstOrDefault(e=>e.Id==borrowid);
            Book book = repository.Books.FirstOrDefault(w => w.Id == borrow.Book_Id);
            return View(new BookBorrowModel
            {
                book=book,
                borrow=borrow
            });
        }
        [HttpPost]
        [LoginNeed]
        public ActionResult ReturnBook(int borrowid,Reader reader)
        {
            string msg;
            if (readerRepository.ReturnBook(borrowid, reader, out msg))
            {
                TempData["success"] = msg;
                return Redirect(Url.Action("Myborrow"));
            }
            else
            {

                TempData["error"] = msg;
                return View();
            }
        }
        [LoginNeed]
        public ActionResult MyFine(Reader reader)
        {
            if (reader.Id == 0)
            {
                return RedirectToAction("Login", new { returnUrl = Request.Url.PathAndQuery });
            }
            List<Fine> fines = repository.Fines.Where(e => e.Reader_Id == reader.Id).ToList();
            return View(fines);
        }
        [LoginNeed]
        public ActionResult FineDetails(int id)
        {
            Fine fine = repository.Fines.FirstOrDefault(e => e.Id == id);
            return View(fine);
        }
        [LoginNeed]
        public ActionResult PayFine(int id)
        {
            Fine fine = repository.Fines.FirstOrDefault(e => e.Id == id);
            return View(fine);
        }
        [HttpPost]
        public ActionResult PayFine(int id, Reader reader)
        {
            string msg;
            if (readerRepository.PayFine(id, reader, out msg))
            {
                TempData["success"] = msg;
                return Redirect(Url.Action("MyFine"));
            }
            else
            {

                TempData["error"] = msg;
                return View();
            }
        }

    }
}