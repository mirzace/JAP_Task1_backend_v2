using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Requests
{
    public class LoginAccountRequest
    {
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
