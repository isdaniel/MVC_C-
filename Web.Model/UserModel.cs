using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
namespace MyWeb.Model
{
    [MetadataType(typeof(Validate_UserInfo))]
    public partial class UserModel
    {
        public string user_txt { get; set; }
        public string password_txt { get; set; }
    }
    public class Validate_UserInfo
    {
        [Required(ErrorMessage = "帳號不能為空")]
        public string user_txt { get; set; }
        [StringLength(10, ErrorMessage = "最多10個個字")]
        [Required(ErrorMessage = "密碼不能為空")]
        public string password_txt { get; set; }
    }
}
