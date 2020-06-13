def exception():
    lista = [1, 10]
    arquivo = open('teste.txt', 'w')
    try:
        divisao = 10 / 1
        numero = lista[1]
        texto = arquivo.read()
        x = a = 5
    except ZeroDivisionError:
        print("Não é possivél dividir por zero")
    except IndexError:
        print("Indice inexistente na lista")
    except Exception as ex:
        print(ex)
    else:
        print("Nã ocorreu Exception")
    finally:
        print('Arquivo fechado')
        arquivo.close()
        print("Sempre executa")


def personalizacao():
    while True:
        try:
            x = int(input("Entre com uma nota de 0 a 10\n"))
            if x > 10:
                raise InputError('Não pode ser maior qeu 10')
            elif x < 0:
                raise InputError('Não pode ser menor qeu 0')
            break
        except ValueError:
            print("Valor invalido. Apenas inteiros entre 0 e 10 são permitidos")
        except InputError as ex:
            print(ex)


class Error(Exception):
    pass


class InputError(Exception):
    def __init__(self, message):
        self.message = message


if __name__ == '__main__':
    personalizacao()
