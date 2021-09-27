using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ScreenplayApp.Core.Entities;
using ScreenplayApp.Core.Enums;
using ScreenplayApp.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Data
{
    public class DataContext : IdentityDbContext<AppUser, AppRole, int,
        IdentityUserClaim<int>, AppUserRole, IdentityUserLogin<int>,
        IdentityRoleClaim<int>, IdentityUserToken<int>>
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {

        }
        public DbSet<Screenplay> Screenplays { get; set; }
        public DbSet<Actor> Actors { get; set; }
        public DbSet<Rating> Ratings { get; set; }
        public DbSet<Ticket> Tickets { get; set; }
        public DbSet<Booking> Bookings { get; set; }

        // Reports
        public DbSet<MostRatedMoviesReport> MostRatedMoviesReports { get; set; }
        public DbSet<MostSoldMoviesWithoutRatingReport> MostSoldMoviesWithoutRatingReport { get; set; }
        public DbSet<MostViewedMoviesForAPeriodReport> MostViewedMoviesForAPeriodReport { get; set; }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // User and Roles
            builder.Entity<AppUser>()
                .HasMany(ur => ur.UserRoles)
                .WithOne(u => u.User)
                .HasForeignKey(ur => ur.UserId)
                .IsRequired();

            builder.Entity<AppRole>()
                .HasMany(ur => ur.UserRoles)
                .WithOne(u => u.Role)
                .HasForeignKey(ur => ur.RoleId)
                .IsRequired();

            // Screenplays
            var screenplays = builder.Entity<Screenplay>();

            screenplays
                .Property(e => e.Category)
                .HasConversion(
                    v => v.ToString(),
                    v => (Category)Enum.Parse(typeof(Category), v));

            // We actually don't need this because the entities follow the naming convection
            // for the relationships in EF Core

            // Tickets
            var tickets = builder.Entity<Ticket>();

            tickets.HasOne<Screenplay>()
                .WithMany(s => s.Tickets)
                .HasForeignKey(t => t.ScreenplayId);

            tickets.HasOne<Booking>()
                .WithMany(b => b.Tickets)
                .HasForeignKey(t => t.BookingId);

            // Reports
            builder.Entity<MostRatedMoviesReport>().HasNoKey();
            builder.Entity<MostSoldMoviesWithoutRatingReport>().HasNoKey();
            builder.Entity<MostViewedMoviesForAPeriodReport>().HasNoKey();
        }
    }
}
