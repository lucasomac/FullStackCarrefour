// const somaCrush = (n1, n2) => n1 + n2;
// module.exports = {somaCrush};
const listaCrushs = ['Lucas Macedo', 'Mateus Macedo', 'Luan Brito'];

export function somaCrush(n1, n2) {
    return n1 + n2;
}

export function validacao(nome) {
    if (!nome) throw 'Nome é obrigatório';
    if (typeof nome !== 'string') throw 'Tipo inválido';
}

export function encontraCrush(nome) {
    try {
        validacao(nome);
        const crushEncontrado = listaCrushs.find(crush => crush === nome);
        return crushEncontrado ? crushEncontrado : 'Crush não encontrado';
    } catch (erro) {
        return erro;
    }
}