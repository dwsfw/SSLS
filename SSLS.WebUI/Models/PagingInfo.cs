using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SSLS.WebUI.Models
{
    public class PagingInfo
    {
        /// <summary>
        /// 总数量
        /// </summary>
        public int TotalItems { get; set; }
        /// <summary>
        /// 每页数量
        /// </summary>
        public int ItemPerPage { get; set; }
        /// <summary>
        /// 当前页码
        /// </summary>
        public int CurrentPage { get; set; }
        /// <summary>
        /// 往前一页
        /// </summary>
        public int BeforePage
        {
            get
            {
                if (CurrentPage > 1)
                    return CurrentPage - 1;
                else
                    return 1;
            }
        }
        /// <summary>
        /// 往后一页
        /// </summary>
        public int NextPage
        {
            get
            {
                if (CurrentPage < TotalPages)
                    return CurrentPage + 1;
                else
                    return TotalPages;
            }
        }
        /// <summary>
        /// 总页数
        /// </summary>
        public int TotalPages
        {
            get
            {
                return (int)Math.Ceiling((decimal)TotalItems / ItemPerPage);
            }
        }
    }
}