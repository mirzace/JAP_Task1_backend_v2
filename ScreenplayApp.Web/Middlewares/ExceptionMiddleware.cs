using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using ScreenplayApp.Core.Exceptions;
using ScreenplayApp.Core.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text.Json;
using System.Threading.Tasks;

namespace ScreenplayApp.Web.Middlewares
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ExceptionMiddleware> _logger;
        private readonly IHostEnvironment _env;
        private readonly ILoggerManager _loggerManager;


        public ExceptionMiddleware(RequestDelegate next, ILogger<ExceptionMiddleware> logger, 
            IHostEnvironment env, ILoggerManager loggerManager)
        {
            _next = next;
            _logger = logger;
            _loggerManager = loggerManager;
            _env = env;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch (Exception ex)
            {
                _loggerManager.LogInformation(ex.Message);
                _logger.LogError(ex, ex.Message);
                var response = context.Response;
                response.ContentType = "application/json";

                switch (ex)
                {
                    case BadRequestException e:
                        response.StatusCode = (int)HttpStatusCode.BadRequest;
                        break;
                    case ForbiddenAccessException e:
                        response.StatusCode = (int)HttpStatusCode.Forbidden;
                        break;
                    case NotFoundException e:
                        response.StatusCode = (int)HttpStatusCode.NotFound;
                        break;
                    default:
                        response.StatusCode = (int)HttpStatusCode.InternalServerError;
                        break;
                }

                var result = _env.IsDevelopment()
                    ? new ApiException(response.StatusCode, ex.Message, ex.StackTrace?.ToString())
                    : new ApiException(response.StatusCode, "Internal Server Error");

                var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
                var json = JsonSerializer.Serialize(result, options);

                await response.WriteAsync(json);
            }
        }
    }
}
