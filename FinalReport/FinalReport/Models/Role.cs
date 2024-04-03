using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class Role
    {
        [Key] public Guid Id { get; set; }

        [Required] 
        public string? Code { get; set; }
        public string? Name { get; set; }
        public string? GroupName { get; set; }  
    }
}
