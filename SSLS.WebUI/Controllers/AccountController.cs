using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Abstract;
using SSLS.Domain.Concrete;
using System.Drawing;
using SSLS.WebUI.Models;
namespace SSLS.WebUI.Controllers
{
    public class AccountController : Controller
    {
        private IProductsRepository repository;
        public AccountController(IProductsRepository bookRpository)
        {
            this.repository = bookRpository;
        }
        // GET: Account
        public ActionResult Index()
        {
            return View();
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
        public ActionResult Login(AdminLoginViewModel model, string returnUrl, string code)
        {
            if (ModelState.IsValid)
            {
                if (Session["check"].ToString() == code)
                {
                    Admin AdminEntry = repository.Admins.FirstOrDefault(c => c.UserName == model.userName
                        && c.Password == model.Password);
                    if (AdminEntry != null)
                    {
                        HttpContext.Session["Admin"] = AdminEntry;
                        TempData["success"] = "欢迎你," + AdminEntry.UserName;
                        return Redirect(returnUrl ?? Url.Action("BookIndex", "Admin"));
                    }
                    else
                    {
                        ModelState.AddModelError("pwderror", "用户名或密码不正确！");
                        return View();
                    }
                }
                else
                {
                    ModelState.AddModelError("codeerror", "验证码不正确");
                    return View();
                }
            }
            return View();

        }
        public ActionResult LoginOut()
        {
            Session.Abandon();
            return Redirect(Url.Action("Login", "Account"));
        }
    }
}