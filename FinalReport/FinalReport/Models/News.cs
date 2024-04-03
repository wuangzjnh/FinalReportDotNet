using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class News
    {
        [Key]
        public Guid Id { get; set; }
        [MaxLength(100)]

        public string? Title { get; set; }
        [MaxLength(500)]

        public string? Description { get; set; }
        [MaxLength(100)]

        public string? Picture {  get; set; }
        public DateTime CreatedDate { get; set; }
        [MaxLength(100)]

        public Guid CreatedBy { get; set; }
        [MaxLength(500)]

        public string? Content { get; set; }
    }
}
