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
        public RatingService(IRatingRepository ratingRepository)
        {
            _ratingRepository = ratingRepository;
        }
        public async Task<RatingInsertResponse> RateScreenplay(RatingInsertRequest request)
        {
            if (request.Rate < 1 || request.Rate > 5) throw new BadRequestException("Rate must be between 1 and 5");
            if (request.ScreenplayId < 1) throw new BadRequestException("Invalid ScreenplayId");

            var response = await _ratingRepository.RateScreenplayAsync(request);
            if (response is null) throw new NotFoundException("Screenplay not found!");

            return response;
        }
    }
}
