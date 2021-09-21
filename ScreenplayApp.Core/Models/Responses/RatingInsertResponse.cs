using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Responses
{
    public class RatingInsertResponse
    {
        public int Id { get; set; }
        public int Rate { get; set; }
        public int ScreenplayId { get; set; }
    }
}
