using SSLS.Domain.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SSLS.WebUI.Filters
{
    // 继承 AuthorizeAttribute 专门用于判断权限的 还有过滤器 但是其他类型是在参数绑定只会才运行的 用于判断action 处理前 以及处理之后
    public class LoginNeedAttribute : AuthorizeAttribute
    {
        // 重载 验证方法
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            //如果Session中不存在该值，那么表示没有登录
            Reader temp_reader = (Reader)filterContext.HttpContext.Session["Reader"];

            // 获取 读者 id 并且判断读者id 是否为空
            if (temp_reader == null)
            {
                filterContext.Result = new RedirectResult("/Reader/Login");
                return;
            }

            // 从数据库中读取用户 并检测用户是否为空
            SSLSEntities db = new SSLSEntities();
            // AsNoTracking EF 查询的时候可以不被缓存下来，避免数据不是最新的
            Reader reader = db.Reader.AsNoTracking().FirstOrDefault(r => r.Id == temp_reader.Id);

            if (reader == null)
            {
                // 如果不满足 条件 则 设置 上下文的结果为 重定向到登入界面
                filterContext.Result = new RedirectResult("/Reader/Login");

                // 这里 new 一个读者对象是为了兼容 之前的代码
                reader = new Reader();
            }

            // 用于 上下文中的数据 传递 （官方推荐）
            filterContext.HttpContext.Items["reader"] = reader;
        }
    }
}