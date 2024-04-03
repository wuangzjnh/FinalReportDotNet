using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class Size
    {
        [Key]
        public Guid Id { get; set; }
        [MaxLength(100)]

        public string? Name { get; set; }
        public Guid ParentID { get; set; }

    }
}
