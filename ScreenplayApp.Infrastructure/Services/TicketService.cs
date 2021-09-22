using ScreenplayApp.Core.Exceptions;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Services
{
    public class TicketService : ITicketService
    {
        private readonly ITicketRepository _ticketRepository;
        public TicketService(ITicketRepository ticketRepository)
        {
            _ticketRepository = ticketRepository;
        }

        public async Task<IEnumerable<TicketResponse>> GetTicketsAsync(TicketsGetRequest request)
        {
            if (request.NumberOfTickets < 0) throw new BadRequestException("Invalid number of tickets");
            if (request.Date < DateTime.Now) throw new BadRequestException("Invalid date");

            var tickets = await _ticketRepository.GetTicketsAsync(request);
            if (tickets is null) throw new NotFoundException("Tickets are not available");

            return tickets;
        }

        public async Task<TicketResponse> UpdateTicketsAsync(UpdateTicketRequest request)
        {
            return await _ticketRepository.UpdateTicketsAsync(request);
        }
    }
}
