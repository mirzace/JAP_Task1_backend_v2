using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class AppUser : IdentityUser<int>
    {
        [StringLength(maximumLength: 255, MinimumLength = 3)]
        public string FirstName { get; set; }
        [StringLength(maximumLength: 255, MinimumLength = 3)]
        public string LastName { get; set; }
        public ICollection<AppUserRole> UserRoles { get; set; }
        public ICollection<Booking> Bookings { get; set; } = null;
    }
}
