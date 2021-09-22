using FluentValidation;
using ScreenplayApp.Core.Models.Requests;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Validators
{
    public class RegisterAccountRequestValidator : AbstractValidator<RegisterAccountRequest>
    {
        public RegisterAccountRequestValidator()
        {
            RuleFor(x => x.UserName)
                .NotNull()
                .MaximumLength(50)
                .MinimumLength(3);

            RuleFor(x => x.FirstName)
                .MaximumLength(255)
                .MinimumLength(3);

            RuleFor(x => x.LastName)
                .MaximumLength(255)
                .MinimumLength(3);

            RuleFor(x => x.Password)
                .NotNull()
                .MaximumLength(64)
                .MinimumLength(8);
        }
    }
}
