using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class Category
    {
        [Key]
        public Guid Id { get; set; }
        [MaxLength(500)]
        public string? Name { get; set; }
        public Guid ParentID { get; set; }
    }
}
