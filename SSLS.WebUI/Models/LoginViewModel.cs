﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
namespace SSLS.WebUI.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "请输入邮箱")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "请输入正确的Email格式")]
        public string Email { get; set; }
        [Required(ErrorMessage="请输入密码")]

        [StringLength(100, ErrorMessage = "{0} 必须至少包含 {2} 个字符。", MinimumLength = 3)]

        [DataType(DataType.Password)]

        [Display(Name = "密码")]
        public string Password { get; set; }
    }
}