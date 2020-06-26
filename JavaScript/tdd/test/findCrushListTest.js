import should from "should";
import {somaCrush, encontraCrush} from "../findCrushs";


describe('Find Crushs', () => {
    it('Soma Crushs', () => {
        somaCrush(2, 3).should.be.equal(5);
    });
    it('Soma e retornar 30', () => {
        somaCrush(10, 20).should.be.equal(30);
    });
    it('Passar nome e retornar nome não encontrado', () => {
        encontraCrush('Joselito Marques').should.be.equal('Crush não encontrado');
    });
    it('Retorna mensagem de nome origatório', () => {
        encontraCrush().should.be.equal('Nome é obrigatório');
    });
    it('Não aceitar números', () => {
        encontraCrush(32).should.be.equal('Tipo inválido');
    });
    it('Deve retornar um nome da lista', () => {
        encontraCrush("Lucas Macedo").should.be.equal('Lucas Macedo');
    });
});
// const should = require('should');
// const findCrushs = require('../findCrushs');
// describe('find crushs', () => {
//     it('soma crushs', () => {
//         findCrushs.somaCrush(2, 3).should.be.equal(5);
//     });
//     it('Soma e retornar 30', () => {
//         findCrushs.somaCrush(10, 20).should.be.equal(30);
//     });
// })

