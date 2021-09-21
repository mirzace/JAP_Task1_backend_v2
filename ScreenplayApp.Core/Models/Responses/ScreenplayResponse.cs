using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Models.Responses
{
    public class ScreenplayResponse
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime ReleaseDate { get; set; }
        public ICollection<ActorResponse> Actors { get; set; }
        public string Category { get; set; }
        public string PhotoUrl { get; set; }
        public double AverageRate { get; set; } = 0;
    }
}
