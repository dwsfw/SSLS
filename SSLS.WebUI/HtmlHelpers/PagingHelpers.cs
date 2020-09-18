using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SSLS.WebUI.Models;
using System.Text;
namespace SSLS.WebUI.HtmlHelpers
{
    public static class PagingHelpers
    {
        public static MvcHtmlString PageLinks(
            this HtmlHelper html,
            PagingInfo pagingInfo,
            Func<int, string> pageUrl)
        {
            StringBuilder result = new StringBuilder();
            TagBuilder li = new TagBuilder("li");
            TagBuilder tag = new TagBuilder("a");
            tag.MergeAttribute("href", pageUrl(pagingInfo.BeforePage));
            tag.InnerHtml = "&laquo;";
            li.InnerHtml = tag.ToString();
            result.Append(li.ToString());
            for (int i = 1; i <= pagingInfo.TotalPages; i++)
            {
                li = new TagBuilder("li");
                tag = new TagBuilder("a");
                tag.MergeAttribute("href", pageUrl(i));
                tag.InnerHtml = i.ToString();
                li.InnerHtml = tag.ToString();
                if (i == pagingInfo.CurrentPage)
                {
                    li.AddCssClass("active");
                }
                result.Append(li.ToString());
            }
            li = new TagBuilder("li");
            tag = new TagBuilder("a");
            tag.MergeAttribute("href", pageUrl(pagingInfo.NextPage));
            tag.InnerHtml = "&raquo;";
            li.InnerHtml = tag.ToString();
            result.Append(li.ToString());
            return MvcHtmlString.Create(result.ToString());
        }
    }
}