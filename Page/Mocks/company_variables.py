from faker import Faker
import random

fake = Faker('pt_BR')

def generate_company_data():
    return {
        'razaoSocial': fake.company(),
        'nomeFantasia': fake.company_suffix() + " " + fake.company(),
        'emailEmpresa': fake.company_email(),
        'cnpj': ''.join([str(random.randint(0, 9)) for _ in range(14)]),
        'telefone': fake.msisdn(),
        'descricaoDoServico': fake.catch_phrase(),
        'nomeDoResponsavel': fake.name(),
        'cep': fake.postcode(),
        'pais': 'Brasil',
        'cidade': fake.city(),
        'estado': fake.state_abbr(),
        'bairro': fake.bairro(),
        'rua': fake.street_name(),
        'numero': str(fake.building_number()),
        'complemento': "Loja 3"
    }

PreencheEmpresa = generate_company_data()