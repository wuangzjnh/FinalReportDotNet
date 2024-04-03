﻿using System.ComponentModel.DataAnnotations;

namespace FinalReport.Models
{
    public class Group
    {
        [Key]
        public Guid Id { get; set; }
        public string Name { get; set; }
    }
}
