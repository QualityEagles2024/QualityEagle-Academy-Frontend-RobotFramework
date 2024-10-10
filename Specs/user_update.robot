*** Settings ***
Library      SeleniumLibrary
Library      Collections
Variables   ../Page/Mocks/login_variables.py
Variables    ../Page/Mocks/user_variables.py
Resource      ${EXECDIR}/Page/login.robot
Resource      ${EXECDIR}/Page/menus.robot
Resource      ${EXECDIR}/Page/user.robot
Suite Setup     Open Browser    about:blank     Google Chrome
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}        Google Chrome	

*** Test Cases ***
CT01 - Criar novo usuario com sucesso
    [Tags]    CT01
    Fazer Login
    Entrar no menu Usuarios
    Clicar no botao Editar
    Editar cadastro

*** Keywords ***
Fazer Login
    #LOGIN#
    Go To  ${PreencheLogin['url']}
    Wait Until Element Is Visible   ${login.txtEmailUser}   30
    Click Element  ${login.txtEmailUser}
    Input Text   ${login.txtEmailUser}    ${PreencheLogin['email']}
    Click Element  ${login.txtSenha}
    Input Text  ${login.txtSenha}     ${PreencheLogin['password']}
    Click Element  ${login.btnEntrar}
    Wait Until Element Is Visible   ${menu.mnuCadastros}   30

Entrar no menu Usuarios
    # PAGINA USUARIO #
    Wait Until Element Is Visible   ${menu.mnuCadastros}    30
    Click Element  ${menu.mnuCadastros}
    Wait Until Element Is Visible   ${menu.mnuUsuarios}     30
    Click Element  ${menu.mnuUsuarios}
    Wait Until Element Is Visible   ${user.btnNovoCadastro}     30

Clicar no botao Editar
    # PAGINA USUARIO #
    Wait Until Element Is Visible   ${user.btnEditar}    30
    Click Element  ${user.btnEditar}

Editar cadastro
    #Alteração do Usuario
    Wait Until Element Is Visible   ${user.txtNomeCompleto}    30
    Sleep    2s
    Clear Element Text    ${user.txtNomeCompleto}
    Input Text  ${user.txtNomeCompleto}  ${PreencheUsuario['nome_completo']}
    Clear Element Text    ${user.txtEmail}
    Input Text  ${user.txtEmail}  ${PreencheUsuario['email']}
    Scroll Element Into View  ${user.btnSalvarNovo}
    Click Element  ${user.btnSalvarNovo}
    Sleep    3s