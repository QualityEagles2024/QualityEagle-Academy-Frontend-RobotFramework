*** Settings ***
Documentation  Essa Suite testa novo cadastro Usuario com Email já cadastrado
Library  SeleniumLibrary
Library  Collections
Variables   ../Page/Mocks/login_variables.py
Resource  ${EXECDIR}/Page/login.robot
Resource  ${EXECDIR}/Page/menus.robot
Resource  ${EXECDIR}/Page/user_duplicate_email.robot
# Suite Setup     Open Browser    about:blank     Google Chrome    options=add_argument("disable-search-engine-choice-screen")
Suite Setup     Open Browser  browser=headlesschrome
Suite Teardown  Close Browser

*** Variables ***
${url}=     https://automacao.qacoders.dev.br/login
${BROWSER}        Google Chrome	

*** Test Cases ***
CT01 - Criar usuario em duplicidade
    Skip
    [Tags]    CT01
    Fazer Login
    Entrar no menu Usuarios
    Clicar no botao Novo Cadastro
    Preencher novo cadastro
    Salvar Cadastro
    Verificar Mensagem Usuario Cpf Informado

*** Keywords ***
Fazer Login
    #LOGIN#
    Go To  ${PreencheLogin['url']}
    Wait Until Element Is Visible   ${login.txtEmailUser}   2s
    Click Element  ${login.txtEmailUser}
    Input Text   ${login.txtEmailUser}    ${PreencheLogin['email']}
    Click Element  ${login.txtSenha}
    Input Text  ${login.txtSenha}     ${PreencheLogin['password']}
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
    Wait Until Element Is Visible   ${user.lblAlertCpfJaExiste}     2s
    ${mensagem}=    Get Text    ${user.lblAlertCpfJaExiste}
    Should Be Equal As Strings    ${mensagem}    ${preencherFormulario.lblAlertCpfJaExiste}
    Sleep    2s
    # Close Browser