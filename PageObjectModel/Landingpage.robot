*** Settings ***
Documentation    All the page objects and keywords of Landing page
Library    SeleniumLibrary

*** Variables ***
${Error_Message_Login}    css:.alert-danger



*** Keywords ***

Fill the Login form
    [Arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    signInBtn

Wait until it checks and displays error message
    Wait Until Element Is Visible    ${Error_Message_Login}

Verify error message is correct
    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.