using AutoMapper;
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
    public class RatingRepository : IRatingRepository
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        public RatingRepository(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<RatingInsertResponse> RateScreenplayAsync(RatingInsertRequest request)
        {
            var rating = new Rating
            {
                Rate = request.Rate,
                ScreenplayId = request.ScreenplayId
            };
            _context.Ratings.Add(rating);
            await _context.SaveChangesAsync();
            return _mapper.Map<RatingInsertResponse>(rating);
        }
    }
}
