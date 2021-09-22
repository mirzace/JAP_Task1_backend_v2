using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Repositories
{
    public interface ITicketRepository
    {
        public Task<IEnumerable<TicketResponse>> GetTicketsAsync(TicketsGetRequest request);
        public Task<TicketResponse> UpdateTicketsAsync(UpdateTicketRequest request);
    }
}
