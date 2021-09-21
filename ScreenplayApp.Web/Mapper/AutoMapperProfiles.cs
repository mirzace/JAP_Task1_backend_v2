using AutoMapper;
using ScreenplayApp.Core.Entities;
using ScreenplayApp.Core.Models.Requests;
using ScreenplayApp.Core.Models.Responses;
using ScreenplayApp.Web.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Mapper
{
    public class AutoMapperProfiles : Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<RegisterAccountRequest, AppUser>().ReverseMap();
            CreateMap<Screenplay, ScreenplayResponse>()
                .ForMember(dest => dest.AverageRate, opt => opt.MapFrom(src => src.Ratings.Average(r => r.Rate)))
                .ReverseMap();
            CreateMap<Actor, ActorResponse>().ReverseMap();
            CreateMap<RatingInsertRequest, Rating>().ReverseMap();
            CreateMap<RatingInsertResponse, Rating>().ReverseMap();
        }
    }
}
