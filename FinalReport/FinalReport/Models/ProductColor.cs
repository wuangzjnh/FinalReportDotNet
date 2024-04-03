using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class ProductColor
    {
        [Key]
        public Guid Id { get; set; }
        [ForeignKey("Product")]
        public Guid ProductID { get; set; }
        [ForeignKey("Color")]
        public Guid ColorID { get; set; }
        [MaxLength(100)]
        public string? Picture { get; set; }


    }
}
