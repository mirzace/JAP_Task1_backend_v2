using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Responses
{
    public class TicketResponse
    {
        public int Id { get; set; }
        public int ScreenplayId { get; set; }
        public int? BookingId { get; set; }
        public DateTime Date { get; set; }
        public bool IsAvailable { get; set; } = true;
        public string Location { get; set; }
    }
}
