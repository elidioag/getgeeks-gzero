*Settings*
Documentation       Base Test

Library     Browser
Library     factories/Users.py
Library     Collections

Resource    actions/_SharedActions.robot
Resource    actions/AuthActions.robot
Resource    actions/SignupActions.robot
Resource    Database.robot
Resource    Helpers.robot

*Variables*
${BASE_URL}     https://getgeeks-elidio.herokuapp.com

*Keywords*
Start Session
    New Browser     chromium        headless=false      slowMo=00:00:00
    New Page        ${BASE_URL}

Finish Session
    Take Screenshot