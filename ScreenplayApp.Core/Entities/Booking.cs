using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class Booking
    {
        [Key]
        public int Id { get; set; }
        public ICollection<Ticket> Tickets { get; set; }
        [Required]
        public AppUser AppUser { get; set; }
    }
}
