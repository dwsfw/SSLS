using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SSLS.WebUI.Models
{
    public class ChangePwdViewModel
    {
        [Required(ErrorMessage="请输入原密码")]
        public string OldPwd { get; set; }
        [Required(ErrorMessage = "请输入新密码")]

        [StringLength(100, ErrorMessage = "{0} 必须至少包含 {2} 个字符。", MinimumLength = 3)]

        [DataType(DataType.Password)]

        [Display(Name = "新密码")]
        public string NewPwd { get; set; }
        [DataType(DataType.Password)]

        [Display(Name = "确认密码")]

        [Compare("NewPwd", ErrorMessage = "密码和确认密码不匹配。")]
        public string NewPwdAgain { get; set; }
    }
}