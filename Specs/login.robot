*** Settings ***
Library  SeleniumLibrary
Resource  ${EXECDIR}/Page/login.robot
Suite Setup  Open Browser  about:blank  chrome
Suite Teardown  Close Browser

*** Variables ***
${url}=     https://automacao.qacoders.dev.br/login

*** Keywords ***
LoginAdmin
    Go To  ${url}
    Click Element  ${login.txtEmailUser}
    Input Text   ${login.txtEmailUser}    ${preencherLogin.txtEmailUser}
    Click Element  ${login.txtSenha}
    Input Text  ${login.txtSenha}     ${preencherLogin.txtSenha}
    Click Element  ${login.btnEntrar}
    Wait Until Element Is Visible   ${company.btnCadastros}   2s