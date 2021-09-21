using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ScreenplayApp.Core.Entities;
using ScreenplayApp.Core.Exceptions;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Services
{
    public class AccountService : IAccountService
    {
        private readonly IMapper _mapper;
        private readonly ITokenService _tokenService;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _singInManager;

        public AccountService(UserManager<AppUser> userManager, SignInManager<AppUser> singInManager, ITokenService tokenService, IMapper mapper)
        {
            _userManager = userManager;
            _singInManager = singInManager;
            _tokenService = tokenService;
            _mapper = mapper;
        }

        public async Task<AccountResponse> Register(RegisterAccountRequest request)
        {
            if (await UserExists(request.UserName)) throw new BadRequestException("User exists");

            var user = _mapper.Map<AppUser>(request);
            if (user is null) throw new ApplicationException("Issue with mapper");

            user.UserName = request.UserName.ToLower();

            var result = await _userManager.CreateAsync(user, request.Password);
            var roleResult = await _userManager.AddToRoleAsync(user, "Consumer");

            return new AccountResponse
            {
                UserName = user.UserName,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Token = await _tokenService.CreateToken(user)
            };
        }

        public async Task<AccountResponse> Login(LoginAccountRequest request)
        {
            // Make repo here
            var user = await _userManager.Users
               .SingleOrDefaultAsync(x => x.UserName == request.UserName.ToLower());

            if (user is null) throw new BadRequestException("Invalid username");

            var result = await _singInManager.CheckPasswordSignInAsync(user, request.Password, false);
            if (!result.Succeeded) throw new ForbiddenAccessException("Unauthorized");

            return new AccountResponse
            {
                UserName = user.UserName,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Token = await _tokenService.CreateToken(user)
            };
        }

        private async Task<bool> UserExists(string username)
        {
            return await _userManager.Users.AnyAsync(x => x.UserName == username.ToLower());
        }
    }
}
