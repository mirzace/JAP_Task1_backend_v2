﻿using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ScreenplayApp.Core.Mapper;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Core.Services;
using ScreenplayApp.Infrastructure.Data;
using ScreenplayApp.Infrastructure.Repositories;
using ScreenplayApp.Infrastructure.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ScreenplayApp.Web.Extensions
{
    public static class ApplicationServiceExtensions
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services, IConfiguration configuration)
        {
            // Services
            services.AddSingleton<ILoggerManager, LoggerManager>();
            services.AddScoped<IAccountService, AccountService>();
            services.AddScoped<ITokenService, TokenService>();
            services.AddScoped<IScreenplayService, ScreenplayService>();
            services.AddScoped<IRatingService, RatingService>();

            // Repositories
            services.AddScoped<IRatingRepository, RatingRepository>();
            services.AddScoped<IScreenplayRepository, ScreenplayRepository>();

            // AutoMapper
            services.AddAutoMapper(typeof(AutoMapperProfiles).Assembly);

            services.AddDbContext<DataContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            });

            return services;
        }
    }
}