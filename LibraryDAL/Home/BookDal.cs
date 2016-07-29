﻿using Dapper;
using LibraryModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryDAL.Home
{
    public class BookDal
    {
        private static BookDal _Insetance = null;
        private IDbConnection _Conn = GetConn.GetInstance();

        /// <summary>
        /// 使用單例模式
        /// </summary>
        private BookDal()
        { }

        /// <summary>
        /// 單例模式 取得實體
        /// </summary>
        /// <returns></returns>
        public static BookDal GetInstance()
        {
            if (_Insetance == null)
                _Insetance = new BookDal();
            return _Insetance;
        }

        /// <summary>
        /// 創建新的資料
        /// </summary>
        /// <param name="model"></param>
        public void Add(BookModel model)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("insert into Library_Book");
            sb.AppendLine("(BookLanguage,bookName,summary,BookType,create_time)");
            sb.AppendLine("value");
            sb.AppendLine("(@BookLanguage,@bookName,@summary,@BookType,@create_time)");
            _Conn.Execute(sb.ToString(),
                new
                {
                    BookLanguage = model.BookLanguage,
                    bookName = model.bookName,
                    summary = model.summary,
                    BookType = model.BookType,
                    create_time = model.create_time
                });
        }

        /// <summary>
        /// 刪除一本書
        /// </summary>
        /// <param name="model">要刪除的實體</param>
        public void Delete(BookModel model)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("delete Library_Book");
            sb.AppendLine("where id=@id");
            _Conn.Execute(sb.ToString(), new { id = model.id });
        }

        /// <summary>
        /// 取得目前在資料庫中的書
        /// </summary>
        /// <param name="SqlStr"></param>
        /// <param name="parameter"></param>
        /// <returns></returns>
        public List<BookModel> GetList(string SqlStr,
            BookSearch_ViewModel parameter)
        {
            return _Conn.Query<BookModel>(SqlStr, parameter).ToList();
        }

        /// <summary>
        /// 修改書的資訊
        /// </summary>
        /// <param name="model"></param>
        public void Modify(BookModel model)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("update Library_Book set");
            sb.AppendLine("BookLanguage=@BookLanguage");
            sb.AppendLine("bookName=@bookName");
            sb.AppendLine("summary=@summary");
            sb.AppendLine("BookType=@BookType");
            sb.AppendLine("where id=@id");
            _Conn.Execute(sb.ToString(), new { id = model.id });
        }
    }
}