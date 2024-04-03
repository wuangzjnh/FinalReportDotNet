using FinalReport.Data;

namespace FinalReport.Models
{
    public class ProductViewModel
    {
        public Product? Product { get; set; }
        public ApplicationDbContext? Context { get; set; }

    }
}
