using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CursoMVC.Models
{
    public class Categoria
    {
        public int id { get; set; }

        [Display(Name = "Descrição")]
        [Required(ErrorMessage = "A descrição é um campo obrigatorio")]
        public string Descricao { get; set; }
        // public List<Produto> Produtos { get; set; }
    }
}
