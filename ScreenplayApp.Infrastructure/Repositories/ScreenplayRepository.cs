using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;
using ScreenplayApp.Core.Entities;
using ScreenplayApp.Core.Enums;
using ScreenplayApp.Core.Models;
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
    public class ScreenplayRepository : IScreenplayRepository
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public ScreenplayRepository(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<ScreenplayResponse> GetScreenplayAsync(int id)
        {
            return _mapper.Map<ScreenplayResponse>(await _context.Screenplays.Include(s => s.Ratings)
                .SingleOrDefaultAsync(x => x.Id == id));
        }

        public async Task<PagedList<ScreenplayResponse>> GetScreenplaysAsync(ScreenplaysGetRequest request)
        {
            var query = _context.Screenplays
                .Include(s => s.Ratings)
                .Include(s => s.Actors)
                .AsQueryable();

            query = query.Where(x => x.Category == request.Category)
                .OrderByDescending(x => x.Ratings.Average(a => a.Rate));

            // Apply filters from search query
            GetFiltersFromSearch(ref request, ref query);

            if (!string.IsNullOrWhiteSpace(request.Search))
            {
                query = query.Where(s => s.Description.Contains(request.Search) || s.Title.Contains(request.Search));
            }

            return await CreateAsync(
                query.ProjectTo<ScreenplayResponse>(_mapper.ConfigurationProvider).AsNoTracking(),
                request.PageNumber, request.PageSize);
        }

        public static async Task<PagedList<ScreenplayResponse>> CreateAsync(IQueryable<ScreenplayResponse> source, int pageNumber, int pageSize)
        {
            var count = await source.CountAsync();
            var items = await source.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToListAsync();

            return new PagedList<ScreenplayResponse>(items, count, pageNumber, pageSize);
        }

        private void GetFiltersFromSearch(ref ScreenplaysGetRequest request, ref IQueryable<Screenplay> query)
        {
            bool stringEndsWithPhrase(string s, string phrase) =>
                s.EndsWith(phrase + "s", StringComparison.CurrentCultureIgnoreCase) ||
                s.EndsWith(phrase, StringComparison.CurrentCultureIgnoreCase) ? true : false;

            bool stringStarsWithPhrase(string s, string phrase) =>
                s.StartsWith(phrase, StringComparison.CurrentCultureIgnoreCase);

            // Get all words from search input
            if (!string.IsNullOrWhiteSpace(request.Search))
            {
                var searchWords = request.Search.Split(' ');

                try
                {
                    // Understand phrase like "5 stars"
                    if (searchWords.Count() == 2 && stringEndsWithPhrase(request.Search, "star"))
                    {
                        if (int.TryParse(searchWords[0], out int numberOfStars))
                        {
                            request.Search = null;
                            request.ExactStars = numberOfStars;

                            if (numberOfStars > 0 && numberOfStars <= 5)
                            {
                                query = query.Where(x => (int)x.Ratings.Average(r => r.Rate) == numberOfStars);
                            }
                        }
                    }

                    // Understand phrase like "at least 3 stars"
                    else if (searchWords.Count() == 4 && stringEndsWithPhrase(request.Search, "star")
                        && stringStarsWithPhrase(request.Search, "at least"))
                    {
                        if (int.TryParse(searchWords[2], out int atLeastStars))
                        {
                            request.Search = null;
                            request.AtLeastStars = atLeastStars;

                            if (request.AtLeastStars >= 0 && request.AtLeastStars <= 5)
                            {
                                query = query.Where(x => x.Ratings.Average(r => r.Rate) >= atLeastStars);
                            }
                        }
                    }

                    // Understand phrase like "after 2015"
                    else if (searchWords.Count() == 2 && stringStarsWithPhrase(request.Search, "after"))
                    {
                        if (int.TryParse(searchWords[1], out int year))
                        {
                            request.Search = null;
                            request.NewerThanYear = year;

                            if (request.NewerThanYear >= 0 && request.NewerThanYear <= DateTime.Today.Year)
                            {
                                query = query.Where(x => x.ReleaseDate.Year > year);
                            }
                        }
                    }

                    // Understand phrase like "older than 5 years"
                    else if (searchWords.Count() == 4 && stringEndsWithPhrase(request.Search, "year")
                        && stringStarsWithPhrase(request.Search, "older than"))
                    {
                        if (int.TryParse(searchWords[2], out int olderThanYears))
                        {
                            request.Search = null;
                            request.OlderThanYears = olderThanYears;

                            if (request.OlderThanYears >= 0)
                            {
                                query = query.Where(x => x.ReleaseDate.Year <= DateTime.Now.AddYears(olderThanYears * (-1)).Year);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new ApplicationException(ex.Message);
                }
            }
        }
    }
}
