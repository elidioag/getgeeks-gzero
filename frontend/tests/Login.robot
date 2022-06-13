*Settings*
Documentation       Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Test

*Test Cases*
User Login
    [Tags]      smoke

    ${user}                         Factory User    login

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]      i_pass

    ${user}     Create Dictionary       email=test@email.com        password=abc123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

User Not Found
    [Tags]      user_404

    ${user}     Create Dictionary       email=test_new@email.com        password=pwd123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Modal Content Should Be     Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      i_email

    ${user}     Create Dictionary       email=test.email.com        password=pwd123

    Go To Login Page
    Fill Credentials            ${user}
    Submit Credentials
    Should Be Type Email

Required Email
    [Tags]      temp

    ${user}     Create Dictionary       email=${EMPTY}      password=pwd123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    E-mail obrigatório

Required Pass
    [Tags]      temp

    ${user}     Create Dictionary       email=test@email.com      password=${EMPTY}

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    Alert Span Should Be    Senha obrigatória    

Required Fields
    [Tags]      temp

    @{expected_alerts}      Create List
    ...                     E-mail obrigatório
    ...                     Senha obrigatória

    Go To Login Page
    Submit Credentials
    Alert Spans Should Be       ${expected_alerts}