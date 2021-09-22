using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Repositories
{
    public interface IBookingRepository
    {
        Task<BookingResponse> CreateBookingAsync(BookingInsertRequest request);
    }
}
