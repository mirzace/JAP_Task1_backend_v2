using ScreenplayApp.Core.Exceptions;
using ScreenplayApp.Core.Models;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Services
{
    public class ReportService : IReportService
    {
        private readonly IReportRepository _reportRepository;

        public ReportService(IReportRepository reportRepository)
        {
            _reportRepository = reportRepository;
        }

        public async Task<IReadOnlyList<MostRatedMoviesReport>> GetMostRatedMoviesAsync()
        {
            var report = await _reportRepository.GetMostRatedMoviesAsync();
            if (report is null) throw new NotFoundException("No data found in this report!");

            return report;
        }

        public async Task<IReadOnlyList<MostSoldMoviesWithoutRatingReport>> GetMostSoldMoviesWithoutRatingAsync()
        {
            var report =  await _reportRepository.GetMostSoldMoviesWithoutRatingAsync();
            if (report is null) throw new NotFoundException("No data found in this report!");

            return report;
        }

        public async Task<IReadOnlyList<MostViewedMoviesForAPeriodReport>> GetMostViewedMoviesForAPeriodAsync(MostViewedMoviesGetRequest request)
        {
            if (request.StartDate < request.EndDate) throw new BadRequestException("End date can not be greather than start date!");
            
            var report = await _reportRepository.GetMostViewedMoviesForAPeriodAsync(request.StartDate, request.EndDate);
            if (report is null) throw new NotFoundException("No data found in this report!");

            return report;
        }
    }
}
