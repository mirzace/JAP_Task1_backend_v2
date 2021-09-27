using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class Ticket
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public int ScreenplayId { get; set; }
        [ForeignKey("ScreenplayId")]
        public Screenplay Screenplay { get; set; }
        public int? BookingId { get; set; }
        [ForeignKey("BookingId")]
        public Booking Booking { get; set; } = null;
        [DataType(DataType.Date)]
        public DateTime Date { get; set; }
        public bool IsAvailable { get; set; } = true;
        [StringLength(maximumLength: 255, MinimumLength = 3)]
        public string Location { get; set; }
    }
}
