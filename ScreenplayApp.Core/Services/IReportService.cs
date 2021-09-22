using ScreenplayApp.Core.Models;
using ScreenplayApp.Core.Models.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Services
{
    public interface IReportService
    {
        Task<IReadOnlyList<MostRatedMoviesReport>> GetMostRatedMoviesAsync();
        Task<IReadOnlyList<MostViewedMoviesForAPeriodReport>> GetMostViewedMoviesForAPeriodAsync(MostViewedMoviesGetRequest request);
        Task<IReadOnlyList<MostSoldMoviesWithoutRatingReport>> GetMostSoldMoviesWithoutRatingAsync();
    }
}
