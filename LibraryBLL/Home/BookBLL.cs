﻿using LibraryBLL.Home.SearchCondition;
using LibraryDAL;
using LibraryDAL.Home;
using LibraryModel;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace LibraryBLL
{
    public class BookBLL
    {
        private BookDal dal = BookDal.GetInstance();

        /// <summary>
        /// 新增一本書
        /// </summary>
        /// <param name="model"></param>
        public int Add(BookModel model)
        {
            return dal.Add(model);
        }

        /// <summary>
        /// 刪除書
        /// </summary>
        /// <param name="model"></param>
        public void Delete(BookModel model)
        {
            dal.Delete(model);
        }

        /// <summary>
        /// 修改書的資訊
        /// </summary>
        /// <param name="model"></param>
        public void Edit(BookModel model)
        {
            dal.Modify(model);
        }

        /// <summary>
        /// 取得所有書的資訊
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public List<BookModel> GetList(BookSearch_ViewModel model)
        {
            SearchConcrete concrete = new SearchConcrete(model);
            StringBuilder sb = new StringBuilder();
            concrete.SetCondition(new BookLanguage());
            string SqlString = concrete.Next();
            sb.AppendLine("select * from Library_Book");
            sb.AppendLine("where 1=1");
            sb.AppendLine(SqlString);
            return BookListViewModel(dal.GetList(sb.ToString(), model));
        }

        /// <summary>
        /// 取得所有參數
        /// </summary>
        /// <returns></returns>
        public List<ParameterModel> GetParameterList()
        {
            ParameterDal paraDal = ParameterDal.GetInstace();
            return paraDal.GetAllParameter();
        }

        private List<BookModel> BookListViewModel(List<BookModel> model)
        {
            ParameterDal paraDal = ParameterDal.GetInstace();
            List<ParameterModel> parameters = paraDal.GetAllParameter();
            var ViewModel = from item in model
                            join language in parameters
                            on item.BookLanguage equals language.English
                            join booktype in parameters
                            on item.BookType equals booktype.English
                            select new BookModel
                            {
                                BookLanguage = booktype.chinese,
                                BookType = language.chinese,
                                id = item.id,
                                summary = item.summary,
                                bookName = item.bookName,
                                create_time = item.create_time
                            };
            return ViewModel.ToList();
        }
    }
}