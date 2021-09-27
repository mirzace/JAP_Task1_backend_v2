using Microsoft.AspNetCore.Identity;
using ScreenplayApp.Core.Entities;
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
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;
        private readonly ITicketService _ticketService;
        private readonly UserManager<AppUser> _userManager;
        public BookingService(IBookingRepository bookingRepository, ITicketService ticketService, UserManager<AppUser> userManager)
        {
            _bookingRepository = bookingRepository;
            _ticketService = ticketService;
            _userManager = userManager;
        }

        public async Task<BookingResponse> CreateBookingAsync(BookingInsertRequest request)
        {
            var ticketParams = new TicketsGetRequest
            {
                ScreenplayId = request.ScreenplayId,
                Date = request.Date,
                Location = request.Location,
                NumberOfTickets = request.NumberOfTickets
            };

            // Get available tickets
            var tickets = await _ticketService.GetTicketsAsync(ticketParams);

            var booking = await _bookingRepository.CreateBookingAsync(request);

            // Update tickets
            foreach (var ticket in tickets)
            {
                var updateTicketRequest = new UpdateTicketRequest
                {
                    IsAvailable = false,
                    BookingId = booking.Id,
                    Id = ticket.Id
                };
                await _ticketService.UpdateTicketsAsync(updateTicketRequest);
            }

            return booking;
            //return await _bookingRepository.CreateBookingAsync(request);
        }
    }
}
