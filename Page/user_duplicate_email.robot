*** Settings ***

Library     SeleniumLibrary


*** Variables ***

&{user}
...     btnNovoCadastro=//*[@id="Novo Cadastro"]
...     txtNomeCompleto=//*[@id="fullName"]
...     txtEmail=//*[@id="mail"]
...     txtPerfilDeAcesso=//*[@id="accessProfile"]
...     txtCPF=//*[@id="cpf"]
...     txtSenha=//*[@id="password"]
...     txtConfirmeaSuaSenha=//*[@id="confirmPassword"]
...     btnSalvarNovo=//*[@id="save"]
...     lblAlert=/html/body/div/div/div[2]/div/form/div[1]

&{preencherFormulario}
...     txtNomeCompleto=Joana de Assis
...     txtEmail=joana.a9@gmail.com
...     txtPerfilDeAcesso=ADMIN
...     txtCPF=56959878920
...     txtSenha=Tecnologia1@
...     txtConfirmeaSuaSenha=Tecnologia1@
...     lblAlertEmailJaInformado=E-mail já cadastrado.

&{NaveguePelaLista}
...     btnAvancar1=//button[contains(@class, 'css-kab9pu')]