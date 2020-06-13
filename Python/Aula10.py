from datetime import date, time, datetime, timedelta


def mostra_date():
    hoje = date.today()
    print(hoje.strftime('%d/%m/%Y'))


def mostra_time():
    hora = time(hour=12, minute=43, second=45)
    print(hora.strftime('%H:%M:%S'))


def mostra_date_time():
    date_time = datetime.now()
    print(date_time.strftime('%d/%m/%Y %H:%M:%S'))


def operacoes_date():
    data = date(1992, 6, 29)
    diferenca = data + timedelta(days=365)
    print(diferenca)

if __name__ == '__main__':
    mostra_date()
    mostra_time()
    mostra_date_time()
    operacoes_date()
