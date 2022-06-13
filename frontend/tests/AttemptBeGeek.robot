*Settings*
Documentation       Attempt BeGeek Test Suite

Resource            ${EXECDIR}/resources/Base.robot

Suite Setup         Start Session For Attempt Be A Geek
Test Template       Attempt Be A Geek

*Variables*
${long_desc}        Formato seu PC com uma descrição muito longa e ela nunca vai acabar por isso estou escrevendo todas essas coisas pra ver se eu consigo cansar vc de ler e por isso você acabará contratando meus serviços de formatação de computador e instalação de vários sistemas operacionais, tanto Linux quanto Windows

*Test Cases*
Short Desc                      desc                Formato o seu PC                A descrição deve ter no minimo 80 caracteres
Long Desc                       desc                ${long_desc}                    A descrição deve ter no máximo 255 caracteres
Empty Desc                      desc                ${EMPTY}                        Informe a descrição do seu trabalho
Whats Only DDD                  whats               11                              O Whatsapp deve ter 11 digitos contando com o DDD
Whats Without DDD               whats               999999999                       O Whatsapp deve ter 11 digitos contando com o DDD
Empty Whats                     whats               ${EMPTY}                        O Whatsapp deve ter 11 digitos contando com o DDD
Cost Only Letters               cost                aaaa                            Valor hora deve ser numérico
Cost Letters And Numbers        cost                aa12                            Valor hora deve ser numérico
Cost With Symbols               cost                @3$%                            Valor hora deve ser numérico
Empty Cost                      cost                ${EMPTY}                        Valor hora deve ser numérico
No Printer Repair               printer_repair      ${EMPTY}                        Por favor, informe se você é um Geek Supremo
No Work                         work                ${EMPTY}                        Por favor, selecione o modelo de trabalho

*Keywords*
Attempt Be A Geek
    [Arguments]     ${key}      ${input_field}      ${output_message}

    ${user}     Factory User        attempt_be_geek

    Set To Dictionary           ${user}[geek_profile]       ${key}      ${input_field}

    Fill Geek Form              ${user}[geek_profile]
    Submit Geek Form
    Alert Span Should Be        ${output_message}

    After Test

Start Session For Attempt Be A Geek
    ${user}     Factory User        attempt_be_geek

    Start Session
    Do Login        ${user}
    Go To Geek Form