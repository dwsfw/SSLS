using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SSLS.WebUI.Models
{
    public class AdminLoginViewModel
    {
        [Required(ErrorMessage = "请输入用户名")]
        public string userName { get; set; }
        [Required(ErrorMessage = "请输入密码")]

        [DataType(DataType.Password)]

        [Display(Name = "密码")]
        public string Password { get; set; }
    }
}