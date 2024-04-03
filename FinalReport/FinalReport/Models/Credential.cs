using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalReport.Models
{
    public class Credential
    {
        [Key]
        public Guid Id { get; set; }
        [ForeignKey("Group")]
        public Guid GroupID { get; set; }
        [ForeignKey("Role")]
        public Guid RoleID { get; set; }

    }
}
