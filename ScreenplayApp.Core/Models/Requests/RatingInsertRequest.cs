using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Requests
{
    public class RatingInsertRequest 
    {
        public int Rate { get; set; }
        public int ScreenplayId { get; set; }
    }
}
