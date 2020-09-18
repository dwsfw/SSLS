using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.Domain.Abstract;
namespace SSLS.WebUI.Infrastructure
{
    public static class Utils
    {
        public static string GetImageSaveName(string rawFileName)
        {
            Random TempInt = new Random();
            byte[] result = System.Text.Encoding.Default.GetBytes(TempInt.Next().ToString());
            System.Security.Cryptography.MD5 md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] output = md5.ComputeHash(result);
            String randomString = BitConverter.ToString(output).Replace("-", "").Substring(0, 4);
            string fileExtName = Path.GetExtension(rawFileName);
            string fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + randomString;
            return fileName + fileExtName;
        }
        public static IEnumerable<SelectListItem> GetCategorySelectList(IProductsRepository repository)
        {
            return repository.Categories.ToList().Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name });
        }
    }
}