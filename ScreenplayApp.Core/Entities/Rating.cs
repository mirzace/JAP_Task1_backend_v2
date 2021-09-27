using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class Rating
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Range(1, 5)]
        public int Rate { get; set; }
        [Required]
        public int ScreenplayId { get; set; }
        [ForeignKey("ScreenplayId")]
        public Screenplay Screenplay { get; set; }
    }
}
