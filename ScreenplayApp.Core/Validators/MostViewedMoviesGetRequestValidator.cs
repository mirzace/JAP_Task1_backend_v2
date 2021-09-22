using FluentValidation;
using ScreenplayApp.Core.Models.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Validators
{
    public class MostViewedMoviesGetRequestValidator : AbstractValidator<MostViewedMoviesGetRequest>
    {
        public MostViewedMoviesGetRequestValidator()
        {
            RuleFor(x => x.StartDate)
                .NotNull();
            RuleFor(x => x.EndDate)
                .NotNull()
                .GreaterThan(x => x.StartDate);
        }
    }
}
