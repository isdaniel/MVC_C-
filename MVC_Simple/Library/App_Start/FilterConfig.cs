﻿using System.Web;
using System.Web.Mvc;

namespace Library
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            //filters.Add(new HandleErrorAttribute());
            filters.Add(new infrastructure.CustomerErrorAtrribute());
            filters.Add(new Authorize.CustomAuthorizeAttribute());
        }
    }
}