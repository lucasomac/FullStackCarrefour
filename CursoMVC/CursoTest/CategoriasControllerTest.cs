using CursoMVC.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using Moq;
using System.Threading;
using Xunit;
using CursoApi.Controllers;
using System.Threading.Tasks;

namespace CursoTest
{
    public class CategoriasControllerTest
    {
        private readonly Mock<DbSet<Categoria>> _moqSet;
        private readonly Mock<Context> _moqContext;
        private readonly Categoria _categoria;
        public CategoriasControllerTest()
        {
            _moqSet = new Mock<DbSet<Categoria>>();
            _moqContext = new Mock<Context>();
            _categoria = new Categoria { id = 1, Descricao = "Teste Categoria" };

            _moqContext.Setup(m => m.Categorias).Returns(_moqSet.Object);
            _moqContext.Setup(m => m.Categorias.FindAsync(1)).ReturnsAsync(_categoria);
            //   _moqContext.Setup(m => m.SetMo(_categoria));
            //   _moqContext.Setup(m => m.SaveChangesAsync(It.IsAny<CancellationToken>())).ReturnsAsync(1);


        }
        [Fact]
        public async Task Get_Categoria()
        {
            var service = new CategoriasController(_moqContext.Object);

            await service.GetCategoria(1);
            _moqSet.Verify(m => m.FindAsync(1), Times.Once());
        }
    }
}
