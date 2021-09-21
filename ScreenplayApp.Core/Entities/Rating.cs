using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class Rating
    {
        public int Id { get; set; }
        [Required]
        public int Rate { get; set; }
        public int ScreenplayId { get; set; }
        public Screenplay Screenplay { get; set; }
    }
}
