using AutoMapper;
using Microsoft.EntityFrameworkCore;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Infrastructure.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Repositories
{
    public class TicketRepository : ITicketRepository
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public TicketRepository(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<IEnumerable<TicketResponse>> GetTicketsAsync(TicketsGetRequest request)
        {
            var query = _context.Tickets.Include(t => t.Screenplay).AsQueryable();

            query = query.Where(x => x.Date == request.Date
               && x.Date > DateTime.Now && x.Location == request.Location
               && x.IsAvailable == true && x.Screenplay.Id == request.ScreenplayId).Take(request.NumberOfTickets);

            return _mapper.Map<IEnumerable<TicketResponse>>(await query.ToListAsync());
        }

        public async Task<TicketResponse> UpdateTicketsAsync(UpdateTicketRequest request)
        {
            var ticket = await _context.Tickets.SingleOrDefaultAsync(x => x.Id == request.Id);

            ticket.IsAvailable = request.IsAvailable;
            ticket.BookingId = request.BookingId;

            _context.Entry(ticket).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return _mapper.Map<TicketResponse>(ticket);
        }
    }
}
