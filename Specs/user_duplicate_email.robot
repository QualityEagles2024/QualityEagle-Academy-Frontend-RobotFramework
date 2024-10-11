*** Settings ***
Documentation  Essa Suite testa novo cadastro Usuario com Email já cadastrado
Library  SeleniumLibrary
Library  Collections
Resource  ${EXECDIR}/Page/login.robot
Resource  ${EXECDIR}/Page/menus.robot
Resource  ${EXECDIR}/Page/user_duplicate_email.robot
Suite Setup     Open Browser  browser=headlesschrome
Suite Teardown  Close Browser

*** Variables ***
${url}=     https://automacao.qacoders.dev.br/login
${BROWSER}        Google Chrome	

*** Test Cases ***
CT01 - Criar usuario em duplicidade
    [Tags]    CT01
    Fazer Login
    Entrar no menu Usuarios e clicar em novo cadastro
    Clicar no botao Novo Cadastro
    Preencher novo cadastro
    Salvar Cadastro
    Clicar no botao Novo Cadastro
    Preencher novo cadastro 
    Salvar Cadastro
    Verificar Mensagem Usuario Email Informado

*** Keywords ***
Fazer Login
    # LOGIN #
    Go To  ${url}
    Wait Until Element Is Visible   ${login.txtEmailUser}   2s
    Click Element  ${login.txtEmailUser}
    Input Text   ${login.txtEmailUser}    ${preencherLogin.txtEmailUser}
    Click Element  ${login.txtSenha}
    Input Text  ${login.txtSenha}     ${preencherLogin.txtSenha}
    Click Element  ${login.btnEntrar}
    Wait Until Element Is Visible   ${menu.mnuCadastros}   2s

Entrar no menu Usuarios 
    # PAGINA USUARIO #
    Wait Until Element Is Visible   ${menu.mnuCadastros}    2s
    Click Element  ${menu.mnuCadastros}
    Wait Until Element Is Visible   ${menu.mnuUsuarios}     2s
    Click Element  ${menu.mnuUsuarios}

Clicar no botao Novo Cadastro
    Wait Until Element Is Visible   ${user.btnNovoCadastro}     2s
    Click Element  ${user.btnNovoCadastro}
    Wait Until Element Is Visible   ${user.txtNomeCompleto}

Preencher novo cadastro
    #Preenchimento Formulario Novo Usuario
    Input Text  ${user.txtNomeCompleto}  ${preencherFormulario.txtNomeCompleto}
    Input Text  ${user.txtEmail}  ${preencherFormulario.txtEmail}
    Input Text  ${user.txtPerfilDeAcesso}  ${preencherFormulario.txtPerfilDeAcesso}
    Input Text  ${user.txtCPF}  ${preencherFormulario.txtCPF}
    Input Text  ${user.txtSenha}  ${preencherFormulario.txtSenha}
    Input Text  ${user.txtConfirmeaSuaSenha}  ${preencherFormulario.txtConfirmeaSuaSenha}

Salvar Cadastro
    Scroll Element Into View  ${user.btnSalvarNovo}
    Click Element  ${user.btnSalvarNovo}

Verificar Mensagem Usuario Cpf Informado
    Wait Until Element Is Visible   ${user.lblAlert}     2s
    ${mensagem}=    Get Text    ${user.lblAlert}
    Should Be Equal As Strings    ${mensagem}    ${preencherFormulario.lblAlertEmailJaCadastrado}
    Sleep    2s
    Close Browser