using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScreenplayApp.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RatingsController : ControllerBase
    {
        private readonly IRatingService _ratingService;
        public RatingsController(IRatingService ratingService)
        {
            _ratingService = ratingService;
        }

        [HttpPost]
        public async Task<ActionResult<RatingInsertResponse>> AddRating(RatingInsertRequest request)
        {
            var response = await _ratingService.RateScreenplay(request);
            return Ok(response);
        }
    }
}
