﻿using LibraryModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace LibraryCommon
{
    public class UploadFileHelper
    {
        /// <summary>
        /// 檔案
        /// </summary>
        private IEnumerable<HttpPostedFileBase> _Files;

        /// <summary>
        /// 圖片的資料夾位置
        /// </summary>
        private string _ImagePath;

        /// <summary>
        /// 將Html的files填入
        /// </summary>
        /// <param name="files"></param>
        public UploadFileHelper(IEnumerable<HttpPostedFileBase> files, string path)
        {
            this._Files = files;
            this._ImagePath = path;
            _FilesName = new List<string>();
        }

        /// <summary>
        /// 全部的檔名
        /// </summary>
        public List<string> _FilesName { private set; get; }

        /// <summary>
        /// 將圖片路徑塞入BookImgaeModel組中
        /// </summary>
        /// <param name="files"></param>
        /// <returns></returns>
        public List<BookImgaeModel> BookAddImagePath(int bookId)
        {
            List<BookImgaeModel> list = new List<BookImgaeModel>();
            foreach (var file in _FilesName)
            {
                list.Add(new BookImgaeModel()
                {
                    Image_Path = file,
                    BookId = bookId
                });
            }
            return list;
        }

        /// <summary>
        /// 將圖片存在path中
        /// </summary>
        public void SaveImage()
        {
            foreach (var file in _Files)
            {
                if (file != null)
                {
                    string ReanderTime =
                      DateTime.Now.Millisecond.ToString() +
                      DateTime.Now.Minute.ToString();
                    var fileName = Path.GetFileName(ReanderTime + file.FileName);
                    _FilesName.Add(fileName);
                    var path = Path.Combine(_ImagePath, fileName);
                    file.SaveAs(path);
                }
            }
        }
    }
}