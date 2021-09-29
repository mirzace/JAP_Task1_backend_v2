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
    public class RatingService : IRatingService
    {
        private readonly IRatingRepository _ratingRepository;
        private readonly IScreenplayRepository _screenplayRepository;
        public RatingService(IRatingRepository ratingRepository, IScreenplayRepository screenplayRepository)
        {
            _ratingRepository = ratingRepository;
            _screenplayRepository = screenplayRepository;
        }
        public async Task<RatingInsertResponse> RateScreenplay(RatingInsertRequest request)
        {
            if (request.Rate < 1 || request.Rate > 5) throw new BadRequestException("Rate must be between 1 and 5");
            if (request.ScreenplayId < 1) throw new BadRequestException("Invalid ScreenplayId");

            var response = await _ratingRepository.RateScreenplayAsync(request);
            if (response is null) throw new NotFoundException("Screenplay not found!");

            var screenplay = await _screenplayRepository.GetScreenplayAsync(request.ScreenplayId);
            response.averageRate = screenplay.AverageRate;

            return response;
        }
    }
}
