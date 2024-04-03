using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class NewsCategory
    {
        [Key]
        public Guid Id { get; set; }
        [ForeignKey("News")]
        public Guid NewsID { get; set; }
        [ForeignKey("Category")]
        public Guid CategoryID { get; set; }
    }
}
