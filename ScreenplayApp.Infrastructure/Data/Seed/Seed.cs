using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using ScreenplayApp.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ScreenplayApp.Infrastructure.Data.Seed
{
    public class Seed
    {
        public static async Task SeedUsers(UserManager<AppUser> userManager, RoleManager<AppRole> roleManager)
        {
            if (await userManager.Users.AnyAsync()) return;

            // Seed Roles
            var roles = new List<AppRole>
            {
                new AppRole { Name = "Consumer"},
                new AppRole { Name = "Admin"}
            };

            foreach (var role in roles)
            {
                await roleManager.CreateAsync(role);
            }

            // Seed Admin User
            var admin = new AppUser
            {
                UserName = "admin"
            };

            await userManager.CreateAsync(admin, "Test123!");
            await userManager.AddToRoleAsync(admin, "Admin");

            // Seed App User
            var user = new AppUser
            {
                UserName = "user"
            };

            await userManager.CreateAsync(user, "Test123!");
            await userManager.AddToRoleAsync(user, "Consumer");
        }

        public static async Task SeedScreenplays(DataContext context)
        {
            if (await context.Screenplays.AnyAsync() || await context.Ratings.AnyAsync()) return;

            var screenplayData = await System.IO.File.ReadAllTextAsync("../ScreenplayApp.Infrastructure/Data/Seed/ScreenplaySeedData.json");
            var screenplays = JsonSerializer.Deserialize<List<Screenplay>>(screenplayData);

            foreach (var screenplay in screenplays)
            {
                context.Screenplays.Add(screenplay);
            }

            await context.SaveChangesAsync();

            // Seed Ratings

            Random rand = new Random();

            foreach (Screenplay screenplay in screenplays)
            {
                for (int i = 0; i < 2; i++)
                {
                    int index = rand.Next(1,5);

                    // Add rating for earch screenplay
                    Rating rating = new Rating
                    {
                        Rate = index + 1,
                        Screenplay = screenplay
                    };
                    context.Ratings.Add(rating);
                }
            }
            await context.SaveChangesAsync();
        }
    }
}
