from faker import Faker 

fake = Faker('pt_BR')

def generate_user_data():
    return {
        'nome_completo': fake.first_name() + " " + fake.last_name(),
        'email' : fake.email(),
        'perfil' : 'ADMIN',
        'cpf': fake.cpf(),
        'senha' : fake.password(),
    }

def generate_user_data_to_update():
    return {
        'nome_completo': fake.first_name() + " " + fake.last_name(),
        'email' : "supernaturaltestecadastro@qacoders.com",
        'perfil' : 'ADMIN',
        'cpf': fake.cpf(),
        'senha' : fake.password(),
    }

PreencheUsuario = generate_user_data()
AlteraUsuario = generate_user_data_to_update()