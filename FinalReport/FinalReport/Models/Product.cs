using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class Product
    {
        [Key]
        public Guid ID { get; set; }
        [Required]
        [MaxLength(100)]

        public string? Name { get; set; }
        [MaxLength(500)]

        public string? Description { get; set; }
        [MaxLength(100)]

        public string? Information { get; set; }
        [MaxLength(100)]

        public string? Addtional {  get; set; }
        [MaxLength(100)]

        public string? Shipping {  get; set; }
        [MaxLength(100)]

        public string? Picture { get; set;}
        public DateTime CreatedDate {  get; set; }
        [MaxLength(100)]

        public Guid CreatedBy { get; set;}
        [MaxLength(100)]
        [ForeignKey("Brand")]
        public Guid BrandID { get; set; }

        public float Price { get; set; }


    }
}
