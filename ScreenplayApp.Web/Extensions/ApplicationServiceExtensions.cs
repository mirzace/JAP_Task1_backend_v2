using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using ScreenplayApp.Core.Mapper;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Core.Services;
using ScreenplayApp.Core.Validators;
using ScreenplayApp.Infrastructure.Data;
using ScreenplayApp.Infrastructure.Repositories;
using ScreenplayApp.Infrastructure.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
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
            services.AddScoped<ITicketService, TicketService>();
            services.AddScoped<IBookingService, BookingService>();
            services.AddScoped<IReportService, ReportService>();

            // Repositories
            services.AddScoped<IRatingRepository, RatingRepository>();
            services.AddScoped<IScreenplayRepository, ScreenplayRepository>();
            services.AddScoped<ITicketRepository, TicketRepository>();
            services.AddScoped<IBookingRepository, BookingRepository>();
            services.AddScoped<IReportRepository, ReportRepository>();

            // AutoMapper
            services.AddAutoMapper(typeof(AutoMapperProfiles).Assembly);

            services.AddDbContext<DataContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            });

            // Fluent Validation
            services.AddMvc()
                .AddFluentValidation()
                .AddJsonOptions(options => 
                    { 
                        options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter()); 
                        options.JsonSerializerOptions.IgnoreNullValues = true; 
                    }); ;
            services.AddTransient<IValidator<RegisterAccountRequest>, RegisterAccountRequestValidator>();
            services.AddTransient<IValidator<LoginAccountRequest>, LoginAccountRequestValidator>();
            services.AddTransient<IValidator<BookingInsertRequest>, BookingInsertRequestValidator>();
            services.AddTransient<IValidator<RatingInsertRequest>, RatingInsertRequestValidator>();

            services.AddTransient<IValidator<MostViewedMoviesGetRequest>, MostViewedMoviesGetRequestValidator>();


            return services;
        }
    }
}
