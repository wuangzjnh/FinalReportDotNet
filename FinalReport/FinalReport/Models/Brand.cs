using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class Brand
    {
        [Key]
        public Guid Id { get; set; }
        [MaxLength(100)]
        public string? Name { get; set; }
    }
}
