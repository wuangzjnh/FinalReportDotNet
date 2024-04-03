using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class Voting
    {
        [Key]
        public Guid Id { get; set; }
        [ForeignKey("Product")]
        public Guid ProductID {  get; set; }
        public Guid CreatedBy { get; set; }
        public int Star {  get; set; }
        public string? Content { get; set; }
        public int Helpful { get; set; }
        public int Unhelpful { get; set; }

    }
}
