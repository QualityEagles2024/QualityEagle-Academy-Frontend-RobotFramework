from faker import Faker

fake = Faker('pt_BR')

def generate_login_data():
    return {
        'url': "https://automacao.qacoders.dev.br/login",
        'email': "sysadmin@qacoders.com",
        'password' : "1234@Test"
    }

PreencheLogin = generate_login_data()