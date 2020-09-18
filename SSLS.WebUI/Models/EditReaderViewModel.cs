using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SSLS.WebUI.Models
{
    public class EditReaderViewModel
    {
        public string Name { get; set; }
        public string Sex { get; set; }
        [Required(ErrorMessage = "请输入电话")]

        [StringLength(11, ErrorMessage = "{0} 必须包含 {2} 个数字。", MinimumLength = 11)]

        [DataType(DataType.PhoneNumber)]

        [Display(Name = "电话")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "请输入邮箱")]
        [RegularExpression(".+\\@.+\\..+", ErrorMessage = "请输入正确的Email格式")]
        public string Email { get; set; }
        public string Classes { get; set; }
    }
}