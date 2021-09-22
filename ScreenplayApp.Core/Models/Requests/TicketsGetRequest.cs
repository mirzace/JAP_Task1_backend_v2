using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Requests
{
    public class TicketsGetRequest
    {
        public DateTime Date { get; set; }
        public string Location { get; set; }
        public int ScreenplayId { get; set; }
        public int NumberOfTickets { get; set; }
    }
}
