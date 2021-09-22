using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Requests
{
    public class BookingInsertRequest
    {
        public int? AppUserId { get; set; }
        public string Location { get; set; }
        public DateTime Date { get; set; }
        public int ScreenplayId { get; set; }
        public int NumberOfTickets { get; set; }
    }
}
