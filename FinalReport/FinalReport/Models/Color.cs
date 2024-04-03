using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class Color
    {
        [Key]
        public Guid ID { get; set; }
        [MaxLength(100)]

        public string? Name { get; set; }
        [MaxLength(100)]

        public string? Code { get; set; }
    }
}
