*** Settings ***
Documentation  Essa Suite testa o site https://automacao.qacoders.dev.br/login para cadastros,consultas e exclusao
Library  SeleniumLibrary
Variables   ../Page/Mocks/login_variables.py
Variables   ../Page/Mocks/company_variables.py
Resource  ${EXECDIR}/Page/login.robot
Resource  ${EXECDIR}/Page/menus.robot
Resource  ${EXECDIR}/Page/company.robot
Suite Setup  Open Browser  browser=headlesschrome
Suite Teardown  Close Browser
#Test Setup     Abrir o navegador - serve para abrir teste isolado
#Test Teardown  Fechar o navegador - srve para finalizar caso de teste isolado

*** Variables ***
${BROWSER}        Google Chrome	

*** Test Cases ***
CT01 - Login de Acesso
    [Documentation]  Esse teste verifica o Login de acesso
    [Tags]           CT01  login_acesso
    Fazer Login

CT02 - Criar Novo Cadastro Company    
    [Documentation]  esse teste verifica o cadastro de novas empresas
    [Tags]           CT02  cadastro_nova_empresa
    Entrar no menu Empresa e clicar em novo cadastro
    Preencher nova Empresa

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

Entrar no menu Empresa e clicar em novo cadastro
    # PAGINA EMPRESA #
    Click Element  ${menu.mnuCadastros}
    Wait Until Element Is Visible   ${menu.mnuEmpresa}   30
    Click Element  ${menu.mnuEmpresa}
    Wait Until Element Is Visible   ${company.btnNovoCadastro}   30
    Click Element  ${company.btnNovoCadastro}
    Wait Until Element Is Visible   ${company.txtRazaoSocial}   30

Preencher nova Empresa
    #Preenchimento Formulario Nova Empresa
    Input Text  ${company.txtRazaoSocial}  ${PreencheEmpresa['razaoSocial']}
    Input Text  ${company.txtNomeFantasia}  ${PreencheEmpresa['nomeFantasia']}
    Input Text  ${company.txtEmail}  ${PreencheEmpresa['emailEmpresa']}
    Input Text  ${company.txtCNPJ}  ${PreencheEmpresa['cnpj']}
    Input Text  ${company.txtTelefone}  ${PreencheEmpresa['telefone']}
    Input Text  ${company.txtDescricaoDoServico}  ${PreencheEmpresa['descricaoDoServico']}
    Input Text  ${company.txtNomeDoResponsavel}  ${PreencheEmpresa['nomeDoResponsavel']}
    Input Text  ${company.txtCEP}  ${PreencheEmpresa['cep']}
    Input Text  ${company.txtPais}  ${PreencheEmpresa['pais']}
    Input Text  ${company.txtCidade}  ${PreencheEmpresa['cidade']}
    Input Text  ${company.txtEstado}  ${PreencheEmpresa['estado']}
    Input Text  ${company.txtBairro}  ${PreencheEmpresa['bairro']}
    Input Text  ${company.txtRua}  ${PreencheEmpresa['rua']}
    Input Text  ${company.txtNumeroDoImovel}  ${PreencheEmpresa['numero']}
    Input Text  ${company.txtComplemento}  ${PreencheEmpresa['complemento']}
    Scroll Element Into View  ${company.btnSalvarNovo}
    Click Element  ${company.btnSalvarNovo}