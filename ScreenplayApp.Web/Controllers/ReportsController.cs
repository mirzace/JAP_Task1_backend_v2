using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScreenplayApp.Core.Models;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScreenplayApp.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ReportsController : ControllerBase
    {
        private readonly IReportService _reportService;

        public ReportsController(IReportService reportService)
        {
            _reportService = reportService;
        }

        [HttpGet("most_rated_movies")]
        public async Task<ActionResult<IReadOnlyList<MostRatedMoviesReport>>> GetMostRatedMovies()
        {
            var response = await _reportService.GetMostRatedMoviesAsync();
            return Ok(response);
        }

        [HttpGet("most_sold_movies_without_rating")]
        public async Task<ActionResult<IReadOnlyList<MostSoldMoviesWithoutRatingReport>>> GetMostSoldMoviesWithoutRating()
        {
            var response = await _reportService.GetMostSoldMoviesWithoutRatingAsync();
            return Ok(response);
        }

        [HttpGet("most_viwed_movies_for_a_period")]
        public async Task<ActionResult<IReadOnlyList<MostViewedMoviesForAPeriodReport>>> GetMostViewedMoviesForAPeriod([FromQuery] MostViewedMoviesGetRequest request)
        {
            var response = await _reportService.GetMostViewedMoviesForAPeriodAsync(request);
            return Ok(response);
        }
    }
}
