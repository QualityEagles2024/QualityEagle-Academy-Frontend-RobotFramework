*** Settings ***
Library      SeleniumLibrary
Library      Collections
Variables   ../Page/Mocks/login_variables.py
Variables    ../Page/Mocks/user_variables.py
Resource      ${EXECDIR}/Page/login.robot
Resource      ${EXECDIR}/Page/menus.robot
Resource      ${EXECDIR}/Page/user.robot
Suite Setup     Open Browser  browser=headlesschrome
Suite Teardown  Close Browser

*** Variables ***
${BROWSER}        Google Chrome	

*** Test Cases ***
CT01 - Criar novo usuario com sucesso
    [Tags]    CT01
    Fazer Login
    Entrar no menu Usuarios e clicar em novo cadastro
    Preencher novo cadastro

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

Entrar no menu Usuarios e clicar em novo cadastro
    # PAGINA USUARIO #
    Wait Until Element Is Visible   ${menu.mnuCadastros}    2s
    Click Element  ${menu.mnuCadastros}
    Wait Until Element Is Visible   ${menu.mnuUsuarios}     2s
    Click Element  ${menu.mnuUsuarios}
    Wait Until Element Is Visible   ${user.btnNovoCadastro}     2s
    Click Element  ${user.btnNovoCadastro}
    Wait Until Element Is Visible   ${user.txtNomeCompleto}

Preencher novo cadastro
    #Preenchimento Formulario Novo Usuario
    Input Text  ${user.txtNomeCompleto}  ${PreencheUsuario['nome_completo']}
    Input Text  ${user.txtEmail}  ${PreencheUsuario['email']}
    Input Text  ${user.txtPerfilDeAcesso}  ${PreencheUsuario['perfil']}
    Input Text  ${user.txtCPF}  ${PreencheUsuario['cpf']}
    Input Text  ${user.txtSenha}  ${PreencheUsuario['senha']}
    Input Text  ${user.txtConfirmeaSuaSenha}  ${PreencheUsuario['senha']}
    Scroll Element Into View  ${user.btnSalvarNovo}
    Click Element  ${user.btnSalvarNovo}