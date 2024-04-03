using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class Member
    {
        [Key]
        public Guid Id { get; set; }
        [Required]
        [MaxLength(100)]

        public string? Name { get; set; }
        [MaxLength(100)]

        public string? Picture { get; set; }

        [MaxLength(100)]
        public string? LoginName { get; set; }
        [MaxLength(100)]
        public string? Password { get; set; }
        public DateTime CreatedDate { get; set; }
        public int Status { get; set; }
        [ForeignKey("Group")]
        public Guid GroupID { get; set; }
    }
}
