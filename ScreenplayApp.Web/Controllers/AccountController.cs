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
    public class AccountController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public AccountController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpPost("register")]
        public async Task<ActionResult<AccountResponse>> Register(RegisterAccountRequest request)
        {
            var response = await _accountService.Register(request);
            return Ok(response);
        }

        [HttpPost("login")]
        public async Task<ActionResult<AccountResponse>> Login(LoginAccountRequest request)
        {
            var response = await _accountService.Login(request);
            return Ok(response);
        }
    }
}
