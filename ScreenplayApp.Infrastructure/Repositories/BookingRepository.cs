using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ScreenplayApp.Core.Entities;
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
    public class BookingRepository : IBookingRepository
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly UserManager<AppUser> _userManager;

        public BookingRepository(DataContext context, IMapper mapper, UserManager<AppUser> userManager)
        {
            _context = context;
            _mapper = mapper;
            _userManager = userManager;
        }

        public async Task<BookingResponse> CreateBookingAsync(BookingInsertRequest request)
        {
            var booking = new Booking
            {
                AppUser = await _userManager.Users
                .SingleOrDefaultAsync(x => x.Id == request.AppUserId),                
            };

            await _context.Bookings.AddAsync(booking);
            await _context.SaveChangesAsync();
            return _mapper.Map<BookingResponse>(booking);
        }
    }
}
