import requests


def consulta_cep(cep):
    url = 'https://viacep.com.br/ws/%s/json/' % cep
    response = requests.get(url)
    # print response.content
    response_json = response.json()
    logradouro = response_json['logradouro']
    localidade = response_json['localidade']
    return logradouro, localidade


def consulta_pokemon(pokemon):
    response = requests.get('https://pokeapi.co/api/v2/pokemon/{}'.format(pokemon))
    return response.json()


def return_response(url):
    response = requests.get(url)
    return response.text


if __name__ == '__main__':
    # print(consulta_cep(input("Informe o cep\n")))
    print(consulta_pokemon(input("Informe o nome do pokemon\n"))['sprites']['front_shiny'])
