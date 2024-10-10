*** Settings ***

Library     SeleniumLibrary


*** Variables ***

&{user}
...     btnNovoCadastro=//*[@id="Novo Cadastro"]
...     btnEditar=//*[@id="edit"]
...     txtNomeCompleto=//*[@id="fullName"]
...     txtEmail=//*[@id="mail"]
...     txtPerfilDeAcesso=//*[@id="accessProfile"]
...     txtCPF=//*[@id="cpf"]
...     txtSenha=//*[@id="password"]
...     txtConfirmeaSuaSenha=//*[@id="confirmPassword"]
...     btnSalvarNovo=//*[@id="save"]

&{NaveguePelaLista}
...     btnAvancar1=//button[contains(@class, 'css-kab9pu')]