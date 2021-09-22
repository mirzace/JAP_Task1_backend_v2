using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Services
{
    public interface ITicketService
    {
        public Task<IEnumerable<TicketResponse>> GetTicketsAsync(TicketsGetRequest request);
        public Task<TicketResponse> UpdateTicketsAsync(UpdateTicketRequest request);
    }
}
