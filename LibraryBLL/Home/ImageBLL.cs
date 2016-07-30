﻿using LibraryCommon;
using LibraryDAL.Home;
using LibraryModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace LibraryBLL.Home
{
    public class ImageBLL
    {
        private string _ImagePath;
        private ImageDal dal = ImageDal.GetInstance();

        public ImageBLL(string ImagePath)
        {
            this._ImagePath = ImagePath;
        }

        public void AddImage(BookModel model)
        {
            ImageDal imagedal = ImageDal.GetInstance();
            imagedal.InsertFiles(model.Image);
        }

        /// <summary>
        /// 取得圖片路徑
        /// </summary>
        /// <returns></returns>
        public List<BookImgaeModel> GetImageList(BookModel model)
        {
            string no_pic = _ImagePath + "No_Pic.gif";
            List<BookImgaeModel> ImageList = dal.GetImagePath(model);
            if (ImageList.Count == 0)
            {
                ImageList.Add(new BookImgaeModel() { Image_Path = no_pic });
            }
            else
            {
                foreach (var item in ImageList)
                {
                    item.Image_Path = _ImagePath + item.Image_Path;
                }
            }
            return ImageList;
        }
    }
}