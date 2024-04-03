using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class ProductCategory
    {
        [Key]
        public Guid Id { get; set; }
        [MaxLength(100)]
        [ForeignKey("Product")]
        public Guid ProductID {  get; set; }
        [MaxLength(100)]
        [ForeignKey("Category")]
        public Guid Category { get; set; }

    }
}
