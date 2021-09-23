using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Moq;
using NUnit.Framework;
using ScreenplayApp.Core.Entities;
using ScreenplayApp.Core.Exceptions;
using ScreenplayApp.Core.Mapper;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Core.Repositories;
using ScreenplayApp.Core.Services;
using ScreenplayApp.Infrastructure.Data;
using ScreenplayApp.Infrastructure.Repositories;
using ScreenplayApp.Infrastructure.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Test
{
    [TestFixture]
    public class RatingServiceTest
    {
        public RatingService _ratingService { get; set; }
        public Mock<RatingRepository> _ratingRepository { get; set; }
        
        DataContext _context;
        IMapper _mapper;

        [SetUp]
        public async Task OneTimeSetupAsync()
        {
            // In memory Database Setup
            var options = new DbContextOptionsBuilder<DataContext>()
                .UseInMemoryDatabase(databaseName: "temp_screenplayApp")
                .Options;

            _context = new DataContext(options);

            _context.Screenplays.Add(new Screenplay
            {
                Id = 1,
                Title = "Steve Jobs",
                Description = "Lorem ipsum",
                Category = "Movie",
                PhotoUrl = "https://photo.url",
                Tickets = null,
                Actors = null,
                ReleaseDate = new DateTime(2111, 11, 11),
                Ratings = null
            });

            _context.Screenplays.Add(new Screenplay
            {
                Id = 2,
                Title = "Steve Jobs 2",
                Description = "Lorem ipsum 2",
                Category = "Movie",
                PhotoUrl = "https://photo2.url",
                Tickets = null,
                Actors = null,
                ReleaseDate = new DateTime(2111, 11, 11),
                Ratings = null
            });

            await _context.SaveChangesAsync();

            // Automapper 
            IConfiguration configuration = new ConfigurationBuilder().Build();

            var mapperConfiguration = new MapperConfiguration(config =>
            {
                config.AddProfile(new AutoMapperProfiles());
            });

            _mapper = mapperConfiguration.CreateMapper();

            // Mock 
            _ratingRepository = new Mock<RatingRepository>(_context, _mapper);
            _ratingService = new RatingService(_ratingRepository.Object);
        }

        [TearDown]
        public async Task TearDownAsync()
        {
            await _context.Database.EnsureDeletedAsync();
        }


        [TestCase(1, 1)]
        [TestCase(3, 2)]
        [TestCase(5, 3)]
        public async Task RatingService_InputValidData_ReturnRatingResponse(int rate, int screenplayId)
        {

            // Arrange
            var request = new RatingInsertRequest
            {
                ScreenplayId = screenplayId,
                Rate = rate,
            };

            // Act
            var result = await _ratingService.RateScreenplay(request);

            // Assert
            Assert.AreEqual(rate, result.Rate);
            Assert.AreEqual(screenplayId, result.ScreenplayId);
            Assert.IsInstanceOf<RatingInsertResponse>(result);
        }

        [TestCase(10, 1)]
        [TestCase(0, 1)]
        [TestCase(-3, 1)]
        public async Task RatingService_InputInvalidRate_ReturnApplicationException(int rate, int screenplayId)
        {
            // Arrange
            var request = new RatingInsertRequest
            {
                ScreenplayId = screenplayId,
                Rate = rate,
            };

            // Assert 
            BadRequestException err = Assert.ThrowsAsync<BadRequestException>(
                () => _ratingService.RateScreenplay(request)
                );

            Assert.That(err.Message, Is.EqualTo("Rate must be between 1 and 5"));
        }
    }
}
