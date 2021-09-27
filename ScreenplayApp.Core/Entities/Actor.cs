using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class Actor
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(maximumLength: 255, MinimumLength = 3)]
        public string FirstName { get; set; }
        [Required]
        [StringLength(maximumLength: 255, MinimumLength = 3)]
        public string LastName { get; set; }
        public ICollection<Screenplay> Screenplays { get; set; }
    }
}
