using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Exceptions
{
    public class ApiException
    {
        public ApiException()
        {
        }

        public ApiException(string message)
        {
            Message = message;
        }

        public ApiException(string message, Exception inner)
        {
            Message = message;
            Details = inner.StackTrace;
        }

        public ApiException(int statusCode, string message = null, string details = null)
        {
            StatusCode = statusCode;
            Message = message;
            Details = details;
        }

        public int StatusCode { get; set; } = 500;
        public string Message { get; set; } = "Internal Server Error";
        public string Details { get; set; }
    }
}
