using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class Comment
    {
        [Key]
        public Guid Id { get; set; }
        [MaxLength(100)]

        public string? Content { get; set; }
        [MaxLength(100)]

        public Guid CreatedBy { get; set; }
        public DateTime CreatedDate { get; set;}
        [ForeignKey("News")]
        public Guid NewsID { get; set; }
    }
}
