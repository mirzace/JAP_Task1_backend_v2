using ScreenplayApp.Core.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ScreenplayApp.Core.Entities
{
    public class Screenplay
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(maximumLength: 255, MinimumLength =3)]
        public string Title { get; set; }
        [Required]
        [StringLength(maximumLength: 1024, MinimumLength = 16)]
        public string Description { get; set; }
        [DataType(DataType.Date)]
        public DateTime ReleaseDate { get; set; }
        public ICollection<Actor> Actors { get; set; } = null;
        public ICollection<Rating> Ratings { get; set; } = null;
        public ICollection<Ticket> Tickets { get; set; } = null;
        [Required]
        [EnumDataType(typeof(Category))]
        public Category Category { get; set; }
        [MaxLength(512, ErrorMessage = "Url can not be longer thatn 512 characters")]
        public string PhotoUrl { get; set; }
    }
}
