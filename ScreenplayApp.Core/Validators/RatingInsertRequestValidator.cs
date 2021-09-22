using FluentValidation;
using ScreenplayApp.Core.Models.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Validators
{
    public class RatingInsertRequestValidator : AbstractValidator<RatingInsertRequest>
    {
        public RatingInsertRequestValidator()
        {
            RuleFor(x => x.Rate)
                .NotNull()
                .GreaterThan(0)
                .LessThan(5);

            RuleFor(x => x.ScreenplayId)
                .NotNull()
                .GreaterThan(0);
        }
    }
}
