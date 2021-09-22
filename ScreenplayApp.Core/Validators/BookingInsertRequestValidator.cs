using FluentValidation;
using ScreenplayApp.Core.Models.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Validators
{
    public class BookingInsertRequestValidator : AbstractValidator<BookingInsertRequest>
    {
        public BookingInsertRequestValidator()
        {
            RuleFor(x => x.AppUserId)
                .Null();
            RuleFor(x => x.Location)
                .NotEmpty();
            RuleFor(x => x.Date)
                .NotEmpty();
            RuleFor(x => x.ScreenplayId)
                .NotEmpty();
            RuleFor(x => x.NumberOfTickets)
                .NotEmpty();
        }
    }
}
