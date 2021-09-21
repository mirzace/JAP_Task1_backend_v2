using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Requests
{
    public class ScreenplaysGetRequest
    {
        public string Category { get; set; } = "Movie";
        public string Search { get; set; }
        public int OlderThanYears { get; set; }
        public int NewerThanYear { get; set; }
        public int AtLeastStars { get; set; }
        public int ExactStars { get; set; }
        public int PageNumber { get; set; } = 1;
        public int PageSize { get; set; } = 50;
    }
}
