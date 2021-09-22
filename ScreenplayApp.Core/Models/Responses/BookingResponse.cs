using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Responses
{
    public class BookingResponse
    {
        public int Id { get; set; }
        public int AppUserId { get; set; }
        public int NumberOfTickets { get; set; }
        public int ScreenplayId { get; set; }
        public DateTime Date { get; set; }
        public string Location { get; set; }
    }
}
