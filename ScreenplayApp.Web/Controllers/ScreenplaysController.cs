using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ScreenplayApp.Core.Models;
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
    public class ScreenplaysController : ControllerBase
    {
        private readonly IScreenplayService _screenplayService;
        public ScreenplaysController(IScreenplayService screenplayService)
        {
        _screenplayService = screenplayService;
        }

        [HttpGet]
        public async Task<ActionResult<PagedList<ScreenplayResponse>>> GetScreenplays([FromQuery] ScreenplaysGetRequest screenplayParams)
        {
            var response = await _screenplayService.GetScreenplaysAsync(screenplayParams);
            return Ok(response);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<ScreenplayResponse>> GetScreenplay(int id)
        {
            var response = await _screenplayService.GetScreenplayAsync(id);
            return Ok(response);
        }
    }
}
