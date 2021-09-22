using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Requests
{
    public class UpdateTicketRequest
    {
        public int Id { get; set; }
        public int? BookingId { get; set; }
        public bool IsAvailable { get; set; }
    }
}
