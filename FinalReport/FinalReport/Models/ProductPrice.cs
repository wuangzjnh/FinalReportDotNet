using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class ProductPrice
    {
        [Key]
        public Guid Id { get; set; }
        [ForeignKey("Product")]
        public Guid ProductID { get; set; }
        [ForeignKey("Color")]
        public Guid ColorID { get; set; }
        [ForeignKey("Size")]
        public Guid SizeID { get; set; }
        public float Price { get; set; }
        [MaxLength(100)]
        public string? Picture {  get; set; }
        public int Amount { get; set; }



    }
}
